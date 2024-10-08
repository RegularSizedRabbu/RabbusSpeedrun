RegularSizedSpeedrun = RegularSizedSpeedrun or {}
local RegularSizedSpeedrun = RegularSizedSpeedrun
local sV
local cV
---------------------------
---- Variables Default ----
---------------------------
-- Account wide
RegularSizedSpeedrun.Default_Account = {
  --table
  scores                  = {},
  lastScores              = {},
  profiles                = {},

  --UI
  speedrun_panel_offsetX  = 500,
  speedrun_panel_offsetY  = 500,
  showPanelAlways         = true,
  unlockUI                = true,
  showUI                  = true,
  showAdvanced            = true,
  showAdds                = true,
  changeAlpha             = false,
  combatAlpha             = 100,
  uiSimple                = false,

  --trial variables
  segmentTimer            = {},
  currentRaidTimer        = {},
  lastRaidTimer           = {},
  lastBossName            = "",
  currentBossName         = "",
  raidID                  = 0,
  lastRaidID              = 0,
  Step                    = 1,
  arenaRound              = 1,
  isBossDead              = true,
  isComplete              = false,
  totalTime               = 10,
  totalScore              = 0,
  finalScore              = 0,
  timeStarted             = 0,
  trialState              = -1,

  -- other settings
  printDiffChange         = true,
  printStepUpdate         = false,

  hgTrialOnly             = false,
  changeNameplates        = false,
  changeHealthBars        = false,
  nameplatesHidden        = "",
  healthBarsHidden        = "",
  nameplatesHiddenHL      = "",
  healthBarsHiddenHL      = "",
  nameplates              = GetSetting(SETTING_TYPE_NAMEPLATES, NAMEPLATE_TYPE_GROUP_MEMBER_NAMEPLATES),
  healthBars              = GetSetting(SETTING_TYPE_NAMEPLATES, NAMEPLATE_TYPE_GROUP_MEMBER_HEALTHBARS),
  nameplatesHL            = GetSetting(SETTING_TYPE_NAMEPLATES, NAMEPLATE_TYPE_GROUP_MEMBER_NAMEPLATES_HIGHLIGHT),
  healthBarsHL            = GetSetting(SETTING_TYPE_NAMEPLATES, NAMEPLATE_TYPE_GROUP_MEMBER_HEALTHBARS_HIGHLIGHT),

  interactBlockAny        = false,
  interactBlockTrial      = false,
  interactBlockPvP        = false,

  food                    = {
    show        = false,
    size        = 30,
    time        = 120,
    timeCombat  = 120,
    x           = 0,
    y           = 0,
    expireStay  = false
  }
}
-- Character
RegularSizedSpeedrun.Default_Character = {
  activeProfile         = "",
  debugMode             = 0,
  isTracking            = true,
  groupHidden           = false,
  hgAutoShow            = true,
  hgNecro               = false,
  writHidePets          = 0,
  -- interactBlockAny      = false,
  -- interactBlockTrial    = false,
  -- interactBlockPvP      = false,
  arenaList             = {},
  customTimerSteps      = {},
  individualArenaTimers = true,
  charVersion           = 0
}
---------------------------
---- Default Tables -------
---------------------------
local defaultProfile = {
  raidList          = {},
  customTimerSteps  = {},
  addsOnCR          = true,
  hmOnSS            = 4
}
local defaultScoreFactors = {
  vitality      = 0,
  bestTime      = nil,
  bestScore     = 0,
  scoreReasons  = {}
}
local defaultRaidList = {
  [638]   = {
    name          = "AA",
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [636]   = {
    name          = "HRC",
    id            = 636,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [639]   = {
    name          = "SO",
    id            = 639,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [725]   = {
    name          = "MoL",
    id            = 725,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [975]   = {
    name          = "HoF",
    id            = 975,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1000]  = {
    name          = "AS",
    id            = 1000,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1051]  = {
    name          = "CR",
    id            = 1051,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1121]  = {
    name          = "SS",
    id            = 1121,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1196]  = {
    name          = "KA",
    id            = 1196,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1263]  = {
    name          = "RG",
    id            = 1263,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1344]  = {
    name          = "DSR",
    id            = 1344,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1427]  = {
    name          = "SE",
    id            = 1427,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1478]  = {
    name          = "LC",
    id            = 1478,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1082]  = {
    name          = "BRP",
    id            = 1082,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [635]   = {
    name          = "DSA",
    id            = 635,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [677]   = {
    name          = "MA",
    id            = 677,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1227]  = {
    name          = "VH",
    id            = 1227,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  }
}
local defaultCustomTimerSteps = {
  [638]   = { --AA
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = ""
  },
  [636]   = { --HRC
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [639]   = { --SO
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = ""
  },
  [725]   = { --MoL
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [975]   = { --HoF
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = "",
    [9]  = "",
    [10] = ""
  },
  [1000]  = { --AS
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1051]  = { --CR
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1121]  = { --SS
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1196]  = { --KA
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1263]  = { --RG
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1344]  = { --DSR
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1427]  = { --SE
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1478]  = { --LC
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = ""
  },
  [1082]  = { --BRP
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = "",
    [9]  = "",
    [10] = "",
    [11] = "",
    [12] = "",
    [13] = "",
    [14] = "",
    [15] = "",
    [16] = "",
    [17] = "",
    [18] = "",
    [19] = "",
    [20] = "",
    [21] = "",
    [22] = "",
    [23] = "",
    [24] = "",
    [25] = ""
  },
  [677]   = { --MA
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = "",
    [9]  = ""
  },
  [635]   = { --DSA
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = "",
    [8]  = "",
    [9]  = "",
    [10] = ""
  },
  [1227]  = { --Vateshran Hollows
    [1]  = "",
    [2]  = "",
    [3]  = "",
    [4]  = "",
    [5]  = "",
    [6]  = "",
    [7]  = ""
  }
}
local defaultScores = {
  [0] = {
    name  = "No Bonus",
    id    = RAID_POINT_REASON_MIN_VALUE,
    times = 0,
    total = 0,
  },
  [1] = {
    name  = "Small adds",
    id    = RAID_POINT_REASON_KILL_NORMAL_MONSTER,
    times = 0,
    total = 0,
  },
  [2] = {
    name  = "Large adds",
    id    = RAID_POINT_REASON_KILL_BANNERMEN,
    times = 0,
    total = 0,
  },
  [3] = {
    name  = "Elite adds",
    id    = RAID_POINT_REASON_KILL_CHAMPION,
    times = 0,
    total = 0,
  },
  [4] = {
    name  = "Miniboss",
    id    = RAID_POINT_REASON_KILL_MINIBOSS,
    times = 0,
    total = 0,
  },
  [5] = {
    name  = "Boss",
    id    = RAID_POINT_REASON_KILL_BOSS,
    times = 0,
    total = 0,
  },
  [6] = {
    name  = "Bonus Low (increased difficulty)",
    id    = RAID_POINT_REASON_BONUS_ACTIVITY_LOW,
    times = 0,
    total = 0,
  },
  [7] = {
    name  = "Bonus Medium (increased difficulty)",
    id    = RAID_POINT_REASON_BONUS_ACTIVITY_MEDIUM,
    times = 0,
    total = 0,
  },
  [8] = {
    name  = "Bonus High (HM)",
    id    = RAID_POINT_REASON_BONUS_ACTIVITY_HIGH,
    times = 0,
    total = 0,
  },
  [9] = {
    name  = "Revives & Resurrections",
    id    = RAID_POINT_REASON_LIFE_REMAINING,
    times = 0,
    total = 0,
  },
  [10] = {
    name  = "Bonus Point One",
    id    = RAID_POINT_REASON_BONUS_POINT_ONE,
    times = 0,
    total = 0,
  },
  [11] = {
    name  = "Bonus Point Two",
    id    = RAID_POINT_REASON_BONUS_POINT_TWO,
    times = 0,
    total = 0,
  },
  [12] = {
    name  = "Bonus Point Three",
    id    = RAID_POINT_REASON_BONUS_POINT_THREE,
    times = 0,
    total = 0,
  },
  [13] = {
    name  = "Remaining Sigils Bonus x1",
    id    = RAID_POINT_REASON_SOLO_ARENA_PICKUP_ONE,
    times = 0,
    total = 0,
  },
  [14] = {
    name  = "Remaining Sigils Bonus x2",
    id    = RAID_POINT_REASON_SOLO_ARENA_PICKUP_TWO,
    times = 0,
    total = 0,
  },
  [15] = {
    name  = "Remaining Sigils Bonus x3",
    id    = RAID_POINT_REASON_SOLO_ARENA_PICKUP_THREE,
    times = 0,
    total = 0,
  },
  [16] = {
    name  = "Remaining Sigils Bonus x4",
    id    = RAID_POINT_REASON_SOLO_ARENA_PICKUP_FOUR,
    times = 0,
    total = 0,
  },
  [17] = {
    name  = "Completion Bonus (Stage / Trial)",
    id    = RAID_POINT_REASON_MAX_VALUE,
    times = 0,
    total = 0,
  },
}
local defaultArenaList = {
  [677]   = {
    name          = "MA",
    id            = 677,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  },
  [1227]  = {
    name          = "VH",
    id            = 1227,
    timerSteps    = {},
    scoreFactors  = {
      vitality      = 0,
      bestTime      = nil,
      bestScore     = 0,
      scoreReasons  = {}
    }
  }
}
local defaultArenaCustomTimerSteps = {
  [677]  = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = "",
    [7] = "",
    [8] = "",
    [9] = ""
  },
  [1227] = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = "",
    [7] = ""
  }
}
-------------------
--- Placeholders --
-------------------
-- Used for updating character saved variables
local soloList = {
  MA = {},
  VH = {},
}
local soloCustomList = {
  MA = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = "",
    [7] = "",
    [8] = "",
    [9] = "",
  },
  VH = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = "",
    [5] = "",
    [6] = "",
    [7] = "",
  },
}
-------------------
---- Functions ----
-------------------
function RegularSizedSpeedrun:GenerateDefaults()
  RegularSizedSpeedrun.Default_Account.scores               = RegularSizedSpeedrun.GetDefaultScores()
  RegularSizedSpeedrun.Default_Character.arenaList          = RegularSizedSpeedrun.GetDefaultArenaList()
  RegularSizedSpeedrun.Default_Character.customTimerSteps   = RegularSizedSpeedrun.GetDefaultArenaCustomSteps()
  defaultProfile.raidList                       = RegularSizedSpeedrun.GetDefaultRaidList()
  defaultProfile.customTimerSteps               = RegularSizedSpeedrun.GetDefaultCustomTimerSteps()
end

function RegularSizedSpeedrun.LoadVariables()
  sV = RegularSizedSpeedrun.savedVariables
  cV = RegularSizedSpeedrun.savedSettings

  -- Create "Default" profile and set it as active if doesn't already exist.
  if sV.profiles["Default"] == nil or sV.profiles["Default"] == "" then
    sV.profiles["Default"] = {}
    sV.profileVersion = 0
  end

  if (cV.activeProfile == nil or cV.activeProfile == "" or not sV.profiles[cV.activeProfile]) then cV.activeProfile = "Default" end

  RegularSizedSpeedrun.activeProfile = cV.activeProfile

  -- Check if it's the first time player uses this version.
  RegularSizedSpeedrun.UpdateSettings(sV.profileVersion, cV.charVersion)

  -- Cleanup if needed.
  RegularSizedSpeedrun.ValidateProfile(RegularSizedSpeedrun.activeProfile)

  -- Load Trial Variables. In case of addon being loaded / reloaded inside an active trial.
  -- Tables
  RegularSizedSpeedrun.LoadCustomTimers(RegularSizedSpeedrun.activeProfile)
  RegularSizedSpeedrun.LoadRaidlist(RegularSizedSpeedrun.activeProfile)

  RegularSizedSpeedrun.scores           = sV.scores
  RegularSizedSpeedrun.totalScore       = sV.totalScore
  -- Trial Status
  RegularSizedSpeedrun.raidID           = sV.raidID
  RegularSizedSpeedrun.Step             = sV.Step
  RegularSizedSpeedrun.arenaRound       = sV.arenaRound
  RegularSizedSpeedrun.segmentTimer     = sV.segmentTimer
  RegularSizedSpeedrun.currentRaidTimer = sV.currentRaidTimer
  RegularSizedSpeedrun.currentBossName  = sV.currentBossName
  RegularSizedSpeedrun.lastBossName     = sV.lastBossName
  RegularSizedSpeedrun.isBossDead       = sV.isBossDead
  RegularSizedSpeedrun.isComplete       = sV.isComplete
  RegularSizedSpeedrun.timeStarted      = sV.timeStarted
  RegularSizedSpeedrun.trialState       = sV.trialState
  RegularSizedSpeedrun.addsOnCR         = sV.profiles[RegularSizedSpeedrun.activeProfile].addsOnCR
  RegularSizedSpeedrun.hmOnSS           = sV.profiles[RegularSizedSpeedrun.activeProfile].hmOnSS
end
--------------------
---- Player Data ---
--------------------
function RegularSizedSpeedrun.LoadRaidlist(profile)
  RegularSizedSpeedrun.raidList[635] 	= sV.profiles[profile].raidList[635]
  RegularSizedSpeedrun.raidList[636] 	= sV.profiles[profile].raidList[636]
  RegularSizedSpeedrun.raidList[638] 	= sV.profiles[profile].raidList[638]
  RegularSizedSpeedrun.raidList[639] 	= sV.profiles[profile].raidList[639]
  RegularSizedSpeedrun.raidList[725] 	= sV.profiles[profile].raidList[725]
  RegularSizedSpeedrun.raidList[975] 	= sV.profiles[profile].raidList[975]
  RegularSizedSpeedrun.raidList[1000]	= sV.profiles[profile].raidList[1000]
  RegularSizedSpeedrun.raidList[1051]	= sV.profiles[profile].raidList[1051]
  RegularSizedSpeedrun.raidList[1082]	= sV.profiles[profile].raidList[1082]
  RegularSizedSpeedrun.raidList[1121]	= sV.profiles[profile].raidList[1121]
  RegularSizedSpeedrun.raidList[1196]	= sV.profiles[profile].raidList[1196]
  RegularSizedSpeedrun.raidList[1263]	= sV.profiles[profile].raidList[1263]
  RegularSizedSpeedrun.raidList[1344] = sV.profiles[profile].raidList[1344]
  RegularSizedSpeedrun.raidList[1427]	= sV.profiles[profile].raidList[1427]
  RegularSizedSpeedrun.raidList[1478]	= sV.profiles[profile].raidList[1478]
  if cV.individualArenaTimers then
    RegularSizedSpeedrun.raidList[677] 	= cV.arenaList[677]
    RegularSizedSpeedrun.raidList[1227]	= cV.arenaList[1227]
  else
    RegularSizedSpeedrun.raidList[677] 	= sV.profiles[profile].raidList[677]
    RegularSizedSpeedrun.raidList[1227]	= sV.profiles[profile].raidList[1227]
  end
end

function RegularSizedSpeedrun.LoadCustomTimers(profile)
  RegularSizedSpeedrun.customTimerSteps[635] 	= sV.profiles[profile].customTimerSteps[635]
  RegularSizedSpeedrun.customTimerSteps[636] 	= sV.profiles[profile].customTimerSteps[636]
  RegularSizedSpeedrun.customTimerSteps[638] 	= sV.profiles[profile].customTimerSteps[638]
  RegularSizedSpeedrun.customTimerSteps[639] 	= sV.profiles[profile].customTimerSteps[639]
  RegularSizedSpeedrun.customTimerSteps[725] 	= sV.profiles[profile].customTimerSteps[725]
  RegularSizedSpeedrun.customTimerSteps[975] 	= sV.profiles[profile].customTimerSteps[975]
  RegularSizedSpeedrun.customTimerSteps[1000]	= sV.profiles[profile].customTimerSteps[1000]
  RegularSizedSpeedrun.customTimerSteps[1051]	= sV.profiles[profile].customTimerSteps[1051]
  RegularSizedSpeedrun.customTimerSteps[1082]	= sV.profiles[profile].customTimerSteps[1082]
  RegularSizedSpeedrun.customTimerSteps[1121]	= sV.profiles[profile].customTimerSteps[1121]
  RegularSizedSpeedrun.customTimerSteps[1196]	= sV.profiles[profile].customTimerSteps[1196]
  RegularSizedSpeedrun.customTimerSteps[1263]	= sV.profiles[profile].customTimerSteps[1263]
  RegularSizedSpeedrun.customTimerSteps[1344] = sV.profiles[profile].customTimerSteps[1344]
  RegularSizedSpeedrun.customTimerSteps[1427]	= sV.profiles[profile].customTimerSteps[1427]
  RegularSizedSpeedrun.customTimerSteps[1478]	= sV.profiles[profile].customTimerSteps[1478]
  if cV.individualArenaTimers then
    RegularSizedSpeedrun.customTimerSteps[677] 	= cV.customTimerSteps[677]
    RegularSizedSpeedrun.customTimerSteps[1227]	= cV.customTimerSteps[1227]
  else
    RegularSizedSpeedrun.customTimerSteps[677] 	= sV.profiles[profile].customTimerSteps[677]
    RegularSizedSpeedrun.customTimerSteps[1227]	= sV.profiles[profile].customTimerSteps[1227]
  end
end

function RegularSizedSpeedrun.SaveTimerStep(raid, step, timer)
  RegularSizedSpeedrun.raidList[raid].timerSteps[step] = timer
  if (raid == 677 or raid == 1227) and cV.individualArenaTimers
  then cV.arenaList[raid].timerSteps[step] = timer
  else sV.profiles[RegularSizedSpeedrun.activeProfile].raidList[raid].timerSteps[step] = timer end
end

function RegularSizedSpeedrun.SaveCustomStep(raid, step, timer)
  if (tonumber(timer) or timer == "") and RegularSizedSpeedrun.customTimerSteps[raid][step] then
    RegularSizedSpeedrun.customTimerSteps[raid][step] = timer

    if raid == 677 or raid == 1227 then
      cV.customTimerSteps[raid][step] = timer
      if (not cV.individualArenaTimers) then
        sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[raid][step] = timer
      end

    else
      sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[raid][step] = timer
    end

  else
    RegularSizedSpeedrun:dbg(0, "Error in saving custom timer for: <<1>> <<2>> step <<3>>", RegularSizedSpeedrun.GetActiveProfileDisplay(), GetZoneNameById(raid), step)
  end
end

function RegularSizedSpeedrun.GetSavedTimerStep(raid, step)
  local timer = nil
  if (cV.individualArenaTimers and (raid == 677 or raid == 1227)) then
    if cV.arenaList[raid].timerSteps[step] ~= nil
    then timer = cV.arenaList[raid].timerSteps[step] end
  else
    if sV.profiles[RegularSizedSpeedrun.activeProfile].raidList[raid].timerSteps[step] ~= nil
    then timer = sV.profiles[RegularSizedSpeedrun.activeProfile].raidList[raid].timerSteps[step] end
  end
  if timer ~= nil then return timer end
end

function RegularSizedSpeedrun.GetCustomTimerStep(raid, step)
  local timer = ""
  if cV.individualArenaTimers and (raid == 677 or raid == 1227)
  then timer = cV.customTimerSteps[raid][step]
  else timer = sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[raid][step] end
  return timer
end

function RegularSizedSpeedrun.GetCustomTimerStepsTrial(raid, profile)
  local steps = {}
  local list  = RegularSizedSpeedrun.Data.customTimerSteps[raid]

  for i = 1, #list do steps[i] = RegularSizedSpeedrun.GetCustomTimerStep(raid, i) end

  -- if ((raid == 677 or raid == 1227) and cV.individualArenaTimers) then
  --   for i, x in pairs(cV.customTimerSteps[raid]) do
  --     local step = cV.customTimerSteps[raid][i]
  --     if step then steps[i] = step end
  --   end
  -- else
  --   for i, x in pairs(sV.profiles[profile].customTimerSteps[raid]) do
  --     local step = sV.profiles[profile].customTimerSteps[raid][i]
  --     if step then steps[i] = step end
  --   end
  -- end

  return steps
end
--------------------
--- Default Data ---
--------------------
function RegularSizedSpeedrun.GetDefaultProfile()
  local profile = {
    raidList          = {},
    customTimerSteps  = {},
    addsOnCR          = true,
    hmOnSS            = 4,
  }
  profile.raidList          = RegularSizedSpeedrun.GetDefaultRaidList()
  profile.customTimerSteps  = RegularSizedSpeedrun.GetDefaultCustomTimerSteps()
  return profile
end

function RegularSizedSpeedrun.GetDefaultArenaList()
  local t = {}
  for k, v in pairs(defaultArenaList) do
    if defaultArenaList[k] then t[k] = defaultArenaList[k] end
  end
  return t
end

function RegularSizedSpeedrun.GetDefaultArenaCustomSteps()
  local c = {}
  for k, v in pairs(defaultArenaCustomTimerSteps) do
    if defaultArenaCustomTimerSteps[k] then c[k] = defaultArenaCustomTimerSteps[k] end
  end
  return c
end

function RegularSizedSpeedrun.GetDefaultScores()
  local scores = {}
  for k, v in pairs(defaultScores) do
    if defaultScores[k] then scores[k] = defaultScores[k] end
  end
  return scores
end

function RegularSizedSpeedrun.GetDefaultScoreFactors()
  local factors = {}
  for k, v in pairs(defaultScoreFactors) do
    if defaultScoreFactors[k] then factors[k] = defaultScoreFactors[k] end
  end
  return factors
end

function RegularSizedSpeedrun.GetDefaultRaidList()
  local drl = {}
  for k, v in pairs(defaultRaidList) do
    if defaultRaidList[k] then drl[k] = defaultRaidList[k] end
  end
  return drl
end

function RegularSizedSpeedrun.GetDefaultCustomTimerSteps()
  local steps = {}
  for k, v in pairs(defaultCustomTimerSteps) do
    if defaultCustomTimerSteps[k] then steps[k] = defaultCustomTimerSteps[k] end
  end
  return steps
end

function RegularSizedSpeedrun.GetDefaultTrial(id)
  if not defaultRaidList[id] then
    RegularSizedSpeedrun:dbg(0, "Failed to add individual timers for:\nProfile <<1>>\nArena [<<2>>]\nCharacter [<<3>>]", RegularSizedSpeedrun.GetActiveProfileDisplay(), GetZoneNameById(id), GetUnitName("player"))
    return
  end

  local a = {}
  for k, v in pairs(defaultRaidList[id]) do
    if defaultRaidList[id][k] then a[k] = defaultRaidList[id][k] end
  end
  return a
end

function RegularSizedSpeedrun.GetDefaultCustomTimerStepsTrial(id)
  local cts = {}
  for k, v in pairs(defaultCustomTimerSteps[id]) do
    if defaultCustomTimerSteps[id][k] then cts[k] = defaultCustomTimerSteps[id][k] end
  end
  return cts
end

function RegularSizedSpeedrun.TrialCheck(id)
  if RegularSizedSpeedrun.raidList[id].timerSteps == nil or RegularSizedSpeedrun.raidList[id].timerSteps == {} then
    if id == 677 or id == 1227 then
      if cV.individualArenaTimers then
        RegularSizedSpeedrun.raidList[id] = cV.arenaList[id]
      else
        RegularSizedSpeedrun.raidList[id]	= sV.profiles[RegularSizedSpeedrun.activeProfile].raidList[id]
      end
    else
      RegularSizedSpeedrun.raidList[id]	= sV.profiles[RegularSizedSpeedrun.activeProfile].raidList[id]
    end
  end

  if RegularSizedSpeedrun.customTimerSteps[id] == nil or RegularSizedSpeedrun.customTimerSteps[id] == {} then
    if id == 677 or id == 1227 then
      if cV.individualArenaTimers then
        RegularSizedSpeedrun.customTimerSteps[id] = cV.soloSteps[id]
      else
        RegularSizedSpeedrun.customTimerSteps[id] = sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id]
      end
    else
      if sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id] then
        RegularSizedSpeedrun.customTimerSteps[id] = sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id]
      elseif sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id] == nil then
        sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id] = RegularSizedSpeedrun.GetDefaultCustomTimerStepsTrial(id)
        RegularSizedSpeedrun.customTimerSteps[id] = sV.profiles[RegularSizedSpeedrun.activeProfile].customTimerSteps[id]
      end
    end
  end
