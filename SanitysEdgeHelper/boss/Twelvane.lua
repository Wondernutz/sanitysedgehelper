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
        "SanitysEdgeHelper/icons/Wamasu.dds",
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
        "SanitysEdgeHelper/icons/Lion.dds",
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
        "SanitysEdgeHelper/icons/Gryphon.dds",
        2 * OSI.GetIconSize())
  end
end

function SEH.Twelvane.AddTwelvaneNumber1Icon()
  if SEH.savedVariables.showTwelvaneNumber1Icon and table.getn(SEH.status.twelvaneNumber1Icon) == 0 and SEH.hasOSI() then
    for i=1,3 do
      table.insert(SEH.status.twelvaneNumber1Icon, 
        OSI.CreatePositionIcon(
          SEH.data.twelvane_number1_pos_list[i][1],
          SEH.data.twelvane_number1_pos_list[i][2],
          SEH.data.twelvane_number1_pos_list[i][3],
          "SanitysEdgeHelper/icons/1.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Twelvane.RemoveTwelvaneNumber1Icon()
  SEH.DiscardPositionIconList(SEH.status.twelvaneNumber1Icon)
  SEH.status.twelvaneNumber1Icon = {}
end

function SEH.Twelvane.AddTwelvaneNumber2Icon()
  if SEH.savedVariables.showTwelvaneNumber2Icon and table.getn(SEH.status.twelvaneNumber2Icon) == 0 and SEH.hasOSI() then
    for i=1,3 do
      table.insert(SEH.status.twelvaneNumber2Icon, 
        OSI.CreatePositionIcon(
          SEH.data.twelvane_number2_pos_list[i][1],
          SEH.data.twelvane_number2_pos_list[i][2],
          SEH.data.twelvane_number2_pos_list[i][3],
          "SanitysEdgeHelper/icons/2.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Twelvane.RemoveTwelvaneNumber2Icon()
  SEH.DiscardPositionIconList(SEH.status.twelvaneNumber2Icon)
  SEH.status.twelvaneNumber2Icon = {}
end

function SEH.Twelvane.AddTwelvaneNumber3Icon()
  if SEH.savedVariables.showTwelvaneNumber3Icon and table.getn(SEH.status.twelvaneNumber3Icon) == 0 and SEH.hasOSI() then
    for i=1,3 do
      table.insert(SEH.status.twelvaneNumber3Icon, 
        OSI.CreatePositionIcon(
          SEH.data.twelvane_number3_pos_list[i][1],
          SEH.data.twelvane_number3_pos_list[i][2],
          SEH.data.twelvane_number3_pos_list[i][3],
          "SanitysEdgeHelper/icons/3.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Twelvane.RemoveTwelvaneNumber3Icon()
  SEH.DiscardPositionIconList(SEH.status.twelvaneNumber3Icon)
  SEH.status.twelvaneNumber3Icon = {}
end

function SEH.Twelvane.AddTwelvaneNumber4Icon()
  if SEH.savedVariables.showTwelvaneNumber4Icon and table.getn(SEH.status.twelvaneNumber4Icon) == 0 and SEH.hasOSI() then
    for i=1,3 do
      table.insert(SEH.status.twelvaneNumber4Icon, 
        OSI.CreatePositionIcon(
          SEH.data.twelvane_number4_pos_list[i][1],
          SEH.data.twelvane_number4_pos_list[i][2],
          SEH.data.twelvane_number4_pos_list[i][3],
          "SanitysEdgeHelper/icons/4.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Twelvane.RemoveTwelvaneNumber4Icon()
  SEH.DiscardPositionIconList(SEH.status.twelvaneNumber4Icon)
  SEH.status.twelvaneNumber4Icon = {}
end

function SEH.Twelvane.AddTwelvaneNumber5Icon()
  if SEH.savedVariables.showTwelvaneNumber5Icon and table.getn(SEH.status.twelvaneNumber5Icon) == 0 and SEH.hasOSI() then
    for i=1,3 do
      table.insert(SEH.status.twelvaneNumber5Icon, 
        OSI.CreatePositionIcon(
          SEH.data.twelvane_number5_pos_list[i][1],
          SEH.data.twelvane_number5_pos_list[i][2],
          SEH.data.twelvane_number5_pos_list[i][3],
          "SanitysEdgeHelper/icons/5.dds",
          2 * OSI.GetIconSize()))
    end
  end
end

function SEH.Twelvane.RemoveTwelvaneNumber5Icon()
  SEH.DiscardPositionIconList(SEH.status.twelvaneNumber5Icon)
  SEH.status.twelvaneNumber5Icon = {}
end