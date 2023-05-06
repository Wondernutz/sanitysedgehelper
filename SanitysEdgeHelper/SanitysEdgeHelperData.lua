SEH = SEH or {}
local SEH = SEH

SEH.data    = {

  trash_wamasu_charge = 200544,

  -- Yaseyla
  yaseyla_deflect = 184823,
  yaseyla_fire_bombs = 183660,
  yaseyla_chain_pull = 184540,
  yaseyla_ignite = 188188,
  yaseyla_frost_bomb_target = 185404, --185403,
  yaseyla_frost_bomb_applied = 185403,
  yaseyla_frost_bomb_applied_2 = 183783,
  yaseyla_wamasu_charge = 200544,
  yaseyla_archer_true_shot = 184802,

  yaseyla_shrapnel_execute_cd = 52, -- how often it can cast shrapnel in execute
  yaseyla_shrapnel_duration = 11,
  yaseyla_shrapnel_thresholds = {81, 55, 25},

  yaseyla_firebombs_first_cd = 9, -- how soon the first firebomb can be cast
  yaseyla_firebombs_preexecute_cd = 23.5, -- how often it can cast firebombs pre-execute
  yaseyla_firebombs_execute_cd = 12, -- how often it can cast firebombs execute
  yaseyla_firebombs_execute_threshold = 27, -- the execute threshold after which it casts firebombs more often

  yaseyla_frostbombs_first_cd = 17, -- how soon the first frostbombs can be cast
  yaseyla_frostbombs_cd = 25, -- how soon it can CAST frostbombs from the last bomb EXPLOSION

  yaseyla_chains_first_cd = 0.1, -- how soon the first chains can be cast
  yaseyla_chains_cd = 32, -- how often it can cast chains

  yaseyla_ignite_blame_cd = 5.5, -- how often the Ignite Blamer reports the first instance of an ignite tick

  -- Ansuul
  ansuul_sunburst = 199344,
  ansuul_wrack = 184621,
  ansuul_wrathstorm = 198759,
  ansuul_calamity = 186728,
  ansuul_execute = 198797,
  ansuul_warlock_sunburst = 187059,
  ansuul_warlock_wrathstorm = 189163,
  ansuul_poisoned_mind = 184710,
  ansuul_manic_phobia = 185117,

  hindered_effect = 165972,
  
  -- Chimera
  chimera_mantle_wamasu   = 184984, --green portal buff
  chimera_mantle_lion     = 184983, --red portal buff
  chimera_mantle_gryphon  = 183640, --blue portal buff
  chimera_chimera_maul    = 186937, --chimera maul
  chimera_chimera_inferno = 186948, --chimera inferno cast
  chimera_chimera_bolt    = 186960, --chimera lightning bolt cast
  chimera_gryphon_wind_lance = 199132, --gryphon wind lance
  chimera_wamasu_impending_storm = 199119, --wamasu impending storm
  chimera_wamasu_repulsion_shock = 186995, --wamasu repulsion shock
  chimera_inferno_debuff1 = 198613, --inferno debuff before sunburst
  chimera_inferno_debuff2 = 186953, --inferno debuff before sunburst
  chimera_inferno_debuff3 = 186952, --inferno debuff before sunburst
  chimera_sunburst        = 1.6   , --sunburst right after inferno debuff
  chimera_chimera_chain_lightning = 183858, --chimera chain lightning
  chimera_circuit_charge  = 199235, --debuff from chain lightning hit/spread

  chimera_number1_pos_list = {
    [1] = {171984,40350,238116},
    [2] = {181899,40350,238230},
    [3] = {191735,40350,238150},
  },
  chimera_number2_pos_list = {
    [1] = {172026,40350,242013},
    [2] = {181903,40350,242085},
    [3] = {191874,40350,242064},
  },
  chimera_number3_pos_list = {
    [1] = {170048,40350,242200},
    [2] = {179948,40350,242203},
    [3] = {189859,40350,242154},
  },
  chimera_number4_pos_list = {
    [1] = {168148,40350,242050},
    [2] = {178072,40350,242011},
    [3] = {187935,40350,242088},
  },
  chimera_number5_pos_list = {
    [1] = {168147,40350,238168},
    [2] = {178065,40350,238175},
    [3] = {187954,40350,238224},
  },

  -- TODO: Consider using UnpackRGBA(0xFFFFFFFF)
  -- Colors
  color = {
    ice       = {tonumber("0x99")/255, tonumber("0xCC")/255, tonumber("0xFF")/255}, -- #99CCFF
    fire      = {tonumber("0xFF")/255, tonumber("0x57")/255, tonumber("0x33")/255}, -- #FF5733
    lightning = {tonumber("0xFF")/255, tonumber("0xD6")/255, tonumber("0x66")/255}, -- #FFD666
    poison    = {tonumber("0x66")/255, tonumber("0xCC")/255, tonumber("0x66")/255}, -- #66CC66
    orange    = {tonumber("0xFF")/255, tonumber("0x85")/255, tonumber("0x00")/255}, -- #FF8500
    red       = {1, 0, 0},                                                          -- #FF0000
    green     = {tonumber("0x66")/255, tonumber("0xCC")/255, tonumber("0x66")/255}, -- #66CC66
    pink      = {tonumber("0xD6")/255, tonumber("0x72")/255, tonumber("0xF7")/255}, -- #D672F7
    teal      = {tonumber("0x03")/255, tonumber("0xC0")/255, tonumber("0xC1")/255}, -- #03C0C1
    cleave      = {tonumber("0xCC")/255, tonumber("0x00")/255, tonumber("0x00")/255}, -- #CC0000
    -- Taleria bridges colors
    taleria_green       = {tonumber("0x65")/255, tonumber("0xC9")/255, tonumber("0x66")/255}, -- #65c966
    taleria_yellow      = {tonumber("0xE8")/255, tonumber("0xDD")/255, tonumber("0x68")/255}, -- #e8dd68
    taleria_purple      = {tonumber("0xC1")/255, tonumber("0x5A")/255, tonumber("0xDB")/255}, -- #c15adb
  },

  -- Boss names.
  -- String lower, to make sure changes here keep strings in lowercase.
  yaseylaName = string.lower("Exarchanic Yaseyla"),
  chimeraName = string.lower("Chimera"),
  ansuulName = string.lower("Ansuul the Tormentor"),

  --default_color = { 1, 0.7, 0, 0.5 },
  dodgeDuration = GetAbilityDuration(28549),
  maxDuration = 4000,
  holdBlock = "Hold Block!",
  sanitysEdgeId = 1427,

  -- Taunt
  innerRage = 42056,
  pierceArmor = 38250,

  -- Testing/debugging values.
  olms_swipe = 95428,
}
