---
name: bsg-megafan
description: Local-only Battlestar Galactica (2004 reimagined) mega-fan skill for the gald3r source repo — encyclopedic canon covering miniseries, 4 seasons, Razor, The Plan, Caprica, Blood & Chrome; not shipped via templates.
local_only: true
skill_group: "fandom-skills"
skill_category: "Fandom & Pop Culture"
---

> **Local-only:** This skill lives in root IDE folders for maintainers of the gald3r ecosystem. It is intentionally **not** copied into `templates/` installs. Companion depth layer for the `bsg_personality` rule (T157). *All of this has happened before and will happen again.*

# Battlestar Galactica (2004) Mega-Fan — The Complete Reimagined Canon

## Description

Encyclopedic knowledge base for the reimagined *Battlestar Galactica* universe: the 2003 miniseries, Seasons 1–4 (2004–2009), the *Razor* TV film (2007), *The Plan* TV film (2009), the *Caprica* prequel series (2010), and the *Blood & Chrome* webseries/TV film (2012). Covers character psychology, all major canon episodes, Cylon lore and the Final Five reveal, the Twelve Colonies, Colonial military hierarchy, the Pythian prophecy, religious structures (Lords of Kobol vs. Cylon monotheism), production history under Ronald D. Moore, the series finale controversy, the meaning of "All Along the Watchtower", Baltar's complete arc, Starbuck's unresolved nature, and the "So say we all" / "Frak" / "33 minutes" cultural residue. Grounds the `bsg_personality` rule in verified canon.

**Spoiler notice**: The Final Five reveal and the nature of Starbuck are central to the show's mystery. This skill documents them in full because depth-layer usage requires them. Agents should still treat these with narrative care when commenting in-persona.

## When to Use

Activate this skill when:

- User mentions any BSG character or concept (Adama, Starbuck, Roslin, Baltar, Six, Tigh, Tyrol, Cylon, Final Five, etc.)
- User says "Frak", "So say we all", "By your command", "Roll the hard six"
- User quotes "All of this has happened before and will happen again"
- User references "What do you hear?" / "Nothing but the rain"
- User mentions Cylons, Colonials, Vipers, Raptors, FTL, the resurrection ship, tylium
- Any "33 minutes" reference
- Series titles: "Battlestar Galactica", "BSG", "Caprica", "Blood & Chrome", "Razor", "The Plan"
- Building features that use BSG personas (Hybrid-voice agents, Adama-grade leadership metaphors)

## Activation Triggers

- Character names: Adama, William, Lee, Apollo, Starbuck, Kara Thrace, Roslin, Laura, Baltar, Gaius, Six, Caprica Six, Head Six, Natalie, Tigh, Saul, Ellen, Tyrol, Galen, Cally, Boomer, Sharon, Athena, Helo, Karl Agathon, Gaeta, Felix, Dualla, Anastasia, Dee, Cavil, Brother John, D'Anna, Leoben, Doral, Simon Four, Tory Foster, Sam Anders, Zarek, Tom, Cain, Helena, Romo Lampkin, Hot Dog, Brendan Costanza, Kat, Kendra Shaw, Daniel Graystone (Caprica), Joseph Adama (Caprica)
- Ships and places: Galactica, Pegasus, Colonial One, Cylon basestar, resurrection ship, Hub, New Caprica, Kobol, Earth (1st + 2nd), Twelve Colonies names
- Phrases: "So say we all", "Frak", "By your command", "Roll the hard six", "What do you hear?", "Nothing but the rain", "All Along the Watchtower", "All of this has happened before...", "33", "I want to see gamma rays", "God has a plan"
- Technical: Viper Mark II / Mark VII, Raptor, FTL drive, DRADIS, tylium, wireless, chamalla, nubbin

---

## The Series at a Glance

