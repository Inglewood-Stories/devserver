-------------------------------------------------------------------------------
-- Eye Events: Police
-------------------------------------------------------------------------------
AddEventHandler('prrp_faction:requestFrisk', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'police' then
		local entity = data.entity

        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
            exports['ox_inventory']:openNearbyInventory()
        end 
	end
end)

AddEventHandler('prrp_faction:requestCuff', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'police' then
		local entity = data.entity
        local type = data.type

        if type ~= 'soft' and type ~= 'hard' then return end

        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			playerHeading = GetEntityHeading(PlayerPedId())
			playerLocation = GetEntityForwardVector(PlayerPedId())
			playerCoords = GetEntityCoords(PlayerPedId())

			TriggerServerEvent('police:cuff', target, playerHeading, playerCoords, playerLocation, type)
        end 
	end
end)

AddEventHandler('prrp_faction:requestUncuff', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'police' then
		local entity = data.entity

        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			playerHeading = GetEntityHeading(PlayerPedId())
			playerLocation = GetEntityForwardVector(PlayerPedId())
			playerCoords = GetEntityCoords(PlayerPedId())

			TriggerServerEvent('police:uncuff', target, playerHeading, playerCoords, playerLocation)
        end 
	end
end)

AddEventHandler('prrp_faction:requestDrag', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'police' then
		local entity = data.entity
        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			TriggerServerEvent('police:drag', target)
        end 
	end
end)

AddEventHandler('prrp_faction:requestGSR', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'police' then
		local entity = data.entity

        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			exports.rprogress:Start('Checking for GSR', 3000)
			TriggerServerEvent('GSR:Status2', target)
        end 
	end
end)

-------------------------------------------------------------------------------
-- Eye Events: Fire Department
-------------------------------------------------------------------------------
AddEventHandler('prrp_faction:requestDragFire', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'ambulance' then
		local entity = data.entity
        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
            TriggerServerEvent('ems:drag', target)
        end 
	end
end)

AddEventHandler('prrp_faction:requestHeal', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'ambulance' then
		local entity = data.entity
        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			TriggerServerEvent('ems:heal', target)
        end 
	end
end)

AddEventHandler('prrp_faction:requestRevive', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'ambulance' then
		local entity = data.entity
        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			TriggerServerEvent('ems:revive', target)
        end 
	end
end)

-------------------------------------------------------------------------------
-- Eye Events: Vehicle
-------------------------------------------------------------------------------
AddEventHandler('prrp_faction:requestImpound', function(data)
    if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= 'ambulance' then return end
    if DoesEntityExist(data.entity) then
		exports.rprogress:Start('Impounding Vehicle...', 3500)
        ESX.Game.DeleteVehicle(data.entity)
    end
end)

AddEventHandler('prrp_faction:requestRepair', function(data)
	local playerPed = PlayerPedId()
	if ESX.PlayerData.job.name ~= 'mechanic' then return end
    if DoesEntityExist(data.entity) then
		ESX.TriggerServerCallback('DE_faction:checkItem', function(hasItem)
			if hasItem then
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				Citizen.Wait(2000)
				ClearPedTasksImmediately(playerPed)
				SetVehicleDoorOpen(data.entity, 4, false, false)
				Citizen.Wait(1000)
				TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
				exports.rprogress:Start('Repairing Vehicle...', 10000)
        		SetVehicleFixed(data.entity)
				SetVehicleDeformationFixed(data.entity)
				SetVehicleUndriveable(data.entity, false)
				ClearPedTasksImmediately(playerPed)
			end
		end, 'repairkit')
    end
end)

AddEventHandler('prrp_faction:requestClean', function(data)
	local playerPed = PlayerPedId()
	if ESX.PlayerData.job.name ~= 'mechanic' then return end
    if DoesEntityExist(data.entity) then
		ESX.TriggerServerCallback('DE_faction:checkItem', function(hasItem)
			if hasItem then
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
				exports.rprogress:Start('Cleaning Vehicle...', 10000)
		        SetVehicleDirtLevel(data.entity, 0)
				ClearPedTasksImmediately(playerPed)
			end
		end, 'cleankit')
    end
end)

-------------------------------------------------------------------------------
-- Eye Functions
-------------------------------------------------------------------------------
ESX.GetPlayerId = function(entity)
    return GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
end -- it's not a default function in ESX
