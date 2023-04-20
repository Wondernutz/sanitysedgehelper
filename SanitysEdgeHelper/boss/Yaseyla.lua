SEH = SEH or {}
local SEH = SEH
SEH.Yaseyla = {}

function SEH.Yaseyla.Hindered(result, targetUnitId, hitValue)
  local isDPS, isHeal, isTank = GetPlayerRoles()
  if isDPS then
    return
  end
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION then
    SEH.AddIconForDuration(
      SEH.GetTagForId(targetUnitId),
      "SanitysEdgeHelper/icons/shattered.dds",
      hitValue)
  elseif result == ACTION_RESULT_HEAL_ABSORBED then
    -- TODO: Track how much healing is left.
  elseif result == ACTION_RESULT_EFFECT_FADED then
    SEH.RemoveIcon(SEH.GetTagForId(targetUnitId))
  end
end

function SEH.Yaseyla.Frost_Bomb_Target(result, targetType, targetUnitId, hitValue)
  if targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Frost Bomb (self)", 0x66CCFFFF, SEH.data.yaseyla_frost_bomb_target, SOUNDS.OBJECTIVE_DISCOVERED, hitValue)
  end

  --[[
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION then
    SEH.AddIconForDuration(
      SEH.GetTagForId(targetUnitId),
      "SanitysEdgeHelper/icons/ice-pin.dds",
      hitValue)
  elseif result == ACTION_RESULT_EFFECT_FADED then
    SEH.RemoveIcon(SEH.GetTagForId(targetUnitId))
  end--]]
end

function SEH.Yaseyla.Frost_Bomb_Applied(result, targetUnitId, hitValue)
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION then
    SEH.AddIconForDuration(
      SEH.GetTagForId(targetUnitId),
      "SanitysEdgeHelper/icons/ice.dds",
      hitValue)
  elseif result == ACTION_RESULT_EFFECT_FADED then
    SEH.RemoveIcon(SEH.GetTagForId(targetUnitId))
  end
end

function SEH.Yaseyla.Shrapnel(result, hitValue)
  -- Shrapnel on HM is cast at Boss health percentages of 80%, 55%, 25% and every ~50s after 25%.
  if not SEH.status.isHMBoss then
    return
  end

  if result == ACTION_RESULT_BEGIN then
    SEH.status.yaseylaLastShrapnel = GetGameTimeSeconds()
    SEH.Alert("", "Shrapnel (STACK!)", 0xFF0033FF, SEH.data.yaseyla_deflect, SOUNDS.DUEL_START, hitValue)
  end
end

function SEH.Yaseyla.CurrentHealthPercentage()
  currentTargetHP, maxTargetHP, effmaxTargetHP = GetUnitPower("boss1", POWERTYPE_HEALTH)
  return currentTargetHP / maxTargetHP * 100
end

function SEH.Yaseyla.UpdateTick(timeSec)
  if not SEH.status.isHMBoss then
    return
  end

  SEHStatus:SetHidden(not SEH.savedVariables.showShrapnel)
  SEHStatusLabelYaseyla1:SetHidden(not SEH.savedVariables.showShrapnel)
  SEHStatusLabelYaseyla1Value:SetHidden(not SEH.savedVariables.showShrapnel)

  -- Shrapnel
  local shrapnelDelta = timeSec - SEH.status.yaseylaLastShrapnel
  -- Time left for next cast
  local shrapnelTimeLeft = SEH.data.yaseyla_shrapnel_cd - shrapnelDelta
  -- Time left of damage
  local shrapnelDamageTimeLeft = SEH.data.yaseyla_shrapnel_duration - shrapnelDelta

  local currentHealthPercentage = SEH.Yaseyla.CurrentHealthPercentage()

  if shrapnelDamageTimeLeft > 0 then
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.green[1],
      SEH.data.color.green[2],
      SEH.data.color.green[3])
    if shrapnelDamageTimeLeft > 3 then
      SEHStatusLabelYaseyla1Value:SetText("ACTIVE: " .. string.format("%.0f", shrapnelDamageTimeLeft) .. "s ")
    else
      -- Add a decimal when it approaches 0.
      SEHStatusLabelYaseyla1Value:SetText("ACTIVE: " .. string.format("%.1f", shrapnelDamageTimeLeft) .. "s ")
    end
  
  elseif currentHealthPercentage > 80 then
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.orange[1],
      SEH.data.color.orange[2],
      SEH.data.color.orange[3])
    SEHStatusLabelYaseyla1Value:SetText(string.format("%.0f", currentHealthPercentage - 80) .. "% ")

  elseif currentHealthPercentage > 55 then
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.orange[1],
      SEH.data.color.orange[2],
      SEH.data.color.orange[3])
    SEHStatusLabelYaseyla1Value:SetText(string.format("%.0f", currentHealthPercentage - 55) .. "% ")

  elseif currentHealthPercentage > 25 then
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.orange[1],
      SEH.data.color.orange[2],
      SEH.data.color.orange[3])
    SEHStatusLabelYaseyla1Value:SetText(string.format("%.0f", currentHealthPercentage - 25) .. "% ")

  elseif shrapnelTimeLeft > 0 then 
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.orange[1],
      SEH.data.color.orange[2],
      SEH.data.color.orange[3])
    SEHStatusLabelYaseyla1Value:SetText(string.format("%.0f", shrapnelTimeLeft) .. "s ")

  else
    -- If you wipe during green, it would stay green without this color re-set.
    SEHStatusLabelYaseyla1Value:SetColor(
      SEH.data.color.orange[1],
      SEH.data.color.orange[2],
      SEH.data.color.orange[3])
    SEHStatusLabelYaseyla1Value:SetText("INC")
  end

end