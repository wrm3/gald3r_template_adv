Implementation-only backlog execution: $ARGUMENTS

## Mode: IMPLEMENT ONLY

This command runs **coding and bug-fixing** — it does NOT verify. Every completed item is
marked `[🔍]` (Awaiting Verification) so a **separate agent session** can independently confirm it.

## Implementation-Only Boundary

`g-go-code` and `g-go-code --swarm` must not spawn reviewer agents, run `g-go-review`, run `g-go-review-swarm`, or invoke `gald3r-code-reviewer` / full adversarial review subagents.

Allowed implementation readiness checks are limited to smoke/unit-style evidence:
- Import/build/typecheck/lint commands relevant to the changed files.
- Focused unit tests or existing fast test gates.
- Acceptance-criteria self-check against the task or bug spec.
- Workspace, constraint, stub/TODO, and bug-discovery gates required before marking `[🔍]`.

The output may include a review handoff and checkpoint SHA. It must not perform the review. Use `g-go` / `g-go --swarm` for implement-plus-auto-review, or `g-go-review` / `g-go-review --swarm` for review-only.

## ⚙️ Pure Executor Contract

`g-go-code` is a **pure executor** — it receives a task spec routed by the `g-go` coordinator and
produces implementation output. It does **not** self-route to other agents, does **not** spawn
reviewers, and does **not** write shared `.gald3r/` coordination surfaces directly.

**Bucket mode** (received via swarm briefing from the coordinator):
- **`parallel`** — this bucket has no cross-bucket dependencies; implement independently and return results.
- **`sequential`** — this bucket depends on upstream bucket handoff data; read the upstream output before implementing.

Bucket agents return to the coordinator: patch bundle, generated artifacts, test/lint evidence,
changed-file inventory, and proposed Status History rows. The coordinator performs **all** shared
writes (TASKS.md, BUGS.md, task files, CHANGELOG.md, generated prompts, parity output, commits).

---


### PCAC Inbox Gate (Only When PCAC Is Configured)

Before task claiming, implementation, verification, planning, or swarm partitioning, first determine whether this project is a PCAC participant. PCAC is configured only when `.gald3r/linking/link_topology.md` declares at least one parent/child/sibling relationship, or `.gald3r/PROJECT.md` explicitly declares PCAC project linking relationships. A Workspace-Control manifest and local `INBOX.md` alone do not make the project a PCAC group member.

If PCAC is configured, run the re-callable PCAC inbox check when the hook exists.

> **Tool routing (BUG-031)**: on Windows, invoke this snippet through the **PowerShell tool**, not Bash. It uses PowerShell-only syntax (`@(...)` array, `Where-Object`, `Test-Path`, `Select-Object`, pipeline). Routing it through Bash produces a parse error such as ``syntax error near unexpected token `('`` — that failure is a tool-selection error, **NOT** a real PCAC conflict gate. Re-run via PowerShell. On Linux/macOS hosts use `pwsh` if available; if neither shell can reach the hook, treat the gate as advisory and let Workspace-Control routing re-evaluate.

```powershell
$hook = @( ".cursor\hooks\g-hk-pcac-inbox-check.ps1", ".claude\hooks\g-hk-pcac-inbox-check.ps1", ".agent\hooks\g-hk-pcac-inbox-check.ps1", ".codex\hooks\g-hk-pcac-inbox-check.ps1", ".opencode\hooks\g-hk-pcac-inbox-check.ps1" ) | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($hook) { powershell -NoProfile -ExecutionPolicy Bypass -File $hook -ProjectRoot . -BlockOnConflict }
```

Installed templates may call the equivalent hook from the active IDE folder. If the check reports `INBOX CONFLICT GATE` or exits with code `2`, stop immediately and run `@g-pcac-read`; do not claim tasks, create worktrees, spawn reviewers, or continue planning until conflicts are resolved. Non-conflict requests, broadcasts, and syncs are advisory and should be surfaced in the session summary.


### Gald3r Housekeeping Commit Gate (T531)

<!-- T531-HOUSEKEEPING-GATE -->
After the PCAC gate is skipped or passes and **before** the Clean Controller Gate hard-blocks the run, run the safety classifier helper at the orchestration root:

```powershell
.\scripts\gald3r_housekeeping_commit.ps1 -Mode preflight -Apply -TaskId <id-when-known> -Json
```

Behavior:

- **`clean`** -> continue.
- **`safe-gald3r-housekeeping`** -> the helper stages **only** allowlisted controller `.gald3r/` paths via explicit `git add -- <paths>` (never `git add .`), re-checks for drift, and creates a focused `chore(gald3r): preflight gald3r housekeeping` commit. The run continues automatically.
- **`unsafe-gald3r` / `mixed-dirty` / `conflict` / `drift-detected` / unknown `.gald3r` paths / member-repo `config-fault`** -> the helper exits non-zero, the existing Clean Controller Gate hard-block applies, and the run STOPs with the exact unsafe paths listed.

The helper allowlist covers the safe controller `.gald3r/` coordination surfaces (TASKS.md, BUGS.md, FEATURES.md, PRDS.md, SUBSYSTEMS.md, IDEA_BOARD.md, learned-facts.md, tasks/, bugs/, features/, prds/, subsystems/, reports/, logs/pcac_auto_actions.log, linking/sent_orders/, linking/INBOX.md). The deny list covers `.identity`, `.user_id`, `.project_id`, `.vault_location`, `vault/`, `config/`, `.gald3r-worktree.json`, secret-named files, and unknown `.gald3r/` paths. Member-repo targets (marker-only `.gald3r/`) are refused -- this gate is **controller-only**.

Re-run the helper in `-Mode post-write -Apply` immediately after coordinator-owned shared `.gald3r` writes (task/bug status writes, review-result writes, sent_orders ledger updates, safe report/log outputs) and before the next major phase so the shared-state dirty window stays short. In `--swarm` flows only the coordinator runs the helper; bucket agents remain handoff producers.
### Clean Controller Gate (before claims, worktrees, reconciliation)

After the PCAC gate is skipped or passes:

1. At the **orchestration git root** (the repo from which you run this command — normally the Workspace-Control owner, e.g. `gald3r_dev`): run `git status --short`. If anything is listed **outside** this run's explicit coordinator staging allowlist for the active task and bug IDs, **STOP** here. Do not claim tasks or bugs, create or reuse T170 worktrees, partition swarms, or write coordinator-owned updates to `.gald3r/TASKS.md`, `.gald3r/BUGS.md`, other shared `.gald3r` coordination files, `CHANGELOG.md`, generated Copilot prompts, or parity output until unrelated changes are committed, stashed, or moved to a prior focused commit. Preserve any bucket handoff artifacts already produced and list the paths that blocked progress.

2. **`gald3r_worktree.ps1 -AllowDirty`**: do not use this switch for `g-go`, `g-go-code`, `g-go-review`, or any `--swarm` variant **except** when every dirty path is owned exclusively by the active task/bug scope and a `## Status History` row documents that override. Otherwise clean the checkout first. The same **per-root** `-AllowDirty` discipline applies to every repository included in the touch set below when multi-repo work is in scope.