end

function RegularSizedSpeedrun.ImportVariables()
  local profile = RegularSizedSpeedrun.profileToImportTo
  if (profile == "" or profile == nil) then return end

  if profile == "Default" then
    if (sV.profileVersion < 1 and sV.raidList == nil and sV.customTimerSteps == nil) then
      sV.profiles[RegularSizedSpeedrun.profileToImportTo] = RegularSizedSpeedrun.GetDefaultProfile() return
    end
  else
    if (sV.raidList == nil and sV.customTimerSteps == nil) then
      RegularSizedSpeedrun:dbg(0, "No data from old list found! Import aborted.") return
    end
  end

  local savedData             = RegularSizedSpeedrun.GetDefaultProfile()
  local raidListData          = sV.raidList ~= nil and true or false
  local customTimerStepsData  = sV.customTimerSteps ~= nil and true or false
  local addsOnCRData          = sV.addsOnCR ~= nil and true or false
  local hmOnSSData            = sV.hmOnSS ~= nil and true or false

  local MA =  677 .. GetUnitName("player")
  local VH = 1227 .. GetUnitName("player")

  if raidListData == true then
    for k, v in pairs(sV.raidList) do
      local trial = sV.raidList[k]

      if trial then
        if trial == MA then
          soloList[MA] = trial
          trial = nil
        elseif trial == VH then
          soloList.VH = trial
          trial = nil
        else
          trial.scoreFactors = defaultScoreFactors
          savedData.raidList[k] = trial
        end
      end
    end
  else
    savedData.raidList = RegularSizedSpeedrun.GetDefaultRaidList()
  end

  if customTimerStepsData == true then
    for k, v in pairs(sV.customTimerSteps) do
      local raid = sV.customTimerSteps[k]

      if raid then
        if raid == MA then
          soloCustomList = raid
          raid = nil
        elseif raid == VH then
          soloCustomList = raid
          raid = nil
        else
          savedData.customTimerSteps[k] = raid
        end
      end
    end
  else
    savedData.customTimerSteps = RegularSizedSpeedrun.GetDefaultCustomTimerSteps()
  end

  if addsOnCRData == true then savedData.addsOnCR = sV.addsOnCR end
  if hmOnSSData   == true then savedData.hmOnSS   = sV.hmOnSS end

  sV.profiles[RegularSizedSpeedrun.profileToImportTo].raidList          = savedData.raidList
  sV.profiles[RegularSizedSpeedrun.profileToImportTo].customTimerSteps  = savedData.customTimerSteps
  sV.profiles[RegularSizedSpeedrun.profileToImportTo].addsOnCR          = savedData.addsOnCR
  sV.profiles[RegularSizedSpeedrun.profileToImportTo].hmOnSS            = savedData.hmOnSS

  sV.customTimerSteps         = nil
  sV.addsOnCR                 = nil
  sV.hmOnSS                   = nil
  sV.debugMode                = nil
  sV.isTracking               = nil
  RegularSizedSpeedrun.profileToImportTo  = ""
  sV.profileVersion           = 1
