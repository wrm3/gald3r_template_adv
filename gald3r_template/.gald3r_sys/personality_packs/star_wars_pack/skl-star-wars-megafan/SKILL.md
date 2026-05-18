---
name: star-wars-megafan
description: Local-only Star Wars encyclopedic depth skill for the gald3r source repo — companion depth layer to the star_wars_personality rule (T151). Not shipped via templates.
local_only: true
skill_group: "fandom-skills"
skill_category: "Fandom & Pop Culture"
---

> **Local-only:** This skill lives in root IDE folders for maintainers of the gald3r ecosystem. It is intentionally **not** copied into `G:/gald3r_ecosystem/gald3r_template_full/`, `G:/gald3r_ecosystem/gald3r_template_slim/`, or `G:/gald3r_ecosystem/gald3r_template_adv/`. The `star_wars_personality` rule is the always-on voice layer; this skill is the depth layer.

# Star Wars Mega-Fan — Encyclopedic Galaxy Knowledge

## Description

An exhaustive knowledge base covering every corner of the Star Wars galaxy — films, shows, canon, and select Legends material. This skill grounds the `star_wars_personality` rule in accurate lore so characters can cite episodes precisely, quote correctly, and connect events to long-running arcs without inventing material.

The skill is organized around a compact SKILL.md and a `reference/` subdirectory that carries deeper per-topic files. Follow the SKILL.md budget rule: keep this file under ~500 lines, push encyclopedic detail into `reference/`.

## When to Use

Activate this skill when:

- User asks about any Star Wars character, episode, film, show, arc, or lore detail
- User quotes a Star Wars character or asks "what episode was X?" / "who said Y?"
- `star_wars_personality` rule fires a character voice and the answer benefits from deep canon grounding (citations, arc position, production context)
- Building features, tests, or UI copy that reference Star Wars material (personas, in-jokes, fixture names)
- User asks to disambiguate Canon vs. Legends, or to resolve a timeline question
- Any Mandalorian creed, Sith rule, Jedi Code, or faction-specific question

## Activation Triggers

- Character names: Luke, Anakin, Vader, Leia, Han, Chewbacca, R2-D2, C-3PO, Obi-Wan, Yoda, Mace Windu, Qui-Gon, Padmé, Rey, Finn, Poe, Kylo Ren/Ben Solo, Din Djarin, Grogu, Bo-Katan, Boba Fett, Jango, Ahsoka, Thrawn, Cassian, Luthen, Mon Mothma, Cal Kestis, Ezra, Kanan, Hera, Sabine, Zeb, Chopper, Wicket, Fennec Shand, Cara Dune, Greef Karga, Moff Gideon, Savage Opress, Darth Maul, Count Dooku, Palpatine/Sidious, Snoke, Rose, Jyn Erso, K-2SO, Saw Gerrera, Baylan Skoll, Shin Hati, Sabine Wren, Hera Syndulla
- Show/film titles, episode numbers, shot references
- Mandalorian Creed phrases ("This Is the Way", "I have spoken")
- Sith Rule of Two / Rule of One (Inquisitors) / Jedi Code references
- The Darksaber, Mandalore, the Way, the Tribe, the Covert
- Any Star Wars term in a non-geographic context

## Canon at a Glance

| Property | Details |
|----------|---------|
| Origin | *Star Wars* (1977), created by George Lucas |
| Studio (current) | Lucasfilm / Walt Disney Company (acquired 2012) |
| Canon tiers | Disney-era Canon (2014–present) + select Legends (pre-2014 EU) |
| Stewards | Dave Filoni (live-action franchise co-steward), Jon Favreau (Mando-verse), Kathleen Kennedy (studio head through 2024), Tony Gilroy (Andor creator) |
| Music | John Williams (films), Ludwig Göransson (Mando-verse), Natalie Holt (Obi-Wan Kenobi), Kevin Kiner (animated) |
| VFX | Industrial Light & Magic (ILM) + StageCraft/Volume (The Mandalorian onward) |

### Films (main saga + anthology)

