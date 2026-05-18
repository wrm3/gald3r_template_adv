# Personality Packs

Personality packs add AI character personas to gald3r. They install rule files (which
IDEs load as system instructions) and optional megafan skill files into your project's
active platform folders.

## Available Packs

| Pack | Type | Default | Personalities / Skills |
|---|---|---|---|
| `gald3r_personality` | built-in | ✅ always-on | Norse pantheon (Odin, Thor, Loki, Freya, Tyr) |
| `personality-rules` | overlay | — | BSG, Firefly, Hackers, Silicon Valley, Star Trek, Star Wars |
| `fandom-skills` | skills | — | 7 megafan knowledge skills |
| `shoresy` | overlay | — | Shoresy (Letterkenny) |

## Commands

```
g-pers-list         List all available packs and which is active
g-pers-pick <name>  Switch to a personality pack overlay
```

## Architecture

Each pack stores a single canonical copy of its content in `source/`:

```
<pack-name>/
  source/
    rules/         ← .md files (installer handles .mdc for Cursor)
    skills/        ← SKILL.md files (same format for all platforms)
  PACK.md          ← metadata: version, tier, contents
  install.ps1      ← platform-aware: detects active IDE folders
```

The installer detects which IDE folders exist (`.cursor`, `.claude`, `.agent`,
`.codex`, `.opencode`, `.copilot`) and installs only to those platforms.

## Default Personality

`gald3r_personality` is always installed by `g-setup`. It is the base persona and
cannot be deactivated. Other packs are overlays stacked on top.
