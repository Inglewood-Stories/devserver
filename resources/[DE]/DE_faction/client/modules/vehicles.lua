-------------------------------------------------------------------------------
-- Eye
-------------------------------------------------------------------------------
local vehicleBones = {
    'door_dside_r',
    'door_pside_r',
}

local whitelistedJobs = {
    'police',
    'ambulance'
}

exports['qtarget']:AddTargetBone(vehicleBones, {
    options = {
        {
            event = 'prrp_faction:vehicleAction',
            icon = 'fas fa-plus-square',
            label = 'Put in Vehicle',
            type = 'seat',
            job = Config.WhitelistedJobs, 
        },
        {
            event = 'prrp_faction:vehicleAction',
            icon = 'fas fa-minus-square',
            label = 'Take from Vehicle',
            type = 'unseat',
            job = Config.WhitelistedJobs, 
        },
    },
    distance = 2
})

exports.qtarget:Vehicle({
	options = {
        {
            event = "prrp_faction:requestTow",
            icon = "fas fa-truck-pickup",
            label = "Request Impound",
            job = { ["police"] = 0, ["ambulance"] = 0 }
        },
		{
			event = "prrp_faction:requestImpound",
			icon = "fas fa-car-crash",
			label = "Impound Vehicle",
            job = { ["police"] = 0, ["ambulance"] = 0 }
		},
	},
	distance = 2
})

exports.qtarget:Vehicle({
	options = {
        {
            event = "prrp_faction:requestRepair",
            icon = "fas fa-truck-pickup",
            label = "Repair Vehicle",
            job = "mechanic"
        },
        {
            event = "prrp_faction:requestClean",
            icon = "fas fa-truck-pickup",
            label = "Clean Vehicle",
            job = "mechanic"
        },
	},
	distance = 2
})

-------------------------------------------------------------------------------
-- Vehicle Functiions
-------------------------------------------------------------------------------

RegisterCommand('repair', function(source, args, rawCommand)
    TriggerEvent('prrp_faction:repairVehicle')
end)

RegisterCommand('clean', function(source, args, rawCommand)
    TriggerEvent('prrp_faction:cleanVehicle')
end)

RegisterNetEvent('prrp_faction:spawnVehicle')
AddEventHandler('prrp_faction:spawnVehicle', function(data)
    if ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.name == 'ambulance' then
        return
    end

    Citizen.Wait(1000)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    ClearVehicleCustomPrimaryColour(vehicle)
    ClearVehicleCustomSecondaryColour(vehicle)
    SetVehicleColours(vehicle, 0, 0)
    SetVehicleModColor_1(vehicle, 0)
    SetVehicleModColor_2(vehicle, 0)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 11, 3, false)
    SetVehicleDirtLevel(vehicle, 0.0)
    ToggleVehicleMod(vehicle, 22, true)
    SetVehicleHeadlightsColour(vehicle, -1)

    exports['LegacyFuel']:SetFuel(vehicle, 100)
    TriggerServerEvent('garage:addKeys', GetVehicleNumberPlateText(vehicle))

    if data.livery ~= nil then
        SetVehicleLivery(vehicle, data.livery)
    end

    if data.extras ~= nil then
        for i = 1, #data.extras do
            local extra = tonumber(data.extras[i])

            if (DoesExtraExist(vehicle, extra) == 1) then
                SetVehicleExtra(vehicle, extra, false)
            end
        end
    end
    
    SetVehicleEngineOn(vehicle, true)
end)

RegisterNetEvent('prrp_faction:vehicleAction')
AddEventHandler('prrp_faction:vehicleAction', function(data)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local target = GetPlayerServerId(closestPlayer)

    if closestPlayer ~= -1 and closestDistance <= 2 then
        if data.type == 'seat' then
            TriggerServerEvent('prrp_faction:car', target, 'put')
        elseif data.type == 'unseat' then
            TriggerServerEvent('prrp_faction:car', target, 'take')
        end
    end
end)

RegisterNetEvent('prrp_faction:putInVehicle')
AddEventHandler('prrp_faction:putInVehicle', function()
    local playerPed = PlayerPedId()
    local vehicle, distance = ESX.Game.GetClosestVehicle()

    if vehicle and distance < 5 then
        local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

        for i=maxSeats - 1, 0, -1 do
            if IsVehicleSeatFree(vehicle, i) then
                freeSeat = i
                break
            end
        end

        if freeSeat then
            TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
            dragStatus.isDragged = false
        end
    end
end)

