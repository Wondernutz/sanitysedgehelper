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
  yaseyla_firebombs_preexecute_cd = 24, -- how often it can cast firebombs pre-execute
  yaseyla_firebombs_execute_cd = 12, -- how often it can cast firebombs execute

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
  
  -- Archwizard Twelvane / Chimera
  twelvane_mantle_wamasu   = 184984, --green portal buff
  twelvane_mantle_lion     = 184983, --red portal buff
  twelvane_mantle_gryphon  = 183640, --blue portal buff
  twelvane_chimera_maul    = 186937, --chimera maul
  twelvane_chimera_inferno = 186948, --chimera inferno cast
  twelvane_chimera_bolt    = 186960, --chimera lightning bolt cast
  twelvane_inferno_debuff1 = 198613, --inferno debuff before sunburst
  twelvane_inferno_debuff2 = 186953, --inferno debuff before sunburst
  twelvane_inferno_debuff3 = 186952, --inferno debuff before sunburst
  twelvane_sunburst        = 1.6   , --sunburst right after inferno debuff
  twelvane_chimera_chain_lightning = 183858, --chimera chain lightning
  twelvane_circuit_charge  = 199235, --debuff from chain lightning hit/spread
  twelvane_add_spawn       = 28    , --wamasu/lion/gryphon spawn

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
  twelvaneName = string.lower("Archwizard Twelvane"),
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
