---
name: g-skl-gitnexus
description: >
  GitNexus MCP — query the pre-built codebase knowledge graph for call chains,
  impact analysis, blast radius, and symbol resolution. Active via gitNexus MCP
  entry in .mcp.json (npx gitnexus mcp). Wire into g-go-code Step b0 Impact Scan
  before any implementation. Use when you need to understand what a change will break.
version: "1.0"
platforms: [cursor, claude, gemini, codex, opencode]
mcp_server: gitnexus
mcp_entry: ".mcp.json → gitnexus entry (npx gitnexus mcp)"
---

# g-skl-gitnexus — Codebase Knowledge Graph via MCP

## Why This Skill Exists

GitNexus (28K stars) indexes your entire codebase into a persistent knowledge graph: call chains,
dependency trees, inheritance hierarchies, execution flows. Agents that query the graph before
editing get architectural context in 1 MCP call instead of 20 grep/read tool calls.

Key insight from GitNexus docs:
> "A smaller model with GitNexus gets better architectural context than a larger model without it."

gald3r wires GitNexus into the **g-go-code Step b0 Impact Scan** so every implementation task
starts with graph-backed blast radius analysis — not manual estimates.

## MCP Configuration

GitNexus is already wired in `gald3r_dev/.mcp.json`:
```json
"gitnexus": {
  "command": "npx",
  "args": ["gitnexus", "mcp"],
  "env": {}
}
```

**First-time setup**: GitNexus requires indexing. Run from each target repo root:
```bash
npx gitnexus index          # Index current directory
npx gitnexus index --watch  # Index + watch for changes
```

Index stored in `.gitnexus/` (gitignore-safe; add `.gitnexus/` to .gitignore).

## Available MCP Tools

GitNexus MCP exposes up to 16 tools. Core set used by gald3r:

| Tool | Description | When to Use |
|------|-------------|-------------|
| `gitnexus_find_definition` | Symbol location across all indexed repos | "Where is X defined?" |
| `gitnexus_query_callers` | All functions that call a given symbol | "What calls X?" |
| `gitnexus_query_callees` | All functions called by a given symbol | "What does X call?" |
| `gitnexus_blast_radius` | Files/symbols impacted by changing a file | Before editing any file |
| `gitnexus_query_imports` | Import chain for a module | "What imports M?" |
| `gitnexus_query_subgraph` | N-hop subgraph around a symbol | Architecture overview |
| `gitnexus_search_symbol` | BM25 + semantic hybrid symbol search | "Find things named X" |
| `gitnexus_list_files` | Files matching pattern with metadata | Discovery |
| `gitnexus_git_diff_impact` | Map git diff to affected downstream symbols | Pre-commit scope check |

## IMPACT SCAN: g-go-code Step b0

Before implementing any task, run this sequence:

```
1. Identify target files from task's subsystems[] and workspace_repos[]
2. For each target file: gitnexus_blast_radius(file=<path>)
3. Parse response: affected_files[], confidence, risk_level
4. If risk_level == HIGH (>10 affected files): note in Status History, flag to user
5. Inject compact summary into working context:
   "Blast radius: <N> files. Affected: [file1, file2, ...]"
6. Use gitnexus_query_callers(<key_functions>) to find what will break if signatures change
```

### Example: before editing `output_pipeline.py`
```
gitnexus_blast_radius(file="gald3r_mcp/output_pipeline.py")
→ {
    "affected_files": ["mcp_server.py", "tests/fast/test_fast_output_pipeline.py"],
    "confidence": 0.97,
    "risk_level": "LOW",
    "caller_count": 1
  }
```

### Blast radius thresholds
| Files affected | Risk | Action |
|---------------|------|--------|
| 0-3 | LOW | Proceed normally |
| 4-10 | MEDIUM | Note in Status History, extra test coverage |
| 11-25 | HIGH | Flag before claiming; get explicit confirmation |
| 26+ | CRITICAL | Must split task or get explicit scope authorization |

## SYMBOL SEARCH: Replacing grep