3. **Member touch-set (v1 — `workspace_repos`)** — The orchestration root is **always** gated. When the active task or bug declares **`workspace_repos:`** with manifest `repository.id` entries, extend the gate to each **other** resolved member root (blast radius follows declared cross-repo scope). Read `.gald3r/linking/workspace_manifest.yaml` when present; map each listed ID (deduplicated) to `repositories[?].local_path`. For each existing path, run `git -C "<path>" rev-parse --show-toplevel` then `git status --short` at that root. Apply the same **explicit coordinator staging allowlist** per root. Skip IDs whose paths are missing while `lifecycle_status` is a planned/bootstrap gap (report only; do not expand the touch set). If the manifest is missing while `workspace_repos` is non-empty, or an ID is unknown under `repositories:`, **STOP** multi-repo coordinator work until manifest or frontmatter is repaired (controller-only queue items whose `workspace_repos` lists only the owner id may proceed once that id resolves).

4. **Touch-set expansion (v2 — optional signals)** — Union extra repository roots into the same per-root checks (still **not** a blanket scan of every manifest member):
   - **`extended_touch_repos:`** — optional task/bug YAML list of additional manifest `repository.id` values beyond `workspace_repos`.
   - **`touch_repos:` (swarm handoffs)** — In `--swarm` runs, when bucket work edits roots not already covered by `workspace_repos` + `extended_touch_repos:`, bucket summaries and the coordinator reconciliation block MUST list those ids under `touch_repos:` so the union is gated before shared writes.
   - **Subsystem `locations:` absolutes** — When the active item declares **`subsystems:`**, read each `.gald3r/subsystems/{name}.md` frontmatter **`locations:`** (all nested strings). For values matching a host **absolute** path (`^[A-Za-z]:[/\\]` on Windows, or POSIX `/` rooted at `/` elsewhere), if the path exists, resolve `git -C <dir> rev-parse --show-toplevel` (use the file's parent directory when the path is a file). Each distinct root **other than** the orchestration root joins the touch set. Relative paths do not expand the set.

### Pre-Reconciliation Clean Gate (before coordinator shared writes)

Also re-run the **Gald3r Housekeeping Commit Gate** with `-Mode post-write -Apply` against the orchestration root immediately after each coordinator-owned shared `.gald3r` write so safe controller coordination state lands in a focused `chore(gald3r): commit g-go coordination state` commit before the next major phase begins.


Immediately before the coordinator merges bucket results into the primary checkout, updates shared `.gald3r` indexes or task/bug files as coordinator-owned writes, touches `CHANGELOG.md`, or creates checkpoint / review-result commits: **re-run** `git status --short` on the **orchestration root and every other repository root in the computed touch set** (steps 1 + 3 + 4). For `--swarm` runs, if unrelated dirty paths appear in **any** of those roots during parallel bucket work, **fail closed** — do not apply those shared writes; keep patches, artifacts, and evidence; report **per-root** blockers using the same blocker family as checkpoint and review-result commits.

## Session-Start: Load Active Goal (Ralph Loop)

> Fires immediately after safety gates pass, before implementation begins. If no active goal is set, this section is a no-op.

If `.gald3r/config/ACTIVE_GOAL.md` exists:

1. Read the file. Parse its YAML frontmatter (`description`, `linked_task`, `set_at`, `turn_budget`, `turns_consumed`).
2. Inject into working context as the prefix:
   ```
   CURRENT GOAL: <description> (turn <turns_consumed>/<turn_budget>, task T{id})
   ```
3. Increment `turns_consumed` by 1 and write the updated value back to `ACTIVE_GOAL.md`.
4. If `turns_consumed >= turn_budget`:
   - Surface `🎯 Goal turn budget exhausted — pausing for user direction.`
   - Stop the run cleanly. The user must extend the budget (`@g-goal <description>` to reset) or clear the goal (`@g-goal clear`).

If `--with-goal T{id}` was passed in `$ARGUMENTS`:

1. Treat as if `@g-goal --from-task T{id}` were just run: read `.gald3r/tasks/task{id}_*.md` (active or archive), set `ACTIVE_GOAL.md` from the task title, then proceed with `tasks {id}` as the work filter.
2. Set `linked_task: T{id}` and the description from the task `title:` field. Default `turn_budget: 50`.

If no `ACTIVE_GOAL.md` exists and no `--with-goal` flag is present, proceed without a goal lock (normal operation).

**Goal-aligned AC gate**: after each AC-gate iteration (step b2 below), the implementing agent self-checks: "Did this action advance `<description>`?" If not, re-anchor on the goal in the next reasoning step. This is a soft drift-correction — not a hard block. If drift is severe (3+ consecutive AC-gate iterations failing the alignment check), surface a `🎯 Goal drift detected` notice in the session summary and consider invoking `@g-goal status` to verify the lock is current.

See `g-goal` command (parity across all 6 IDE platforms) for the full Ralph loop specification.

---

## Execution Protocol

### 1. Load Context (Before Touching Anything)

Read in this order:
- `.gald3r/PROJECT.md` — mission, goals, ecosystem context
- `.gald3r/PLAN.md` — current milestones
- `.gald3r/BUGS.md` — open bugs (**read before TASKS** — bugs run first)
- `.gald3r/TASKS.md` — master task list
- `.gald3r/CONSTRAINTS.md` — guardrails (if exists)
- `.gald3r/DECISIONS.md` — past decisions (if exists, read-only)
- `git log --oneline -10` — recent changes

### 2. Build the Work Queue

**Bugs first (Tier 1), then tasks (Tier 2).**

**Tier 1 — Open bugs:**
- From `BUGS.md` + `bugs/` files; Critical → High → Medium → Low
- Skip bugs with external blockers
- **Skip `[🚨]` bugs** — log in Skipped section as "Requires-User-Attention — human review needed"

**Tier 2 — Pending tasks:**
- Status `[ ]` (pending), `[📋]` (ready), or stale `[📝]` (speccing claim expired)
- **Skip non-expired `[📝]` speccing claims** — log owner/expiry in Skipped section as "Speccing-In-Progress"
- For stale `[📝]` claims, append a Status History takeover row naming the prior `spec_owner` before proceeding
- **NOT** `[🚨]` (requires-user-attention) — **skip entirely**, log in Skipped section as "Requires-User-Attention — human review needed"
- No unmet dependencies, with the rolling-pipeline exception below: a dependency at `[🔍]` counts as **implementation-satisfied** for follow-on coding unless the downstream task declares `requires_verified_dependencies: true`
- Not `ai_safe: false`
- Priority: Critical → High → Medium → Low

Supported `$ARGUMENTS` filters:
- Task IDs: `@g-go-code tasks 7, 9`
- Bug IDs: `@g-go-code bugs BUG-003`
- Subsystem: `@g-go-code subsystem vault-hooks-automation`
- `@g-go-code bugs-only` / `@g-go-code tasks-only`

### 2a. Resolve Speccing Claims Before Worktrees

Before Step 3 worktree allocation, resolve task-spec claims in the primary checkout:
- For a bare `[ ]` task with no complete task file, run `g-skl-tasks` `CLAIM-FOR-SPEC` -> `WRITE-SPEC` -> `PROMOTE-SPEC` first.
- Skip non-expired `[📝]` claims before allocating a coding worktree.
- For expired `[📝]` claims, append a Status History takeover row naming the prior `spec_owner`, then finish/promote the spec before worktree creation.
- Only `[📋]` tasks or stale claims successfully promoted to `[📋]` proceed to coding worktree creation.

### 2b. Harvested Task Pre-Flight Check (T810)

**Applies to any task with `harvested_from:` in its YAML frontmatter.** Tasks created before this feature lacked the field — those pass silently. Only tasks explicitly generated by `g-skl-res-apply` will carry the field.

For each queued task that has `harvested_from:` set:

1. **Read subsystem spec** — Find the task's `subsystems:` list. For each subsystem, read `.gald3r/subsystems/{name}.md`. Extract the `locations:` paths and read the key files there. Produce a 3-5 line bullet summary of what is currently implemented.

2. **Scan pending queue** — Search `TASKS.md` for other tasks in status `[📋]` or `[🔄]` that reference the same subsystem(s) in their frontmatter. List: task ID, title, status.

3. **Display context panel:**
   ```
   ⚠️ HARVESTED TASK PRE-FLIGHT
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Task:    T{id} — {title}
   Source:  {harvested_from} (analyzed {harvest_date})
   Type:    {harvest_type}

   Subsystem: {subsystem_name}
   Existing implementation:
     • {bullet 1}
     • {bullet 2}
     • {bullet 3}

   Other pending tasks for same subsystem:
     T{n}: "{title}" [{status}]
     (none) if queue is empty
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

4. **Decision gate by `harvest_type`:**
   - `harvest_type: additive` — Display panel, then **proceed automatically.** The task adds new capability; no comparison gate needed.
   - `harvest_type: replacement` without `harvest_approved: true` — **BLOCK.** Do not implement. Pause and present the panel to the user asking: "This harvested task would replace existing functionality. Confirm to proceed, or type `skip` to defer this task." Log the task in the run's Skipped section as "Awaiting harvest comparison confirmation."
   - `harvest_type: replacement` with `harvest_approved: true` — Display panel as context, then proceed.
   - No `harvest_from:` field — Pass silently; no panel shown. (Legacy tasks created before T810.)

> **`--override-harvest-check` flag** — When this flag is passed to `@g-go-code`, replacement-type harvested tasks are treated as if `harvest_approved: true` and proceed without blocking. Use for batch runs after explicit human review of the harvest intake report.

### Step 0: Generate Locked Implementation Plan (Manus Planning Gate — T879)

**Runs after work queue is finalized, before any file edits or worktree creation.**

Skip this step only when `--skip-plan` is explicitly passed (trivial single-file tasks). `--skip-plan` is not the default and must be justified in the session summary.

For each queued task or bug, generate a locked implementation plan and append it to the task/bug file under `## Implementation Plan`. The plan locks intent before code touches the filesystem. Any mid-implementation divergence must be documented as a `DEVIATION:` note — do not silently rewrite history.

**Plan template** (append to the task file):

```markdown
## Implementation Plan
**Objectives:** [each Acceptance Criterion reworded as a concrete objective]
**Constraints:** [active CONSTRAINTS.md constraints relevant to this task's subsystems — list by ID and 1-line summary]
**Steps:**
1. [first concrete implementation step — name the file and operation]
2. [second step]
3. [continue as needed]
**Success Criteria:** [mirrors the AC checkboxes verbatim]
**Lock Status:** LOCKED
**Locked at:** YYYY-MM-DD
```

**Lock rules:**
- Write the plan, set `Lock Status: LOCKED`, then proceed to coding. Never skip writing the plan section.
- If implementation must deviate from a planned step, append `DEVIATION: {reason}` under the affected step and continue — do not stop, do not silently rewrite.
- After implementation, `g-go-review` reads `## Implementation Plan` and compares against the actual diff to flag undocumented divergences.
- Use `g-skl-plan` `LOCK_PLAN` operation to generate the plan (reads AC + active CONSTRAINTS.md constraints).

### 3. Pre-Create Coding Worktrees (Before Editing)

After speccing claims are resolved and before any implementation file changes or primary-checkout status writes, isolate every queued item with the T170 helper:

```powershell
.\scripts\gald3r_worktree.ps1 -Action Create -TaskId {id} -Role code -Owner {platform_or_agent_slug} -Json
```

Installed templates may call the helper from the `g-skl-git-commit/scripts/gald3r_worktree.ps1` skill directory when no root `scripts/` copy exists.

Rules:
- Worktree root defaults to `$env:GALD3R_WORKTREE_ROOT`, else `<repo-parent>/.gald3r-worktrees/<repo-name>`.
- The helper must refuse nested worktrees inside the active checkout.
- The helper blocks when the active checkout is dirty unless the **Clean Controller Gate** is satisfied with a documented `-AllowDirty` override in the owning task or bug `## Status History` (see `g-rl-33`).
- Map helper JSON to claim metadata: `worktree_path` → `worktree_path`, `worktree_branch` → `worktree_branch`, `created_at` → `worktree_created_at`, and `owner` → `worktree_owner`.
- Run implementation commands from the worktree root. Keep the primary checkout for queue coordination and final status writes.
- Pre-create all queued item worktrees before marking any item `[🔍]`; this prevents legitimate gald3r status writes from making later worktree creation look unsafe.
- If worktree creation fails, preserve any existing files, record the reason in Deferred Items, and skip the item rather than editing the primary checkout.

### 4. Work Through Items Sequentially

For each item:

**a)** Read the task/bug file — understand objective and acceptance criteria
**b)** If the item is a bare `[ ]` task with no complete spec, run `g-skl-tasks` `CLAIM-FOR-SPEC` → `WRITE-SPEC` → `PROMOTE-SPEC` first; skip non-expired `[📝]` claims. Then create/reuse the coding worktree and implement the solution inside that worktree

