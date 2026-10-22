# FF11-GearSwap-PUP-EN (v2.2, English edition)

A GearSwap job file for the Puppetmaster in Final Fantasy XI. It tracks the recast of your automaton's Provoke (Strobe) and Flashbulb and swaps into your enmity gear 2 seconds before the move goes off. When the automaton's TP reaches 930, it swaps into your weapon skill gear ahead of the move.

This is the English edition of [FF11-GearSwap-PUP](https://github.com/hikaruoshino/FF11-GearSwap-PUP), which is written for the Japanese client. The logic is the same. All names are in English: attachments, weapons, equipment, job abilities and weapon skills.

> **Not tested on the English client.** I play on the Japanese client. The item names come from the game's resource files (`res/items.lua`), and I checked each weapon skill name against `res/weapon_skills.lua`. It passes a Lua syntax check, but I have never run this build in game. If something does not swap, please open an issue and include the console message.

## Notice

The FFXI Terms of Service prohibit third-party tools, and Windower and GearSwap may fall under that. Your account could be penalized, so use this at your own risk. The author accepts no responsibility for any harm from using it.

This job file never uses weapon skills or spells for you. It only changes your equipment.

## What it does

1. **Pre-swap for Provoke and Flashbulb**
   - With the attachment (Strobe or Strobe II, Flashbulb) and the matching maneuver (Fire, Light) active, it swaps into `sets.midcast.Pet['Provoke']` or `sets.midcast.Pet['Flashbulb']` once the recast is 2 seconds or less.
   - The recast is taken as 30 seconds for Provoke and 45 seconds for Flashbulb.
2. **Pre-swap for automaton weapon skills**
   - When the automaton's TP is 930 or more, it swaps into `sets.midcast.Pet.WeaponSkill` and waits.
   - If you define a set for a specific move (for example `sets.midcast.Pet['Bone Crusher']`), that set is used when the move goes off.
3. **One set at a time, in a fixed order**
   - The order is Provoke, Flashbulb, automaton weapon skill, normal gear. If Provoke and a weapon skill coincide, the enmity gear wins.
   - It does not swap while you or the automaton are acting, so it never disturbs the gear for the action in progress.
4. **Timers keep running while you retrieve the automaton.** They reset only when the automaton disappears.
5. **10-second guard.** If the move has not been used 10 seconds after the pre-swap, it assumes the move was used and returns to your normal gear.

### How it detects the moves

Provoke and Flashbulb are detected by the ability ID in the automaton's action packet, and maneuvers by buff ID. The once-a-second tick and the action packets are handled with `raw_register_event`, which skips GearSwap's equipment handling.

## Requirements

| Requirement | Notes |
| :--- | :--- |
| Windower 4 with GearSwap | The GearSwap addon that ships with Windower, including its Mote-Include libraries (`GearSwap/libs/Mote-Include.lua`) |
| English client | Names in the files are the English ones |
| `user-globals.lua` (optional) | See the next section |

This job file is written for Mote-Include.

## About `user-globals.lua`

The Japanese edition is meant to be used together with the `user-globals.lua` from [greeds.net's GearSwap code list](https://greeds.net/gearswap-code-list/) (the files are in [ktgreeds/GearSwap](https://github.com/ktgreeds/GearSwap)). That file belongs to greeds. It has no license, it is written in Japanese, and it is not mine to translate or redistribute, so **this repository includes neither the file nor any translation of it.**

You do not need it. `PUP_gear.lua` in this edition assigns a set to each hand-to-hand weapon skill itself (the `WS_DAMAGE` and `WS_CRITICAL` lists near the end of the file; edit them as you like), and it calls `init_weapon_skill()` only if one exists. Weapon switching (`gs c cycle MainWeapons`) and the lockstyle come from that file. Without it, the job file still swaps gear for the automaton.

If you already use greeds's code on the English client, note that parts of it may use Japanese names (buff names, spell names, comments). I can point out which places need English names, in an issue on this repository. I will not post the file.

## Files and installation

```text
Windower4/addons/GearSwap/data/
├── PUP.lua              <-- the logic (timers, priority)
└── <your character name>/
    └── PUP_gear.lua     <-- your gear sets (rewrite them for your own gear)
```

1. Download this repository (Code > Download ZIP) and unzip it.
2. Put `PUP.lua` in `Windower4/addons/GearSwap/data/`.
3. Put `PUP_gear.lua` in `Windower4/addons/GearSwap/data/<your character name>/`, and **rewrite the sets for the gear you own.** The file contains my own gear.
4. Log in as a Puppetmaster and run `//gs reload` (or `//gs load PUP`).

## Gear sets (`PUP_gear.lua`)

| Set | Used |
| :--- | :--- |
| `sets.midcast.Pet['Provoke']` | Pre-swap for Provoke, and when it goes off |
| `sets.midcast.Pet['Flashbulb']` | Pre-swap for Flashbulb, and when it goes off |
| `sets.midcast.Pet.WeaponSkill` | Pre-swap at automaton TP 930 or more, and when an automaton weapon skill goes off |
| `sets.midcast.Pet['Move Name']` | When that move goes off (example: `['Bone Crusher']`; otherwise `WeaponSkill` is used) |
| `sets.precast.JA['Maneuver']` | When you use a maneuver (the key must be `Maneuver`, the spell map that Mote-Mappings assigns to every maneuver) |
| `sets.idle`, `sets.engaged`, and so on | Your normal gear, as in Mote-Include |

`sets.midcast.Pet` is created by Mote-Include, so you do not need to write `sets.midcast.Pet = {}`. The names in `state.MainWeapons` (in `PUP.lua`) should match the `gear['Name']` entries in `PUP_gear.lua`.

The mode names are my own and are romanized Japanese: `Tate` is the shield (tank) set, `hontai` is gear for the puppetmaster himself, and `Cut` and `cut2` are damage-reduction sets built from Nyame and Malignance pieces. Rename them or replace the sets as you like.

## Macros

| Command | What it does |
| :--- | :--- |
| `/console gs c cycle OffenseMode` | Change the engaged gear (Normal / Tate / Cut / hontai) |
| `/console gs c cycle IdleMode` | Change the idle gear (Normal / Tate / cut2) |
| `/console gs c cycle MainWeapons` | Change weapons (needs a `user-globals.lua` that handles it) |

## Credits and license

The base structure of this job file and what I learned while writing it come from the code and explanations of greeds ([greeds.net](https://greeds.net/gearswap-code-list/), [ktgreeds/GearSwap](https://github.com/ktgreeds/GearSwap)), which I customized and rebuilt. Thank you for making your code and knowledge public.

This repository has no license. Because it is built on greeds's code, please do not redistribute or repost it.

## Changelog

- **v2.2 (2026-10-23, English edition):** First release of the English edition, based on the Japanese v2.2. English names throughout, and weapon skill sets assigned inside `PUP_gear.lua`. The Japanese edition's automatic weapon skill for your own character is not included.