Instead of `rg "memory_capture" --type py`, use:

```
gitnexus_search_symbol(query="memory_capture", mode="hybrid")
→ Returns ranked list: function names + file locations + brief docstring
```

Hybrid mode (BM25 + semantic) returns both exact-match and conceptually related symbols.
Token cost: ~200 tokens vs. ~800 tokens for equivalent ripgrep multi-file scan.

## MULTI-REPO SUPPORT

GitNexus indexes multiple repos into a unified graph. For gald3r workspace:

```bash
# Index all active repos into shared workspace graph
cd G:/gald3r_ecosystem/gald3r_dev && npx gitnexus index
cd G:/gald3r_ecosystem/gald3r_valhalla && npx gitnexus index
cd G:/gald3r_ecosystem/gald3r_throne && npx gitnexus index
cd G:/gald3r_ecosystem/gald3r_agent && npx gitnexus index
```

Cross-repo queries (e.g., "which gald3r_valhalla function is called from gald3r_dev?") work
automatically once all repos are indexed — GitNexus resolves cross-package references.

## DEPENDENCY GRAPH vs. BLAST RADIUS

| Concept | Tool | Output |
|---------|------|--------|
| Dependency graph | `gitnexus_query_imports(module)` | Who depends on me? (downstream) |
| Blast radius | `gitnexus_blast_radius(file)` | What breaks if I change this? |
| Call chain | `gitnexus_query_callers(fn)` | Who calls this function? |
| Execution flow | `gitnexus_query_callees(fn)` | What does this function call? |

## REPLACING MANUAL blast_radius: TASK FRONTMATTER

T871 objective: replace the manual `blast_radius: medium` YAML in task files with computed values.

New workflow (post-T871):
1. g-go-code runs `gitnexus_blast_radius` on task target files
2. Computes actual file count
3. Replaces manual estimate with: `blast_radius_computed: {files: 7, confidence: 0.94}`
4. Status History row includes: "Impact scan: 7 files, LOW risk"

Tasks created before T871 still have manual `blast_radius:` estimates — these are acceptable;
GitNexus provides live validation at task-claim time.

## GIT-DIFF IMPACT MAPPING

After making changes, before committing:
```
gitnexus_git_diff_impact(diff=<git diff output>)
→ {
    "added_symbols": [...],
    "modified_symbols": ["OutputPipeline.run", "OutputPipeline.register"],
    "removed_symbols": [],
    "downstream_affected": ["mcp_server.register_resources"],
    "test_files_to_run": ["tests/fast/test_fast_output_pipeline.py"]
  }
```

This surfaces the minimum test set to run after each change — reduces test execution time
from full suite to targeted affected tests.

## INDEX MAINTENANCE

```bash
# Check index status
npx gitnexus status

# Update after file changes
npx gitnexus update --changed=<files>

# Full rebuild (run monthly or after large refactors)
npx gitnexus index --force

# Auto-update via post-commit hook (recommended)
npx gitnexus hooks install
```

The `.cursor/hooks/g-hk-gitnexus-update.ps1` hook runs `gitnexus update` after each commit
for the gald3r_dev root. See also `scripts/gitnexus_impact.ps1` which wraps the CLI for
PowerShell integration.

## LANGUAGE SUPPORT

GitNexus 11-language support relevant to gald3r:
- **Python** ✓ (gald3r_valhalla, gald3r_dev scripts)
- **TypeScript** ✓ (gald3r_throne React frontend)
- **JavaScript** ✓ (Any JS tooling)
- **Rust** ✓ (gald3r_agent if using Rust paths)
- **Go** ✓ (future microservices)

## PARITY NOTES

This skill lives in:
- `.cursor/skills/g-skl-gitnexus/SKILL.md` (Cursor)
- `.claude/skills/g-skl-gitnexus/SKILL.md` (Claude Code parity)

MCP entry is in `gald3r_dev/.mcp.json` under key `"gitnexus"` — already wired.
To confirm gitNexus is active in a Cursor session: check MCP status in Cursor settings.
