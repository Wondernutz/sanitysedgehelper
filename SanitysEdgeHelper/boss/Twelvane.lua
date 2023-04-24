SEH = SEH or {}
local SEH = SEH
SEH.Twelvane = {}

function SEH.Twelvane.AddWamasuIcons()
    if SEH.savedVariables.showWamasuIcons and table.getn(SEH.status.twelvaneWamasuIcons) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneWamasuIcons, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][1],
            "SanitysEdgeHelper/icons/squaretwo_green.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveWamasuIcons()
    SEH.DiscardPositionIconList(SEH.status.twelvaneWamasuIcons)
    SEH.status.twelvaneWamasuIcons = {}
  end

  function SEH.Twelvane.AddLionIcons()
    if SEH.savedVariables.showLionIcons and table.getn(SEH.status.twelvaneLionIcons) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneLionIcons, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][2],
            "SanitysEdgeHelper/icons/squaretwo_red.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveLionIcons()
    SEH.DiscardPositionIconsList(SEH.status.twelvaneLionIcons)
    SEH.status.twelvaneLionIcons = {}
  end

  function SEH.Twelvane.AddGryphonIcons()
    if SEH.savedVariables.showGryphonIcons and table.getn(SEH.status.twelvaneGryphonIcons) == 0 and SEH.hasOSI() then
      for i=1,3 do
        table.insert(SEH.status.twelvaneGryphonIcons, 
          OSI.CreatePositionIcon(
            SEH.data.mantle_pos_list[i][3],
            "SanitysEdgeHelper/icons/squaretwo_blue.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
  
  function SEH.Twelvane.RemoveGryphonIcons()
    SEH.DiscardPositionIconList(SEH.status.twelvaneGryphonIcons)
    SEH.status.twelvaneGryphonIcons = {}
  end