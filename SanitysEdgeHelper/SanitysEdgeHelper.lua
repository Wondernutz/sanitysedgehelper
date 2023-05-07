SEH = SEH or {}
local SEH = SEH

SEH.name     = "SanitysEdgeHelper"
SEH.version  = "0.4.0"
SEH.author   = "@Wondernuts"
SEH.active   = false

SEH.status = {
  testStatus = 0,
  inCombat = false,

  currentBoss = "",
  isYaseyla = false,
  isChimera = false,
  isAnsuul = false,
  isHMBoss = false,

  yaseylaLastShrapnel = 0,
  yaseylaLastFirebombs = 0,
  yaseylaLastFrostbombs = 0,
  yaseylaLastChains = 0,
  yaseylaLastIgniteBlame = 0,
  yaseylaIsFirstFirebombs = true,
  yaseylaIsFirstFrostbombs = true,
  yaseylaIsFirstChains = true,
  yaseylaShrapnelCount = 0,
  
  locked = true,
  
  ChimeraWamasuIcon  = nil,
  ChimeraLionIcon    = nil,
  ChimeraGryphonIcon = nil,
  ChimeraNumber1Icon = {},
  ChimeraNumber2Icon = {},
  ChimeraNumber3Icon = {},
  ChimeraNumber4Icon = {},
  ChimeraNumber5Icon = {},

  AnsuulGreenIcon  = nil,
  AnsuulRedIcon    = nil,
  AnsuulBlueIcon   = nil,

  unitDamageTaken = {}, -- unitDamageTaken[unitId] = all damage events for a given id.
  --[[ TODO: Damage events to track:
    ACTION_RESULT_DAMAGE,
    ACTION_RESULT_CRITICAL_DAMAGE,
    ACTION_RESULT_DOT_TICK,
    ACTION_RESULT_DOT_TICK_CRITICAL,
    ACTION_RESULT_BLOCK,
  ]]--
  debuffTracker = {},

  mainTankTag = "",
}
-- Default settings.
SEH.settings = {
  showHinderedIcon = true,

  -- Yaseyla
  showShrapnel = true,
  showFirebombs = true,
  showFrostbombs = false,
  showChains = false,

  -- Chimera
  showCrystalNumberIcons = true,
  -- Ansuul
  showSplitBossHP = false,

  -- Misc
  uiCustomScale = 1,
}
SEH.units = {}
SEH.unitsTag = {}

function SEH.EffectChanged(eventCode, changeType, effectSlot, effectName, unitTag, beginTime, endTime, stackCount, iconName, buffType, effectType, abilityType, statusEffectType, unitName, unitId, abilityId, sourceType )
  SEH.IdentifyUnit(unitTag, unitName, unitId)
  local timeSec = GetGameTimeSeconds()
  -- EFFECT_RESULT_GAINED = 1
  -- EFFECT_RESULT_FADED = 2
  -- EFFECT_RESULT_UPDATED = 3
end