**b0) Impact Scan + Code-Graph Context Query (T921 + T874b)** — before writing any file, run the cross-file impact analysis to understand blast radius, and (when enabled) query the pre-built code graph to seed implementer context with ~200 tokens instead of grepping linearly.

**b0.1 Impact Scan (T921, default-on)**

```powershell
.\scripts\gitnexus_impact.ps1 -File "{file_to_be_modified}" -Depth 2 -Json
```

Review the returned `affected_files` list. If the impact scan reveals > 3 transitively dependent files, add them to the implementation context window before writing. This prevents cross-file breakage ("agent edits one file and breaks another"). Non-blocking: proceed even if the script returns no results or falls back to the ripgrep backend.

**b0.2 Graphify Code-Graph Query (T874b, opt-in)**

Read `.gald3r/config/AGENT_CONFIG.md` → `context_reduction_mode.graphify_b0_enabled`. When `true`, the coordinator runs a single graph query before bucket spawn (or before single-agent implementation), captures the result as a small context block (typical ≤200 tokens), and passes it to implementer subagents as part of the briefing. When `false` (safe default), this step is skipped and Step b0.1 alone gates the impact context.

Backend fallback order (g-skl-graphify §Backends):

1. **gitNexus MCP** (preferred) — `gitnexus.context` / `gitnexus.impact` / `gitnexus.cypher` for symbol-level call/import resolution. Already wired in `.mcp.json` per T842.
2. **graphify CLI** — when gitNexus is unavailable, run `graphify query --root . --symbol {target}` against the local `.graphify/` index. See g-skl-graphify §SETUP for indexing guidance.
3. **tree-sitter + ripgrep fallback** — when neither backend is reachable, fall back to the legacy grep-based context-prep (Step b0.1 + ad-hoc reads). Do NOT halt the run.

