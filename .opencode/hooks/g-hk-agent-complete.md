# Hook: g-hk-agent-complete

## Fires On
Cursor `stop` / Claude Code agent-complete lifecycle event — fires when the agent loop ends. The event payload includes `status` (completed/aborted/error), `loop_count`, `conversation_id`, and optional `transcript_path`.

## What It Does
Persists a local chat log to `.gald3r/logs/` and writes a reflection hint for the next session. Reads stdin only when redirected (guarded by `[Console]::IsInputRedirected` per BUG-003). Falls back to `$env:CURSOR_TRANSCRIPT_PATH` when the transcript path isn't in the JSON envelope.

## Side Effects
- Writes diagnostic line to `.gald3r/logs/hook_diag.log` (proves hook fired).
- Creates / updates `.gald3r/logs/` chat transcripts.
- May write `.gald3r/logs/pending_reflection.json` consumed by the next session-start hook.
- **T1174 opt-in**: When `.gald3r/config/AGENT_CONFIG.md` declares `skill_capture_hook: true` and `status == completed`, stages a SKILL-candidate stub at `.gald3r/reports/skill_candidates/YYYYMMDD_HHMMSS_session{shortcid}.md`. Stub is filled by the next agent session or surfaced by `@g-idea-farm`. Default is disabled — hook is a no-op for the skill-capture path unless the flag is set.

## Configuration
| Flag (in `.gald3r/config/AGENT_CONFIG.md`) | Default | Effect |
|--------------------------------------------|---------|--------|
| `skill_capture_hook: true`                 | `false` (omit) | Enables T1174 skill-candidate stub staging on `status: completed` |

## Related Tasks
- BUG-003 (stdin guard fix)
- T600 (hook contract acknowledgement)
- T1174 (skill-capture stub staging)
