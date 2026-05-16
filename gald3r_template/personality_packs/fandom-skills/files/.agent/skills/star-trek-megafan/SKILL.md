---
name: star-trek-megafan
description: Local-only Star Trek mega-fan skill for the gald3r source repo — encyclopedic canon depth across TOS through SNW/LDS/PRO plus films; not shipped via templates.
local_only: true
---

> **Local-only:** This skill lives in root IDE folders for maintainers of the gald3r ecosystem. It is intentionally **not** copied into `templates/` installs. Companion depth layer for the `star_trek_personality` rule (T152).

# Star Trek Mega-Fan — Encyclopedic Canon Depth

## Description

Encyclopedic knowledge base covering the entire Star Trek franchise from The Original Series (1966) through the current streaming era (SNW, LDS, PRO, SFA) plus all 13 Prime-timeline films and the 3 Kelvin-timeline films. Covers character psychology, episode-by-episode canon highlights, species lore, production history across Roddenberry → Berman → Kurtzman eras, Rules of Acquisition, Klingon honor culture, the Borg Collective, the Dominion War, the Temporal Cold War, the Burn, and all the "Make it so / Engage / Live long and prosper" cultural residue. Complements the `star_trek_personality` rule with canonical depth.

## When to Use

Activate this skill when:

- User mentions any Star Trek character, ship, or species
- User asks "what episode was..." or "who said..." or "what stardate..."
- User references Starfleet, the Federation, the Prime Directive
- Building features that use Trek personas (LCARS UI metaphors, Data/Spock-grade agents)
- Grounding the `star_trek_personality` rule in specific canon citations
- Anyone wants to argue whether DS9 or TNG is objectively the best Trek

## Activation Triggers