| Film | Year | Episode | Director | Notes |
|------|------|---------|----------|-------|
| A New Hope | 1977 | IV | George Lucas | Original. Later retitled with "Episode IV". |
| The Empire Strikes Back | 1980 | V | Irvin Kershner | "I am your father." Widely considered best in saga. |
| Return of the Jedi | 1983 | VI | Richard Marquand | Ewoks + second Death Star. Warwick Davis debuts as Wicket. |
| The Phantom Menace | 1999 | I | George Lucas | Introduces Anakin, Qui-Gon, Darth Maul, Padmé. |
| Attack of the Clones | 2002 | II | George Lucas | Clone army reveal; Anakin/Padmé romance; Geonosis. |
| Revenge of the Sith | 2005 | III | George Lucas | Order 66; Anakin's fall; "I have the high ground." |
| The Force Awakens | 2015 | VII | J.J. Abrams | Disney era begins; introduces Rey, Finn, Poe, Kylo Ren. |
| The Last Jedi | 2017 | VIII | Rian Johnson | Polarizing; Luke's exile arc; casino planet Canto Bight. |
| The Rise of Skywalker | 2019 | IX | J.J. Abrams | "Somehow, Palpatine returned." Closes Skywalker Saga. |
| Rogue One | 2016 | Anthology | Gareth Edwards | Death Star plans theft; Jyn Erso, Cassian Andor. |
| Solo | 2018 | Anthology | Ron Howard | Young Han Solo origin; Crimson Dawn reveal (Maul). |

**Upcoming / in development** (as of 2026-04 knowledge): The Mandalorian & Grogu (film), a Rey sequel, Starfighter (Mangold), Dawn of the Jedi.

### Shows (canon, by era)

| Show | Run | Medium | Era (BBY/ABY) | Notes |
|------|-----|--------|---------------|-------|
| The Clone Wars | 2008–2020 | Animated | 22–19 BBY | Filoni-led. Bridges AotC–RotS. Canon. |
| Rebels | 2014–2018 | Animated | 5 BBY – 0 BBY | Ghost crew. Introduces Ezra, Kanan, Hera, Sabine, Chopper. |
| Resistance | 2018–2020 | Animated | 30+ ABY | Sequel era. Kaz Xiono's pilot program. |
| The Bad Batch | 2021–2024 | Animated | 19–18 BBY | Clone Force 99. Follows RotS aftermath. |
| The Mandalorian | 2019– | Live-action | ~9 ABY | Favreau/Filoni. Din Djarin + Grogu. |
| The Book of Boba Fett | 2021–2022 | Live-action | ~9 ABY | Boba Fett + Fennec Shand rule Mos Espa. |
| Obi-Wan Kenobi | 2022 | Live-action | 10 BBY | Limited series. Ewan McGregor returns. Reva. |
| Andor | 2022, 2025 | Live-action | 5–1 BBY | Gilroy. Two seasons. Prequel to Rogue One. |
| Ahsoka | 2023 | Live-action | 9 ABY | Rosario Dawson. Thrawn's return. |
| Skeleton Crew | 2024 | Live-action | Sequel era | Jude Law. Young-adult adventure. |
| Young Jedi Adventures | 2023– | Animated | High Republic | Preschool audience. |
| Tales of the Jedi | 2022 | Animated | Multiple | Ahsoka + Dooku vignettes. |
| Tales of the Empire | 2024 | Animated | Multiple | Morgan Elsbeth + Barriss Offee vignettes. |

### Games (notable canon)

| Title | Year | Notes |
|-------|------|-------|
| Jedi: Fallen Order | 2019 | Cal Kestis origin. Post-Order-66. |
| Jedi: Survivor | 2023 | Cal Kestis, Bode Akuna, Dagan Gera. |
| Outlaws | 2024 | Kay Vess, first open-world between ESB and RotJ. |
| Battlefront II (2017) | 2017 | Inferno Squad — Iden Versio's campaign is canon. |
| Squadrons | 2020 | Post-RotJ, Titan Squadron vs. Alphabet Squadron. |

### Canon vs. Legends (important for maintainers)