RegisterNetEvent('prrp_faction:pulloutOfVehicle')
AddEventHandler('prrp_faction:pulloutOfVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

RegisterNetEvent('prrp_faction:cleanVehicle')
AddEventHandler('prrp_faction:cleanVehicle', function()
    if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= "ambulance" then return end

    local vehicle = GetVehiclePedIsIn(PlayerPedId())

    FreezeEntityPosition(vehicle, true)
    exports.rprogress:Start('Cleaning Vehicle...', 3500)
    SetVehicleDirtLevel(vehicle, 0.0)
    FreezeEntityPosition(vehicle, false)
end)

RegisterNetEvent('prrp_faction:repairVehicle')
AddEventHandler('prrp_faction:repairVehicle', function()
    if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= "ambulance" then return end

    local vehicle = GetVehiclePedIsIn(PlayerPedId())

    FreezeEntityPosition(vehicle, true)
    exports.rprogress:Start('Repairing Vehicle...', 5000)
    SetVehicleFixed(vehicle)
    SetVehicleDirtLevel(vehicle, 0.0)
    FreezeEntityPosition(vehicle, false)
end)

RegisterCommand('livery', function(source, args, rawCommand)
    TriggerEvent('prrp_faction:getLiveries')
end)

RegisterCommand('extra', function(source, args, rawCommand)
    TriggerEvent('prrp_faction:getExtras')
end)

RegisterNetEvent('prrp_faction:getLiveries')
AddEventHandler('prrp_faction:getLiveries', function()
    local sendMenu = {}

    table.insert(sendMenu,{
        header = "<strong>Vehicle Liveries</strong>",
        context = "Adjust your vehicle livery."
    })

    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    local count = GetVehicleLiveryCount(vehicle)

    for i = 1, count, 1 do
        local liveryStatus = GetVehicleLivery(vehicle)
        if liveryStatus == i then 
            liveryStatus = "<span style='color: rgb(4, 120, 87); font-weight: bold;'>Enabled</span>" 
        else 
            liveryStatus = "<span style='color: rgb(185, 28, 28); font-weight: bold;'>Disabled</span>" 
        end
        
        table.insert(sendMenu,{
            header = ('Livery %d:&nbsp; %s'):format(i, liveryStatus),
            context = "",
            event = "prrp_faction:toggleLivery",
            args = { vehicle, i }
        })
    end 

    table.insert(sendMenu, {
        header = "Cancel",
        context = "",
        event = "fakeevent",
        args = {}
    })

    TriggerEvent('nh-context:createMenu', sendMenu)
end)

AddEventHandler('prrp_faction:toggleLivery', function(vehicle, livery)
    if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= "ambulance" then return end
    SetVehicleLivery(vehicle, livery)
    TriggerEvent('prrp_faction:getLiveries')
    TriggerEvent('prrp_faction:fix')
end)

RegisterNetEvent('prrp_faction:getExtras')
AddEventHandler('prrp_faction:getExtras', function()
    local sendMenu = {}
    table.insert(sendMenu,{
        header = "Vehicle Extras",
        context = "Adjust your vehicle components."
    })
    for i = 1, 14, 1 do     
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if DoesExtraExist(vehicle, i) then 
            local extraStatus = IsVehicleExtraTurnedOn(vehicle, i)
            if extraStatus == 1 then 
                extraStatus = "<span style='color: rgb(4, 120, 87); font-weight: bold;'>Enabled</span>" 
            else 
                extraStatus = "<span style='color: rgb(185, 28, 28); font-weight: bold;'>Disabled</span>" 
            end

            table.insert(sendMenu, {
                header = ('Extra %d:&nbsp; %s'):format(i, extraStatus),
                context = "",
                event = "prrp_faction:toggleExtras",
                args = { vehicle, i }
            })
        end
    end 

    table.insert(sendMenu,{
        header = "Cancel",
        context = "",
        event = "fakeevent",
        args = {}
    })
    TriggerEvent('nh-context:createMenu', sendMenu)
end)

AddEventHandler('prrp_faction:toggleExtras', function(vehicle, extra)
    local extraStatus = IsVehicleExtraTurnedOn(vehicle, extra)
    if extraStatus == 1 then 
        SetVehicleAutoRepairDisabled(vehicle, true)
        SetVehicleExtra(vehicle, extra, true)
    else 
        SetVehicleAutoRepairDisabled(vehicle, true)
        SetVehicleExtra(vehicle, extra, false)
        TriggerEvent('prrp_faction:fix')
    end 

    TriggerEvent('prrp_faction:getExtras')
end)

RegisterNetEvent('prrp_faction:fix')
AddEventHandler('prrp_faction:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn(vehicle, true, true )
		SetVehicleFixed(vehicle)
	else
        return
    end
end)