function SEH.CombatEvent(eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log, sourceUnitId, targetUnitId, abilityId, overflow)
  -- Debug ability casts of NPCs (unit type None)
  if result == ACTION_RESULT_BEGIN and sourceType == COMBAT_UNIT_TYPE_NONE then
    SEH:Trace(3, string.format(
      "Ability: %s, ID: %d, Hit Value: %d, Source name: %s, Target name: %s", abilityName, abilityId, hitValue, sourceName, targetName
    ))
  end
  
  if abilityId == SEH.data.hindered_effect then
    SEH.Yaseyla.Hindered(result, targetUnitId, hitValue)
  end

  if result == ACTION_RESULT_BEGIN and (abilityId == SEH.data.yaseyla_wamasu_charge or abilityId == SEH.data.trash_wamasu_charge) then
    SEH.Alert("", "Wamasu Charge", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
    CombatAlerts.AlertCast(abilityId, "Wamasu Charge", hitValue, {-2, 1})
  end

  -- Yaseyla
  if abilityId == SEH.data.yaseyla_frost_bomb_target then
    SEH.Yaseyla.Frost_Bomb_Target(result, targetType, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.yaseyla_frost_bomb_applied or abilityId == SEH.data.yaseyla_frost_bomb_applied_2 then
    SEH.Yaseyla.Frost_Bomb_Applied(result, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.yaseyla_ignite then
    SEH.Yaseyla.Ignite(result, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.yaseyla_deflect then
    SEH.Yaseyla.Shrapnel(result, hitValue)
  end

  if abilityId == SEH.data.yaseyla_fire_bombs then
    SEH.Yaseyla.FireBombs(result, targetType, hitValue)
  end

  if abilityId == SEH.data.yaseyla_chain_pull then
    SEH.Yaseyla.Chain_Pull(result, targetType, hitValue)
  end

  -- Chimera/Chimera
  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_chimera_inferno then
    SEH.Alert("", "Sunbursts", 0xFF6600FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_chimera_bolt and hitValue > 500 then
    SEH.Alert("Chimera", "Lightning Bolts", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_chimera_chain_lightning and hitValue > 1000 then
    SEH.Alert("Chimera", "Chain Lightning", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
  end

  --if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_wamasu_impending_storm then
  --  SEH.Alert("Ascendant Wamasu", "Impending Storm", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
  --end

  --if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_wamasu_repulsion_shock then
  --  SEH.Alert("Ascendant Wamasu", "Repulsion Shock", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
  --end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.chimera_gryphon_wind_lance then
    SEH.Alert("Ascendant Gryphon", "Wind Lance", 0xD1F1F9FF, abilityId, SOUNDS.BATTLEGROUND_CAPTURE_FLAG_RETURNED, hitValue)
  end

  if result == ACTION_RESULT_EFFECT_GAINED and abilityId == SEH.data.chimera_mantle_wamasu and targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Wamasu Portal", 0x02FF00FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 5000)
  end

  if result == ACTION_RESULT_EFFECT_GAINED and abilityId == SEH.data.chimera_mantle_lion and targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Lion Portal", 0xFF0000FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 5000)
  end

  if result == ACTION_RESULT_EFFECT_GAINED and abilityId == SEH.data.chimera_mantle_gryphon and targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Gryphon Portal", 0x0005FFFF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 5000)
  end

  -- Ansuul
  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.ansuul_sunburst and targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Sunburst (self)", 0xFF6600FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
    CombatAlerts.AlertCast(abilityId, abilityName, hitValue, {-2, 0})
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.ansuul_wrack then
    SEH.Alert("", "Wrack (KITE!)", 0xFFD666FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.ansuul_wrathstorm then
    local offset = 2000
    SEH.Alert("", "Wrathstorm", 0xFF6600FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, hitValue + offset)
    CombatAlerts.AlertCast(abilityId, abilityName, hitValue + offset, {-2, 1})
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.ansuul_execute then
    SEH.Alert("", "Execute (INTERRUPT)", 0xFF0033FF, abilityId, SOUNDS.DUEL_START, hitValue)
  end

  if abilityId == SEH.data.ansuul_poisoned_mind then
    SEH.Ansuul.Poisoned_Mind(result, targetType, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.ansuul_manic_phobia then
    SEH.Ansuul.Manic_Phobia(result, targetType, targetUnitId, hitValue)
  end
end

function SEH.UpdateSlowTick(gameTimeMs)
  if IsUnitInCombat("player") then
    return
  end
end

function SEH.UpdateTick(gameTimeMs)
  local timeSec = GetGameTimeSeconds()

  if IsUnitInCombat("boss1") then
    if not SEH.status.inCombat then
      -- If it switched from non-combat to combat, re-check boss names.
    end
    SEH.status.inCombat = true
  end

  if IsUnitInCombat("player") and SEH.status.isYaseyla then
    SEH.status.inCombat = true
  end

  if SEH.status.inCombat == false then
    return
  end
  
  -- Boss 1: Yaseyla
  if SEH.status.isYaseyla then
    SEH.Yaseyla.UpdateTick(timeSec)
  end

  -- Boss 3: Ansuul (disabled, not working)
  --if SEH.status.isAnsuul then
  --  SEH.Ansuul.UpdateTick(timeSec)
  --end

end

function SEH.DeathState(event, unitTag, isDead)
  if unitTag == "player" and not isDead and not IsUnitInCombat("boss1") then
    -- I just resurrected, and it was a wipe or we killed the boss.
    -- Remove all UI
    SEH.ClearUIOutOfCombat()
  end
end

function SEH.CombatState(eventCode, inCombat)
  local currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("boss1", POWERTYPE_HEALTH)
  -- Do not change combat state if you are dead, or the boss is not full.

  -- Do not do anything outside of boss fights.
  if maxTargetHP == 0 or maxTargetHP == nil then
    SEH.ClearUIOutOfCombat()
    return
  end
  if currentTargetHP < 0.99*maxTargetHP or IsUnitDead("player") then
    return
  end
  if inCombat then
    SEH.status.inCombat = true
    SEH.ResetStatus()
  else
    SEH.ClearUIOutOfCombat()
  end
end

function SEH.ResetStatus()
  SEH.status.debuffTracker = {}
  SEH.status.unitDamageTaken = {}

  SEH.status.yaseylaLastShrapnel = 0
  SEH.status.yaseylaLastIgniteBlame = 0
  SEH.status.yaseylaLastFirebombs = GetGameTimeSeconds()
  SEH.status.yaseylaLastFrostbombs = GetGameTimeSeconds()
  SEH.status.yaseylaLastChains = GetGameTimeSeconds()
  SEH.status.yaseylaIsFirstFirebombs = true
  SEH.status.yaseylaIsFirstFrostbombs = true
  SEH.status.yaseylaIsFirstChains = true
  SEH.status.yaseylaShrapnelCount = 0

  SEH.status.mainTankTag = ""
end

function SEH.GetBossName()
  -- 1 to 6 so far
  for i = 1,MAX_BOSSES do
    local name = string.lower(GetUnitName("boss" .. tostring(i)))
    if name ~= nil and name ~= "" then
      return name
    end
  end
  return ""
end

function SEH.BossesChanged()
  local bossName = SEH.GetBossName()
  local lastBossName = SEH.status.currentBoss
  --d("[SEH] Boss change. Name = " .. bossName .. ". Last boss name = " .. lastBossName)
  if bossName ~= nil then
    if SEH.status.currentBoss == SEH.data.ansuulName and bossName == "" then
      -- Do not reset Ansuul for empty, this helps the clearing on wipes.
    else
      if bossName ~= SEH.status.currentBoss then
        --d("[SEH] Boss change. Name = " .. bossName)
      end
      SEH.status.currentBoss = bossName
    end
    
    SEH.status.isYaseyla = false
    SEH.status.isChimera = false
    SEH.status.isAnsuul = false
    SEH.status.isHMBoss = false

    SEH.Chimera.RemoveWamasuIcon()
    SEH.Chimera.RemoveLionIcon()
    SEH.Chimera.RemoveGryphonIcon()
    SEH.Chimera.RemoveCrystalNumberIcons()

    SEH.Ansuul.RemoveGreenIcon()
    SEH.Ansuul.RemoveRedIcon()
    SEH.Ansuul.RemoveBlueIcon()

    local currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("boss1", POWERTYPE_HEALTH)
    local hardmodeHealth = {
      [SEH.data.yaseylaName] = 80000000, -- vet 65M, HM 97.8M
      [SEH.data.chimeraName] = 70000000,  -- vet 46.5M, HM 93.1M
      [SEH.data.ansuulName] = 100000000, -- vet: 69M, HM 160.7M
    }

    -- Check for HM.
    if bossName ~= nil and maxTargetHP ~= nil and hardmodeHealth[bossName] ~= nil then
      if maxTargetHP > hardmodeHealth[bossName] then
        SEH.status.isHMBoss = true
      else
        SEH.status.isHMBoss = false
      end
    end

    if string.match(bossName, SEH.data.yaseylaName) then
      SEH.status.isYaseyla = true
    end
    if string.match(bossName, SEH.data.chimeraName) then
      SEH.status.isChimera = true
      SEH.Chimera.AddWamasuIcon()
      SEH.Chimera.AddLionIcon()
      SEH.Chimera.AddGryphonIcon()
      
      if SEH.status.isHMBoss then
        SEH.Chimera.AddCrytalNumberIcons()
      end
    end
    if string.match(bossName, SEH.data.ansuulName) then
      SEH.status.isAnsuul = true
      SEH.Ansuul.AddGreenIcon()
      SEH.Ansuul.AddRedIcon()
      SEH.Ansuul.AddBlueIcon()
    end
  end
end

function SEH.PlayerActivated()
  -- Disable all visible UI elements at startup.
  SEH.UnlockUI(false)

  if GetZoneId(GetUnitZoneIndex("player")) ~= SEH.data.sanitysEdgeId then
    return
  else
    SEH.units = {}
    SEH.unitsTag = {}
  end

  if not SEH.active and not SEH.savedVariables.hideWelcome then
    d("|cFF6200[SEH] Thanks for using Sanity Edge Helper " .. SEH.version ..".|r Please send issues on discord Wondernuts#1973")
  end
  SEH.active = true
  SEHStatusLabelAddonName:SetText("Sanity's Edge Helper " .. SEH.version)

  EVENT_MANAGER:UnregisterForEvent(SEH.name .. "CombatEvent", EVENT_COMBAT_EVENT )
  EVENT_MANAGER:RegisterForEvent(SEH.name .. "CombatEvent", EVENT_COMBAT_EVENT, SEH.CombatEvent)
  
  -- Buffs/debuffs
  EVENT_MANAGER:UnregisterForEvent(SEH.name .. "Buffs", EVENT_EFFECT_CHANGED )
  EVENT_MANAGER:RegisterForEvent(SEH.name .. "Buffs", EVENT_EFFECT_CHANGED, SEH.EffectChanged)
  
  -- Boss change
  EVENT_MANAGER:UnregisterForEvent(SEH.name .. "BossChange", EVENT_BOSSES_CHANGED, SEH.BossesChanged)
  EVENT_MANAGER:RegisterForEvent(SEH.name .. "BossChange", EVENT_BOSSES_CHANGED, SEH.BossesChanged)
  
  -- Combat state
  EVENT_MANAGER:UnregisterForEvent(SEH.name .. "CombatState", EVENT_PLAYER_COMBAT_STATE , SEH.CombatState)
  EVENT_MANAGER:RegisterForEvent(SEH.name .. "CombatState", EVENT_PLAYER_COMBAT_STATE , SEH.CombatState)
  
  -- Death state
  EVENT_MANAGER:UnregisterForEvent(SEH.name .. "DeathState", EVENT_UNIT_DEATH_STATE_CHANGED , SEH.DeathState)
  EVENT_MANAGER:RegisterForEvent(SEH.name .. "DeathState", EVENT_UNIT_DEATH_STATE_CHANGED , SEH.DeathState)
  
  -- Ticks
  EVENT_MANAGER:RegisterForUpdate(SEH.name.."UpdateTick", 
    1000/10, function(gameTimeMs) SEH.UpdateTick(gameTimeMs) end)
  EVENT_MANAGER:RegisterForUpdate(SEH.name.."UpdateSlowTick", 
    1000, function(gameTimeMs) SEH.UpdateSlowTick(gameTimeMs) end)
end

function SEH.OnAddonLoaded(event, addonName)
	if addonName ~= SEH.name then
		return
	end

  SEH.savedVariables = ZO_SavedVars:NewAccountWide("SanitysEdgeHelperSavedVariables", 2, nil, SEH.settings)
  SEH.RestorePosition()
  SEH.Menu.AddonMenu()
  SLASH_COMMANDS["/seh"] = SEH.CommandLine
  
	EVENT_MANAGER:UnregisterForEvent(SEH.name, EVENT_ADD_ON_LOADED )
	EVENT_MANAGER:RegisterForEvent(SEH.name .. "PlayerActive", EVENT_PLAYER_ACTIVATED,
    SEH.PlayerActivated)
end

EVENT_MANAGER:RegisterForEvent( SEH.name, EVENT_ADD_ON_LOADED, SEH.OnAddonLoaded )
