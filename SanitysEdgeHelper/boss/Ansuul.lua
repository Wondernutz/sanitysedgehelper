SEH = SEH or {}
local SEH = SEH
SEH.Ansuul = {
  Splits = {},
  IsSplit = false,
  SplitStart = 0,
}

local BLUE = 1
local RED = 2
local GREEN = 3

function SEH.Ansuul.Init()
  -- TODO: Move other Ansuul variables into SEH.Ansuul module
  SEH.Ansuul.IsSplit = false
  SEH.Ansuul.Splits = {}
  SEH.Ansuul.SplitStart = 0
end

function SEH.Ansuul.AddAnsuulCornerIcons()
  if SEH.savedVariables.showAnsuulCornerIcons and SEH.hasOSI() then

    if table.getn(SEH.status.AnsuulGreenIcon) == 0 then
      table.insert(SEH.status.AnsuulGreenIcon, 
        OSI.CreatePositionIcon(
          196570,
          30199,
          38049,
          "SanitysEdgeHelper/icons/squaretwo_green.dds",
          2 * OSI.GetIconSize()))
    end

    if table.getn(SEH.status.AnsuulRedIcon) == 0 then
      table.insert(SEH.status.AnsuulRedIcon, 
        OSI.CreatePositionIcon(
          200014,
          30199,
          44150,
          "SanitysEdgeHelper/icons/squaretwo_red.dds",
          2 * OSI.GetIconSize()))
    end

    if table.getn(SEH.status.AnsuulBlueIcon) == 0 then
      table.insert(SEH.status.AnsuulBlueIcon, 
        OSI.CreatePositionIcon(
          203417,
          30199,
          38080,
          "SanitysEdgeHelper/icons/squaretwo_blue.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Ansuul.RemoveAnsuulCornerIcons()
  SEH.DiscardPositionIconList(SEH.status.AnsuulGreenIcon)
  SEH.status.AnsuulGreenIcon = {}

  SEH.DiscardPositionIconList(SEH.status.AnsuulRedIcon)
  SEH.status.AnsuulRedIcon = {}

  SEH.DiscardPositionIconList(SEH.status.AnsuulBlueIcon)
  SEH.status.AnsuulBlueIcon = {}
end

function SEH.Ansuul.Poisoned_Mind(result, targetType, targetUnitId, hitValue)
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION and targetType == COMBAT_UNIT_TYPE_PLAYER then
    --SEH.Alert("", "Poisoned Mind (self)", 0x23B402FF, SEH.data.ansuul_poisoned_mind, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
    CombatAlerts.AlertBorder(true, hitValue, "green")
  end

  if result == ACTION_RESULT_EFFECT_GAINED_DURATION then
    SEH.AddIconForDuration(
      SEH.GetTagForId(targetUnitId),
      "SanitysEdgeHelper/icons/PoisonDropLarge.dds",
      hitValue)
  elseif result == ACTION_RESULT_EFFECT_FADED then
    SEH.RemoveIcon(SEH.GetTagForId(targetUnitId))
  end
end

function SEH.Ansuul.Manic_Phobia(result, targetType, targetUnitId, hitValue)
  --if result == ACTION_RESULT_BEGIN then
    --SEH.Alert("Manic Phobia", SEH.GetNameForId(targetUnitId), 0x303B4CFF, SEH.data.ansuul_manic_phobia, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
  --end
end

function SEH.Ansuul.Calamity(result, targetType, targetUnitId, hitValue)
  if result == ACTION_RESULT_BEGIN then
    SEH.status.ansuulIsFirstCalamity = false
    SEH.status.ansuulLastCalamity = GetGameTimeSeconds()
  end
end

function SEH.Ansuul.TheRitual(result, targetType, targetUnitId, hitValue)
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION then
    -- Maze starts
    SEH.status.ansuulSpawned = false
    
  elseif result == ACTION_RESULT_EFFECT_FADED then
    -- Maze ends
    SEH.status.ansuulSpawned = true
    SEH.status.ansuulLastCalamity = GetGameTimeSeconds()
    SEH.status.ansuulIsFirstCalamity = true
  end
end

function SEH.Ansuul.Breakdown(result, targetType, targetUnitId, hitValue, abilityId)
  if result == ACTION_RESULT_EFFECT_GAINED then
    -- Triplet phase starts, red clone performs the calamity move
    SEH.status.ansuulLastCalamity = GetGameTimeSeconds()
    SEH.status.ansuulIsFirstCalamity = true
    SEH.Ansuul.InitializeSplitHPTracking(targetUnitId, abilityId)
    
  elseif result == ACTION_RESULT_EFFECT_FADED then
    -- Triplet phase ends
    SEH.Ansuul.IsSplit = false
    SEH.status.ansuulLastCalamity = GetGameTimeSeconds()
    SEH.status.ansuulIsFirstCalamity = true
  end
end

function SEH.Ansuul.InitializeSplitHPTracking(targetUnitId, abilityId)
  local color = nil
  local ui_text_element = nil
  local maxhp = SEH.data.ansuul_split_hm_hp

  if abilityId == SEH.data.ansuul_red_split_breakdown then
    color = RED
    ui_text_element = SEHStatusLabelAnsuul3Value
  elseif abilityId == SEH.data.ansuul_green_split_breakdown then
    color = GREEN
    ui_text_element = SEHStatusLabelAnsuul4Value
  elseif abilityId == SEH.data.ansuul_blue_split_breakdown then 
    color = BLUE
    ui_text_element = SEHStatusLabelAnsuul5Value
  end

  -- TODO: Add logic to track splits HP on normal
  if SEH.status.isHMBoss then
    maxhp = SEH.data.ansuul_split_hm_hp
  else
    maxhp = SEH.data.ansuul_split_hp
  end

  SEH.Ansuul.Splits[targetUnitId] = {
    color = color,
    id = targetUnitId,
    percent = 100,
    hp = maxhp,
    maxhp = maxhp,
    combat_event_hp_threshold = maxhp * .15,
    complete = false,
    ui_text_element = ui_text_element,
  }

  if not SEH.Ansuul.IsSplit then
    SEH.Ansuul.IsSplit = true
    SEH.Ansuul.SplitStart = GetGameTimeSeconds()
  end
end

function SEH.Ansuul.UpdateTick(timeSec)
  SEHStatus:SetHidden(not (SEH.savedVariables.showAnsuulCalamityTimer or SEH.savedVariables.showSplitBossHP))
  SEH.Ansuul.UpdateCalamityTick(timeSec)
  SEH.Ansuul.UpdateSplitBossHPTick(timeSec)
end

function SEH.Ansuul.UpdateCalamityTick(timeSec)
  SEHStatusLabelAnsuul1:SetHidden(not SEH.status.ansuulSpawned or not SEH.savedVariables.showAnsuulCalamityTimer)
  SEHStatusLabelAnsuul1Value:SetHidden(not SEH.status.ansuulSpawned or not SEH.savedVariables.showAnsuulCalamityTimer)

  if SEH.status.ansuulSpawned then
    local calamityDelta = timeSec - SEH.status.ansuulLastCalamity

    local calamityTimeLeft = 0
    if SEH.status.ansuulIsFirstCalamity then
      calamityTimeLeft = SEH.data.ansuul_calamity_first_cd - calamityDelta
    else
      calamityTimeLeft = SEH.data.ansuul_calamity_cd - calamityDelta
    end

    SEHStatusLabelAnsuul1Value:SetText(SEH.GetSecondsRemainingString(calamityTimeLeft))
  end
end

function SEH.Ansuul.UpdateSplitBossHPTick(timeSec)
  local splitTrackingDisabled = not (SEH.savedVariables.showSplitBossHP and SEH.Ansuul.IsSplit)

  SEHStatusLabelAnsuul3:SetHidden(splitTrackingDisabled)
  SEHStatusLabelAnsuul3Value:SetHidden(splitTrackingDisabled)
  SEHStatusLabelAnsuul4:SetHidden(splitTrackingDisabled)
  SEHStatusLabelAnsuul4Value:SetHidden(splitTrackingDisabled)
  SEHStatusLabelAnsuul5:SetHidden(splitTrackingDisabled)
  SEHStatusLabelAnsuul5Value:SetHidden(splitTrackingDisabled)

  if splitTrackingDisabled then return end
  
  for unitId, split_data in pairs(SEH.Ansuul.Splits) do
    if split_data.complete then
      split_data.ui_text_element:SetColor(
        SEH.data.color.green[1],
        SEH.data.color.green[2],
        SEH.data.color.green[3])
      split_data.ui_text_element:SetText("DONE")
    else
      SEH.Ansuul.Splits[unitId].percent = (split_data.hp / split_data.maxhp) * 100
      split_data.ui_text_element:SetText(string.format("%.1f", SEH.Ansuul.Splits[unitId].percent) .. " %") 
    end
  end
end

function SEH.Ansuul.UpdateSplitsHPOnReticleOver(unitId, unitTag)
  if not (SEH.savedVariables.showSplitBossHP and SEH.Ansuul.IsSplit) then return end

  if SEH.Ansuul.Splits[unitId] and unitTag == "reticleover" then
    local curhp, maxhp = GetUnitPower("reticleover", POWERTYPE_HEALTH)
    SEH.Ansuul.Splits[unitId].hp = curhp
    SEH.Ansuul.Splits[unitId].maxhp = maxhp
    if curhp < 25000 then SEH.Ansuul.Splits[unitId].complete = true end
  end
end

function SEH.Ansuul.TrackCombatEventsToSplits(result, targetUnitId, hitValue, powerType)
  if not (SEH.savedVariables.showSplitBossHP and SEH.Ansuul.IsSplit) then return end

  if SEH.Ansuul.Splits[targetUnitId] and hitValue > 0 and powerType ~= 0 and hitValue < SEH.Ansuul.Splits[targetUnitId].combat_event_hp_threshold then
    SEH.Ansuul.Splits[targetUnitId].hp = SEH.Ansuul.Splits[targetUnitId].hp - hitValue
    if SEH.Ansuul.Splits[targetUnitId].hp < 0 then SEH.Ansuul.Splits[targetUnitId].hp = 0 end --this whole thing isnt optimized but whatevers its like 30 seconds of the entire trial
  end
end