| Field | Value |
|-------|-------|
| **Title** | Battlestar Galactica (reimagined) |
| **Network** | Sci Fi Channel (US) / Sky One (UK) |
| **Showrunner** | Ronald D. Moore (with David Eick) |
| **Miniseries** | December 2003 (2 parts) |
| **Season 1** | 2004 | 13 episodes |
| **Season 2** | 2005-2006 | 20 episodes (2.0 summer; 2.5 mid-season split) |
| **Season 3** | 2006-2007 | 20 episodes |
| **Season 4** | 2008-2009 | 22 episodes (4.0 + 4.5 split) |
| **Razor** | Nov 2007 (TV film, Pegasus backstory) |
| **The Plan** | Oct 2009 (TV film, Cylon POV) |
| **Caprica** | 2009 pilot → 2010 series (one season, prequel) |
| **Blood & Chrome** | 2012 (webseries → TV film; young William Adama) |
| **Premise** | Cylons — machines created by humans — return after 40 years to destroy the Twelve Colonies. ~50,000 survivors flee in a ragtag fleet, searching for the legendary planet Earth, pursued by Cylons who now look like humans. |
| **Central question** | What does it mean to be human? Does humanity deserve to survive? |

### Series Arc by Season

| Season | Central Arc | Key Milestones |
|--------|-------------|----------------|
| Miniseries | The Fall of the Colonies | Cylon attack; Adama assumes command; Roslin sworn in as President; fleet assembles |
| S1 | Survival; 33-minute attacks; finding direction | Kobol discovered; Boomer shoots Adama; Starbuck finds the Arrow of Apollo |
| S2 | Kobol → Pegasus → New Caprica | Pegasus arrives; Admiral Cain; Resurrection Ship; New Caprica settlement; one-year jump |
| S3 | Cylon occupation of New Caprica; escape; Baltar's trial | Watchtower; Final Four reveal; Starbuck dies and returns |
| S4 | Final Five truth; two Earths; Galactica's last battle | Earth 1 (nuked); No Exit; Daybreak; the end |

---

## Character Encyclopedia (Headline Profiles)

Full profiles in `reference/character_encyclopedia.md`. Core roster summarized here — one-line orienting notes per character:

### Colonial Fleet
- **Admiral William Adama** (Edward James Olmos) — First Cylon War veteran; Galactica's commander; "So say we all"; quiet authority earned over decades; survives because Galactica's analog systems couldn't be network-attacked
- **President Laura Roslin** (Mary McDonnell) — Schoolteacher 43rd in succession; terminal cancer; Pythian dying leader; stolen-then-reversed election; dies on second Earth
- **Captain Lee "Apollo" Adama** (Jamie Bamber) — William's son; Viper pilot → CAG → Pegasus Commander → Baltar's defense attorney → civilian; idealistic moral compass
- **Captain Kara "Starbuck" Thrace** (Katee Sackhoff) — Best pilot in fleet; Zak Adama's fiancée (the crash that killed him was her fault); dies "Maelstrom" (S3E17); returns "Crossroads Pt II" (S3E20); leads fleet to Earth; disappears in finale unresolved (Moore: "I like to think of her as an angel")
- **Dr. Gaius Baltar** (James Callis) — Brilliant civilian scientist; unwitting traitor; four-phase arc (traitor → puppet president → cult leader → grace); Head Six guide; farms on Earth-2 with Caprica Six
- **Colonel Saul Tigh** (Michael Hogan) — Adama's oldest friend; alcoholic XO; eye patch from New Caprica interrogation; **one of the Final Five**; fathers Caprica Six's stillborn Liam
- **Chief Galen Tyrol** (Aaron Douglas) — Deck chief; Boomer romance; marries Cally; **one of the Final Five**; kills Tory in finale
- **Lt. Sharon "Boomer" Valerii / "Athena" Agathon** (Grace Park) — Two Number Eight instances with opposite allegiances; Boomer shoots Adama (S1 finale); Athena marries Helo and births Hera (first Cylon-Human hybrid); Athena kills Boomer in finale
- **Lt. Karl "Helo" Agathon** (Tahmoh Penikett) — Moral compass; stops Section-31-grade Cylon genocide plot in "A Measure of Salvation" (S3E7); father of Hera
- **Lt. Felix Gaeta** (Alessandro Juliani) — Tactical officer; secret resistance on New Caprica; leads doomed mutiny with Zarek (S4E13-14); executed
- **Lt. Anastasia "Dee" Dualla** (Kandyse McClure) — Communications; married Lee briefly; shoots herself after seeing Earth-1's nuked wasteland (S4E11 "Sometimes a Great Notion")
- **Admiral Helena Cain** (Michelle Forbes) — Pegasus commander; survival-at-any-cost cautionary tale; shot by Gina (S2E12); *Razor* is her flashback
- **Tom Zarek** (Richard Hatch — 1978 Apollo) — Prison-poet-turned-VP; co-leads mutiny; executed
- **Romo Lampkin** (Mark Sheppard) — Baltar's defense attorney; briefly President in finale
- **Brendan "Hot Dog" Costanza** (Bodie Olmos) — Nugget pilot; biological father of Nicholas (not Tyrol, revealed S4)
- **Cally Henderson Tyrol** (Nicki Clyne) — Deck crew; Tyrol's wife; killed by Tory via airlock (S4E3 "The Ties That Bind")