end

local function CheckCharacterVars(key)
  local vars = {
    ["version"] 							= key["version"],
    ["charVersion"] 					= key["charVersion"],
    ["debugMode"] 						= key["debugMode"],
    ["groupHidden"] 					= key["groupHidden"],
    -- ["hgTrialOnly"]           = key["hgTrialOnly"],
    -- ["interactBlockAny"]			= key["interactBlockAny"],
    -- ["interactBlockTrial"]		= key["interactBlockTrial"],
    -- ["interactBlockPvP"]			= key["interactBlockPvP"],
    ["activeProfile"] 				= key["activeProfile"],
    ["isTracking"] 						= key["isTracking"],
    ["arenaList"] 						= key["arenaList"],
    ["customTimerSteps"] 			= key["customTimerSteps"],
    ["individualArenaTimers"] = key["individualArenaTimers"],
    ["$LastCharacterName"] 		= key["$LastCharacterName"],
  }
  for k, v in pairs(key) do
    if key[k] then
      if not vars[k] then key[k] = nil end
    end
  end
  for k, v in pairs(vars) do
    if vars[k] then
      if not key[k] then key[k] = vars[k] end
    end
  end
  vars = {}
end

function RegularSizedSpeedrun.RefreshCharacterVariables()
  CheckCharacterVars(cV)