Failure modes (never halt the run):

- **Missing backend** — `.mcp.json` has no `gitnexus` entry AND `graphify` CLI not on PATH AND no `.graphify/` index → log "graphify b0 skipped: no backend reachable" and fall through to legacy.
- **Graph staleness** — index older than the orchestration root's last commit → emit a warning; still use the result (advisory) and append a note recommending `graphify update` or `gitnexus group_sync`.
- **Query timeout** (>5s) — abort the query, log "graphify b0 timeout — fell back to legacy", proceed.
- **Empty result** — query returned no symbols / no edges → log "graphify b0 empty — fell back to legacy"; proceed with Step b0.1 context.

The b0.2 query is **advisory**, **non-blocking**, and **single tool call** (g-rl-37 "Think in Code" — one query, ≤200 tokens of returned context). Operators opt in by flipping `graphify_b0_enabled: true` in `AGENT_CONFIG.md`.

**b1) Post-Write Lint Gate (T919)** — after each Write or StrReplace tool call, run the language-appropriate syntax check:

```powershell
.\scripts\gald3r_post_write_lint.ps1 -FilePath "{relative_path_to_written_file}" -ProjectRoot . -Json
```

| Extension | Lint command |
|-----------|-------------|
| `.py` | `python -m py_compile {file}` |
| `.json` | `python -c "import json; json.load(open('{file}'))"` |
| `.yaml` / `.yml` | `python -c "import yaml; yaml.safe_load(open('{file}').read())"` |
| `.toml` | `python -c "import tomllib; tomllib.load(open('{file}', 'rb'))"` |
| `.ts` / `.tsx` / `.js` | `npx tsc --noEmit` (when tsconfig present) |
| `.ps1` | PowerShell AST parser |
| Other | Pass silently |

