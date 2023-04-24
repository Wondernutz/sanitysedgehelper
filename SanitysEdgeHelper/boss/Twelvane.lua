SEH = SEH or {}
local SEH = SEH
SEH.Twelvane = {}

function SEH.Twelvane.AddWamasuIcons()
  if SEH.savedVariables.showWamasuIcons and table.getn(SEH.status.twelvaneWamasuIcons) == 0 and SEH.hasOSI() then
    table.insert(SEH.status.twelvaneWamasuIcons, 
      OSI.CreatePositionIcon(
        182503,
        40390,
        222654,
        "SanitysEdgeHelper/icons/squaretwo_green.dds",
        2 * OSI.GetIconSize()))
  end
end
  
function SEH.Twelvane.RemoveWamasuIcons()
  SEH.DiscardPositionIconList(SEH.status.twelvaneWamasuIcons)
  SEH.status.twelvaneWamasuIcons = {}
end

function SEH.Twelvane.AddLionIcons()
  if SEH.savedVariables.showLionIcons and table.getn(SEH.status.twelvaneLionIcons) == 0 and SEH.hasOSI() then
    table.insert(SEH.status.twelvaneLionIcons, 
      OSI.CreatePositionIcon(
        187466,
        40385,
        222654,
        "SanitysEdgeHelper/icons/squaretwo_red.dds",
        2 * OSI.GetIconSize()))
  end
end
  
function SEH.Twelvane.RemoveLionIcons()
  SEH.DiscardPositionIconsList(SEH.status.twelvaneLionIcons)
  SEH.status.twelvaneLionIcons = {}
end

function SEH.Twelvane.AddGryphonIcons()
  if SEH.savedVariables.showGryphonIcons and table.getn(SEH.status.twelvaneGryphonIcons) == 0 and SEH.hasOSI() then
    table.insert(SEH.status.twelvaneGryphonIcons, 
      OSI.CreatePositionIcon(
        184996,
        40390,
        228135,
        "SanitysEdgeHelper/icons/squaretwo_blue.dds",
        2 * OSI.GetIconSize()))
  end
end
  
function SEH.Twelvane.RemoveGryphonIcons()
  SEH.DiscardPositionIconList(SEH.status.twelvaneGryphonIcons)
  SEH.status.twelvaneGryphonIcons = {}
end