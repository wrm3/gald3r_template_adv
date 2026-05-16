# personality_packs/ — Optional Personality & Fandom Content

Personality rules and fandom-superfan skills that are **not** part of the default gald3r install.
Each pack ships an opt-in collection of content; install only the personalities you want loaded.

## Available Packs

| Pack | What it installs | Install |
|------|------------------|---------|
| [personality-rules](./personality-rules/PACK.md) | 6 always-apply persona rules: Silicon Valley, Norse, Star Wars, Star Trek, Firefly/Serenity, Battlestar Galactica | `.\personality_packs\personality-rules\install.ps1` |
| [fandom-skills](./fandom-skills/PACK.md) | 5 mega-fan reference skills: silicon-valley-superfan, star-trek-megafan, star-wars-megafan, firefly-serenity-megafan, bsg-megafan | `.\personality_packs\fandom-skills\install.ps1` |

## How to Install

```powershell
# Install a pack into the current project
.\personality_packs\personality-rules\install.ps1

# Install into a specific project
.\personality_packs\fandom-skills\install.ps1 -ProjectRoot "C:\my-project"

# List files without copying
.\personality_packs\personality-rules\install.ps1 -List
```

After install, restart your IDE to load the new rules/skills.

## How to Uninstall

Delete the rule and skill directories listed in each pack's `PACK.md` under **FILES**.

## Why a Separate Pack Folder?

- **`skill_packs/`** ships domain-functional content (community tools, infra, AI/ML, blockchain, etc.).
- **`personality_packs/`** ships *flavor* content — agent voice and entertainment lore.

Personality content is opinionated and may not suit every workspace. Splitting it out keeps the default install clean while preserving easy opt-in for users who want the personas.

## Design Principles

- **Inert at rest** — `personality_packs/` does not auto-load. Content deploys only when you run `install.ps1`.
- **No loader hacks** — files copy into standard IDE rule/skill paths (`.cursor/rules/`, `.claude/skills/`, etc.).
- **5 IDE targets for skills**, **4 IDE targets for rules** (Codex has no `rules/` directory).
- **No default gald3r pollution** — none of these are included in the base install or in the `template_*/` trees.

## Adding a New Pack

1. Create `personality_packs/{pack-name}/` with `PACK.md`, `install.ps1`, and `files/`
2. Populate `files/` with the IDE target directories and rule/skill files
3. Add a row to this README
