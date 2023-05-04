SEH = SEH or {}
local SEH = SEH
SEH.Twelvane = {}


function SEH.Twelvane.RemoveWamasuIcon()
  if SEH.status.TwelvaneWamasuIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.TwelvaneWamasuIcon)
    end
    SEH.status.TwelvaneWamasuIcon = nil
  end
end

function SEH.Twelvane.AddWamasuIcon()
  if SEH.status.TwelvaneWamasuIcon == nil and SEH.hasOSI() then
    SEH.status.TwelvaneWamasuIcon =
      OSI.CreatePositionIcon(
        182503,
        40390,
        222654,
        "SanitysEdgeHelper/icons/squaretwo_green.dds",
        2 * OSI.GetIconSize())
  end
end


function SEH.Twelvane.RemoveLionIcon()
  if SEH.status.TwelvaneLionIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.TwelvaneLionIcon)
    end
    SEH.status.TwelvaneLionIcon = nil
  end
end

function SEH.Twelvane.AddLionIcon()
  if SEH.status.TwelvaneLionIcon == nil and SEH.hasOSI() then
    SEH.status.TwelvaneLionIcon =
      OSI.CreatePositionIcon(
        187466,
        40385,
        222654,
        "SanitysEdgeHelper/icons/squaretwo_red.dds",
        2 * OSI.GetIconSize())
  end
end

function SEH.Twelvane.RemoveGryphonIcon()
  if SEH.status.TwelvaneGryphonIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.TwelvaneGryphonIcon)
    end
    SEH.status.TwelvaneGryphonIcon = nil
  end
end

function SEH.Twelvane.AddGryphonIcon()
  if SEH.status.TwelvaneGryphonIcon == nil and SEH.hasOSI() then
    SEH.status.TwelvaneGryphonIcon =
      OSI.CreatePositionIcon(
        184996,
        40390,
        228135,
        "SanitysEdgeHelper/icons/squaretwo_blue.dds",
        2 * OSI.GetIconSize())
  end
end