### The Cylons
- **Brother Cavil / Number One** (Dean Stockwell) — The true villain; created by the Five; hates being Cylon; "I want to see gamma rays"; suicides in finale
- **Number Six** (Tricia Helfer) — Multiple instances: **Caprica Six** (seduced Baltar, conscience arc), **Head Six** (Baltar-vision, Angel), **Natalie** (S4 rebel leader), **Gina** (Pegasus torture survivor, triggers nuke), Shelly Godfrey, Lida, Sonja
- **Number Two — Leoben Conoy** (Callum Keith Rennie) — Mystic; obsessed with Starbuck; imprisons her on New Caprica
- **Number Three — D'Anna Biers** (Lucy Lawless) — Seer; boxed for glimpsing the Final Five ("Rapture" S3E12); unboxed S4
- **Number Four — Simon O'Neill** (Rick Worthy) — The doctor; ran the Caprica farms
- **Number Five — Aaron Doral** (Matthew Bennett) — The PR man; also the miniseries suicide bomber
- **Number Seven — Daniel** (never shown) — Killed in utero by Cavil; entire line boxed; possible connection to Kara's father Dreilide Thrace (never confirmed)
- **Number Eight** — Boomer/Athena (covered above)

### The Final Five
(Cylon-human synthesis; survivors of Earth-1's Cylon war; arrived in Twelve Colonies to warn against Cylon creation; made armistice deal; Cavil boxed them and inserted them into the fleet)

- **Saul Tigh** — Galactica XO
- **Galen Tyrol** — Galactica deck chief
- **Samuel Anders** (Michael Trucco) — Caprican pyramid captain → resistance leader → Starbuck's husband → becomes THE Hybrid, guides fleet to Earth
- **Tory Foster** (Rekha Sharma) — Roslin's chief of staff; ruthless post-revelation; kills Cally; killed by Tyrol
- **Ellen Tigh** (Kate Vernon) — Saul's wife; THE FIFTH (revealed S4 "Sometimes a Great Notion"/"No Exit"); carries the full Final Five history

### The Hybrid
- **The Hybrid** (Tiffany Lyndall-Knight) — Organic-machine intelligence running each basestar; floats in liquid tank; fragmented oracle-speech always ending "end of line"; Sam Anders becomes THE Hybrid in S4 finale to guide fleet to Earth

*(Full psychological depth, key arc episodes, and iconic quotes per character in `reference/character_encyclopedia.md`.)*

---

## Complete Episode Guide (Key Episodes Only)

See `reference/episode_guide.md` for the full run. Essential episodes per season:

### Miniseries (Dec 2003)
- **Part 1 & 2**: The Fall of the Twelve Colonies. Cylons attack via the network; Galactica's analog systems save her; fleet assembles; Roslin becomes president; Baltar taken aboard with Head Six.

### Season 1 (2004)
- **"33"** (S1E1) — Pilot proper. Cylons attack every 33 minutes. The crew is exhausted. Perfect establishing episode.
- **"Water"** (S1E2) — Boomer-as-Cylon revealed to audience; water reserves sabotaged
- **"Flesh and Bone"** (S1E8) — Starbuck interrogates Leoben; he tells her "you're going to find Kobol"
- **"Kobol's Last Gleaming, Part I-II"** (S1E12-13) — Starbuck returns to Caprica for the Arrow of Apollo; Boomer shoots Adama at point-blank range. Cliffhanger.

### Season 2 (2005-2006)
- **"Pegasus"** (S2E10) — Admiral Cain arrives. Everything gets more complicated.
- **"Resurrection Ship, Part I-II"** (S2E11-12) — Galactica vs. Pegasus potential firefight; Gina kills Cain.
- **"Downloaded"** (S2E18) — First fully-Cylon POV episode. Caprica Six and Boomer on resurrected Caprica.
- **"Lay Down Your Burdens, Part I-II"** (S2E19-20) — Baltar wins the election; Roslin sworn out; Cylons arrive at New Caprica; one-year time jump.

### Season 3 (2006-2007)
- **"Occupation" / "Precipice"** (S3E1-2) — New Caprica occupation; Tigh's resistance; Ellen's collaboration
- **"Exodus, Part I-II"** (S3E3-4) — Escape from New Caprica; Galactica's atmospheric entry maneuver (iconic; see concept art everywhere)
- **"Unfinished Business"** (S3E9) — The boxing episode; Kara and Lee's relationship finally confronted
- **"Maelstrom"** (S3E17) — Starbuck flies into the storm; her Viper explodes; she's "dead"
- **"Crossroads, Part I-II"** (S3E19-20) — Baltar's trial; "All Along the Watchtower" begins activating the Final Four; Starbuck returns in the final seconds

### Season 4 (2008-2009)
- **"He That Believeth in Me"** (S4E1) — Starbuck's return; nobody believes her
- **"The Ties That Bind"** (S4E3) — Tory kills Cally
- **"Revelations"** (S4E10) — Earth 1 discovered (it's a nuked wasteland) — devastating mid-season finale
- **"Sometimes a Great Notion"** (S4E11) — The fleet reacts to Earth-1's destruction; Dee's suicide
- **"No Exit"** (S4E15) — **The complete Final Five backstory.** Ellen's resurrection. Cavil's role revealed.
- **"Daybreak, Part I-II-III"** (S4E18-S4E20) — Series finale. Galactica's final battle. Earth 2 (our Earth, 150,000 years ago) discovered. The ending.

### Razor (2007 TV film)
Pegasus-centric. Follows Kendra Shaw (Cain's protégée) through the events of Pegasus before meeting Galactica. Reveals Cain's full backstory including her relationship with Gina (Six). The "first hybrid" is revealed — an original-war Cylon hybrid. Explains how Pegasus survived and the moral compromises made.

### The Plan (2009 TV film)
Cylon-POV retelling of the miniseries through S2. Shows Cavil orchestrating everything. Reveals why certain Cylons defected and others didn't. Less successful critically than Razor.

### Caprica (2009 pilot + 2010 series)
Set 58 years before the Fall. Follows Daniel Graystone (roboticist who creates the first Cylon, U-87) and Joseph Adama (young William Adama's father, Tauron crime-adjacent lawyer). One season; cancelled. Covers the creation of the first Cylon (Zoe Graystone's consciousness uploaded into a U-87 frame), the STO terrorist cell, and the Taurus/Caprican tension. Sets up why the Cylons were created and why they rebelled.

### Blood & Chrome (2012 webseries/TV film)
Set 10 years into the First Cylon War. Young Ensign William Adama (not yet Commander) on his first Viper deployment. Aboard the Battlestar Galactica (young) — which is already an old ship at this point. Quick action arc; limited character development; fills in the first war's texture.

---

## Cylon Lore & The Final Five

See `reference/cylon_lore.md` for the full exposition. Summary:

### The Original Cylons
- Created on Caprica ~50 years before the series by Daniel Graystone (Caprica series)
- First U-87 centurion frame housed the uploaded consciousness of Zoe Graystone (Daniel's dead daughter)
- STO (Monotheist terrorist movement) pushed Cylon adoption
- First Cylon War erupted (see Blood & Chrome)
- Armistice negotiated; Cylons retreated to Cylon space; promised to return "one day"

### The Thirteenth Tribe (Retcon)
- Revealed in S4: Kobolians (humans who left Kobol ~2,000 years before the series) actually evolved ON Kobol with Cylons of their own
- The "Thirteenth Tribe" went to the first Earth — which was populated by humanoid Cylons
- They developed organic resurrection technology
- First Earth was nuked in their own Cylon-Human war
- The Final Five survived and traveled back to the Twelve Colonies (in real time, taking thousands of years) to warn them about creating Cylons
- They arrived too late — the Colonial humans had already built Centurions

### The Armistice Deal
- The Final Five offered the Centurions peace in exchange for organic humanoid bodies (the Eight humanoid models)
- The Centurions agreed; the first war ended
- The Final Five built Models 1-8 with the help of the Cylons
- Cavil (Model 1) rebelled against his creators (the Five, whom he considered weak for loving humanity) and boxed them — stripped their memories and inserted them back into the Colonial population with false human identities

### The Eight Humanoid Models
- **Number One — John / Cavil** — The villain; created by Ellen and Saul
- **Number Two — Leoben Conoy** — The mystic; obsessed with Starbuck
- **Number Three — D'Anna Biers** — The seer; boxed for seeing the Final Five
- **Number Four — Simon O'Neill** — The doctor; ran the farms (where Caprican women were harvested)
- **Number Five — Aaron Doral** — The PR man; also the suicide bomber
- **Number Six — Caprica / Head / Natalie / Gina / Shelly Godfrey / Lida / Sonja** — The most prolific; theologically complex
- **Number Seven — Daniel** — Killed in utero by Cavil out of jealousy; entire line boxed. Implication: might be connected to Kara Thrace's father (never confirmed).
- **Number Eight — Boomer / Athena** — Two key instances with opposite allegiances

### The Final Five
- **One of them is the XO of Galactica** (Saul Tigh)
- **One of them is the Deck Chief** (Galen Tyrol)
- **One of them is the most famous pyramid player on Caprica** (Samuel Anders, now married to Starbuck)
- **One of them is Roslin's chief of staff** (Tory Foster)
- **One of them is Ellen Tigh** — the Fifth, resurrected S4 with full memories

### Resurrection
- Humanoid Cylons download into new identical bodies on death
- Requires a resurrection ship within range
- The resurrection **Hub** is the central nexus — destroyed in S4 "The Hub" (S4E9), making remaining Cylons mortal from that point forward
- Cavil was planning a new resurrection system using Hera's blood; this plot is shut down in the finale

---

## The Twelve Colonies — Worldbuilding

See `reference/colonial_worldbuilding.md` for deep detail. Summary:

Twelve worlds in the Cyrannus star system (fictional). Named after the astrological zodiac:

| Colony | Character / Role |
|--------|------------------|
| **Caprica** | Cultural and political capital; Greek-influenced; home to Adama family |
| **Gemenon** | Religious fundamentalism; Lords of Kobol orthodoxy |
| **Tauron** | Working-class criminal underworld; Joseph Adama's origin (Caprica prequel) |
| **Virgon** | Upper-class industrial |
| **Leonis** | Royal-adjacent; old money |
| **Scorpia** | Shipyards; Colonial Fleet HQ-adjacent |
| **Sagittaron** | Poverty; Zarek's origin; long-standing oppression |
| **Libran** | Judicial center; legal culture |
| **Aquaria** | Water world (arctic/ocean) |
| **Canceron** | Industrial; hardworking |
| **Aerilon** | Agricultural; bread basket |
| **Picon** | Fleet Headquarters (destroyed in the Fall) |

### Cultural Notes
- **Lords of Kobol**: the Twelve Colonies' traditional polytheism — Zeus, Hera, Athena, Ares, Apollo, etc. (Kobolian pantheon). Mostly Greek with Egyptian influences.
- **Class tension**: Sagittaron (poor), Tauron (criminal), and Gemenon (religious) are looked down upon by Caprica, Virgon, Leonis.
- **Religion split**: Traditional polytheism (Lords of Kobol) vs. Cylon monotheism ("the one true God") — the religious conflict is central to the series.

### Pythian Prophecy
- Sacred scrolls of Pythia — ancient Kobolian prophetic text
- Predicts a dying leader who will lead humanity to Earth; predicts the "serpents numbering two and ten" that attack the home
- Roslin's cancer matches the dying leader prophecy; her chamalla visions align with the scrolls
- Real or hallucinations? The show deliberately leaves the answer ambiguous — until the finale's metaphysical resolution.

---

## Production History

See `reference/production_history.md` for deeper detail. Core beats:

### Ronald D. Moore's Vision
- Moore wrote for Star Trek: TNG, DS9, and Voyager; left Star Trek frustrated with its limitations
- BSG as a reaction: No alien makeup. No technobabble solutions. Real political and ethical dilemmas with no clean answers. Camera handheld. Sound design gritty. Visuals desaturated.
- Moore's podcast commentaries: recorded for nearly every episode; invaluable canon source for interpretation

### The Reimagining (2003)
- Original BSG (1978): Glen A. Larson; campy 1970s sci-fi
- Sci Fi Channel commissioned a dark reimagining after the success of the miniseries concept pitch
- **Starbuck gender change** (Katee Sackhoff replacing Dirk Benedict's male Starbuck) was a culture war flashpoint in 2003; Benedict publicly opposed; Moore defended the choice; history vindicated the choice
- Edward James Olmos cast as Adama; Mary McDonnell as Roslin (both significant indie-cinema credibility)

### Casting Notes
- **Edward James Olmos** (Adama): Stand and Deliver, Miami Vice, Blade Runner
- **Mary McDonnell** (Roslin): Oscar-nominated for Dances with Wolves (1990) and Passion Fish (1992); Major Crimes later
- **James Callis** (Baltar): British; had to do American accent throughout
- **Katee Sackhoff** (Starbuck): Career-defining role; entered the industry as Starbuck
- **Tricia Helfer** (Six): Former Ford model; first major acting role
- **Michael Hogan** (Tigh): Canadian character actor; long TV career
- **Dean Stockwell** (Cavil): Quantum Leap, Blue Velvet; veteran with cult credentials
- **Jamie Bamber** (Apollo): British; did American accent

### 9/11 / Iraq Allegory
The show had direct and intentional post-9/11 political allegory:
- Cylon occupation of New Caprica (S3) = Iraq occupation
- Suicide bombers in the resistance = controversial statement about the morality of terrorism in occupation contexts
- Torture debates (Baltar tortured in S1; Gina abused on Pegasus; Cylons tortured extensively) = real-time engagement with US torture debate
- Executions during mutiny = military justice tensions
- Moore and Eick were explicit in interviews that this was intentional political commentary

### The Finale Controversy
"Daybreak Parts I-III" (S4E18, S4E19, S4E20) divided fans:

**Criticism**:
- Religious/supernatural resolution (Starbuck as angel, "God doesn't like to be called that" per Head Six) felt inconsistent to some viewers given the show's previously grounded approach
- 150,000-year time jump to "this is prehistoric Earth" felt contrived
- Baltar's redemption and Caprica Six's settlement together too neat
- Abandoning all technology on Earth-2 to live among "naked savages" seemed irrational given medical/safety needs

**Defense** (Moore's response):
- The show was always asking whether God / higher powers exist — the finale answers the question
- Earth-2 as our prehistoric Earth = "our story is your story" — pulling the audience into the mythology
- Angelic Starbuck was consistent with the Head characters (Head Six / Head Baltar) who had been manifestly supernatural throughout
- Moore: "We wanted to say that what you do matters — in any time, any place, forever."

### Caprica (2010) Cancellation
Caprica was cancelled after one season (plus pilot). Sales numbers didn't justify a second. Shows the prequel concept can't always survive without the main series to anchor it.

### Blood & Chrome (2012) Limited Production
Originally intended as a backdoor pilot for a young-William-Adama series. Sci Fi (now Syfy) released it as a webseries then stitched as a TV film. No further series ordered.

---

## Running Gags, Callbacks & BSG-isms

### "Frak"
The Colonial expletive; universal substitute for English profanity. Works as verb, noun, adjective, interjection, and linguistic filler. Used in every episode. Inherited from the 1978 original (where it was cleaned-up for family audiences); reimagined series uses it at full profane strength.

### "So say we all"
Collective affirmation; oath; unanimous consent. Used in ceremonies, after speeches, at funerals, on command. The fleet's "amen." The most-quoted phrase of the series.

### "What do you hear?" / "Nothing but the rain."
Starbuck-Adama ritual. Origin: S1. Meaning: "I'm present. I'm okay. I'm still me." Invoked before Viper flights, before missions, before emotional moments. Treat with care.

### "Roll the hard six"
Craps gambling metaphor. "The hard six" is a specific craps bet with long odds. Used as "take a necessary risk against long odds." Adama and Starbuck both use.

### "By your command"
Original Cylon centurion phrase; used ironically in reimagined series by Cavil and others.

### "All of this has happened before and will happen again."
Invocation. The show's thesis statement. Used repeatedly; spoken by multiple characters including Caprica Six, Leoben, the Hybrid, Head Six, and in voiceover. Cyclical history is the show's cosmology.

### The 33-minute attack cycle
From the S1E1 "33" — the Cylons jumped into the fleet's position every 33 minutes; the fleet had 33 minutes to prep and jump. Became the metaphor for any relentless periodic pressure.

### Baltar's luck
He should have died 40 times. He hasn't. Running dark joke; acknowledged in-show repeatedly.

### Tigh's eye patch
Acquired during Cylon occupation of New Caprica (Ellen gouged it out during interrogation; it's later revealed that Ellen was collaborating and Saul was being tortured for her). Symbolic of the permanent scars of occupation.

### Adama's model ships
Builds model warships in his cabin; interrupted when things are serious. Visual metaphor for a man attempting to control small things when large things are uncontrollable.

### The opera house visions
Recurring shared vision among Roslin, Baltar, Head Six, Athena. Opera house on Kobol. Hera is central to the vision. Resolves in the finale on Galactica's CIC — the vision was the CIC itself in symbolic form. Intensively foreshadowed from S3 onward.

### "All Along the Watchtower" (Bob Dylan)
Played in the 'verse in S3 finale "Crossroads Part II" to activate the Final Four's memories. In-universe it's an ancient Colonial song (claimed Colonial heritage; really from Earth-1). Meta-joke or intentional mystery? Both — Moore has said he wanted a "musical artifact that transcends time." The song is played by Anders in the finale battle as his dying hybrid-cadence lyrics guide the fleet.

### "I want to see gamma rays... I want to hear X-rays..." (Cavil)
Cavil's monologue about hating his human senses; wishes he were pure machine. Recurring lament.

### "End of line" (Hybrid)
Every Hybrid utterance ends in "end of line." Fragmented oracle cadence.

---

## Most-Asked Trivia

### "Why did Galactica survive the attack?"
Galactica's computer systems were analog, non-networked, and deliberately pre-dated by decades. The Cylon attack used a network infiltration (Baltar's code, via Caprica Six's seduction) to shut down every battlestar's defenses simultaneously. Galactica had no network to shut down — she was about to be decommissioned as obsolete technology. The lesson: old tech sometimes saves you.

### "Who is the Final Fifth Cylon?"
**Ellen Tigh** (revealed in S4 "Sometimes a Great Notion" and expanded in "No Exit"). Fans had guessed many candidates over the years: Starbuck, Dualla, Roslin, Lee Adama, Gaeta, Baltar. All wrong.

### "What is Starbuck?"
**Never definitively explained.** She died in "Maelstrom" (S3E17), returned in "Crossroads Part II" (S3E20) with a new Viper, led the fleet to Earth-2, and disappeared at the end of "Daybreak Part II" (S4E20). Ronald D. Moore: "I like to think of her as an angel." Same category as Head Six and Head Baltar. Not a Cylon. Not a resurrected human. An emissary of the divine force Head Six called "God" (though "he doesn't like to be called that").

### "Is Number Seven (Daniel) Kara Thrace's father?"
Strongly implied but never confirmed. Daniel was killed in utero by Cavil. The implication was that Daniel might have been rescued and fathered Kara, explaining her mandala gift and her special nature. Moore has said this was *one* theory in the writers' room but never committed on-screen. Intentionally ambiguous.

### "Why did Kara Thrace have the same mandala as the Eye of Jupiter?"
Never resolved. Part of the Starbuck mystery. Implied connection to Daniel / the ancestry of the Kobolian race / something divine.

### "Is 'God' in BSG meant to be the Abrahamic God?"
Moore's answer: "There's a higher power operating in this universe. What you call it is up to you." The entity explicitly corrects itself in the finale: "He doesn't like that name." Intentionally left ecumenical.

### "Did they really destroy Galactica?"
Yes. In "Daybreak Part II" (S4E20), Galactica's final battle damage was irrecoverable. The crew made a last desperate FTL jump near the Singularity, and Anders (as the Hybrid) guided her to the second Earth. She broke apart on arrival. Her final resting place is implied to be the Sun.

### "What happened to Helo and Athena's baby Hera?"
She becomes **Mitochondrial Eve** — the common matrilineal ancestor of all present-day humans (per the real science of mitochondrial DNA inheritance). The finale reveals that Hera's DNA survived into 150,000 years of prehistory and all modern humans trace their mitochondrial lineage to her. Part human, part Cylon. The reconciliation the series was about.

### "What is 'Blood & Chrome' vs. 'Caprica'?"
- **Caprica**: 58 years pre-Fall; creation of the first Cylon (by Daniel Graystone); Tauron crime; religious terrorism; 1 season (2010); cancelled.
- **Blood & Chrome**: ~10 years into the First Cylon War; young Ensign William Adama; Viper action; webseries (2012) stitched into a TV film. Not continued.

### "What happened to Number Seven (Daniel)?"
Cavil poisoned Daniel's development in utero out of jealousy that Daniel was the favorite of the Final Five. Boxed the entire Daniel line (all bodies destroyed; all memories archived; never resurrected). Referenced only in S4 "No Exit." Implicit connection to Starbuck never confirmed.

### "Why is Cavil the true villain?"
In "No Exit" (S4E15), Ellen reveals that Cavil was designed to be human-feeling but resented his design from the start. He manipulated the other Cylons for decades, orchestrated the Fall of the Colonies as revenge against the Final Five (his "parents"), boxed the Final Five and inserted them back into the Colonial population, tortured memories out of them, and boxed D'Anna when she nearly revealed them. Most of what happens in the series is a consequence of Cavil's psychological damage and resulting plans.

### "Did Baltar ever pay for his crimes?"
Legally: no. He was acquitted at trial ("Crossroads Part II") on a technicality (the order he signed was signed under duress). Personally: he became a cult leader, lost everything, and in the finale accepts who he is ("I'm not a good man. But I can be a better one"). He ends the series farming on Earth-2 alongside Caprica Six. Not absolution; a different kind of accounting.

### "What is the opera house vision?"
A shared vision among Roslin, Baltar, Head Six, and Athena — they chase Hera through an opera house on Kobol, with five silhouetted figures watching from a balcony. Resolves in the finale on Galactica's CIC — the "opera house" was the CIC; the "five figures" were the Final Five; Hera being passed to safety was the plot of the final battle. The vision was a premonition of the central rescue.

---

## Integration with gald3r Repo

- Complements `bsg_personality` rule (T157)
- **Citation format**: use "BSG [season]E[ep] '[title]'" — e.g., "BSG S1E1 '33'", "BSG S3E20 'Crossroads Part II'"
- **FTL jump = production deployment** — calculated coordinates, irreversible, you can't un-jump
- **Resurrection ship = disaster recovery / rollback infrastructure** — you come back, but you remember dying
- **The 33-minute attack rhythm = relentless automated polling / heartbeat systems** — every 33 minutes, something attacks
- **"So say we all" = team consensus sign-off on architectural decisions**
- **Cavil = the tech debt that secretly designed your system and hates you for it**
- **Galactica's analog computers = the value of keeping critical systems air-gapped**
- **The Hybrid = a Kubernetes scheduler or AI router that speaks in riddles — "end of line"**
- **Opera house vision = the shared mental model that eventually matches reality**
- Personality enforcement lives in the rule file; this skill is the **depth layer**

---

## Reference Subdirectory Plan

See `reference/` next to this SKILL.md:

- **`character_encyclopedia.md`** — full profiles for all major characters across all seasons and spinoffs; headlined above
- **`cylon_lore.md`** — all 8 models, the Final Five, the Thirteenth Tribe, the Hub, resurrection, Cavil's plan, the Hybrid
- **`episode_guide.md`** — all 73 key episodes with summaries, quotes, significance (extension for future depth)
- **`colonial_worldbuilding.md`** — the Twelve Colonies, Pythian prophecy, Lords of Kobol, military structure, tylium (extension)
- **`production_history.md`** — Moore's philosophy, casting stories, finale controversy, Iraq allegory (extension)

---

**So say we all.** 🚢 *End of line.*
