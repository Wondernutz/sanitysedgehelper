SEH = SEH or {}
local SEH = SEH
SEH.Ansuul = {}

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