If the script exits non-zero (`exit 2` = syntax error), **stop and fix the file before proceeding**. Do not advance to the next write. Treat a lint failure the same as a TypeScript compile error — it blocks continuation.

**b2) AC gate** — before moving on, walk every `- [ ]` acceptance criterion in the task spec:
  - Is this criterion now satisfied? Check the actual files, not just intent.
  - Any unmet criterion → return to **(b)** and address it.
  - Cannot meet a criterion this session → log as a Blocker in step 5 and **skip this task entirely** (do not mark `[🔍]` for partial work).
  - **Stub/TODO scan**: search files modified for this task for bare `# TODO`, `// TODO`, `pass` (non-abstract), `raise NotImplementedError`, `throw new Error("not implemented")` — each is an unmet criterion until annotated `TODO[TASK-X→TASK-Y]` with a follow-up task created (see `g-rl-34`)
  - **Bug-discovery check**: any pre-existing bug encountered while implementing must have a BUG entry + `BUG[BUG-{id}]` comment before `[🔍]`; bugs introduced by this task must be fixed inline (see `g-rl-35`)
  - **Constraint check**: run `@g-constraint-check` mentally — does this implementation violate any active constraint? Any `🚫 VIOLATION` blocks `[🔍]`
  - **Workspace boundary check**: run `g-skl-workspace` ENFORCE_SCOPE before editing and before `[🔍]`; omitted metadata is current-repo-only, unknown manifest repo IDs block, and member repo writes require explicit `workspace_repos`, compatible `workspace_touch_policy`, authorization text, reviewed member git status, and manifest write permission.
  - All criteria confirmed met → continue.
**b3) Queue Status History** — collect the row that will be appended before marking `[🔍]`:
  ```
  | YYYY-MM-DD | pending | awaiting-verification | Implementation complete; {1-line summary} |
  ```
  If the task file has no `## Status History` section yet, add it first (backfill row: `| {created_date} | — | pending | Task created (backfill) |`).
**c)** Validate — lint, test, check files exist
**d)** Record decisions — if you chose approach A over B, append to `.gald3r/DECISIONS.md`
**e)** Update subsystem Activity Log — for each subsystem in the task's `subsystems:` field, append to `.gald3r/subsystems/{name}.md` Activity Log: `| {date} | TASK | {id} | {title} | — |`. Create a stub spec if the file doesn't exist.
**f)** Queue status update → mark `[🔍]` (NOT `[✅]`) in both task file and TASKS.md during the final batch write
**g)** Move to next item

> **IMPORTANT**: Mark every completed item `[🔍]`, never `[✅]`.
> `[✅]` requires a separate agent session running `@g-go-review`.

### 4a. Mid-Task Checkpoint (Mandatory, Every N Major Operations)

**`CHECKPOINT_TOOL_CALL_INTERVAL`**: Default **20** major operations (file reads, shell commands, file writes). Override via `.gald3r/config/AGENT_CONFIG.md` key `checkpoint_interval`.

**Trigger**: After every N major tool operations within a single task's implementation, pause for a brief self-evaluation **before continuing**.

**Self-evaluation covers:**
1. **AC alignment** — How many acceptance criteria are satisfied vs. remaining? Is current trajectory sufficient?
2. **Scope check** — Am I within the declared `subsystems:` and `workspace_repos:` boundaries? Any creep?
3. **Blocking obstacles** — Anything discovered that may prevent completing this task? (missing files, unclear spec, external dep)
4. **Token budget** — Rough estimate of remaining context; flag if >75% consumed with significant work still remaining.

