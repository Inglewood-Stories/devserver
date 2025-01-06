config = {}
-- Coordinates where you can pick up each ingredient (Not every ingredient is already here, I suggest you to add the remaining ones, like sprite, in a market instead of making it harvestable)
config.ingredientsCoords = {
}

-- Coordinates of labs
config.Labs = {
    [1] = vector3(1388.4, 3605.51, 38.94),
    [2] = vector3(2436.24, 4965.56, 42.36),
}
-- Can players sell drugs by plane?
config.enableAirplaneSell = false

-- Meters where the player can sell drugs
config.heightToSell = 600

-- Time required player has to remain above config.heightToSell and above the ocean in order to sell with a plane (ms)
config.timeToSellInPlane = 300000

-- When a player starts selling drugs in plane, the police will be alerted
config.alarmPoliceInPlane = false

-- Can Players sell drugs by boat?
config.enableBoatSell = false

-- Time required player has to remain in ocean in order to sell with a boat (ms)
config.timeToSellInBoat = 120000

-- When a player starts selling drugs in boat, the police will be alerted
config.alarmPoliceInBoat = false

--[[
    true: allows players to sell drugs by going anywhere in the ocean using the specific vehicle
    false: allows players to sell drugs by going in the radius of config.sellArea using the specific vehicle
]]
config.sellUseWholeOcean = {
    plane = false,
    boat = false,
}

-- works with config.sellUseWholeOcean
config.sellArea = {
    plane = {x = 1.0, y = 2.0, z = 3.0, radius = 300.0},
    boat = {x = 3449.7, y = 105.4, z = 32.43, radius = 200.0}
}

-- If config.sellUseWholeOcean = false for specific vehicle, when in radius will the area be shown?
config.showRadiusWhileSelling = false

-- Should ingredients blips be showed on the map?
config.enableIngredientsBlips = false

-- Should labs blips be showed on the map?
config.enableLabsBlips = false

-- Seconds the blip will remain in the map after a npc calls police
config.blipTimeAfterNPCCallPolice = 120

-- Allow players to sell drugs to NPCs?
config.enableNPCSell = false

config.enableFireOnError = true