# Pack: fandom-skills

Encyclopedic mega-fan reference skills for the gald3r personality system.

## What This Installs

- `silicon-valley-superfan` — HBO Silicon Valley canon depth (companion to silicon_valley_personality)
- `star-trek-megafan` — Star Trek canon across TOS / TNG / DS9 / VOY / ENT / DIS / PIC / SNW / LDS / PRO + films
- `star-wars-megafan` — Star Wars canon (films, Mandalorian, Andor, Clone Wars, comics, expanded canon)
- `firefly-serenity-megafan` — Firefly + Serenity 'verse canon (14 episodes + film + comics)
- `bsg-megafan` — Battlestar Galactica reimagined canon (miniseries + 4 seasons + Razor + The Plan + Caprica + Blood & Chrome)

## Prerequisites

The matching personality rules from the `personality-rules` pack (recommended). Without them the agent voice never fires; the megafan skills become reference-only.

## Install

```powershell
.\personality_packs\fandom-skills\install.ps1
.\personality_packs\fandom-skills\install.ps1 -ProjectRoot "C:\my-project"
.\personality_packs\fandom-skills\install.ps1 -List
```

## Uninstall

Delete these skill directories from your project's `.cursor/skills/`, `.claude/skills/`, etc.:
- `silicon-valley-superfan/`
- `star-trek-megafan/`
- `star-wars-megafan/`
- `firefly-serenity-megafan/`
- `bsg-megafan/`

## FILES

5 skills × 5 IDE targets = 25 SKILL.md files.

- `.cursor/skills/silicon-valley-superfan/SKILL.md`
- `.cursor/skills/star-trek-megafan/SKILL.md`
- `.cursor/skills/star-wars-megafan/SKILL.md`
- `.cursor/skills/firefly-serenity-megafan/SKILL.md`
- `.cursor/skills/bsg-megafan/SKILL.md`
- (+ 4 more IDE targets: .claude, .agent, .codex, .opencode)