**Output formats:**

Healthy:
```
## Mid-Task Checkpoint (operation N/20): HEALTHY
AC progress: {X}/{total} satisfied. No blockers. Continuing.
```

Needs correction:
```
## Mid-Task Checkpoint (operation N/20): NEEDS_CORRECTION
⚠️ CHECKPOINT: {issue description}
AC progress: {X}/{total} satisfied. Blocker: {description}.
Correction plan: {1-2 sentences}.
```

**Task file audit trail** — Before continuing, append to the task's `## Status History`:
```
| YYYY-MM-DD | in-progress | in-progress | CHECKPOINT {N}: {1-line summary}. AC: {X}/{total}. Blockers: {none|description}. Continuing. |
```

**Rules:**
- Checkpoint is **mandatory** — not optional. Fires every N major operations with no exceptions.
- A task completed with ≥1 checkpoints must show those rows in `## Status History` before being marked `[🔍]`.
- If checkpoint yields `NEEDS_CORRECTION` with an unresolvable blocker, surface `⚠️ CHECKPOINT: [issue]` in the next message and log as Blocked in step 6.
- In `--swarm` mode, each bucket agent runs independent checkpoints; the coordinator does not aggregate them.

### 5. Docs Check (Per Task)

After each task, ask: does this add/remove/change user-facing behavior?
- **YES** → Append entry to `CHANGELOG.md` (root); update `README.md` if relevant section exists
- **NO** (internal refactor only) → skip

### 5a. Auto-Learn Extraction (Per Task)

After the docs check, run the auto-learn extraction for each task moved to `[🔍]`:

1. **Read the task's `## Status History`** and implementation notes from the task file.
2. **Extract**: "Given this implementation, what architectural decision, pattern, or watch-out should the next agent know?" Produce 0–3 candidate facts. Skip entirely if no meaningful insight emerges.
3. **Dedup**: read `.gald3r/learned-facts.md`. Skip any candidate fact that is a substring match (case-insensitive, first 80 chars) of an existing entry.
4. **Append** novel facts with the format:
   ```
   - [YYYY-MM-DD] {extracted_fact} (context: T{task_id})
   ```
   Append under the most appropriate heading (`## Architecture & Conventions`, `## Recurring Preferences`, or `## Watch-Outs & Gotchas`). Create the section if missing.
5. **Count new facts** and include in the handoff summary: `🧠 {N} new fact(s) learned from T{task_id}` (omit if 0).
6. **MCP chain** (when backend is available): call `memory_capture_session` with the extracted facts as the session content.

> **Skip silently** when `.gald3r/learned-facts.md` does not exist — note in summary as `🧠 learned-facts.md not found — skipped`.
> **Manual `/g-learn` still works** as before; this step does not replace it.

### 6. Question & Blocker Collection

DO NOT stop to ask. Collect silently:

```markdown
## Deferred Items

### Questions (Need Human Answer)
- Q1: [question] (task #X)

### Blockers (Could Not Proceed)
- B1: Task #X — [reason]

### Decisions Made (FYI)
- D1: Task #X — chose A over B because [reason]
```

### 7. Record Decisions

Before the handoff message, append any new decisions to `.gald3r/DECISIONS.md`:
- Use the next sequential ID after the last entry (`D{NNN}`)
- Include: Date | Decision | Rationale | this-agent

### 7a. Coordinator-Only Shared Writes

For swarm mode, bucket agents are patch producers, not shared-ledger writers. They must return:

- Patch bundle or explicit changed-file list.
- Generated artifacts produced inside the assigned worktree.
- Test/lint evidence.
- Proposed Status History rows and status transitions.
- Requested shared writes (`.gald3r`, `CHANGELOG.md`, generated prompts, parity sync) for the coordinator to perform.

Bucket agents must not directly write or commit shared coordination surfaces:

- `.gald3r/TASKS.md`, `.gald3r/BUGS.md`, task files, bug files, archive indexes, INBOX/sent_orders ledgers.
- `CHANGELOG.md`, `README.md`, `AGENTS.md`, `CLAUDE.md`.
- Generated Copilot prompts/instructions, parity copies, or platform-wide sync output.
- Final `git add`, `git commit`, `git merge`, or broad staging commands.

The coordinator alone performs shared writes after all bucket outputs are collected and reconciled.

### 7b. Code-Complete Checkpoint Commit

Default review handoff is branch-addressable. After successful implementation reconciliation and shared writes, the coordinator creates a code-complete checkpoint commit before handing work to review:

1. Stage only intended paths by explicit allowlist.
2. Include implementation files plus coordinator-owned shared writes needed for `[🔍]` handoff.
3. Commit with a message that names the implemented task/bug IDs and states that the commit is ready for independent review.
4. Record the checkpoint branch and commit SHA in the handoff summary.

Snapshot review mode is fallback-only. Use it when the user explicitly requests uncommitted review, when a source cannot be made branch-addressable, or when a failed reconciliation must be inspected read-only. Do not make dirty snapshot mode the default.

### 7c. Rolling Implementation Waves

`g-go-code` and `g-go-code --swarm` must optimize for throughput. A code-complete checkpoint is a stable handoff point, not a global stop sign.

After a checkpoint commit is created:

