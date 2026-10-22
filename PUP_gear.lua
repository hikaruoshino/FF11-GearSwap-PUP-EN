function init_weaponns()
    send_command('gs c set MainWeapons Ohtas')
end


function init_gear_sets()
    -- Lockstyle set number
    lockstyleset = 182

    -- Weapons
    gear['Ohtas']                  = {name="Ohtas"}
    gear["Gnafron's Adargas"]        = {name="Gnafron's Adargas"}
    gear['Midnights']              = {name="Midnights"}
    gear['Verethragna']              = {name="Verethragna"}
    gear["Sakpata's Fists"]          = {name="Sakpata's Fists"}
	gear['Kenkonken']          = {name="Kenkonken"}
	gear['Xiucoatl']          = { name="Xiucoatl", augments={'Path: C',}}
    gear.Slip                         = {name="Frenzy Sallet"}

    -- Subtle Blow
    sets.SubtleBlow = {
    }

    -- Idle
    sets.idle = {
--    range="Animator P +1",
    ammo="Automat. Oil +3",
    head="Tali'ah Turban +2",
    body="Pitre Tobe +4",
    hands="Pitre Dastanas +3",
    legs={ name="Herculean Trousers", augments={'Pet: Attack+18 Pet: Rng.Atk.+18','Pet: "Store TP"+11','Pet: INT+1',}},
    feet={ name="Herculean Boots", augments={'Pet: "Store TP"+11','Pet: Attack+3 Pet: Rng.Atk.+3',}},
--    feet="Mpaca's Boots",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Enmerkar Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Varar Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},
    }

    sets.idle.Tate = {
--    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body="Foire Tobe +3",
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Mpaca's Boots",
    neck="Empath Necklace",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Overbearing Ring",
    right_ring="Shneddick Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }

    sets.idle.cut2 = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Bathy Choker +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Murky Ring",
    right_ring="Shneddick Ring",
    back="Moonbeam Cape",
    }

    sets.idle.cut = {
    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body="Foire Tobe +3",
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Mpaca's Boots",
    neck="Empath Necklace",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Overbearing Ring",
    right_ring="Shneddick Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }

    -- Engaged
    sets.engaged = {
--    range="Animator P +1",
    ammo="Automat. Oil +3",
    head="Tali'ah Turban +2",
    body="Pitre Tobe +4",
    hands="Pitre Dastanas +3",
    legs={ name="Herculean Trousers", augments={'Pet: Attack+18 Pet: Rng.Atk.+18','Pet: "Store TP"+11','Pet: INT+1',}},
    feet={ name="Herculean Boots", augments={'Pet: "Store TP"+11','Pet: Attack+3 Pet: Rng.Atk.+3',}},
--    feet="Mpaca's Boots",
    neck="Empath Necklace",
    waist="Klouskap Sash +1",
    left_ear="Enmerkar Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},
    }

    sets.engaged.Tate = {
--    range="Animator P +1",
    ammo="Automat. Oil +3",
    head={ name="Rao Kabuto +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    body="Foire Tobe +3",
    hands={ name="Rao Kote +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Mpaca's Boots",
    neck="Empath Necklace",
    waist="Isa Belt",
    left_ear="Rimeice Earring",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Overbearing Ring",
    right_ring="Varar Ring +1",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }

    sets.engaged.Cut = {
    main="Sakpata's Fists",
--    range="Animator P +1",
    ammo="Automat. Oil +3",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Murky Ring",
    right_ring="Warden's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }

    sets.engaged.hontai = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Moonbow Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
    }

    -- ===================================================================
    -- Automaton abilities and weapon skills (Mote-Include)
    -- ===================================================================
    -- sets.midcast.Pet is already defined by Mote-Include.lua,
    -- so there is no need to reset it with "sets.midcast.Pet = {}" here.

    -- (1) Common set used for every automaton weapon skill
    sets.midcast.Pet.WeaponSkill = {
	    main={ name="Xiucoatl", augments={'Path: C',}},
        head="Kara. Cappello +3",
        body="Pitre Tobe +4",
        hands="Mpaca's Gloves",
		legs="Kara. Pantaloni +3",
        feet="Mpaca's Boots",
        neck="Empath Necklace",
        waist="Incarnation Sash",
        left_ear="Burana Earring",
        right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
        left_ring="C. Palug Ring",
        right_ring="Overbearing Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},
    }

    -- (2) Set for Bone Crusher only
    sets.midcast.Pet['Bone Crusher'] = set_combine(sets.midcast.Pet.WeaponSkill, {
	    main={ name="Xiucoatl", augments={'Path: C',}},
        head="Kara. Cappello +3",
        body="Pitre Tobe +4",
        hands="Mpaca's Gloves",
		legs="Kara. Pantaloni +3",
        feet="Mpaca's Boots",
        neck="Empath Necklace",
        waist="Incarnation Sash",
        left_ear="Burana Earring",
        right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
        left_ring="C. Palug Ring",
        right_ring="Overbearing Ring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}},
    })
	
   
    sets.midcast.Pet['Provoke']  = {
        head="Heyoka Cap +1",
        body="He. Harness +1",
        hands="He. Mittens +1",
        legs="Heyoka Subligar +1",
        feet="He. Leggings +1",
        left_ear="Rimeice Earring",
        right_ear="Domes. Earring",
    }

-- Gear for Flashbulb (same as Provoke)
    sets.midcast.Pet['Flashbulb'] = sets.midcast.Pet['Provoke']

	-- (3) Job abilities
   	sets.precast.JA['Overdrive']     = set_combine({body="Pitre Tobe +4"})
   	sets.precast.JA['Activate']       = set_combine()
   	sets.precast.JA['Deus Ex Automata']             = set_combine()
   	sets.precast.JA['Repair']             = set_combine({legs="Desultor Tassets",feet="Foire Babouches +2",left_ear="Guignol Earring",right_ear="Pratik Earring"})
   	sets.precast.JA['Role Reversal']         = set_combine({feet="Pitre Babouches +4"})
   	sets.precast.JA['Ventriloquy']               = set_combine({legs="Pitre Churidars +4"})
   	sets.precast.JA['Tactical Switch'] = set_combine({feet="Karagoz Scarpe +3"})
   	sets.precast.JA['Cooldown']         = set_combine()
   	sets.precast.JA['Heady Artifice'] = set_combine()

    -- (4) Maneuver gear (the key must be 'Maneuver', the spell map Mote-Mappings assigns to every maneuver)
    sets.precast.JA['Maneuver'] = set_combine({
        main="Kenkonken",
        head="Pitre Taj +3",
        body="Kara. Farsetto +1",
        hands="Foire Dastanas +2",
        neck="Buffoon's Collar",
        left_ear="Burana Earring",
        back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
    })


    -- Fast cast
    sets.precast.FC = {
--    range="Animator P +1",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+28','Weapon skill damage +2%','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    body="Zendik Robe",
    hands="Nyame Gauntlets",
    legs="Gyve Trousers",
    feet="Nyame Sollerets",
    neck="Baetyl Pendant",
    waist="Plat. Mog. Belt",
    left_ear="Enchntr. Earring +1",
    right_ear={ name="Kara. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Store TP"+5',}},
    left_ring="Prolix Ring",
    right_ring="Rahab Ring",
    }

    -- Weapon skill: damage
    sets.precast.WS.Damage = {
--    range="Animator P +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Schere Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Cornelia's Ring",
    }
    
	sets.precast.WS.Critical = {
--    range="Animator P +1",
    head="Blistering Sallet +1",
    body="Foire Tobe +3",
    hands="Pitre Dastanas +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Crep. Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Cornelia's Ring",
    back="Null Shawl",
    }
	    -- Weapon skill: critical. To reuse the damage gear instead:
--    sets.precast.WS.Critical = sets.precast.WS.Damage
	
    -- Weapon skill: magic
    sets.precast.WS.Magic = {
    }
    
    -- Assign a set to each hand-to-hand weapon skill. Edit this list as you like.
    -- (If you also use a user-globals.lua that defines init_weapon_skill(), it is called afterwards.)
    local WS_DAMAGE   = {'Combo', 'Raging Fists', 'Spinning Attack', 'Howling Fist', 'Dragon Kick', 'Asuran Fists', 'Tornado Kick', 'Shijin Spiral', 'Final Heaven', 'Stringing Pummel'}
    local WS_CRITICAL = {'Backhand Blow', "Ascetic's Fury", 'Victory Smite'}
    for _, name in ipairs(WS_DAMAGE) do sets.precast.WS[name] = sets.precast.WS.Damage end
    for _, name in ipairs(WS_CRITICAL) do sets.precast.WS[name] = sets.precast.WS.Critical end
    if init_weapon_skill then init_weapon_skill() end

end
