SEH = SEH or {}
local SEH = SEH

function SEH.OnSEHMessage1Move()
  SEH.savedVariables.message1Left = SEHMessage1:GetLeft()
  SEH.savedVariables.message1Top = SEHMessage1:GetTop()
end

function SEH.OnSEHMessage2Move()
  SEH.savedVariables.message2Left = SEHMessage2:GetLeft()
  SEH.savedVariables.message2Top = SEHMessage2:GetTop()
end

function SEH.OnSEHMessage3Move()
  SEH.savedVariables.message3Left = SEHMessage3:GetLeft()
  SEH.savedVariables.message3Top = SEHMessage3:GetTop()
end

function SEH.OnSEHStatusMove()
  SEH.savedVariables.statusLeft = SEHStatus:GetLeft()
  SEH.savedVariables.statusTop = SEHStatus:GetTop()
end

function SEH.DefaultPosition()
  SEH.savedVariables.message1Left = nil
  SEH.savedVariables.message1Top = nil
  SEH.savedVariables.message2Left = nil
  SEH.savedVariables.message2Top = nil
  SEH.savedVariables.message3Left = nil
  SEH.savedVariables.message3Top = nil
  SEH.savedVariables.statusLeft = nil
  SEH.savedVariables.statusTop = nil
  SEH.savedVariables.mapLeft = nil
  SEH.savedVariables.mapTop = nil
end

function SEH.RestorePosition()
  if SEH.savedVariables.message1Left ~= nil then
    SEHMessage1:ClearAnchors()
    SEHMessage1:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT,
        SEH.savedVariables.message1Left,
        SEH.savedVariables.message1Top)
  end
  
  if SEH.savedVariables.message2Left ~= nil then
    SEHMessage2:ClearAnchors()
    SEHMessage2:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT,
        SEH.savedVariables.message2Left,
        SEH.savedVariables.message2Top)
  end

  if SEH.savedVariables.message3Left ~= nil then
    SEHMessage3:ClearAnchors()
    SEHMessage3:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT,
        SEH.savedVariables.message3Left,
        SEH.savedVariables.message3Top)
  end


  if SEH.savedVariables.statusLeft ~= nil then
    SEHStatus:ClearAnchors()
    SEHStatus:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT,
        SEH.savedVariables.statusLeft,
        SEH.savedVariables.statusTop)
  end

end


function SEH.UnlockUI(unlock)
  SEH.status.locked = not unlock
  SEH.HideAllUI(not unlock)
  SEHMessage1:SetMouseEnabled(unlock)
  SEHMessage2:SetMouseEnabled(unlock)
  SEHMessage3:SetMouseEnabled(unlock)
  SEHStatus:SetMouseEnabled(unlock)
  
  SEHMessage1:SetMovable(unlock)
  SEHMessage2:SetMovable(unlock)
  SEHMessage3:SetMovable(unlock)
  SEHStatus:SetMovable(unlock)
end

function SEH.ClearUIOutOfCombat()
  SEH.status.inCombat = false

  -- Calls here Hide icons, if needed.

  SEH.ResetStatus()
  SEH.ResetAllPlayerIcons()
  SEH.HideAllUI(true)
  SEH.LoadSavedScale()
end

function SEH.HideAllUI(hide)
  SEHMessage1:SetHidden(hide)
  SEHMessage2:SetHidden(hide)
  SEHMessage3:SetHidden(hide)
  SEHStatus:SetHidden(hide)
  SEHScreenBorder:SetHidden(true) -- do NOT want to display it on unlock.
  
  -- Generic
  SEHStatusLabelTop:SetHidden(hide)

end


function SEH.CommandLine(param)
  local help = "[QDRH] Usage: /qdrh {lock,unlock}"
  if param == nil or param == "" then
    d(help)
  elseif param == "lock" then
    SEH.Lock()
  elseif param == "unlock" then
    SEH.Unlock()
  else
    d(help)
  end
end

function SEH.Lock()
  SEH.UnlockUI(false)
end

function SEH.Unlock()
  SEH.UnlockUI(true)
end

function SEH.LoadSavedScale()
  SEH.SetScale(SEH.savedVariables.uiCustomScale)
end

-- Caled when sliding the menu slider.
function SEH.SetScale(scale)
  SEH.savedVariables.uiCustomScale = scale

  -- Updating top controls scales all children.
  SEHStatus:SetScale(SEH.savedVariables.uiCustomScale)
  SEHMessage1:SetScale(SEH.savedVariables.uiCustomScale)
  SEHMessage2:SetScale(SEH.savedVariables.uiCustomScale)
  SEHMessage3:SetScale(SEH.savedVariables.uiCustomScale)
end