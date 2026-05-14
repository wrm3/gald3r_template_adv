# setup_dev_env.ps1 — regenerate platform skill/agent/command dirs from canonical root
# Run this after cloning or when platform dirs are missing/stale.
# The root skills/, agents/, commands/ dirs are the single source of truth.
#
# T1048: Platform dirs (.cursor/skills/ etc.) are gitignored.
# This script regenerates them from root canonical sources.

param(
    [switch]$Clean  # If set, delete platform dirs before regenerating
)

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$platforms = @(".cursor", ".claude", ".agent", ".codex", ".opencode")
$categories = @("skills", "agents", "commands")

Write-Host "setup_dev_env.ps1 — regenerating platform dirs from root canonical"
Write-Host "Root: $root"
Write-Host ""

foreach ($platform in $platforms) {
    foreach ($category in $categories) {
        $src = Join-Path $root $category
        $dst = Join-Path $root $platform $category

        if (-not (Test-Path $src)) { continue }

        if ($Clean -and (Test-Path $dst)) {
            Remove-Item $dst -Recurse -Force
        }

        if (-not (Test-Path $dst)) {
            New-Item -ItemType Directory -Force $dst | Out-Null
        }

        Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
        Write-Host "  Synced $category -> $platform/$category"
    }
}

# .copilot/commands gets only commands (no skills or agents in Phase 1)
$copilotSrc = Join-Path $root "commands"
$copilotDst = Join-Path $root ".copilot" "commands"
if (Test-Path $copilotSrc) {
    if ($Clean -and (Test-Path $copilotDst)) {
        Remove-Item $copilotDst -Recurse -Force
    }
    if (-not (Test-Path $copilotDst)) {
        New-Item -ItemType Directory -Force $copilotDst | Out-Null
    }
    Copy-Item -Path "$copilotSrc\*" -Destination $copilotDst -Recurse -Force
    Write-Host "  Synced commands -> .copilot/commands"
}

Write-Host ""
Write-Host "setup_dev_env complete. Platform dirs regenerated from root."