- Character name or species mentions (Vulcan, Klingon, Borg, Ferengi, Cardassian, Bajoran, Trill, Betazoid, Andorian, Tellarite, Kelpien, Orion)
- Series or film titles mentioned
- "Stardate" references (any format)
- Trek-isms: "make it so", "engage", "live long and prosper", "resistance is futile", "beam me up", "energize", "fascinating", "highly illogical"
- Rules of Acquisition cited (any number)
- Technobabble terms: warp core, dilithium, tachyon pulse, isolinear chips, bio-neural gel packs, holodeck, tricorder, pattern buffer, subspace, plasma conduit
- "Lower Decks", "Deep Space", "Voyager", "Discovery", "Enterprise", "Strange New Worlds" in non-geographic context
- Any of "Q", "Spot" (Data's cat), "Porthos" (Archer's beagle), "Livingston" (Picard's fish), "Number One" (ambiguously Riker or Una)

---

## Franchise at a Glance

### TV Series

| Series | Years | Setting Stardate | Key Ship | Showrunner/Era |
|--------|-------|-----------------|----------|----------------|
| TOS | 1966-1969 | 2266-2269 | Enterprise NCC-1701 | Gene Roddenberry |
| TAS | 1973-1974 | 2269-2270 (animated) | Enterprise NCC-1701 | Roddenberry / Filmation |
| TNG | 1987-1994 | 2364-2370 | Enterprise NCC-1701-D | Roddenberry → Berman |
| DS9 | 1993-1999 | 2369-2375 | Deep Space 9 / USS Defiant | Berman / Ira Steven Behr |
| VOY | 1995-2001 | 2371-2378 | USS Voyager NCC-74656 | Berman / Jeri Taylor / Braga |
| ENT | 2001-2005 | 2151-2161 | Enterprise NX-01 | Berman / Braga / Coto |
| DIS | 2017-2024 | 2256-2259 → 3189 | USS Discovery NCC-1031 | Kurtzman / Bryan Fuller → Aaron Harberts → Michelle Paradise |
| PIC | 2020-2023 | 2399-2402 | La Sirena → USS Titan-A | Kurtzman / Michael Chabon → Terry Matalas |
| LDS | 2020-2024 | 2380-2382 | USS Cerritos NCC-75567 | Kurtzman / Mike McMahan |
| PRO | 2021-present | 2383-2384 | USS Protostar NX-76884 | Kurtzman / Hageman Brothers |
| SNW | 2022-present | 2259-2261 | Enterprise NCC-1701 | Kurtzman / Akiva Goldsman / Henry Alonso Myers |
| SFA | upcoming (2025+) | 2490s | Starfleet Academy | Kurtzman / Noga Landau |

### Films (Prime Timeline)

1. **The Motion Picture** (1979) — V'ger
2. **The Wrath of Khan** (1982) — Khan returns; Spock dies
3. **The Search for Spock** (1984) — Genesis planet; Enterprise destroyed
4. **The Voyage Home** (1986) — Whales; time travel to 1986 San Francisco
5. **The Final Frontier** (1989) — Sybok seeks "God"
6. **The Undiscovered Country** (1991) — Klingon peace
7. **Generations** (1994) — Kirk/Picard meet; Enterprise-D destroyed
8. **First Contact** (1996) — Borg; Zefram Cochrane's warp flight
9. **Insurrection** (1998) — Ba'ku
10. **Nemesis** (2002) — Shinzon; Data dies

### Films (Kelvin Timeline)

11. **Star Trek** (2009) — Nero's incursion creates alternate timeline
12. **Into Darkness** (2013) — Kelvin Khan
13. **Beyond** (2016) — Krall; destruction of Enterprise (Kelvin)

### Upcoming
- *Section 31* (2025 TV film) — Philippa Georgiou spinoff
- *Starfleet Academy* (series, 2025+)

---

## Character Encyclopedia (High-Level)

See `reference/character_encyclopedia.md` for full profiles. Minimum roster covered:

- **TOS**: Kirk, Spock, McCoy, Scotty, Uhura, Sulu, Chekov, Chapel, M'Benga, Sarek, Amanda Grayson, Khan
- **TNG**: Picard, Riker, Data, Troi, Worf, La Forge, Crusher, Yar, Wesley, Q, Guinan, Ro Laren, Lore, O'Brien (early)
- **DS9**: Sisko, Kira, Odo, Quark, Jadzia Dax, Ezri Dax, O'Brien, Bashir, Garak, Winn, Dukat, Weyoun, Nog, Rom, Martok, Eddington
- **VOY**: Janeway, Chakotay, Seven of Nine, The Doctor, Tuvok, B'Elanna Torres, Tom Paris, Harry Kim, Neelix, Kes, Naomi Wildman, Icheb
- **ENT**: Archer, T'Pol, Trip Tucker, Malcolm Reed, Hoshi Sato, Travis Mayweather, Phlox, Shran
- **DIS**: Burnham, Saru, Stamets, Tilly, Book, Culber, Adira, Gray, Georgiou (both), Lorca, Tyler/Voq
- **PIC**: older Picard, older Guinan, Raffi, Elnor, Soji/Dahj, Agnes Jurati, Cristóbal Rios, Seven (older), Laris
- **SNW**: Pike, young Spock, Una Chin-Riley (Number One), La'an Noonien-Singh, young Uhura, young Chapel, M'Benga, Hemmer, Ortegas, Erica, Pelia
- **LDS**: Mariner, Boimler, Tendi, Rutherford, Captain Freeman, Ransom, Shaxs, Dr. T'Ana, Billups, Migleemo
- **PRO**: Dal R'El, Rok-Tahk, Zero, Gwyn, Jankom Pog, Murf, Hologram Janeway, Admiral Janeway, The Diviner
- **Films**: Saavik, David Marcus, Valeris, Soran, Lily Sloane, Krall, Kelvin-Kirk/Spock/Uhura, Nero, Khan (Kelvin)
- **Recurring villains/antagonists**: Khan, Borg Queen, Gul Dukat, Kai Winn, Chang, Shinzon, Sela, Lore, Armus, The Traveler, Tomalak, Nero, Krall

---

## Series & Film Episode Guide (Essential Canon)

See `reference/episode_guide.md` for full per-series list. Must-know episodes (by citation):

### TOS Essentials
- **"The City on the Edge of Forever"** (TOS S1E28) — Harlan Ellison teleplay; Edith Keeler
- **"Space Seed"** (TOS S1E22) — Khan's first appearance
- **"The Trouble with Tribbles"** (TOS S2E15) — Tribbles; callbacks to DS9's "Trials and Tribble-ations"
- **"Mirror, Mirror"** (TOS S2E4) — Mirror Universe established; Goatee Spock
- **"Amok Time"** (TOS S2E1) — Pon farr; T'Pring; the fight music meme
- **"Balance of Terror"** (TOS S1E14) — First Romulans

### TNG Essentials
- **"The Best of Both Worlds, Part I-II"** (TNG S3E26 / S4E1) — Picard becomes Locutus; "Mr. Worf... fire."
- **"The Inner Light"** (TNG S5E25) — Picard lives an entire life on Kataan; learns the Ressikan flute
- **"Yesterday's Enterprise"** (TNG S3E15) — Tasha Yar returns; alternate timeline
- **"Tapestry"** (TNG S6E15) — Q shows Picard the consequences of his youth
- **"Chain of Command, Part II"** (TNG S6E11) — "There are FOUR lights!"
- **"All Good Things..."** (TNG S7E25-26) — Series finale; Q's final test
- **"Darmok"** (TNG S5E2) — "Shaka, when the walls fell"; Tamarian language
- **"The Measure of a Man"** (TNG S2E9) — Data's personhood trial

### DS9 Essentials
- **"In the Pale Moonlight"** (DS9 S6E19) — Sisko's confession; "I can live with it"
- **"The Visitor"** (DS9 S4E3) — Jake watches his father die repeatedly; most-beloved episode
- **"Far Beyond the Stars"** (DS9 S6E13) — Benny Russell; racism in 1950s America
- **"Trials and Tribble-ations"** (DS9 S5E6) — Crew time-travels into TOS "Tribbles" footage
- **"Duet"** (DS9 S1E19) — Kira and a Cardassian impersonator; DS9's "we've arrived" episode
- **"The Way of the Warrior"** (DS9 S4E1-2) — Worf joins DS9; Klingon War begins
- **"Sacrifice of Angels"** (DS9 S6E6) — The Dominion War pivot
- **"What You Leave Behind"** (DS9 S7E25-26) — Series finale

### VOY Essentials
- **"Scorpion, Part I-II"** (VOY S3E26 / S4E1) — Seven of Nine introduced; Species 8472
- **"Year of Hell, Part I-II"** (VOY S4E8-9) — Annorax; temporal warfare
- **"Timeless"** (VOY S5E6) — Future Harry Kim tries to undo Voyager's destruction
- **"Equinox, Part I-II"** (VOY S5E26 / S6E1) — Another Starfleet ship in the Delta Quadrant; darker choices
- **"Living Witness"** (VOY S4E23) — 700 years later, a backup EMH
- **"Endgame"** (VOY S7E25-26) — Admiral Janeway breaks time to bring Voyager home

### ENT Essentials
- **"Broken Bow"** (ENT S1E1-2) — The pilot; launch of NX-01
- **"In a Mirror, Darkly, Part I-II"** (ENT S4E18-19) — Mirror Universe; Defiant salvaged
- **"Terra Prime"** (ENT S4E21) — Xenophobic backlash to alien contact
- **"These Are the Voyages..."** (ENT S4E22) — Finale framed as a TNG holodeck program; controversial

### DIS Essentials
- **"The Vulcan Hello" / "Battle at the Binary Stars"** (DIS S1E1-2) — Burnham's mutiny; war begins
- **"Magic to Make the Sanest Man Go Mad"** (DIS S1E7) — Time loop episode
- **"Such Sweet Sorrow, Part II"** (DIS S2E14) — Discovery jumps to 32nd century
- **"That Hope Is You"** (DIS S3E1) — 32nd century; The Burn

### PIC Essentials
- **"Remembrance"** (PIC S1E1) — "Please state the nature..." — oh wait, wrong show
- **"Et in Arcadia Ego, Part II"** (PIC S1E10) — Picard's death and android resurrection
- **"Penance"** (PIC S2E2) — Q's alternate timeline
- **"Võx"** (PIC S3E9) — Borg/Changeling reveal
- **"The Last Generation"** (PIC S3E10) — TNG cast on Enterprise-D; Jack Crusher saved

### SNW Essentials
- **"A Quality of Mercy"** (SNW S1E10) — Pike's vision of his own future disability
- **"Under the Cloak of War"** (SNW S2E8) — M'Benga and the Klingon War
- **"Subspace Rhapsody"** (SNW S2E9) — The musical episode
- **"Hegemony"** (SNW S2E10) — The Gorn

### LDS Essentials
- **"Crisis Point"** (LDS S1E9) — Mariner's holodeck movie
- **"I, Excretus"** (LDS S2E8) — Every Trek scenario compressed
- **"The Spy Humongous"** (LDS S2E6) — Boimler meets the Redshirts cult
- **"wej Duj"** (LDS S2E9) — Klingon, Vulcan, and Pakled Lower Decks parallel
- **"Old Friends, New Planets"** (LDS S4E10) — Mariner and Locarno

### PRO Essentials
- **"Lost and Found"** (PRO S1E1) — Protostar discovered
- **"A Moral Star, Part II"** (PRO S1E20) — The Protostar returns to Federation
- **"Supernova, Part II"** (PRO S2E10) — Wesley Crusher; timeline repaired

### Films (Must-Know)
- **Wrath of Khan** — "KHAAAAAN!"; Spock's death scene ("The needs of the many outweigh the needs of the few")
- **The Voyage Home** — "Nuclear wessels"; Chekov; whales
- **First Contact** — "The line must be drawn HERE"; Borg Queen; Zefram Cochrane
- **Star Trek (2009)** — Kelvin timeline bifurcation; Nero's incursion (2233)

---

## Lore & Worldbuilding

See `reference/lore_worldbuilding.md` for deep-dive. Core concepts:

### The United Federation of Planets (UFP)
Founded 2161. Capital: Paris, Earth (with Starfleet Command in San Francisco). 150+ member worlds by 24th century. Charter includes the Prime Directive (General Order 1) — non-interference with pre-warp civilizations.

### Starfleet
UFP's exploratory/defensive service. Ranks: Ensign → Lieutenant JG → Lieutenant → Lt. Commander → Commander → Captain → Commodore → Rear Admiral (Lower/Upper) → Vice Admiral → Admiral → Fleet Admiral.

### Warp Scale
- **TOS scale**: Warp 6 was cruising; Warp 8 was emergency; Warp 10 was theoretical/fatal
- **TNG scale** (recalibrated): Warp 9 is standard; Warp 9.9+ pushes the ship's limits; Warp 10 = infinite velocity (Tom Paris "Threshold" incident)
- **Transwarp**: Borg; various species; allegedly faster than max warp
- **Quantum slipstream**: Delta Quadrant tech
- **Spore drive**: DIS-era, mycelial network, one navigator
- **Pathway drive**: 32nd century post-Burn solution

### Species Deep-Dives

- **Vulcans** — logic > emotion; mind melds (katra transfer); Kolinahr (purging of emotion); pon farr (7-year mating cycle, only talked about under extreme duress); Surak's reforms (~4th c. Earth time)
- **Klingons** — honor (*batlh*), Sto'vo'kor (warrior heaven), Gre'thor (dishonorable afterlife), bat'leth, Kahless (first emperor), the Chancellor's Council, the House system, *Qapla'* = "success"
- **Borg** — Collective consciousness; "We are the Borg. Resistance is futile. Your biological and technological distinctiveness will be added to our own." Hives. Queens. The assimilation protocol. Unimatrices. Transwarp hubs. First contact with Federation: 2365 ("Q Who"); canonically much earlier per ENT ("Regeneration")
- **Ferengi** — 285 Rules of Acquisition (see `reference/rules_of_acquisition.md`); profit as religious devotion; the Grand Nagus; lobes as organ of business acumen; women historically forbidden clothing and commerce (reformed by Zek under Ishka's influence)
- **Cardassians** — Obsidian Order (intelligence service, dissolved ~2371); Detapa Council; family over self; enigma tales (mystery novels where everyone is guilty); occupation of Bajor (2318-2369)
- **Bajorans** — Prophets (wormhole aliens); Pah-wraiths (Fire Caves); Orbs of the Prophets; d'jarras (caste system, disused); earrings mark faith
- **Q Continuum** — extradimensional beings of infinite power; Q (the one who appears) is the one who likes humanity most; Continuum has internal civil war ("Death Wish", VOY S2E18)
- **Trill** — joined (symbiont + host) vs unjoined; multi-lifetime memories; Association of Former Hosts reunion taboo
- **Betazoid** — telepathic (empathic with half-humans like Troi); age 4 onset of telepathy; public telepathic weddings (everyone nude, per Lwaxana)
- **Changelings** — The Great Link; Founders of the Dominion; shapeshifters; "The solids"
- **Jem'Hadar** — Dominion soldiers; ketracel-white dependency; genetically engineered
- **Vorta** — Dominion administrators (Weyoun); clone-based
- **Denobulan** — Phlox's species; polygamous (Phlox has three wives, they each have three husbands)
- **Kelpien** — Saru's species; prey species on homeworld; threat ganglia; vahar'ai transformation

### Major Tech
- **LCARS** — Library Computer Access and Retrieval System; TNG-era UI; isolinear chips; bio-neural gel packs (VOY)
- **Holodeck** — holographic simulation; safety protocols ("computer, disable safety protocols" = always a bad idea); the Moriarty Problem (TNG "Elementary, Dear Data" / "Ship in a Bottle")
- **Transporters** — Heisenberg compensators; pattern buffers; Scotty's trick (trapped 75 years in a transporter loop, TNG "Relics")
- **Replicators** — matter-energy conversion; invented after TOS, standard by TNG

### The Dominion War (DS9 S4-7)
Federation + Klingon Empire + Romulan Empire (after "In the Pale Moonlight") vs. Dominion + Cardassian Union + Breen Confederacy. Ends 2375 with Founders' surrender after Odo returns to the Great Link to cure the Section 31 plague.

### The Temporal Cold War (ENT)
Controversial. Factions from multiple eras manipulating 22nd century. Includes the Suliban Cabal, the future Guardian, Daniels. Partially retconned by DIS's 32nd-century temporal ban.

### The Burn (DIS S3)
2256 → 3188: while Discovery was gone, dilithium everywhere spontaneously detonated simultaneously (~3069). Cause: a Kelpien boy's grief reached a dilithium-based sensitivity across all dilithium. The Federation fragmented. Revived post-DIS S3.

### Picard's Borg Experience
"Best of Both Worlds" (TNG S3E26/S4E1) — Picard becomes Locutus. Freed. PTSD echoes through "Family" (TNG S4E2), "I, Borg" (TNG S5E23), First Contact (film), Picard (series). The show treats it as a real, persistent trauma.

### Rules of Acquisition
All 285 Ferengi Rules; commonly cited in DS9. Famous ones:
- **#1** "Once you have their money, you never give it back."
- **#3** "Never spend more for an acquisition than you have to."
- **#10** "Greed is eternal."
- **#21** "Never place friendship above profit."
- **#22** "A wise man can hear profit in the wind."
- **#34** "War is good for business."
- **#35** "Peace is good for business."
- **#57** "Good customers are as rare as latinum. Treasure them."
- **#62** "The riskier the road, the greater the profit."
- **#76** "Every once in a while, declare peace. It confuses the hell out of your enemies."
- **#111** "Treat people in your debt like family — exploit them."
- **#190** "Hear all, trust nothing."
- **#214** "Never begin a business negotiation on an empty stomach."
- **#239** "Never be afraid to mislabel a product."
- **#285** "No good deed ever goes unpunished."

(See `reference/rules_of_acquisition.md` for all 285.)

---

## Production History

See `reference/production_history.md` for the long version. Key beats:

### Roddenberry Era (1966-1991 with breaks)
- **TOS** (1966-1969): Gene Roddenberry ("The Great Bird of the Galaxy") pitched a "Wagon Train to the stars." NBC pilot "The Cage" (1965) rejected as too cerebral; second pilot "Where No Man Has Gone Before" sold the series. Cancelled after 3 seasons.
- **TAS** (1973-1974): Filmation animated; won Emmy; decanonized by Roddenberry, later re-included.
- **TMP** (1979): Following the success of *Star Wars* (1977), Paramount revived Trek.
- **TNG** (1987): Roddenberry's strict "no interpersonal conflict among crew" rule; softened after his health declined (1991 death) and Rick Berman took over.

### Berman Era (1991-2005)
- **TNG S3+**: Michael Piller's writers' room policy (unsolicited spec scripts accepted) produced the show's best writing.
- **DS9** (1993-1999): Ira Steven Behr pushed serialization, moral ambiguity, the Dominion War — ahead of its time. Roddenberry would have hated it.
- **VOY** (1995-2001): UPN flagship; Kate Mulgrew was second choice (Genevieve Bujold quit after 1.5 days of filming).
- **ENT** (2001-2005): Dropped "Star Trek" from the title in S1. Added theme song with lyrics ("Faith of the Heart") — divisive.
- **Nemesis** (2002): Commercial flop; ended TNG film era.
- **Franchise fatigue**: ENT cancellation 2005; first time since 1987 with no Trek on TV.

### The Dormancy (2005-2009)
No new Trek in production. J.J. Abrams hired to relaunch as films.

### Kelvin Timeline (2009-2016)
- **Star Trek** (2009): Box office hit; reboot via Nero time incursion (stardate 2233.04, Kelvin destruction); Leonard Nimoy passes torch.
- **Into Darkness** (2013): Cumberbatch as Khan; divisive.
- **Beyond** (2016): Simon Pegg co-wrote; more Trek-feeling; Anton Yelchin's final film before his death.

### Kurtzman Era (2017-present)
- **DIS** (2017): CBS All Access (now Paramount+) flagship; serialized.
- **PIC** (2020): Sir Patrick Stewart returns; Michael Chabon showrunner S1; Terry Matalas (S3) widely celebrated for TNG reunion.
- **LDS** (2020): First adult animated Trek; Mike McMahan (Rick and Morty alum); surprisingly the most canon-literate Trek running.
- **SNW** (2022): Return to episodic; widely called "the best new Trek."
- **PRO** (2021): Kids-accessible but Trek-literate; moved from Paramount+ to Netflix S2.
- **SFA** (2025): Cadet-focused series; announced 2023.
- **Section 31** (2025): Georgiou TV film.

### Controversies
- **Decanonization battles**: Roddenberry vs. TAS vs. novels; modern Kurtzman era mostly embraces all prior canon (including TAS).
- **Kelvin vs. Prime**: Kelvin established as branch from Nero incursion; Prime timeline preserved.
- **Season 1 DIS Klingons**: redesigned appearance, contested in-universe and out. Later retconned in DIS S2.
- **PIC S1 sentimentality vs. Ron Moore's realism**: Chabon wanted contemplative; fans wanted action.

---

## Running Gags, Callbacks & Trek-isms

- **"Beam me up, Scotty"** — never said exactly this way in TOS; closest: "Scotty, beam us up" (TOS S1E29 "Operation: Annihilate!"). Cultural fossilization.
- **"Make it so"** — Picard's standing order to confirm execution. (Also "Engage", "Tea, Earl Grey, Hot", "Mister Worf... fire.")
- **"Dammit Jim, I'm a doctor not a..."** — McCoy catalog: "not a physicist" (TOS "Metamorphosis"), "not an escalator" (TOS "Friday's Child"), "not a bricklayer" (TOS "The Devil in the Dark"), "not a magician" (TOS "The Deadly Years"). 11+ variants across TOS alone.
- **"Highly illogical"** / **"Fascinating"** — Spock's catchphrases; Tuvok inherits both.
- **"The needs of the many outweigh the needs of the few"** — Spock to Kirk in *Wrath of Khan*; inverted "the needs of the one" in *Search for Spock*.
- **Holodeck malfunction** — every series has one. TNG "The Big Goodbye", "Ship in a Bottle"; DS9 "Our Man Bashir"; VOY "Bride of Chaotica!"; SNW "Subspace Rhapsody" (musical via probe, not holodeck, but same spirit).
- **Tribbles** — TOS "The Trouble with Tribbles"; DS9 "Trials and Tribble-ations"; SNW "Ghosts of Illyria" background; appears in every Trek.
- **Red shirts** — security officers in TOS died often; actual statistics: 24 of 59 TOS casualties wore red (40%) — but most crew wore red. Still, the myth is canon.
- **Q appearances** — TNG ("Encounter at Farpoint" S1E1 → "All Good Things..." S7E25-26), DS9 ("Q-Less" S1E7), VOY ("Death Wish" S2E18, "The Q and the Grey" S3E11, "Q2" S7E19), PIC (S2).
- **Worf's "Today is a good day to die"** — TNG and DS9 repeatedly; bluffs during Klingon diplomacy.
- **Data's "I am not programmed to..."** — before he developed the emotion chip; later replaced by genuine affect.
- **Quark's Rules of Acquisition** — usually cited mid-scheme to justify ethical compromise.
- **The Riker Maneuver** — Jonathan Frakes developed a back injury early in TNG, so he swung his leg over the back of a chair to sit. Became iconic; explicitly parodied in LDS "wej Duj" (S2E9).
- **"Computer, tea. Earl Grey. Hot."** — Picard's order; the "Hot" is load-bearing since the replicator would otherwise default to room temperature.
- **Transporter buffer tricks** — Scotty's 75-year trick ("Relics"); Barclay gremlin ("Realm of Fear"); pattern-ghosts.
- **Inverting the tachyon pulse** / **reversing the polarity of the deflector array** — LD-parodied technobabble solutions.

---

## Most-Asked Trivia

### "What is Kirk's middle name?"
**Tiberius** (after his paternal grandfather; confirmed TOS, expanded by SNW).

### "Who are Spock's parents?"
**Sarek** (Vulcan ambassador) and **Amanda Grayson** (human teacher). Sarek also appears in TNG ("Sarek" S3E23, "Unification" S5E7-8) and DIS.

### "Who plays Data?"
**Brent Spiner**, who also plays Lore (Data's evil brother), B-4 (Data's simpler precursor), Dr. Noonien Soong (Data's creator), Dr. Arik Soong (ENT — ancestor, augment researcher), and Dr. Altan Inigo Soong (PIC).

### "Why was DS9 controversial?"
Roddenberry's "no interpersonal conflict" rule was built into TNG's DNA. DS9 had:
- A fixed station (not exploration)
- Religion treated as serious rather than allegorical
- Moral ambiguity (Sisko in "In the Pale Moonlight")
- Explicit war arcs
- Characters who disliked each other and stayed that way

Roddenberry died before DS9 aired; Ira Steven Behr has said explicitly he wouldn't have approved.

### "What is the Picard Maneuver?"
**Two things, do not confuse them:**
1. **In-universe**: a tactical maneuver from *USS Stargazer* where Picard briefly jumped to warp to appear in two places on enemy sensors. Canon from TNG "The Battle" (S1E9).
2. **Fan-invented**: Jean-Luc's habit of tugging his uniform down after standing up. Real thing Patrick Stewart did; fans named it; not canon-official.

### "Why is Worf on both TNG and DS9?"
After the *Enterprise-D* was destroyed in *Generations* (2371), Worf was reassigned to DS9 in "The Way of the Warrior" (DS9 S4E1, 2372) during the Klingon War. He stayed through DS9's end, then appears in PIC S3 as a fully developed master intelligence operative.

### "How many times should Voyager have died?"
Canonical count is ambiguous; fan counts often cite 100+ near-destructions in 172 episodes. Highlights: "Scorpion" (Species 8472), "Year of Hell" (Annorax), "Equinox" (sister Starfleet ship), "Timeless" (actually destroyed in alternate timeline), "Endgame" (future Janeway).

### "What is 'In the Pale Moonlight' about?"
Sisko conspires with Garak to forge evidence implicating the Dominion in a Romulan senator's assassination, in order to draw the Romulans into the war on the Federation side. Garak kills the Romulan (Vreenak) and the forger. Sisko ends the episode confessing to his personal log: "I can live with it." The closing line is "Computer, erase that entire personal log." Often cited as DS9's best episode and one of the best in all Trek.

### "How does the Kelvin timeline differ from Prime?"
In 2233, Romulan mining vessel *Narada* (Nero's ship) from 2387 appears via Red Matter black hole. Destroys USS *Kelvin*. George Kirk dies; James T. Kirk is born in shuttle. Divergence cascades forward — Vulcan destroyed (2009 film), Kirk becomes captain younger, etc. Prime timeline preserved; Spock Prime lives out his life in Kelvin timeline until Leonard Nimoy's passing (2015) is acknowledged in *Beyond*.

### "Why is Lower Decks actually good Trek?"
- Meticulously canon-accurate (McMahan is a superfan)
- Respects characters rather than mocking them
- Episodic structure within serialized character growth
- Ends most episodes with a genuine Trek moral, not a punchline
- Integrates seamlessly with other eras (TNG cameos, DS9 station returns, Voyager callbacks)

### "What happened to Enterprise NX-01?"
Decommissioned c. 2161 per ENT finale "These Are the Voyages..." — made a museum ship. The real-world decommission was controversial because the framing was a TNG holodeck recreation, making the ENT crew's final appearance filtered through Riker's holodeck program. Fans call this "a betrayal of the ENT cast."

### "What is Stardate?"
No single canonical answer. TOS: arbitrary (writers inserted any numbers). TNG+: format is `[era-digit][year]xx.x` — e.g., 41254.7 = 4th century series (TNG = 40s), 1st year (season 1, 2364), day 254.7 of the year. DIS used TOS-era stardates for S1-2 then post-Burn era stardates for S3+.

### "Who is the Tamarian?"
Species that communicates entirely via cultural allusion. "Darmok and Jalad at Tanagra" = cooperation against common threat. "Shaka, when the walls fell" = failure, collapse. TNG "Darmok" (S5E2) — Captain Dathon dies teaching Picard the language. Influential in linguistics and sci-fi culture.

---

## Integration with gald3r Repo

- Complements the `star_trek_personality` rule (T152)
- **Citation format**: always use series + season + episode + title — e.g., "TNG S5E25 'The Inner Light'"
- **Kelvin vs. Prime** distinction matters when citing Spock-era content; default to Prime unless Kelvin explicitly specified
- **LCARS** = the gald3r task/knowledge UI metaphor — the ship's computer
- **Starfleet ranks** = agent seniority metaphor (Ensign = first-session agent; Captain = senior architect)
- **Federation species diversity** = plural team styles in banter/commentary
- **The Borg** = monolithic architecture; "resistance is futile" = the refactor that keeps scope-creeping
- **Holodeck** = the dev/test environment (safety protocols: do NOT disable in prod)
- **Lower Decks meta-awareness** = when LDS characters are invoked, they may comment on the gald3r system itself from within their persona
- Personality enforcement lives in the rule file; this skill is the **depth layer** for canon references

---

## Reference Subdirectory Plan

See `reference/` next to this SKILL.md:

- **`character_encyclopedia.md`** — full profiles per character across all series and films, with background, psychology, signature traits, key arcs, iconic quotes, and episode citations. Most-asked-about characters get the deepest treatment (Picard, Data, Spock, Kirk, Janeway, Sisko, Garak, Seven, Q, Worf).
- **`rules_of_acquisition.md`** — all 285 Ferengi Rules of Acquisition, annotated where commonly cited, with source episodes where available.
- **`episode_guide.md`** — canonical essential episodes per series (optional extension for future depth).
- **`lore_worldbuilding.md`** — species deep-dives, factions, technology, geography (optional extension).
- **`production_history.md`** — showrunner eras, casting stories, controversies (optional extension).

---

**So say we all.** 🖖