end

local function CheckProfileData(profile, raidID)
  local d = RegularSizedSpeedrun.Data.raidList[raidID]
  local trial = sV.profiles[profile].raidList[raidID]
  if not trial.name then trial.name = d.name end
  --if not trial.id then trial.id = d.id end
  if not trial.timerSteps then trial.timerSteps = d.timerSteps end
  if not trial.scoreFactors then trial.scoreFactors = d.scoreFactors end
end

function RegularSizedSpeedrun.ValidateProfile(profile)
  for i, x in pairs(RegularSizedSpeedrun.Data.raidList) do
    local trial = RegularSizedSpeedrun.Data.raidList[i]
    if trial then
      if sV.profiles[profile].raidList[i] == nil then sV.profiles[profile].raidList[i] = RegularSizedSpeedrun.GetDefaultTrial(i)
      elseif sV.profiles[profile].raidList[i] then CheckProfileData(profile, i) end
    end
  end
  for i, x in pairs(RegularSizedSpeedrun.Data.customTimerSteps) do
    if sV.profiles[profile].customTimerSteps[i] == nil or sV.profiles[profile].customTimerSteps[i] == {} then
      sV.profiles[profile].customTimerSteps[i] = RegularSizedSpeedrun.GetDefaultCustomTimerStepsTrial(i)
    end
  end
