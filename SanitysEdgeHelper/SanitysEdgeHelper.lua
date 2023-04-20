SEH = SEH or {}
local SEH = SEH

SEH.name     = "SanitysEdgeHelper"
SEH.version  = "0.1.0"
SEH.author   = "@Wondernuts"
SEH.active   = false

SEH.status = {
  testStatus = 0,
  inCombat = false,

  currentBoss = "",
  isYaseyla = false,
  isTwelvane = false,
  isAnsuul = false,
  isHMBoss = false,

  yaseylaLastShrapnel = 0,
  yaseylaLastFirebombs = 0,
  yaseylaIsFirstFirebombs = true,
  
  locked = true,
  
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
  if abilityId == SEH.data.hindered_effect then
    SEH.Yaseyla.Hindered(result, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.yaseyla_frost_bomb_target then
    SEH.Yaseyla.Frost_Bomb_Target(result, targetType, targetUnitId, hitValue)
  end

  if abilityId == SEH.data.yaseyla_frost_bomb_applied or abilityId == SEH.data.yaseyla_frost_bomb_applied_2 then
    SEH.Yaseyla.Frost_Bomb_Applied(result, targetUnitId, hitValue)
  end

  -- Yaseyla Shrapnel
  if abilityId == SEH.data.yaseyla_deflect then
    SEH.Yaseyla.Shrapnel(result, hitValue)
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.yaseyla_fire_bombs then
    SEH.Alert("", "Fire Bombs", 0xFF6600FF, abilityId, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
  end

  if result == ACTION_RESULT_BEGIN and abilityId == SEH.data.yaseyla_wamasu_charge then
    SEH.Alert("", "Wamasu Charge", 0xFFD666FF, abilityId, SOUNDS.DUEL_START, hitValue)
    CombatAlerts.AlertCast(abilityId, "Wamasu Charge", hitValue, {-2, 0})
  end

  --[[if result == ACTION_RESULT_BEGIN and targetType == COMBAT_UNIT_TYPE_PLAYER and abilityId == SEH.data.yaseyla_archer_true_shot then
    -- -3: ranged alert
    CombatAlerts.AlertCast(abilityId, sourceName, hitValue, {-3, 1})
  end--]]

  --[[ Light/heavy attacks (1.5s windup) alert for non-tanks.
  if result == ACTION_RESULT_BEGIN and targetType == COMBAT_UNIT_TYPE_PLAYER and (
    abilityId == SEH.data.guardian_crush or 
    abilityId == SEH.data.guardian_claw) then
    local isDPS, isHeal, isTank = GetPlayerRoles()
    if not isTank then
      CombatAlerts.AlertCast(abilityId, sourceName, hitValue, {-2, 2})
    end
  end--]]

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

  if SEH.status.inCombat == false then
    return
  end
  
  -- Boss 1: Yaseyla
  if SEH.status.isYaseyla then
    SEH.Yaseyla.UpdateTick(timeSec)
  end

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
  SEH.status.yaseylaLastFirebombs = 0
  SEH.status.yaseylaIsFirstFirebombs = true

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
	--local bossName = string.lower(GetUnitName("boss1"))
  local bossName = SEH.GetBossName()
  local lastBossName = SEH.status.currentBoss
  if bossName ~= nil then
    if SEH.status.currentBoss == SEH.data.ansuulName and bossName == "" then
      -- Do not reset Ansuul for empty, this helps the clearing on wipes.
      -- TODO: Remove UI after killing Ansuul.
    else
      if bossName ~= SEH.status.currentBoss then
        --d("[SEH] Boss change. Name = " .. bossName)
      end
      SEH.status.currentBoss = bossName
    end
    
    SEH.status.isYaseyla = false
    SEH.status.isTwelvane = false
    SEH.status.isAnsuul = false
    SEH.status.isHMBoss = false

    local currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("boss1", POWERTYPE_HEALTH)
    local hardmodeHealth = {
      [SEH.data.yaseylaName] = 70000000, -- vet 65M, HM 97.8M
      [SEH.data.twelvaneName] = 25000000,  -- vet 17.4M, HM 34.9M
      [SEH.data.ansuulName] = 100000000, -- vet: 69M, HM ?
    }

    -- Check for HM.
    -- TODO: Check if this works for Reef Guardian since "boss1" disappears, but then hp is nil so it shouldn't update.
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
    if string.match(bossName, SEH.data.twelvaneName) then
      SEH.status.isTwelvane = true
    end
    if string.match(bossName, SEH.data.ansuulName) then
      SEH.status.isAnsuul = true
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
  
  -- Bufs/debuffs
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
