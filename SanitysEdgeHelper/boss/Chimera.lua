SEH = SEH or {}
local SEH = SEH
SEH.Chimera = {}

function SEH.Chimera.AddChimeraAddIcons()
  if SEH.savedVariables.showChimeraAddIcons and SEH.hasOSI() then

    if table.getn(SEH.status.ChimeraWamasuIcon) == 0 then
      table.insert(SEH.status.ChimeraWamasuIcon, 
        OSI.CreatePositionIcon(
          182466,
          40391,
          222635,
          "SanitysEdgeHelper/icons/Wamasu.dds",
          2 * OSI.GetIconSize()))
    end

    if table.getn(SEH.status.ChimeraLionIcon) == 0 then
      table.insert(SEH.status.ChimeraLionIcon, 
        OSI.CreatePositionIcon(
          187456,
          40387,
          222644,
          "SanitysEdgeHelper/icons/Lion.dds",
          2 * OSI.GetIconSize()))
    end

    if table.getn(SEH.status.ChimeraGryphonIcon) == 0 then
      table.insert(SEH.status.ChimeraGryphonIcon, 
        OSI.CreatePositionIcon(
          185015,
          40390,
          228119,
          "SanitysEdgeHelper/icons/Gryphon.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Chimera.RemoveChimeraAddIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraWamasuIcon)
  SEH.status.ChimeraWamasuIcon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraLionIcon)
  SEH.status.ChimeraLionIcon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraGryphonIcon)
  SEH.status.ChimeraGryphonIcon = {}
end

function SEH.Chimera.AddNonHMCrystalNumberIcons()
  if SEH.savedVariables.showNonHMCrystalNumberIcons and SEH.hasOSI() then

    if table.getn(SEH.status.ChimeraNonHMNumber1Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHMNumber1Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhmnumber1_pos_list[i][1],
            SEH.data.chimera_nonhmnumber1_pos_list[i][2],
            SEH.data.chimera_nonhmnumber1_pos_list[i][3],
            "SanitysEdgeHelper/icons/1.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHMNumber2Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHMNumber2Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhmnumber2_pos_list[i][1],
            SEH.data.chimera_nonhmnumber2_pos_list[i][2],
            SEH.data.chimera_nonhmnumber2_pos_list[i][3],
            "SanitysEdgeHelper/icons/2.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHMNumber3Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHMNumber3Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhmnumber3_pos_list[i][1],
            SEH.data.chimera_nonhmnumber3_pos_list[i][2],
            SEH.data.chimera_nonhmnumber3_pos_list[i][3],
            "SanitysEdgeHelper/icons/3.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHMNumber4Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHMNumber4Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhmnumber4_pos_list[i][1],
            SEH.data.chimera_nonhmnumber4_pos_list[i][2],
            SEH.data.chimera_nonhmnumber4_pos_list[i][3],
            "SanitysEdgeHelper/icons/4.dds",
            1 * OSI.GetIconSize()))
      end
    end
  end
end

function SEH.Chimera.RemoveNonHMCrystalNumberIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHMNumber1Icon)
  SEH.status.ChimeraNonHMNumber1Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHMNumber2Icon)
  SEH.status.ChimeraNonHMNumber2Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHMNumber3Icon)
  SEH.status.ChimeraNonHMNumber3Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHMNumber4Icon)
  SEH.status.ChimeraNonHMNumber4Icon = {}
end

function SEH.Chimera.AddHMCrystalNumberIcons()
  if SEH.savedVariables.showHMCrystalNumberIcons and SEH.hasOSI() then

    if table.getn(SEH.status.ChimeraHMNumber1Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHMNumber1Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hmnumber1_pos_list[i][1],
            SEH.data.chimera_hmnumber1_pos_list[i][2],
            SEH.data.chimera_hmnumber1_pos_list[i][3],
            "SanitysEdgeHelper/icons/1.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHMNumber2Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHMNumber2Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hmnumber2_pos_list[i][1],
            SEH.data.chimera_hmnumber2_pos_list[i][2],
            SEH.data.chimera_hmnumber2_pos_list[i][3],
            "SanitysEdgeHelper/icons/2.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHMNumber3Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHMNumber3Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hmnumber3_pos_list[i][1],
            SEH.data.chimera_hmnumber3_pos_list[i][2],
            SEH.data.chimera_hmnumber3_pos_list[i][3],
            "SanitysEdgeHelper/icons/3.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHMNumber4Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHMNumber4Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hmnumber4_pos_list[i][1],
            SEH.data.chimera_hmnumber4_pos_list[i][2],
            SEH.data.chimera_hmnumber4_pos_list[i][3],
            "SanitysEdgeHelper/icons/4.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHMNumber5Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHMNumber5Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hmnumber5_pos_list[i][1],
            SEH.data.chimera_hmnumber5_pos_list[i][2],
            SEH.data.chimera_hmnumber5_pos_list[i][3],
            "SanitysEdgeHelper/icons/5.dds",
            1 * OSI.GetIconSize()))
      end
    end
  end
end

function SEH.Chimera.RemoveHMCrystalNumberIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraHMNumber1Icon)
  SEH.status.ChimeraHMNumber1Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHMNumber2Icon)
  SEH.status.ChimeraHMNumber2Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHMNumber3Icon)
  SEH.status.ChimeraHMNumber3Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHMNumber4Icon)
  SEH.status.ChimeraHMNumber4Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHMNumber5Icon)
  SEH.status.ChimeraHMNumber5Icon = {}
end