end

function RegularSizedSpeedrun.UpdateSettings(sv, cv)
  if sv <= 0 then
    RegularSizedSpeedrun.profileToImportTo = "Default"
    -- add previous data if any exists
    RegularSizedSpeedrun.ImportVariables()
    sV.profileVersion = 1
  end

  if sv <= 1 then
    if sV.isUIDrawn ~= nil then sV.isUIDrawn = nil end
    if sV.isScoreSet ~= nil then sV.isScoreSet = nil end
    if sV.isMoveable ~= nil then
      sV.unlockUI = sV.isMoveable
      sV.isMoveable = nil
    end
    if sV.uiIsHidden ~= nil then
      sV.showUI = not sV.uiIsHidden
      sV.uiIsHidden = nil
    end
    if sV.addsAreHidden ~= nil then
      sV.showAdds = not sV.addsAreHidden
      sV.addsAreHidden = nil
    end
    sV.profileVersion = 2
  end

  -- Update to version 3.
  if sv <= 2 or cv <= 0 or cv == nil then
    local pStep
    local sStep
    for k, v in pairs(sV.profiles) do
      local profile = sV.profiles[k]
      local MA = 677 .. GetUnitName("player")
      local VH = 1227 .. GetUnitName("player")
      if profile then
        if profile.raidList[MA] and profile.raidList[MA].timerSteps ~= {} then
          if soloList.MA == {} then soloList.MA = profile.raidList[MA]
          else
            for i = 1, 9 do
              pStep = profile.raidList[MA].timerSteps[i]
              sStep = soloList.MA[i]
              if pStep and (pStep ~= 0 and pStep ~= "") then
                if sStep == nil or (sStep > pStep) then soloList.MA[i] = pStep end
              end
            end
          end
          profile.raidList[MA] = nil
        else
          if profile.raidList[MA] then profile.raidList[MA] = nil end
        end

        if profile.raidList[VH] and profile.raidList[VH].timerSteps ~= {} then
          if soloList.VH == {} then soloList.VH = profile.raidList[VH]
          else
            for i = 1, 7 do
              pStep = profile.raidList[VH].timerSteps[i]
              sStep = soloList.VH[i]
              if pStep and (pStep ~= 0 and pStep ~= "") then
                if sStep == nil or (sStep > pStep) then soloList.VH[i] = pStep end
              end
            end
          end
          profile.raidList[VH] = nil
        else
          if profile.raidList[VH] then profile.raidList[VH] = nil end
        end
      end
      local cStep
      local csStep
      if profile.customTimerSteps[MA] then
        for i = 1, 9 do
          cStep = profile.customTimerSteps[MA][i]
          csStep = soloCustomList.MA[i]
          if cStep and cStep ~= "" then
            if csStep == "" or csStep > cStep then soloCustomList.MA[i] = cStep end
          end
        end
        profile.customTimerSteps[MA] = nil
      else
        if profile.customTimerSteps[MA] then profile.customTimerSteps[MA] = nil end
      end

      if profile.customTimerSteps[VH] then
        for i = 1, 7 do
          cStep = profile.customTimerSteps[VH][i]
          csStep = soloCustomList.VH[i]
          if cStep and cStep ~= "" then
            if csStep == "" or csStep > cStep then soloCustomList.VH[i] = cStep
            end
          end
        end
        profile.customTimerSteps[VH] = nil
      else
        if profile.customTimerSteps[VH] then profile.customTimerSteps[VH] = nil end
      end
    end
    cV.arenaList[677].timerSteps 	= soloList.MA
    cV.arenaList[1227].timerSteps = soloList.VH
    cV.customTimerSteps[677] 			= soloCustomList.MA
    cV.customTimerSteps[1227] 		= soloCustomList.VH
    cV.charVersion 								= 1
    sV.profileVersion 						= 3
    RegularSizedSpeedrun.RefreshCharacterVariables()
  end

  if sV.speedrun_container_offsetX then
    if ((sV.speedrun_panel_offsetX == RegularSizedSpeedrun.Default_Account.speedrun_panel_offsetX) and (sV.speedrun_panel_offsetY == RegularSizedSpeedrun.Default_Account.speedrun_panel_offsetY)) then
      if ((sV.speedrun_container_offsetX ~= RegularSizedSpeedrun.Default_Account.speedrun_container_offsetX) and (sV.speedrun_container_offsetY ~= RegularSizedSpeedrun.Default_Account.speedrun_container_offsetY)) then
        sV.speedrun_panel_offsetX = sV.speedrun_container_offsetX
        sV.speedrun_panel_offsetY = sV.speedrun_container_offsetY
      end
    end
  end
end

function RegularSizedSpeedrun.StressTestedCheck()
  local st = false

  for i = 1, 5 do
    local gID = GetGuildId(i)
    if gID == 579086 then
      st = true
    end
  end

  if st == true then
    if RegularSizedSpeedrun.Default_Account.valenFinallyGotGH == nil then
      RegularSizedSpeedrun.Default_Account.valenFinallyGotGH = false
    end
    RegularSizedSpeedrun.StressTestedConfirmed()
  end
  return st
end
-- /script for i=1,5 do d("["..i.."] = "..GetGuildId(i)) end