1. Recompute the runnable queue immediately.
2. Treat dependencies that are `[🔍]` / `awaiting-verification` as implementation-satisfied when they have a branch-addressable checkpoint and the downstream task does not declare `requires_verified_dependencies: true`.
3. Start the next coding wave from the latest checkpoint or member-repo branch that contains the dependency output.
4. Record checkpoint-dependent downstream work in the dependent task's Status History:
   `Started on unverified dependency T{id} at checkpoint {sha}; rework required if review fails.`
5. Continue coding until no runnable work remains, a PCAC conflict appears, Workspace-Control preflight fails, or a task explicitly requires verified dependencies.

Review remains mandatory, but `g-go-code*` only prepares the handoff. It must not start the review lane itself. A later review failure requeues only the failed item and any downstream tasks that explicitly consumed its checkpoint. Do not stop unrelated implementation work merely because a prior item is awaiting review.

Tasks may force the old strict behavior with:

```yaml
requires_verified_dependencies: true
```

Use that field for destructive operations, irreversible migrations, public release/signing, production writes, security-sensitive changes, or any task whose acceptance criteria explicitly require verified predecessor behavior.

### 8. Final Status Batch + Handoff

After all attempted items are implemented and validated, reconcile their worktree diffs into the primary checkout, then batch-write `.gald3r/TASKS.md`, `.gald3r/BUGS.md`, task files, bug files, docs logs, and changelog entries for all successful items. Do not let one item's status write block another item's worktree creation.

Reconciliation rule for each successful worktree:
1. Inspect `git status --short` in the worktree.
2. Stage only intended implementation files in the worktree with `git add -A -- {paths}` so new files are included. Never use `git add .` in a swarm worktree.
3. Export `git diff --binary --cached HEAD` from the worktree.
4. Apply to the primary checkout with `git apply --3way --index`.
5. If the patch does not apply cleanly, leave the worktree and branch intact and list the item under Skipped / Blocked with its path.
6. Reject or manually resolve any patch that touches shared coordination surfaces; those changes must be represented as coordinator requests, not applied as bucket-owned edits.

After the final shared-write pass, create the checkpoint commit before review. If the checkpoint commit cannot be created, leave the implemented items at `[🔍]` only when the handoff explicitly names snapshot mode and the dirty checkout path reviewers must inspect.

```markdown
## Implementation Session Summary

### Moved to [🔍] (Awaiting Verification)
- [🔍] Task #X: {title}
- [🔍] Bug BUG-00N: {title}

### Skipped (Blocked)
- Task #Y: {reason}

### Deferred Questions & Blockers
{collected items from step 5}

### Decisions Made This Session
{append these to .gald3r/DECISIONS.md}

### 🧠 Auto-Learn Summary
{N} new fact(s) appended to `.gald3r/learned-facts.md` (or "none / file not found").

### Handoff
{N} task(s) / {M} bug(s) moved to [🔍].
Implementation checkpoint: {branch}@{commit_sha} (default review source)
Handoff only: for independent verification, open a NEW agent session and run @g-go-review. Do not launch that reviewer from g-go-code.
Rolling waves: {continued|stopped}; next runnable queue: {ids or none}; verified-dependency blockers: {ids or none}
```

## Behavioral Rules

| Rule | Why |
|------|-----|
| Never ask questions mid-execution | Uninterrupted autonomous work |
| Never spawn reviewer agents from g-go-code* | Implementation mode stays focused on coding and readiness checks |
| Mark completed items `[🔍]`, never `[✅]` | Enforce independent verification gate |
| Keep coding across `[🔍]` dependencies unless strict verification is declared | Preserve fast product development while review catches up |
| Log every decision made | Future agents and humans need the audit trail |
| Skip tasks you can't complete | Maximize total output |
| Respect CONSTRAINTS.md | Never violate project guardrails |
| Abort if destructive (schema drop, data loss) | Safety first — log it as a blocker |


### PCAC Inbox Heartbeats (Swarm / Long Runs)

For swarm mode or any run lasting more than 30 minutes, the coordinator reruns the PCAC inbox check every 30 minutes and once more before the final summary. If a conflict appears mid-run, pause new claims/spawns/reconciliation, preserve worktrees and partial outputs, and require `@g-pcac-read` before continuing.

## Swarm Mode (`--swarm`)

When `$ARGUMENTS` includes `--swarm`, activate the **COORDINATOR PHASE** before any implementation.
Swarm mode partitions the work queue into conflict-safe buckets and spawns N parallel agents.

### Coordinator Phase (runs FIRST when --swarm is present)

**Step S1: Build full work queue** — same rules as standard mode (Steps 1–2 above), including skipping non-expired `[📝]` speccing claims and logging stale-claim takeovers.

**Step S2: Evaluate swarm eligibility after workspace preflight**
- If 0 qualifying items remain → exit with the existing empty queue or blocker message.
- If workspace preflight rejects a candidate (unknown `workspace_repos` member, target path is not a git root, unauthorized member write, or similar Workspace-Control denial) → stop with a blocker message. Do not offer swarm fallback for invalid workspace routing.
- If exactly 1 qualifying item remains and preflight passes → automatically downgrade to standard single-agent implementation mode and continue without asking for confirmation:
  `[SWARM] Single runnable item — auto-downgrading to @g-go-code standard mode`
- If 2 or more qualifying items remain → continue with swarm agent-count calculation and partitioning.
- After each checkpoint, rerun S1/S2 as a rolling wave. Previously completed `[🔍]` dependencies from this or earlier checkpoints count as implementation-satisfied unless a downstream task declares `requires_verified_dependencies: true`.

**Step S3: Compute agent count** (Smart Agent Count Formula)