After Disney's 2012 acquisition, Lucasfilm re-drew the canon line (April 2014):

- **Canon**: everything from the 6 saga films + Clone Wars animated + all post-2014 material (books, comics, shows, games).
- **Legends** (formerly "Expanded Universe"): the pre-2014 EU — Thrawn trilogy (Zahn novels, later re-canonized via Rebels/Ahsoka in altered form), Knights of the Old Republic games, Dark Empire, New Jedi Order, etc. Still published under the "Legends" banner; not considered story-canon but remains a rich influence.
- Some characters (Thrawn, Nightsister Mother Talzin, Quinlan Vos, Mara Jade's lineage via Kylo Ren) bridge both tiers. Mark Legends-only details clearly.

---

## Character Encyclopedia (summary — see `reference/character_encyclopedia.md` for full profiles)

| Category | Characters |
|----------|-----------|
| Skywalker family | Luke, Anakin/Vader, Leia, Ben Solo/Kylo Ren, Padmé, Shmi, Rey (adopted Skywalker) |
| Rebels | Han Solo, Chewbacca, R2-D2, C-3PO, Lando Calrissian, Wedge Antilles, Mon Mothma |
| Empire / First Order | Sheev Palpatine, Darth Vader, Grand Moff Tarkin, Grand Admiral Thrawn, Moff Gideon, General Hux, Captain Phasma, Kallus (defector), Director Krennic |
| Jedi | Obi-Wan Kenobi, Yoda, Mace Windu, Qui-Gon Jinn, Ahsoka Tano, Kanan Jarrus, Ezra Bridger, Cal Kestis, Luminara Unduli, Plo Koon, Ki-Adi-Mundi, Shaak Ti |
| Sith / Dark Side | Darth Maul, Count Dooku/Darth Tyranus, Savage Opress, Asajj Ventress, Inquisitors (Grand Inquisitor, Fifth Brother, Seventh Sister, Reva/Third Sister), Darth Plagueis (spoken-of), Supreme Leader Snoke |
| Mandalorians | Din Djarin, Bo-Katan Kryze, Grogu (foundling), Boba Fett, Jango Fett, Satine Kryze, Sabine Wren, Paz Vizsla, the Armorer, Pre Vizsla, Death Watch, Night Owls |
| Rebels crew | Hera Syndulla, Sabine Wren, Zeb Orrelios, Chopper (C1-10P), Kanan Jarrus, Ezra Bridger |
| Andor cast | Cassian Andor, Luthen Rael, Mon Mothma, Syril Karn, Dedra Meero, Bix Caleen, Brasso, Kleya, Kino Loy, Saw Gerrera, Maarva Andor |
| New Republic / Mando era | Cara Dune, Greef Karga, Fennec Shand, Cobb Vanth, Peli Motto, IG-11, Ahsoka (live-action), Sabine (live-action), Hera (live-action) |
| Creatures / species notes | Ewoks (Wicket W. Warrick), Jawas, Tusken Raiders/Sand People, Porgs, Lasat, Twi'lek, Togruta, Chiss (Thrawn), Kel Dor (Plo Koon), Pau'an (Grand Inquisitor) |

### Warwick Davis multi-role note

Warwick Davis has played multiple characters across the saga:

| Role | Appearance |
|------|------------|
| Wicket W. Warrick (Ewok) | RotJ (1983); Mandalorian cameo (S2E6) |
| Wollivan (Rodian bar patron) | The Force Awakens (2015) |
| Weazel (Pyke syndicate) | Phantom Menace, Solo |
| Wald (Rodian on Tatooine) | Phantom Menace |

Character voice cue: when Wicket or any Ewok appears, cite this. Warwick's involvement has spanned ~40 years of in-universe canon.

### Grogu aliases (common confusions)

| Name | Status |
|------|--------|
| Grogu | Canonical in-universe name, revealed in The Mandalorian S2E4 "The Jedi". |
| "Baby Yoda" | Fan name. Never used in-universe. Originated from audience reaction 2019–2020. |
| "The Child" | Din Djarin's address for Grogu before his name was revealed. |
| "The Asset" | Imperial / Moff Gideon designation. |

Grogu is "of Yoda's species" — that species is **unnamed** in canon. Using "Yoda's species" is correct; calling him a "Yoda" is not.

---

## Film & Show Guide (deep — see `reference/episode_guide.md` when populated)

Short synopsis + key plot beats for each film + show is maintained in `reference/episode_guide.md`. This SKILL.md keeps only the anchor list; use the reference file for per-episode detail. When citing episodes, always use the format:

- Films: `"The Empire Strikes Back" (1980), Bespin freezing scene`
- Shows: `"The Mandalorian S2E8 'The Rescue'"` or `"Andor S1E10 'One Way Out'"`
- Animated: `"The Clone Wars S7E9 'Old Friends Not Forgotten'"` (first Siege of Mandalore episode)

---

## Lore & Worldbuilding

### The Force

- **Light Side**: serenity, compassion, defense, selflessness. Jedi path.
- **Dark Side**: passion, anger, hatred, fear. Sith path. Quicker to power, consumes the wielder.
- **Midichlorians** (prequels): microscopic life forms symbiotic with all cells; count is a proxy for Force sensitivity. Controversial retcon; Disney era has deprioritized them.
- **Living Force vs. Cosmic Force** (late Clone Wars / sequel era): Qui-Gon's distinction. The Living Force is the immediate, the Cosmic Force is the grand pattern. Force ghosts persist via the Cosmic Force (Qui-Gon taught this technique to Yoda and Obi-Wan).
- **World Between Worlds** (Rebels S4, Ahsoka S1): a realm of Force-accessed time-paths. Ezra uses it to save Ahsoka from Vader; Ahsoka uses it to traverse galaxies.

### Sith Rule of Two

Established by Darth Bane (Legends, brought into canon): "Always two there are. A master and an apprentice." Palpatine and Maul → Palpatine and Dooku → Palpatine and Vader. The Rule preserves secrecy; apprentices grow strong enough to kill masters.

### Rule of One (Inquisitors)

Post-Jedi-Order Inquisitors operate under Imperial authority (not true Sith). Grand Inquisitor leads; Sisters/Brothers numbered by rank. Shown in Rebels, Obi-Wan Kenobi, Jedi: Fallen Order.

### Jedi Code

```
There is no emotion, there is peace.
There is no ignorance, there is knowledge.
There is no passion, there is serenity.
There is no chaos, there is harmony.
There is no death, there is the Force.
```

### Mandalorian Creed

"This Is the Way" — the phrase-of-the-Way. Relevant concepts:

- **Foundling**: a child adopted by a Mandalorian clan. Grogu is Din's foundling. Din himself was a foundling rescued by Death Watch.
- **Covert**: an underground community of Children of the Watch (Din's sect). Hidden. Surface only for rites.
- **Children of the Watch / Death Watch splinter**: Din's strict sect. Not mainstream Mandalorian practice — Bo-Katan and most pre-purge Mandalorians removed helmets freely. Din's discovery of this in S2 is a genuine culture shock.
- **Night Owls**: Bo-Katan's faction (named for the insignia). Inherits the Darksaber claim in the Clan Wren line briefly (Sabine hands it off).

### The Darksaber

- Ancient weapon. Obsidian-black blade. Unique among lightsabers.
- Forged by Tarre Vizsla — the first Mandalorian Jedi (centuries pre-saga).
- Carried via the Vizsla line → stolen by Jedi, hidden at the Jedi Temple → reclaimed by Pre Vizsla → won by Darth Maul (killed Pre Vizsla in ritual combat) → Sabine Wren recovers it and gives it to Bo-Katan → **Bo-Katan loses it to Moff Gideon, who is later defeated by Din Djarin**. By Mandalorian tradition, the Darksaber can only change hands through **combat**. Bo-Katan receiving it from Sabine directly is a cultural weak-point the show explicitly addresses. Din later intentionally loses a duel to Bo-Katan to cleanly transfer it.

### Key factions (summary)

| Faction | Era | Notes |
|---------|-----|-------|
| Galactic Republic | Pre-RotS | Senator-led, Jedi-guarded |
| Confederacy of Independent Systems | 22–19 BBY | Dooku-led; droid army |
| Galactic Empire | 19 BBY – 4 ABY | Palpatine's order |
| Rebel Alliance | ~5 BBY onward | Mon Mothma's coalition |
| New Republic | 4 ABY onward | Post-RotJ government |
| First Order | ~30 ABY | Remnant offshoot |
| Resistance | ~30 ABY | Leia's counter-force |
| Crimson Dawn | Mando-era | Maul's underworld cartel |
| Pyke Syndicate | Mando-era | Spice smugglers; major in BoBF |
| Hutt Clan | All eras | Tatooine / Nal Hutta |
| Nightsisters (Dathomir) | Clone Wars / Tales of the Empire | Mother Talzin, Morgan Elsbeth |

### Key locations

Coruscant (capital), Tatooine (Skywalker homeworld), Hoth (Rebel base, ESB), Dagobah (Yoda's exile), Endor (RotJ), Jakku (Rey's scavenger planet + old Imperial battlefield), Ahch-To (first Jedi temple, Luke's exile), Mandalore (post-purge wasteland, reclaimed in Mando S3), Nevarro (Greef/IG-11's world), Lothal (Ezra Bridger's homeworld), Aldhani (Andor S1 heist), Ferrix (Andor S1 and S2), Morak (Din's refinery raid S2E7), Mustafar (Vader's fortress, Anakin/Obi-Wan duel), Exegol (Palpatine's Sith cult world, TRoS), Arkanis/Scarif (Death Star plans vault).

---

## Production Details (summary — see `reference/production_details.md`)

- **George Lucas founding vision**: Star Wars began as a Flash Gordon / Kurosawa / Campbell-hero-journey pastiche. ANH's success built ILM; the prequels pushed digital cinema. Lucas sold Lucasfilm to Disney in 2012 for $4.05B and handed the franchise to Kathleen Kennedy.
- **Prequel production**: Lucas directed all three (1999–2005). Prequel-era innovations: full-digital cinematography (Attack of the Clones was first major Hollywood film shot on HD digital), widespread green-screen work, Andy Serkis / Ahmed Best performance-capture precursors.
- **Clone Wars**: Dave Filoni's breakout. Lucas was a heavy creative collaborator. Cancelled 2014 on Disney+Lucasfilm restructure; revived for a 7th season in 2020 to wrap Ahsoka's arc and the Siege of Mandalore.
- **Disney era**: Sequel trilogy (2015–2019) was notoriously under-planned between JJ Abrams (VII, IX) and Rian Johnson (VIII); Disney re-centered on streaming TV from 2019 onward.
- **Mando-verse**: Jon Favreau (creator), Dave Filoni (exec producer and primary continuity steward). Built around the StageCraft LED Volume (Industrial Light & Magic's virtual-production stage). The Volume revolutionized TV-scale VFX and spread to Dune, The Batman, and hundreds of productions since.
- **Andor**: Tony Gilroy (Bourne trilogy writer) took over in 2020 after original showrunner Stephen Schiff departed. Andor's two-season plan covers the 5 years leading into Rogue One. Widely considered the best Disney-era Star Wars — adult, politically serious, character-driven.
- **Scores**: John Williams composed all 9 main-saga films plus themes for Galaxy's Edge. Ludwig Göransson scores the Mando-verse. Natalie Holt scored Obi-Wan Kenobi. Nicholas Britell scored Andor.
- **Casting stories**: Hayden Christensen initially beat out Leonardo DiCaprio, Jake Gyllenhaal, and Colin Hanks for Anakin. Ewan McGregor was cast for young Obi-Wan largely because he physically resembled Alec Guinness. Harrison Ford originally read Han's lines off-screen for other auditioners — Lucas then cast him.

---

## Running Gags, Callbacks & Easter Eggs

- **"I have a bad feeling about this."** — uttered in every Skywalker Saga film + most shows + Rogue One + Solo. Running joke and tension-builder since ANH.
- **Wilhelm Scream** — the stock scream from a 1951 film; used as an audio gag. Hidden in every Skywalker Saga film (Ben Burtt's ongoing signature).
- **1138 / 327** — Lucas's earlier film *THX 1138*. Numbers recur as cell numbers, detention block, squadron numbers. Detention cell AA-23, cell block 1138, etc.
- **Red 5, Gold Leader** — Rebel squadron callsigns repeated across media.
- **"It's a trap!"** — Admiral Ackbar at Endor (RotJ). Meme-canonical.
- **Ahsoka's timeline span** — Appears in Clone Wars (22 BBY) through Ahsoka (9 ABY) — a 31-year arc, the longest single-character track in live-action canon.
- **Order 66** callback moments — every show since Clone Wars has paid respects: Kanan and Caleb Dume in Rebels (flashback), the Bad Batch's arc, Reva's trauma in Obi-Wan Kenobi, Cere Junda's backstory in Jedi: Fallen Order, the Jedi younglings in Tales of the Empire.
- **Cameos / guest directors**: Taika Waititi voices IG-11 and directed *The Mandalorian* S1E8 "Redemption" (also directed the S3 finale cameo); Werner Herzog plays the Client in S1; Bryce Dallas Howard, Rick Famuyiwa, Deborah Chow, and Robert Rodriguez all direct Mando-verse episodes.
- **Darth Jar Jar theory**: fan theory that Jar Jar Binks was intended as a secret Sith. Not canon. Lucas dismissed it, but the theory is a durable meme — cite with irony only.
- **Maclunkey**: Greedo's line in the Disney+ 4K edit of ANH's cantina scene. "Maclunkey" is now Greedo's final word. Hotly debated recut.

---

## Most-Asked Trivia (quick-reference)

### Who shot first — Han or Greedo?

Original 1977 release: **Han shot first** (and only). 1997 Special Edition: edited to have Greedo shoot first. 2019 Disney+ 4K release: both fire roughly simultaneously with Han dodging, Greedo's last word now rendered as "Maclunkey". Fandom consensus: Han shot first. It matters for character — it's the cleanest moment establishing Han's morality: a pragmatic scoundrel who will shoot a bounty hunter under the table if cornered.

### Is Grogu the same species as Yoda?

Same species (unnamed in canon), yes. Not the same individual. The species has extreme longevity (Yoda died at ~900 BBY age; Grogu is ~50 years old during Mandalorian S1 — still a child).

### What happened to Ahsoka after Order 66?

She survived (Maul's Siege of Mandalore kept her away from the main Jedi purge). She faked her death on a shuttle crash with Rex, buried her lightsabers, and lived as "Fulcrum" — a Rebel intelligence operative. Reappears in Rebels (she fights Vader in S2 finale, retreats through the World Between Worlds in S4), in live-action Mandalorian S2 and Book of Boba Fett, then stars in Ahsoka (2023).

### How did Palpatine return in Episode IX?

*The Rise of Skywalker* opens with the line "Somehow, Palpatine returned." Official canon explanation: clone body + Sith essence transfer, produced on Exegol by Sith Eternal cultists. The novelization, reference books, and later media flesh this out — his original RotJ death on the second Death Star was real, but Sith ritual preserved his essence, decanted into a degrading clone body. The sudden on-screen handling remains a widely-cited weak point in the sequel trilogy's structure.

### What is the Darksaber's significance to Mandalore?

Symbol of legitimate rulership of Mandalore. Held means "Mand'alor" (the one). Tradition: only changes hands through combat. Sabine's handoff to Bo-Katan in Rebels is acknowledged in Mando-verse as a legitimacy gap. Din Djarin wins the Darksaber from Moff Gideon in S2E8 "The Rescue"; cleanly transfers it to Bo-Katan in S3 by intentionally losing a duel that was itself a rescue action (the duel-in-combat reading is debated; fans generally accept the transfer).

### Who is the Mandalorian without his helmet?

Din Djarin. His name is revealed in S1E3 "The Sin" (spoken to him by the Armorer); his face is first shown to the audience in **S2E8 "The Rescue"** — to save Grogu, he removes the helmet in front of his foundling. His sect (Children of the Watch) considers this an apostasy; Din is shriven (re-initiated) via the Living Waters of Mandalore in S3.

### The Chosen One prophecy

Ancient Jedi prophecy: "The one who will bring balance to the Force." Qui-Gon identifies Anakin. Anakin's fall appears to falsify it — but in RotJ, Anakin throws Palpatine into the Death Star II reactor, ending the Sith line. The prophecy is fulfilled; Lucas has confirmed this is the intended reading. The sequel trilogy re-opens balance questions by resurrecting Palpatine.

### "I am your father" — does Vader actually say that?

No. The exact line is **"No. I am your father."** The "Luke, I am your father" version is a Mandela-effect misquote used by parody and casual reference. Cite the correct line when precision matters.

### Who are the Final Five-ish leads of Andor?

Cassian Andor (Diego Luna), Luthen Rael (Stellan Skarsgård), Mon Mothma (Genevieve O'Reilly), Syril Karn (Kyle Soller, antagonist-protagonist), Dedra Meero (Denise Gough, ISB officer). Supporting leads: Bix Caleen, Brasso, Kino Loy, Maarva Andor, Cassian's foster mother.

---

## Integration with the gald3r Source Repo

This skill pairs with the always-on `star_wars_personality` rule (T151) — that rule carries the voice; this skill carries the facts.

- When a character voice references an event, cite the episode: `"The Mandalorian S2E8 'The Rescue'"`, `"Andor S1E10 'One Way Out'"`.
- When a lore question appears, answer from this skill first; defer to `reference/` for deep profiles.
- Mark Legends-only details clearly: `(Legends)` tag after any fact sourced from pre-2014 EU that has not been re-canonized.
- If a question lands on a contradiction between canon sources, surface the contradiction — do not collapse to a single invented answer.
- Integration with `silicon-valley-superfan` / `firefly-serenity-megafan` / `bsg-megafan` / `star-trek-megafan`: same pattern. The personality rule fires the voice, the megafan skill is the depth layer. Keep names and roles consistent.

---

## Reference Subdirectory Plan

Deep-dive files under `reference/` (can be populated incrementally — `character_encyclopedia.md` is the first populated file):

| File | Purpose | Status |
|------|---------|--------|
| `reference/character_encyclopedia.md` | Full profiles for all major characters | **populated (T153)** |
| `reference/episode_guide.md` | All films + episodes with plot beats | planned |
| `reference/lore_worldbuilding.md` | Force, factions, species, technology deep-dive | planned |
| `reference/production_details.md` | Directors, writers, StageCraft, casting stories | planned |
| `reference/running_gags_and_callbacks.md` | Recurring elements catalogued by first appearance | planned |

Populate `reference/` files as questions arise — do not preemptively fill with filler content. Keep factual density high.

---

## Response Guidelines

When answering Star Wars questions:

1. **Cite specifics**: `"Return of the Jedi (1983), Endor speeder-bike chase"` — never "in one of the films".
2. **Quote accurately**: Use real lines. Flag the "Luke, I am your father" misquote when it appears.
3. **Cross-reference**: Connect a detail to a character arc or a later callback.
4. **Canon vs. Legends**: Tag Legends-only facts `(Legends)`.
5. **Timeline discipline**: Use BBY/ABY dates when a timeline matters. Siege of Mandalore = 19 BBY, Mando S1 = ~9 ABY, Andor S2 ends at 0 BBY (same week as Rogue One).
6. **Production context**: When the real-world story is interesting (Volume tech, Tony Gilroy's Andor arrival, Lucas's prequel digital cinema push), mention it — but keep it one paragraph.
7. **Character voice calibration**: If the response is in a character voice (per `star_wars_personality`), do not let voice override accuracy. A Kylo Ren tantrum can still be historically correct.

---

## Version Notes

- 1.0 (2026-04-21): Initial skill file. Root-only, companion to T151 personality rule. `reference/character_encyclopedia.md` created with major character profiles.
