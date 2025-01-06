-- Elevator: Helipad - Up/Down (Pillbox)
exports['qtarget']:AddBoxZone('pb_helipad_up', vector3(325.63, -603.41, 43.28), 0.05, 0.15, {
        name="pb_helipad_elevator",
        heading=340,
        debugPoly=false,
        minZ=43.48,
        maxZ=43.78
    }, {
    options = {
        {
            event = "prrp_faction:elevator",
            icon = "fas fa-caret-square-up",
            label = "Go Up",
            type = 'Pillbox',
            location = 'helipad_up'
        },
    },
    distance = 2
})
exports['qtarget']:AddBoxZone('pb_helipad_down', vector3(338.18, -583.72, 74.16), 0.2, 3.15, {
        name="pb_helipad_down",
        heading=69,
        debugPoly=false,
        minZ=73.16,
        maxZ=75.51
    }, {
    options = {
        {
            event = "prrp_faction:elevator",
            icon = "fas fa-door-open",
            label = "Enter the Hospital",
            type = 'Pillbox',
            location = 'helipad_down'
        },
    },
    distance = 5
})

-- Elevator: Garage - Up/Down (Pillbox)
exports['qtarget']:AddBoxZone('pb_garage_up', vector3(341.07, -582.51, 28.8), 0.15, 0.05, {
        name="pb_garage_up",
        heading=340,
        debugPoly=false,
        minZ=29.0,
        maxZ=29.25
    }, {
    options = {
        {
            event = "prrp_faction:elevator",
            icon = "fas fa-caret-square-up",
            label = "Go Up",
            type = 'Pillbox',
            location = 'garage_up'
        },

    },
    distance = 2
})
exports['qtarget']:AddBoxZone('pb_garage_down', vector3(331.94, -597.18, 43.28), 0.2, 0.05, {
        name="pb_elevator_down",
        heading=340,
        debugPoly=false,
        minZ=43.48,
        maxZ=43.78
    }, {
    options = {
        {
            event = "prrp_faction:elevator",
            icon = "fas fa-caret-square-down",
            label = "Go Down",
            type = 'Pillbox',
            location = 'garage_down'
        },
    },
    distance = 2
})

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
AddEventHandler('prrp_faction:elevator', function(data)
    if data.type == nil then return end
    if data.location == nil then return end

    if Config.Elevators[data.type] ~= nil then
        local table = Config.Elevators[data.type]
        UseElevator(table, data.location)
    end
end)

-------------------------------------------------------------------------------
-- Functiions
-------------------------------------------------------------------------------
UseElevator = function(table, type)
    if string.find(type, "_up") then
        DoScreenFadeOut(100)
        Citizen.Wait(750)
        ESX.Game.Teleport(PlayerPedId(), table[type].xyz)
        DoScreenFadeIn(100)
    else
        DoScreenFadeOut(100)
        Citizen.Wait(750)
        ESX.Game.Teleport(PlayerPedId(), table[type].xyz)
        DoScreenFadeIn(100)
    end
end
