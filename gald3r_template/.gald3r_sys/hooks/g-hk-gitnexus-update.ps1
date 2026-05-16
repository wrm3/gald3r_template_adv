<#
.SYNOPSIS
    [DEPRECATED — T1158] Use g-hk-graph-update.ps1 instead.
    Post-commit hook: update the codebase knowledge graph index.

.DESCRIPTION
    ⚠️ DEPRECATED (T1158): The codebase graph backend migrated from
    GitNexus to gald3r_muninn (clean-room rewrite, parent epic T1147).

    This hook is retained as a forwarding shim so that any installed
    `.git/hooks/post-commit` entries pointing at this path keep working
    during the migration window. It forwards to
    `g-hk-graph-update.ps1` when that script is available, and otherwise
    falls through to the original GitNexus update path.

.NOTES
    Original install command (still works via shim):
        echo 'powershell -NoProfile -ExecutionPolicy Bypass -File .cursor/hooks/g-hk-gitnexus-update.ps1' > .git/hooks/post-commit

    New install command (preferred):
        echo 'powershell -NoProfile -ExecutionPolicy Bypass -File .cursor/hooks/g-hk-graph-update.ps1' > .git/hooks/post-commit

    Task: T1158 — gald3r_muninn integration into g-go-code Step b0.
#>

param(
    [string]$ProjectRoot = $PSScriptRoot -replace '[\\/]\.cursor[\\/]hooks$', ''
)

if (-not $ProjectRoot) {
    $ProjectRoot = (Get-Location).Path
}

# Forward to the replacement hook when available.
$replacement = Join-Path $PSScriptRoot "g-hk-graph-update.ps1"
if (Test-Path $replacement) {
    & $replacement -ProjectRoot $ProjectRoot
    exit $LASTEXITCODE
}

# Legacy GitNexus path (fallback only — kept so this script remains
# self-contained when graph_update is somehow missing).
$gnAvailable = Get-Command gitnexus -ErrorAction SilentlyContinue
if (-not $gnAvailable) {
    # Not installed - silently exit (optional tool)
    exit 0
}

Set-Location $ProjectRoot
$statusOut = & gitnexus status 2>&1
if ($statusOut -match "not indexed") {
    exit 0
}

$updateOut = & gitnexus analyze . --no-stats --skip-agents-md 2>&1
$exitCode = $LASTEXITCODE

$logDir = Join-Path $ProjectRoot ".gald3r\logs"
if (Test-Path $logDir) {
    $logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') | gitnexus-update (deprecated) | exit=$exitCode | $($updateOut -join ' ')"
    Add-Content -Path (Join-Path $logDir "gitnexus_updates.log") -Value $logEntry -ErrorAction SilentlyContinue
}

# Non-blocking: always exit 0 so git commit is not blocked.
exit 0
