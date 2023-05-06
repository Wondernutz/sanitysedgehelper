SEH = SEH or {}
local SEH = SEH
SEH.Chimera = {}


function SEH.Chimera.RemoveWamasuIcon()
  if SEH.status.ChimeraWamasuIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.ChimeraWamasuIcon)
    end
    SEH.status.ChimeraWamasuIcon = nil
  end
end

function SEH.Chimera.AddWamasuIcon()
  if SEH.status.ChimeraWamasuIcon == nil and SEH.hasOSI() then
    SEH.status.ChimeraWamasuIcon =
      OSI.CreatePositionIcon(
        182503,
        40390,
        222654,
        "SanitysEdgeHelper/icons/Wamasu.dds",
        2 * OSI.GetIconSize())
  end
end


function SEH.Chimera.RemoveLionIcon()
  if SEH.status.ChimeraLionIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.ChimeraLionIcon)
    end
    SEH.status.ChimeraLionIcon = nil
  end
end

function SEH.Chimera.AddLionIcon()
  if SEH.status.ChimeraLionIcon == nil and SEH.hasOSI() then
    SEH.status.ChimeraLionIcon =
      OSI.CreatePositionIcon(
        187466,
        40385,
        222654,
        "SanitysEdgeHelper/icons/Lion.dds",
        2 * OSI.GetIconSize())
  end
end

function SEH.Chimera.RemoveGryphonIcon()
  if SEH.status.ChimeraGryphonIcon ~= nil then
    if SEH.hasOSI() then
      OSI.DiscardPositionIcon(SEH.status.ChimeraGryphonIcon)
    end
    SEH.status.ChimeraGryphonIcon = nil
  end
end

function SEH.Chimera.AddGryphonIcon()
  if SEH.status.ChimeraGryphonIcon == nil and SEH.hasOSI() then
    SEH.status.ChimeraGryphonIcon =
      OSI.CreatePositionIcon(
        184996,
        40390,
        228135,
        "SanitysEdgeHelper/icons/Gryphon.dds",
        2 * OSI.GetIconSize())
  end
end

function SEH.Chimera.AddCrytalNumberIcons()
  if SEH.savedVariables.showCrystalNumberIcons and SEH.hasOSI() then

    if table.getn(SEH.status.chimeraNumber1Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.chimeraNumber1Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_number1_pos_list[i][1],
            SEH.data.chimera_number1_pos_list[i][2],
            SEH.data.chimera_number1_pos_list[i][3],
            "SanitysEdgeHelper/icons/1.dds",
            2 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.chimeraNumber2Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.chimeraNumber2Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_number2_pos_list[i][1],
            SEH.data.chimera_number2_pos_list[i][2],
            SEH.data.chimera_number2_pos_list[i][3],
            "SanitysEdgeHelper/icons/2.dds",
            2 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.chimeraNumber3Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.chimeraNumber3Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_number3_pos_list[i][1],
            SEH.data.chimera_number3_pos_list[i][2],
            SEH.data.chimera_number3_pos_list[i][3],
            "SanitysEdgeHelper/icons/3.dds",
            2 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.chimeraNumber4Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.chimeraNumber4Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_number4_pos_list[i][1],
            SEH.data.chimera_number4_pos_list[i][2],
            SEH.data.chimera_number4_pos_list[i][3],
            "SanitysEdgeHelper/icons/4.dds",
            2 * OSI.GetIconSize()))
      end
    end

    if table.getn(SEH.status.chimeraNumber5Icon) == 0 then
      for i=1,3 do
        table.insert(SEH.status.chimeraNumber5Icon, 
          OSI.CreatePositionIcon(
            SEH.data.chimera_number5_pos_list[i][1],
            SEH.data.chimera_number5_pos_list[i][2],
            SEH.data.chimera_number5_pos_list[i][3],
            "SanitysEdgeHelper/icons/5.dds",
            2 * OSI.GetIconSize()))
      end
    end
  end
end

function SEH.Chimera.RemoveCrystalNumberIcons()
  SEH.DiscardPositionIconList(SEH.status.chimeraNumber1Icon)
  SEH.status.chimeraNumber1Icon = {}

  SEH.DiscardPositionIconList(SEH.status.chimeraNumber2Icon)
  SEH.status.chimeraNumber2Icon = {}

  SEH.DiscardPositionIconList(SEH.status.chimeraNumber3Icon)
  SEH.status.chimeraNumber3Icon = {}

  SEH.DiscardPositionIconList(SEH.status.chimeraNumber4Icon)
  SEH.status.chimeraNumber4Icon = {}

  SEH.DiscardPositionIconList(SEH.status.chimeraNumber5Icon)
  SEH.status.chimeraNumber5Icon = {}
end