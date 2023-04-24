SEH = SEH or {}
local SEH = SEH
SEH.Twelvane = {}

function SEH.Twelvane.AddWamasuIcon()
    if SEH.savedVariables.showWamasuIcon and table.getn(SEH.status.twelvaneWamasuIcon) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneWamasuIcon, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][1],
            "SanitysEdgeHelper/icons/squaretwo_green.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveWamasuIcon()
    SEH.DiscardPositionIconList(SEH.status.twelvaneWamasuIcon)
    SEH.status.twelvaneWamasuIcon = {}
  end

  function SEH.Twelvane.AddLionIcon()
    if SEH.savedVariables.showLionIcon and table.getn(SEH.status.twelvaneLionIcon) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneLionIcon, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][2],
            "SanitysEdgeHelper/icons/squaretwo_red.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveLionIcon()
    SEH.DiscardPositionIconList(SEH.status.twelvaneLionIcon)
    SEH.status.twelvaneLionIcon = {}
  end

  function SEH.Twelvane.AddGryphonIcon()
    if SEH.savedVariables.showGryphonIcon and table.getn(SEH.status.twelvaneGryphonIcon) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneGryphonIcon, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][3],
            "SanitysEdgeHelper/icons/squaretwo_blue.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveGryphonIcon()
    SEH.DiscardPositionIconList(SEH.status.twelvaneGryphonIcon)
    SEH.status.twelvaneGryphonIcon = {}
  end