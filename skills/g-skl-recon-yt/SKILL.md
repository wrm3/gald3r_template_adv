---
name: g-skl-recon-yt
description: YouTube transcript ingestion into the vault. Uses yt-dlp to fetch transcripts locally — no Docker, no MCP, no screen captures. Stores in research/videos/ with analysis_depth=transcript_only for future vision upgrade.
---
# g-recon-yt

**Scripts**: `.cursor/skills/g-skl-ingest-youtube/scripts/`

**Activate for**: "ingest this YouTube video", "capture transcript", "add video to vault", "save YouTube notes", any YouTube URL.

---

## Purpose

Capture YouTube video transcripts into the vault's `research/videos/` folder using **yt-dlp** — a local command-line tool with no Docker or MCP requirement. Notes are stored as `analysis_depth: transcript_only` which signals a future task can upgrade them to full vision analysis when the MCP video analyzer is available.

---

## Prerequisites

```bash
pip install yt-dlp
# or
uv pip install yt-dlp
```

Verify: `yt-dlp --version`

---

## Clean Room Boundary

This capture skill may store source material in the vault for research, provenance, and later review. When captured content is used for `--deep`, `g-skl-res-deep`, or any adoption workflow, downstream outputs must be clean-room reverse specs: behavior-level summaries, interfaces, workflows, data shapes, constraints, and architectural patterns only. Do not copy source code, comments, docs prose, prompts, tests, or unique strings into generated gald3r artifacts except tiny attributed excerpts that are license-compatible and necessary for review. Record source URL/path, license when discoverable, capture date, and extraction limits so reviewers can separate source evidence from original gald3r specifications.

---

## Operation: INGEST_YOUTUBE

Capture a YouTube video transcript and create a vault note.

```bash
python .cursor/skills/g-skl-ingest-youtube/scripts/fetch_transcript.py \
  --url "https://www.youtube.com/watch?v=VIDEO_ID" \
  --vault-path /path/to/vault
```

**What happens:**
1. Run `yt-dlp --dump-json` to get metadata (title, channel, duration, upload date)
2. Run `yt-dlp --write-auto-sub --skip-download --sub-format vtt` to fetch captions
3. Parse VTT → clean text (strip timestamps, deduplicate rolling captions)
4. Generate 2–3 sentence summary and key-points list from transcript
5. Write vault note to `research/videos/{YYYY-MM-DD}_{slugified-title}.md`
6. Append to `vault/log.md`
7. Add entry to `vault/_index.yaml`
8. Run `g-hk-vault-reindex.ps1` (if available)

**Output note path**: `{vault_root}/research/videos/{date}_{slug}.md`

---

## Operation: CHECK_SETUP

Verify yt-dlp is installed and working.

```bash
python .cursor/skills/g-skl-ingest-youtube/scripts/fetch_transcript.py --check-setup
```

Reports: yt-dlp version + a simple test that the binary is accessible.

---

## Caption Source Priority

| Priority | Source | Notes |
|---|---|---|
| 1 | Manually uploaded captions (`en`) | Most accurate |
| 2 | Auto-generated captions (`en`) | Usually good for clear speech |
| 3 | Auto-translated to English | Fallback for non-English videos |
| 4 | No captions available | Metadata-only note with warning |

---

## Vault Note Schema

```yaml
---
date: 2026-04-06
type: video
ingestion_type: one_shot
source: https://www.youtube.com/watch?v=VIDEO_ID
title: "Video Title"
channel: "Channel Name"
published: "2026-01-15"
duration_minutes: 42
tags: [video]
refresh_policy: manual
source_volatility: snapshot
analysis_depth: transcript_only
source_notes: "Transcript captured 2026-04-06. No visual analysis."
---

## Summary
{2–3 sentence AI-generated summary from transcript}

## Key Points
- {Point 1}
- {Point 2}
- {Point N}

## Full Transcript
{clean transcript text, timestamps removed}
```

---

## Not In Scope

- No video download (no storage cost)
- No frame extraction or visual analysis (future upgrade via `analysis_depth` field)
- No scheduled re-ingestion — these are one-shot captures

---

---

## Mandatory IDEA_BOARD Write (NON-NEGOTIABLE)

**After every YouTube ingestion, you MUST write all harvest findings to `.gald3r/IDEA_BOARD.md`. Do NOT skip this step. Do NOT ask permission. Do NOT stage for later.**

The vault note stores the source material. The IDEA_BOARD records what gald3r should do about it. Both must be written in the same operation. A vault note without IDEA_BOARD entries is an incomplete ingest.

### Write after Step 5 (vault note complete)

After `research/videos/{date}_{slug}.md` is written, immediately generate harvest entries and append to `.gald3r/IDEA_BOARD.md` using `StrReplace`.

### Entry format

```markdown
## HARVEST-BATCH-{YYYY-MM-DD}-yt-{VIDEO_ID}
*Source: {youtube_url} | Title: {video_title} | Harvested: {YYYY-MM-DD}*

---

### IDEA-HARVEST-{NNN}
**Title**: {idea title}
**Source**: {specific segment or timestamp}
**Priority**: high|medium|low
**Type**: feature|enhancement|research|documentation
**Summary**: {2-3 sentences: what gald3r could adopt and why}
**Action**: [Task created — T{id}] OR [IDEA_BOARD capture] OR [SKIP — {reason}]
```

### Finding the next IDEA-HARVEST-NNN

Search `.gald3r/IDEA_BOARD.md` for the highest `### IDEA-HARVEST-NNN` and increment. Never reuse a number.

### Minimum entries

- **Relevant video**: 1–7 entries minimum
- **Off-topic / ads**: 1 SKIP entry still required (documents the review happened)
- **Batch of videos**: write all batches back-to-back in a single IDEA_BOARD write

---

## Obsidian Compatibility

All notes written by this skill must conform to **VAULT_OBSIDIAN_STANDARD.md** (§2 type registry, §3 tag taxonomy).  
Required fields: `type: video`, `tags: [video, ...]`, `title:`, `date:`.  
Encoding: UTF-8 without BOM. See also: `scripts/gen_vault_moc.py`.

