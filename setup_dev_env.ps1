# setup_dev_env.ps1 — regenerate platform skill/agent/command dirs from canonical root
# Run this after cloning or when platform dirs are missing/stale.
# The root skills/, agents/, commands/ dirs are the single source of truth.
#
# T1048: Platform dirs (.cursor/skills/ etc.) are gitignored.
# Auto-detects the calling platform and populates only that platform's dirs.
# Use -Platform all to populate every platform, or specify one explicitly.
#
# Usage:
#   .\setup_dev_env.ps1                        # auto-detect platform
#   .\setup_dev_env.ps1 -Platform cursor       # cursor only
#   .\setup_dev_env.ps1 -Platform all          # all platforms
#   .\setup_dev_env.ps1 -Platform all -Clean   # wipe then regenerate all
#   .\setup_dev_env.ps1 -Platform cursor -Quiet  # for hook invocation

param(
    [string]$Platform = "auto",  # auto | cursor | claude | agent | codex | opencode | copilot | all
    [switch]$Clean,              # wipe target dirs before regenerating
    [switch]$Quiet               # suppress all output (for hook invocation)
)

try {

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# ── Platform detection ────────────────────────────────────────────────────────
function Get-ActivePlatform {
    param([string]$ProjectRoot)

    # 1. Environment variables set by each IDE/CLI
    if ($env:CURSOR_TRACE -or $env:VSCODE_PID) { return @("cursor") }
    if ($env:CLAUDE_CODE  -or $env:ANTHROPIC_MODEL) { return @("claude") }
    if ($env:GEMINI_CLI) { return @("agent") }
    if ($env:OPENAI_CODEX -or $env:CODEX_CLI) { return @("codex") }

    # 2. Parent process name heuristic (catches gemini CLI)
    try {
        $parent = (Get-Process -Id $PID -ErrorAction SilentlyContinue).Parent
        if ($parent -and $parent.ProcessName -match "gemini") { return @("agent") }
    } catch {}

    # 3. Fall back: which platform dirs already exist in the project
    $detected = @()
    if (Test-Path (Join-Path $ProjectRoot ".cursor"))   { $detected += "cursor" }
    if (Test-Path (Join-Path $ProjectRoot ".claude"))   { $detected += "claude" }
    if (Test-Path (Join-Path $ProjectRoot ".agent"))    { $detected += "agent" }
    if (Test-Path (Join-Path $ProjectRoot ".codex"))    { $detected += "codex" }
    if (Test-Path (Join-Path $ProjectRoot ".opencode")) { $detected += "opencode" }
    if (Test-Path (Join-Path $ProjectRoot ".copilot"))  { $detected += "copilot" }
    if ($detected.Count -gt 0) { return $detected }

    # 4. Nothing detected — safe default: populate all
    return @("cursor", "claude", "agent", "codex", "opencode", "copilot")
}

# ── Platform → category mapping ───────────────────────────────────────────────
$platformCats = @{
    cursor   = @("skills", "agents", "commands")
    claude   = @("skills", "agents", "commands")
    agent    = @("skills", "agents", "commands")
    codex    = @("skills", "agents", "commands")
    opencode = @("skills", "agents", "commands")
    copilot  = @("commands")   # Phase 1 — no skills/agents yet
}

$platformPrefix = @{
    cursor   = ".cursor"
    claude   = ".claude"
    agent    = ".agent"
    codex    = ".codex"
    opencode = ".opencode"
    copilot  = ".copilot"
}

# ── Resolve target platforms ──────────────────────────────────────────────────
$targets = switch ($Platform.ToLower()) {
    "auto" { Get-ActivePlatform -ProjectRoot $root }
    "all"  { @("cursor", "claude", "agent", "codex", "opencode", "copilot") }
    default { @($Platform.ToLower()) }
}

# ── Sync each target platform ─────────────────────────────────────────────────
foreach ($plat in $targets) {
    if (-not $platformCats.ContainsKey($plat)) {
        if (-not $Quiet) { Write-Host "  ! Unknown platform '$plat' — skipping" }
        continue
    }

    $prefix     = $platformPrefix[$plat]
    $platDir    = Join-Path $root $prefix
    $categories = $platformCats[$plat]
    $counts     = @{}

    foreach ($cat in $categories) {
        $src = Join-Path $root $cat
        $dst = Join-Path $platDir $cat

        if (-not (Test-Path $src)) {
            $counts[$cat] = 0
            continue
        }

        if ($Clean -and (Test-Path $dst)) {
            Remove-Item $dst -Recurse -Force -ErrorAction SilentlyContinue
        }

        if (-not (Test-Path $dst)) {
            New-Item -ItemType Directory -Force $dst | Out-Null
        }

        Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force -ErrorAction SilentlyContinue
        $counts[$cat] = @(Get-ChildItem $dst -ErrorAction SilentlyContinue).Count
    }

    if (-not $Quiet) {
        $summary = ($categories | ForEach-Object { "$($counts[$_]) $_" }) -join ", "
        Write-Host "  ✓ ${plat}: $summary"
    }
}

} catch {
    # Never throw — hooks must not break sessions
    if (-not $Quiet) { Write-Host "  setup_dev_env: non-fatal error: $($_.Exception.Message)" }
}

exit 0
