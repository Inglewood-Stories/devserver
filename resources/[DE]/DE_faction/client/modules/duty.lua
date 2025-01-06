-------------------------------------------------------------------------------
-- Duty Locations (qtarget)
-------------------------------------------------------------------------------
--  Law Enforcement
exports['qtarget']:AddBoxZone("police_signin", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
        name="police_signin",
        heading=11.0,
        debugPoly=false,
        minZ=29.77834,
        maxZ=31.87834,
    }, {
    options = {
        {
            event = "prrp_factions:ondutypd",
            icon = "fas fa-sign-in-alt",
            label = "Sign In",
            job = "offpolice",
        },
        {
            event = "prrp_factions:offdutypd",
            icon = "fas fa-sign-out-alt",
            label = "Sign Out",
            job = "police",
        },
    },
    distance = 3.5
})

--  Fire Department
exports['qtarget']:AddBoxZone("pb_signin", vector3(310.22, -597.57, 43.28), 0.25, 0.4, {
        name="pb_signin",
        heading=61,
        debugPoly=false,
        minZ=43.23,
        maxZ=43.38,
    }, {
    options = {
        {
            event = "prrp_factions:ondutyfd",
            icon = "fas fa-sign-in-alt",
            label = "Sign In",
            job = "offambulance",
        },
        {
            event = "prrp_factions:offdutyfd",
            icon = "fas fa-sign-out-alt",
            label = "Sign Out",
            job = "ambulance",
        },
    },
    distance = 3.5
})

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
RegisterNetEvent('prrp_factions:ondutypd')
AddEventHandler('prrp_factions:ondutypd', function()
    TriggerServerEvent('duty:onpd')
end)

RegisterNetEvent('prrp_factions:offdutypd')
AddEventHandler('prrp_factions:offdutypd', function()
    TriggerServerEvent('duty:offpd')
end)

RegisterNetEvent('prrp_factions:ondutyfd')
AddEventHandler('prrp_factions:ondutyfd', function()
    TriggerServerEvent('duty:onfd')
end)

RegisterNetEvent('prrp_factions:offdutyfd')
AddEventHandler('prrp_factions:offdutyfd', function()
    TriggerServerEvent('duty:offfd')
end)