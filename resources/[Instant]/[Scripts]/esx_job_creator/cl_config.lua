config = config or {}

-- Uses billing UI instead of normal prompt to bill
config.useBillingUI = true

-- Max distance where marker can be seen
config.markerDistance = 10.0

-- Use 3D text instead of markers
config.use3Dtext = false

config.textSize = 1

--[[
    Available fonts values:
    0 - ChaletLondon
    1 - HouseScript
    2 - Monospace
    4 - CharletComprimeColonge
    7 - Pricedown
]] 
config.textFont = 7

-- Seconds to lockpick a car
config.carLockpickTime = 10

-- Should the vehicle have alarm while lockpicking?
config.enableAlarmWhenLockpicking = false

-- Use or not jsfour-idcard script (if you have it) to view target ID card in check identity action
config.useJSFourIdCard = false

-- Can the player use the F6 actions menu when it's off duty?
config.canUseActionsMenuWhileOffDuty = false