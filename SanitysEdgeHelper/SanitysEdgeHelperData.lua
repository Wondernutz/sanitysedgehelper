SEH = SEH or {}
local SEH = SEH

SEH.data    = {
  -- Yaseyla
  yaseyla_deflect = 184823,
  yaseyla_fire_bombs = 183660,
  yaseyla_frost_bomb_target = 185404, --185403,
  yaseyla_frost_bomb_applied = 185403,
  yaseyla_frost_bomb_applied_2 = 183783,
  yaseyla_wamasu_charge = 191133,
  yaseyla_archer_true_shot = 184802,
  yaseyla_shrapnel_cd = 52, -- how often it can cast shrapnel in execute
  yaseyla_shrapnel_duration = 11,

  hindered_effect = 165972,

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