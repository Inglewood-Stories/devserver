-------------------------------------------------------------------------------
-- Eye
-------------------------------------------------------------------------------
exports.qtarget:Player({
    options = {
        {
            event = 'prrp_faction:requestHeal',
            label = 'Heal',
            icon = 'fas fa-first-aid',
            job = 'ambulance',
            num = 1,
        },
        {
            event = 'prrp_faction:requestRevive',
            label = 'Revive',
            icon = 'fas fa-heartbeat',
            job = 'ambulance',
            num = 2,
        },
        {
            event = 'prrp_faction:requestDragFire',
            label = 'Escort Patient',
            icon = 'fas fa-people-carry',
            job = 'ambulance',
            num = 3,
        },
    },
    distance = 2
})

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
RegisterNetEvent('ems:Drag')
AddEventHandler('ems:Drag', function(paramedic)
    eisDragged = not eisDragged
    edragStatus.EmsId = paramedic
end)

RegisterNetEvent('ems:Heal')
AddEventHandler('ems:Heal', function()
    local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

    SetEntityHealth(playerPed, maxHealth)
end)