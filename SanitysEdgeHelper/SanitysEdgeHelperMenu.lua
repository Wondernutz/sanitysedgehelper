SEH = SEH or {}
local SEH = SEH
SEH.Menu = {}

function SEH.Menu.AddonMenu()
  local menuOptions = {
    type         = "panel",
    name         = "Sanity's Edge Helper",
    displayName  = "|cFF4500Sanity's Edge Helper|r",
    author       = SEH.author,
    version      = SEH.version,
    registerForRefresh  = true,
    registerForDefaults = true,
  }
  local requiresOSI = "Requires Ody Support Icons."
  local dataTable = {
    {
      type = "description",
      text = "Trial timers, alerts and indicators for Sanity's Edge.",
    },
    {
      type = "divider",
    },
    {
      type = "description",
      text = "For mechanics arrows on players for Target, Positions... install |cff0000OdySupportIcons|r (optional dependency)",
    },
    {
      type = "divider",
    },
    {
      type    = "checkbox",
      name    = "Unlock UI",
      default = false,
      getFunc = function() return not SEH.status.locked end,
      setFunc = function( newValue ) SEH.UnlockUI(newValue) end,
    },
    {
      type = "description",
      text = "You can also do /seh lock and /seh unlock to reposition the UI.",
    },
    {
      type    = "button",
      name    = "Reset to default position",
      func = function() SEH.DefaultPosition()  end,
      warning = "Requires /reloadui for the position to reset",
    },
    {
      type    = "checkbox",
      name    = "Hide welcome text on chat",
      default = false,
      getFunc = function() return SEH.savedVariables.hideWelcome end,
      setFunc = function( newValue ) SEH.savedVariables.hideWelcome = newValue end,
    },
    {
      type = "divider",
    },
    {
      type = "header",
      name = "Yaseyla",
      reference = "YaseylaHeader"
    },
    {
      type    = "checkbox",
      name    = "Panel: Shrapnel timer",
      default = true,
      getFunc = function() return SEH.savedVariables.showShrapnel end,
      setFunc = function(newValue) SEH.savedVariables.showShrapnel = newValue end,
    },
    {
      type    = "checkbox",
      name    = "Panel: Firebombs timer",
      default = true,
      getFunc = function() return SEH.savedVariables.showFirebombs end,
      setFunc = function(newValue) SEH.savedVariables.showFirebombs = newValue end,
    },
    {
      type    = "checkbox",
      name    = "Panel: Frostbombs timer",
      default = false,
      getFunc = function() return SEH.savedVariables.showFrostbombs end,
      setFunc = function(newValue) SEH.savedVariables.showFrostbombs = newValue end,
    },
    {
      type    = "checkbox",
      name    = "Panel: Chain Pull timer",
      default = false,
      getFunc = function() return SEH.savedVariables.showChains end,
      setFunc = function(newValue) SEH.savedVariables.showChains = newValue end,
    },
    {
      type = "divider",
    },
    {
      type = "header",
      name = "Chimera",
      reference = "ChimeraHeader"
    },
    {
      type    = "checkbox",
      name    = "Icon: Show Wamasu, Lion and Gryphon Portals",
      default = true,
      getFunc = function() return SEH.savedVariables.showChimeraPortalIcons end,
      setFunc = function(newValue) SEH.savedVariables.showChimeraPortalIcons = newValue end,
      warning = requiresOSI
    },
    {
      type    = "checkbox",
      name    = "(Non-HM) Icon: Show Crystal Numbers",
      default = true,
      getFunc = function() return SEH.savedVariables.showNonHM_CrystalNumberIcons end,
      setFunc = function(newValue) SEH.savedVariables.showNonHM_CrystalNumberIcons = newValue end,
      warning = requiresOSI
    },
    {
      type    = "checkbox",
      name    = "(HM) Icon: Show Crystal Numbers",
      default = true,
      getFunc = function() return SEH.savedVariables.showHM_CrystalNumberIcons end,
      setFunc = function(newValue) SEH.savedVariables.showHM_CrystalNumberIcons = newValue end,
      warning = requiresOSI
    },
    {
      type = "divider",
    },
    {
      type = "header",
      name = "Ansuul",
      reference = "AnsuulHeader"
    },
    {
      type    = "checkbox",
      name    = "Icon: Show Poison, Fire, Lightning Maze Corners",
      default = true,
      getFunc = function() return SEH.savedVariables.showAnsuulCornerIcons end,
      setFunc = function(newValue) SEH.savedVariables.showAnsuulCornerIcons = newValue end,
      warning = requiresOSI
    },
    {
      type    = "checkbox",
      name    = "Panel: Show Split Bosses HP (NOT FUNCTIONAL)",
      default = false,
      getFunc = function() return SEH.savedVariables.showSplitBossHP end,
      setFunc = function(newValue) SEH.savedVariables.showSplitBossHP = newValue end,
    },
    {
      type = "divider",
    },
    {
      type = "header",
      name = "Misc",
      reference = "SanitysEdgeMiscMenu"
    },
    {
      type = "description",
      text = "NOT recommended to change. Unlock UI first to be able to change scale.",
    },
    {
      type    = "slider",
      name    = "Scale",
      min = 0.2,
      max = 2.5,
      step = 0.1,
      decimals = 1,
      tooltip = "0.5 is tiny, 2 is huge",
      default = SEH.savedVariables.uiCustomScale,
      disabled = function() return SEH.status.locked end,
      getFunc = function() return SEH.savedVariables.uiCustomScale end,
      setFunc = function(newValue) SEH.SetScale(newValue) end,
      warning = "Only for extreme resolutions. Addon optimized for scale=1."
    },
  }

  LAM = LibAddonMenu2
  LAM:RegisterAddonPanel(SEH.name .. "Options", menuOptions)
  LAM:RegisterOptionControls(SEH.name .. "Options", dataTable)
end
