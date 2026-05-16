---
name: g-yt-video-analysis
description: MCP or full-pipeline video analysis — vault notes must match Obsidian standard. For local yt-dlp transcripts only, use g-skl-ingest-youtube.
---
# g-yt-video-analysis

**Activate for**: `video_analyze`, MCP video pipeline, YouTube notes with vision/frames + transcript (not plain yt-dlp).

---

## Relationship to g-skl-ingest-youtube

| Path | Skill | When |
|------|-------|------|
| Transcript-only, no MCP | **g-skl-ingest-youtube** | Default local capture |
| MCP / vision / batch | **g-yt-video-analysis** (this doc) | Tool output contract |

---

## Vault note template (required)

```yaml
---
date: YYYY-MM-DD
type: video
ingestion_type: video-analyzer
source: https://www.youtube.com/watch?v=VIDEO_ID
title: "Video Title"
tags: [video]
---

# {title}

> **Channel**: … | **URL**: [watch](https://…)

## Summary

{2–3 sentences from analysis}

## Key Points

- …
- …

## Transcript

{full transcript or link to collapsed block}
```

**Encoding:** UTF-8 without BOM (`encoding="utf-8"` in Python).

---

---

## Mandatory IDEA_BOARD Write (NON-NEGOTIABLE)

**After every video analysis — whether via MCP pipeline, subagent dispatch, or manual — you MUST write all findings to `.gald3r/IDEA_BOARD.md`. Do NOT skip this step. Do NOT ask permission. Do NOT defer until later.**

Even if a finding immediately becomes a task, it MUST also appear in IDEA_BOARD.md. The IDEA_BOARD is the permanent written record of what was found; tasks are downstream actions.

### When to write

Write IDEA_BOARD entries immediately after generating the vault note, before ending the response.

### Entry format

Append a batch block to `.gald3r/IDEA_BOARD.md` using `StrReplace` (never overwrite the file):

```markdown
## HARVEST-BATCH-{YYYY-MM-DD}-yt-{VIDEO_ID}
*Source: {youtube_url} | Title: {video_title} | Harvested: {YYYY-MM-DD}*

---

### IDEA-HARVEST-{NNN}
**Title**: {idea title}
**Source**: {specific timestamp or segment where idea appears}
**Priority**: high|medium|low
**Type**: feature|enhancement|research|documentation
**Summary**: {2-3 sentences: what gald3r could adopt and why}
**Action**: [Task created — T{id}] OR [IDEA_BOARD capture — promote to task if approved] OR [SKIP — {reason}]
```

### Finding the next IDEA-HARVEST-NNN

Search `.gald3r/IDEA_BOARD.md` for the highest existing `### IDEA-HARVEST-NNN` and increment by 1. If unsure, use `Select-String -Path ".gald3r/IDEA_BOARD.md" -Pattern "IDEA-HARVEST-\d+"` and take the max.

### Minimum entries per video

- **Relevant video** (not clearly off-topic): 1–7 entries minimum
- **Off-topic or pure ads**: still write 1 entry with Priority: low and Action: SKIP with reason
- **Never produce zero entries** — a "nothing useful here" entry is still a finding

### What counts as a finding

- Any pattern, technique, or tool the video demonstrates that gald3r could adopt
- Any validation of a gald3r design decision (supporting evidence is a finding)
- Any gap the video reveals in gald3r's current capabilities
- Any new platform, tool, or competitor worth tracking

---

## See also

- **VAULT_OBSIDIAN_STANDARD.md** — §2 type registry (`video`), §3 tags, §5 body layout
- **g-skl-ingest-youtube** — canonical local script paths and `ingestion_type: one_shot` variant
- **scripts/gen_vault_moc.py** — refresh `research/videos/_INDEX.md` after adding notes
