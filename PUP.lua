-------------------------------------------------------------------------------------------------------------------
-- PUP.lua (English edition) - Mote-Include job file
-- Pre-swaps gear for Provoke (Strobe) and Flashbulb, and for the automaton's weapon skills. v2.2
-------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('english')

    -- Load the gear definitions
    include('PUP_gear.lua')
end

function job_setup()
    state.IdleMode:options('Normal', 'Tate', 'cut2')
    state.OffenseMode:options('Normal', 'Tate', 'Cut', 'hontai')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons = M{'Ohtas', "Gnafron's Adargas", 'Kenkonken', 'Midnights', 'Xiucoatl', 'Verethragna', "Sakpata's Fists"}
    state.RangeWeapons = M{'Animator P +1'}

    -- Receive the once-a-second tick as "gs c pup_tick".
    -- If a user-globals.lua already defines job_self_command, chain to it instead of overwriting it.
    local base_self_command = job_self_command
    job_self_command = function(cmdParams, eventArgs)
        if cmdParams[1] == 'pup_tick' then
            pup_tick()
            eventArgs.handled = true
        elseif base_self_command then
            base_self_command(cmdParams, eventArgs)
        end
    end

    -- Initialize the gear sets (PUP_gear.lua)
    if init_gear_sets then init_gear_sets() end
end

-------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------
local STROBE_RECAST = 30         -- Provoke (Strobe) recast, in seconds
local FLASHBULB_RECAST = 45      -- Flashbulb recast, in seconds
local PRE_EQUIP_SEC = 2          -- swap this many seconds (or fewer) before the recast ends
local PRE_EQUIP_TIMEOUT = 10     -- give up after this many seconds if the move never comes
local PET_WS_TP = 930            -- automaton TP at which to swap to the weapon skill gear

-- Automaton ability IDs (res/monster_abilities.lua). Compared with the param of the action packet (category 11)
local ABIL_PROVOKE = 1945
local ABIL_FLASHBULB = 1947

-- Buff IDs (res/buffs.lua)
local BUFF_FIRE_MANEUVER = 300
local BUFF_LIGHT_MANEUVER = 306

-------------------------------------------------------------------
-- Internal state
-------------------------------------------------------------------
local strobe_time = 0            -- when Provoke last went off. 0 = not yet
local flashbulb_time = 0         -- when Flashbulb last went off. 0 = not yet

-- Automaton gear currently worn: nil (normal) / 'strobe' / 'flashbulb' / 'ws'
local pet_gear = nil
local pet_gear_since = 0

-------------------------------------------------------------------
-- Helpers
-------------------------------------------------------------------
local function has_attachment(...)
    if not pet.isvalid or not pet.attachments then return false end
    for _, name in ipairs({...}) do
        if pet.attachments[name] then return true end
    end
    return false
end

local function recast_left(fired_time, recast, now)
    if fired_time == 0 then return 0 end
    return math.max(0, recast - (now - fired_time))
end

local function pet_set(name)
    return sets.midcast and sets.midcast.Pet and sets.midcast.Pet[name]
end

-- Put on automaton gear. Does nothing if the set does not exist
local function wear_pet_gear(mode, set, now)
    pet_gear = mode
    pet_gear_since = now
    if set then equip(set) end
end

-- Go back to the normal gear
local function restore_gear()
    pet_gear = nil
    pet_gear_since = 0
    handle_equipping_gear(player.status)
end

-------------------------------------------------------------------
-- Mote-Include pet midcast (when the move or ability goes off)
-------------------------------------------------------------------
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if not spell then return end

    if spell.english == 'Provoke' then
        local set = pet_set('Provoke')
        if set then
            equip(set)
            eventArgs.handled = true
        end

    elseif spell.english == 'Flashbulb' then
        local set = pet_set('Flashbulb')
        if set then
            equip(set)
            eventArgs.handled = true
        end

    -- Automaton weapon skills (moves that have skillchain properties)
    elseif spell.skillchain_a then
        pet_gear = 'ws'
        local set = pet_set(spell.english) or pet_set('WeaponSkill')
        if set then
            equip(set)
            eventArgs.handled = true
        end
    end
end

-------------------------------------------------------------------
-- When the pet's action ends (Mote-Include puts the gear back)
-------------------------------------------------------------------
function job_pet_aftercast(spell, action, spellMap, eventArgs)
    pet_gear = nil
    pet_gear_since = 0
end

-------------------------------------------------------------------
-- Pre-swap to automaton gear
-------------------------------------------------------------------
local function update_pet_gear(now)
    if not pet.isvalid then
        -- The automaton is gone: reset the timers and take off any automaton gear
        strobe_time = 0
        flashbulb_time = 0
        if pet_gear then restore_gear() end
        return
    end

    -- Do not swap while you or the automaton are acting (it would break the gear for that action)
    if midaction() or pet_midaction() then return end

    -- Pre-swapped but the move never came: treat it as used and give up
    if pet_gear == 'strobe' and now - pet_gear_since >= PRE_EQUIP_TIMEOUT then
        strobe_time = now
    elseif pet_gear == 'flashbulb' and now - pet_gear_since >= PRE_EQUIP_TIMEOUT then
        flashbulb_time = now
    end

    -- Decide which automaton gear to wear (higher in the list wins)
    local want = nil
    if pet.status == 'Engaged' then
        if has_attachment('Strobe', 'Strobe II') and buffactive[BUFF_FIRE_MANEUVER]
                and recast_left(strobe_time, STROBE_RECAST, now) <= PRE_EQUIP_SEC then
            want = 'strobe'
        elseif has_attachment('Flashbulb') and buffactive[BUFF_LIGHT_MANEUVER]
                and recast_left(flashbulb_time, FLASHBULB_RECAST, now) <= PRE_EQUIP_SEC then
            want = 'flashbulb'
        elseif (pet.tp or 0) >= PET_WS_TP then
            want = 'ws'
        end
    end

    if want == pet_gear then return end

    if want == 'strobe' then
        wear_pet_gear('strobe', pet_set('Provoke'), now)
    elseif want == 'flashbulb' then
        wear_pet_gear('flashbulb', pet_set('Flashbulb'), now)
    elseif want == 'ws' then
        wear_pet_gear('ws', pet_set('WeaponSkill'), now)
    else
        restore_gear()
    end
end

-------------------------------------------------------------------
-- Once-a-second work (called from "gs c pup_tick")
-------------------------------------------------------------------
function pup_tick()
    local now = os.time()
    update_pet_gear(now)
end

-------------------------------------------------------------------
-- Events
-- GearSwap's register_event runs its equipment handling on every call, so anything that fires
-- every frame or on every action packet is taken with raw_register_event and only acts when needed
-------------------------------------------------------------------
local last_tick = 0
windower.raw_register_event('prerender', function()
    local now = os.time()
    if now == last_tick then return end
    last_tick = now
    send_command('gs c pup_tick')
end)

-- Detect the automaton's Provoke and Flashbulb by ability ID and update the timers.
-- The next pup_tick puts the gear back
windower.raw_register_event('action', function(act)
    if act.category ~= 11 then return end
    if act.param ~= ABIL_PROVOKE and act.param ~= ABIL_FLASHBULB then return end

    local my_pet = windower.ffxi.get_mob_by_target('pet')
    if not my_pet or act.actor_id ~= my_pet.id then return end

    if act.param == ABIL_PROVOKE then
        strobe_time = os.time()
    else
        flashbulb_time = os.time()
    end
end)
