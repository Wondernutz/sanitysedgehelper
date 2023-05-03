SEH = SEH or {}
local SEH = SEH
SEH.Ansuul = {}

function SEH.Ansuul.Poisoned_Mind(result, targetType, targetUnitId, hitValue)
  if result == ACTION_RESULT_EFFECT_GAINED_DURATION and targetType == COMBAT_UNIT_TYPE_PLAYER then
    SEH.Alert("", "Poisoned Mind (self)", 0x23B402FF, SEH.data.ansuul_poisoned_mind, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
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
  if result == ACTION_RESULT_BEGIN then
    SEH.Alert("Manic Phobia", SEH.GetNameForId(targetUnitId), 0x303B4CFF, SEH.data.ansuul_manic_phobia, SOUNDS.OBJECTIVE_DISCOVERED, 2000)
  end
end

function SEH.Ansuul.UpdateTick(timeSec)
  SEHStatus:SetHidden(not SEH.savedVariables.showSplitBossHP)
  SEH.Ansuul.UpdateSplitBossHPTick(timeSec)
end

function SEH.Ansuul.UpdateSplitBossHPTick(timeSec)
  local bossHealth = {
    currentHP = {},
    maxHP = {},
    percentage = {},
    labels = {
      SEHStatusLabelAnsuul1Value,
      SEHStatusLabelAnsuul2Value,
      SEHStatusLabelAnsuul3Value
    },
    hide = {},
  }

  for i=1, 4 do
    local bossTag = "boss" .. tostring(i)
    bossHealth.currentHP[i], bossHealth.maxHP[i] = GetUnitPower(bossTag, POWERTYPE_HEALTH)

    if bossHealth.currentHP[i] ~= nil and bossHealth.maxHP[i] ~= nil and bossHealth.maxHP[i] ~= 0 then
      bossHealth.percentage[i] = bossHealth.currentHP[i] / bossHealth.maxHP[i] * 100
      bossHealth.labels[i]:SetText(string.format("%.1f", bossHealth.percentage[i]) .. " %")
      bossHealth.hide[i] = false
    else
      bossHealth.labels[i]:SetText("-")
      bossHealth.hide[i] = true
    end
  end

  SEHStatusLabelAnsuul1:SetHidden(bossHealth.hide[2] or not SEH.savedVariables.showSplitBossHP)
  SEHStatusLabelAnsuul1Value:SetHidden(bossHealth.hide[2] or not SEH.savedVariables.showSplitBossHP)
  SEHStatusLabelAnsuul2:SetHidden(bossHealth.hide[3] or not SEH.savedVariables.showSplitBossHP)
  SEHStatusLabelAnsuul2Value:SetHidden(bossHealth.hide[3] or not SEH.savedVariables.showSplitBossHP)
  SEHStatusLabelAnsuul3:SetHidden(bossHealth.hide[4] or not SEH.savedVariables.showSplitBossHP)
  SEHStatusLabelAnsuul3Value:SetHidden(bossHealth.hide[4] or not SEH.savedVariables.showSplitBossHP)
end
