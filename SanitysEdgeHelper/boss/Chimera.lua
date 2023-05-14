SEH = SEH or {}
local SEH = SEH
SEH.Chimera = {}

function SEH.Chimera.AddChimeraPortalIcons()
  if SEH.savedVariables.showChimeraPortalIcons and SEH.hasOSI() then

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

function SEH.Chimera.RemoveChimeraPortalIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraWamasuIcon)
  SEH.status.ChimeraWamasuIcon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraLionIcon)
  SEH.status.ChimeraLionIcon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraGryphonIcon)
  SEH.status.ChimeraGryphonIcon = {}
end

function SEH.Chimera.AddNonHM_CrystalNumberIcons()
  if SEH.savedVariables.showNonHM_CrystalNumberIcons and SEH.hasOSI() then

    if table.getn(SEH.status.ChimeraNonHM_Number1Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHM_Number1Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhm_number1_pos_list[i][1],
            SEH.data.chimera_nonhm_number1_pos_list[i][2],
            SEH.data.chimera_nonhm_number1_pos_list[i][3],
            "SanitysEdgeHelper/icons/1.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHM_Number2Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHM_Number2Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhm_number2_pos_list[i][1],
            SEH.data.chimera_nonhm_number2_pos_list[i][2],
            SEH.data.chimera_nonhm_number2_pos_list[i][3],
            "SanitysEdgeHelper/icons/2.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHM_Number3Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHM_Number3Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhm_number3_pos_list[i][1],
            SEH.data.chimera_nonhm_number3_pos_list[i][2],
            SEH.data.chimera_nonhm_number3_pos_list[i][3],
            "SanitysEdgeHelper/icons/3.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraNonHM_Number4Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraNonHM_Number4Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_nonhm_number4_pos_list[i][1],
            SEH.data.chimera_nonhm_number4_pos_list[i][2],
            SEH.data.chimera_nonhm_number4_pos_list[i][3],
            "SanitysEdgeHelper/icons/4.dds",
            1 * OSI.GetIconSize()))
      end
    end
  end
end

function SEH.Chimera.RemoveNonHM_CrystalNumberIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHM_Number1Icon)
  SEH.status.ChimeraNonHM_Number1Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHM_Number2Icon)
  SEH.status.ChimeraNonHM_Number2Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHM_Number3Icon)
  SEH.status.ChimeraNonHM_Number3Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraNonHM_Number4Icon)
  SEH.status.ChimeraNonHM_Number4Icon = {}
end

function SEH.Chimera.AddHM_CrystalNumberIcons()
  if SEH.savedVariables.showHM_CrystalNumberIcons and SEH.hasOSI() then

    if table.getn(SEH.status.ChimeraHM_Number1Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHM_Number1Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hm_number1_pos_list[i][1],
            SEH.data.chimera_hm_number1_pos_list[i][2],
            SEH.data.chimera_hm_number1_pos_list[i][3],
            "SanitysEdgeHelper/icons/1.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHM_Number2Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHM_Number2Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hm_number2_pos_list[i][1],
            SEH.data.chimera_hm_number2_pos_list[i][2],
            SEH.data.chimera_hm_number2_pos_list[i][3],
            "SanitysEdgeHelper/icons/2.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHM_Number3Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHM_Number3Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hm_number3_pos_list[i][1],
            SEH.data.chimera_hm_number3_pos_list[i][2],
            SEH.data.chimera_hm_number3_pos_list[i][3],
            "SanitysEdgeHelper/icons/3.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHM_Number4Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHM_Number4Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hm_number4_pos_list[i][1],
            SEH.data.chimera_hm_number4_pos_list[i][2],
            SEH.data.chimera_hm_number4_pos_list[i][3],
            "SanitysEdgeHelper/icons/4.dds",
            1 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.ChimeraHM_Number5Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.ChimeraHM_Number5Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_hm_number5_pos_list[i][1],
            SEH.data.chimera_hm_number5_pos_list[i][2],
            SEH.data.chimera_hm_number5_pos_list[i][3],
            "SanitysEdgeHelper/icons/5.dds",
            1 * OSI.GetIconSize()))
      end
    end
  end
end

function SEH.Chimera.RemoveHM_CrystalNumberIcons()
  SEH.DiscardPositionIconList(SEH.status.ChimeraHM_Number1Icon)
  SEH.status.ChimeraHM_Number1Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHM_Number2Icon)
  SEH.status.ChimeraHM_Number2Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHM_Number3Icon)
  SEH.status.ChimeraHM_Number3Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHM_Number4Icon)
  SEH.status.ChimeraHM_Number4Icon = {}

  SEH.DiscardPositionIconList(SEH.status.ChimeraHM_Number5Icon)
  SEH.status.ChimeraHM_Number5Icon = {}
end
