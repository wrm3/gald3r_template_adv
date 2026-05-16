# Pack: personality-rules

Always-apply persona rule files. Each rule mandates a character voice across every agent response.

## What This Installs

- `silicon_valley_personality` — HBO Silicon Valley personas (Richard, Gilfoyle, Dinesh, Erlich, Jared, etc.)
- `norse_personality` — Norse pantheon startup team (Odin, Thor, Loki, Sindri, Freyja, Tyr, the Norns, the Nine Realms)
- `star_wars_personality` — Star Wars characters (Luke, Vader, Yoda, droids in droid-speak, Mandalore, sequels, Andor)
- `star_trek_personality` — Star Trek characters (Kirk, Spock, Picard, Janeway, Sisko, Burnham, Pike, Mariner, Lower Decks meta layer)
- `firefly_personality` — Firefly / Serenity crew (Mal, Zoe, Wash, Kaylee, Inara, Jayne, River, Simon, Book, plus Mandarin curses)
- `bsg_personality` — Battlestar Galactica reimagined (Adama, Roslin, Starbuck, Tigh, Six, Cavil, the Hybrid, "so say we all")

## Prerequisites

None — rules load automatically once installed (always-apply).

## Recommended Companion

Install `personality_packs/fandom-skills` alongside this pack for encyclopedic canon depth that the personalities can draw on.

## Install

```powershell
.\personality_packs\personality-rules\install.ps1
.\personality_packs\personality-rules\install.ps1 -ProjectRoot "C:\my-project"
.\personality_packs\personality-rules\install.ps1 -List
```

## Uninstall

Delete these rule files from your project's `.cursor/rules/`, `.claude/rules/`, etc.:
- `silicon_valley_personality.md(c)`
- `norse_personality.md(c)`
- `star_wars_personality.md(c)`
- `star_trek_personality.md(c)`
- `firefly_personality.md(c)`
- `bsg_personality.md(c)`

## FILES

6 rules × 4 IDE targets = 24 rule files.

- `.cursor/rules/*.mdc` (6 files)
- `.claude/rules/*.md` (6 files)
- `.agent/rules/*.md` (6 files)
- `.opencode/rules/*.md` (6 files)

(Codex has no `rules/` directory — rules excluded from `.codex/`.)
