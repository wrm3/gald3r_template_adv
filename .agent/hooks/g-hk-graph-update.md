# Hook: g-hk-graph-update

## Fires On
Post-commit. Wire via git post-commit hook (`echo 'powershell -NoProfile -ExecutionPolicy Bypass -File .cursor/hooks/g-hk-graph-update.ps1' > .git/hooks/post-commit`) or invoke from `hooks.json` on agent-complete. Non-blocking: failures are logged and the hook exits cleanly.

## What It Does
Runs the gald3r_muninn indexers (Python AST + TypeScript) to refresh the codebase knowledge graph after a commit. Keeps the muninn SQLite store (`~/.gald3r/muninn.db`) current so `graph_impact`, `graph_callers`, `graph_callees`, `graph_deps`, `graph_status`, and `graph_search` MCP tools (auto-loaded into the gald3r_valhalla server) return accurate results for the next `g-go-code` Step b0 Impact Scan.

## Side Effects
- Mutates `~/.gald3r/muninn.db` (or `MUNINN_DB_PATH` override) — the muninn graph store.
- Appends to `.gald3r/logs/muninn_updates.log`.
- Non-blocking even when Python / Node.js / muninn plugin are unavailable.

## Migration Note (T1158)
Replaces `g-hk-gitnexus-update.ps1` (deprecated). The old hook is retained as a thin shim that forwards to this script when present; remove the legacy `.git/hooks/post-commit` entry next time you re-wire local hooks.

## Related Tasks
- T1158 (gald3r_muninn — g-go-code Step b0 integration)
- T1147 (parent epic — clean-room rewrite of GitNexus capability)
- `.gald3r/subsystems/codebase-graph.md`
