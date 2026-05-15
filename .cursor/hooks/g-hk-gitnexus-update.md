# Hook: g-hk-gitnexus-update

## Fires On
Post-commit. Wire via git post-commit hook (`echo 'powershell -NoProfile -ExecutionPolicy Bypass -File .cursor/hooks/g-hk-gitnexus-update.ps1' > .git/hooks/post-commit`) or invoke from `hooks.json` on agent-complete. Non-blocking: failures are logged and the hook exits cleanly.

## What It Does
Runs `gitnexus analyze` to refresh the codebase knowledge graph after a commit. Keeps the GitNexus 1.6.3 backend index current so `mcp__gitnexus__impact`, `mcp__gitnexus__api_impact`, and `scripts/gitnexus_impact.ps1` return accurate blast-radius results for the next `g-go-code` Step b0 Impact Scan.

## Side Effects
- Mutates `.gitnexus/` (codebase memory database).
- Writes errors to stdout / a log file but never blocks the commit (failure mode by design).
- Non-blocking even when GitNexus is unavailable.

## Related Tasks
- T921 (GitNexus codebase semantic memory integration)
- `.gald3r/subsystems/codebase-graph.md`