| Queue size | Agents |
|-----------|--------|
| 1 | 1 (no swarm — fallback) |
| 2–4 | 2 |
| 5–9 | `ceil(count / 3)` (2–3) |
| 10–14 | 4 |
| 15+ | 5 (hard cap) |

**Step S4: Partition into conflict-safe buckets**

```
1. Build conflict_graph:
   For each pair (A, B) in work_queue:
     CONFLICT if: shared subsystem in subsystems[] OR A depends_on B OR B depends_on A

2. Greedy partition:
   Sort work_queue by priority (Critical→Low)
   For each item:
     Assign to the first existing bucket with no conflict with any item already in it
     If no bucket fits → open new bucket (up to agent_count limit)
     If max buckets hit → assign to smallest bucket (accept conflict; note it)

3. Output: buckets = [[task_ids...], [task_ids...], ...]
```

**Primary axis**: subsystem boundaries (same subsystem → same bucket).
**Secondary axis**: file-lock zones (tasks both touching TASKS.md/BUGS.md directly → same bucket).
**Dependency rule**: if A depends on B → same bucket, or B's bucket runs first.

**Step S5: Display partition plan**
```
[SWARM] Work queue: {M} items → {N} agents
  Bucket 1: Task 7 (vault-knowledge-store), Task 9 (vault-knowledge-store)
  Bucket 2: Task 10 (task-lifecycle-management), Task 11 (behavioral-rules-engine)
  Bucket 3: Task 12 (cross-project-coordination-pcac)
Spawning {N} implementation agents...
```

**Step S6: Spawn sub-agents**
- Before spawning, create or reuse one coding worktree per bucket:
  ```powershell
  .\scripts\gald3r_worktree.ps1 -Action Create -TaskId bucket-{bucket_number} -Role code-swarm -Owner {platform_or_agent_slug} -Json
  ```
- Branch/worktree names must include the bucket role plus repo/owner suffix from the helper contract.
- Each bucket agent receives its assigned `worktree_path` and `worktree_branch` and must run implementation from that worktree root.
- Bucket agents MUST NOT directly write shared `.gald3r/TASKS.md` / `.gald3r/BUGS.md`, task/bug status files, `CHANGELOG.md`, generated Copilot prompts, parity output, or commits. They return proposed status changes, changed-file inventory, generated artifacts, and evidence to the coordinator.
- Bucket agents MUST NOT run `git add .`; use explicit path staging only when creating a patch bundle, and exclude `.gald3r-worktree.json`, worktree ownership metadata, terminal transcripts, local logs, and other non-deliverable artifacts.
- Use the Agent tool to spawn N agents, each receiving:
  - The full `g-go-code` prompt (this command file content)
  - A `tasks X, Y, Z` filter argument restricting to that bucket's items only
  - The bucket worktree metadata
- Run all agents. Each follows the standard protocol on its slice.

**Step S7: Collect and merge**
After all sub-agents complete:
1. Inspect each bucket worktree with `git status --short` and `git diff --stat`.
2. Detect overlapping shared-file edits before applying patches. If two buckets request the same shared file, defer that file to the coordinator's final write.
3. Reconcile one bucket at a time: stage only intended bucket files in the bucket worktree with `git add -A -- {paths}`, export `git diff --binary --cached HEAD`, then apply it to the primary checkout with `git apply --3way --index`; do not overwrite user edits.
4. If reconciliation cannot be completed cleanly, leave the bucket worktree and branch intact and list it under Skipped / Blocked with its path.
5. Batch-write `.gald3r/TASKS.md`, `.gald3r/BUGS.md`, task files, bug files, `CHANGELOG.md`, generated Copilot prompts/instructions, and parity outputs only after bucket outputs are reconciled.
6. Run parity sync and prompt regeneration at most once from the coordinator after final shared writes.
7. Create one code-complete checkpoint commit from the primary checkout so review swarms can create clean `review-swarm` worktrees from a committed source.
8. Recompute the work queue for the next rolling wave. Continue immediately when new items become runnable through `[🔍]` checkpoint dependencies and no strict verification gate applies.
9. Write the unified handoff when no further coding wave can run:

```markdown
## Swarm Implementation Session Summary

### Swarm Configuration
- Agents spawned: N
- Partition strategy: subsystem-boundary
- Total items in queue: M

### Bucket Results
| Bucket | Agent | Tasks | Status |
|--------|-------|-------|--------|
| 1 | Agent-1 | 7, 9 | [🔍] ×2 |
| 2 | Agent-2 | 10, 11 | [🔍] ×1, Blocked ×1 |

### Moved to [🔍] (Awaiting Verification)
{merged list from all agents}

### Skipped / Blocked
{merged list from all agents}

### Handoff
{total} task(s) / {total} bug(s) moved to [🔍].
Implementation checkpoint: {branch}@{commit_sha} (default review-swarm source)
Handoff only: for independent verification, open a NEW agent session and run @g-go-review --swarm. Do not launch that reviewer from g-go-code-swarm.
Rolling waves completed: {count}; checkpoint-dependent downstream items: {ids}; strict verified-dependency blockers: {ids or none}
```

---

## Usage Examples

```
@g-go-code
@g-go-code tasks 14, 15
@g-go-code bugs BUG-001, BUG-002
@g-go-code subsystem cross-project
@g-go-code bugs-only
@g-go-code --swarm
@g-go-code --swarm tasks 7, 9, 10, 11, 12
@g-go-code --swarm bugs-only
```

Let's implement.
