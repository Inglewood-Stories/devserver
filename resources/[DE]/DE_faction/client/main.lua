dragStatus, isDragged = {}, false
edragStatus, eisDragged = {}, false
local mapBlips = {}
local viewfam = true
local isPlayerWhitelisted = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:playerLogout')
AddEventHandler('esx:playerLogout', function(xPlayer, isNew)
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedJobs) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

AddEventHandler('prrp_faction:requestCarry', function(data)
	if GetEntityType(data.entity) == 1 and ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'police' then
		local entity = data.entity
        if IsPedAPlayer(entity) then 
			local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
			TriggerServerEvent('emergency:frontCarry', target)
        end 
	end
end)


RegisterNetEvent('emergency:FrontCarry')
AddEventHandler('emergency:FrontCarry', function()
	local plyPed = PlayerPedId()
	local targetDict = "anim@heists@box_carry@"
	local targetAnim = "idle"
	isCarrying = not isCarrying
	if isCarrying then
		LoadAnimationDictionary(targetDict)
		TaskPlayAnim(plyPed, targetDict, targetAnim, 8.0, 8.0, -1, 50, 0, false, false, false)
	else
		ClearPedTasksImmediately(plyPed)
	end
end)

OnPlayerData = function(key, val, last)
	if type(val) == 'table' then val = json.encode(val) end
	if key == 'dead' then -- However, this function can be used for other PlayerData
		if val == true then
			print('reset death state for drag??')
		end
	end
end

function DrawText3D(x, y, z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
   
    SetTextScale(0.35, 0.35)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

AddEventHandler('onResourceStop', function(resource) 
  if resource == GetCurrentResourceName() then
    TriggerEvent('police:Uncuff')

    for i = 1, #mapBlips do
		RemoveBlip(mapBlips[i])
    end
  end
end)

-- Softcuff & Handcuff
CreateThread(function()
	while true do
		Wait(0)
		local letSleep = true
		local plyPed = PlayerPedId()

		if LocalPlayer.state.isCuffed then
			letSleep = false
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			if IsEntityPlayingAnim(plyPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(plyPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		end

		if LocalPlayer.state.isShackled then
			letSleep = false
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D
		end

		if LocalPlayer.state.isCuffed or LocalPlayer.state.isShackled then
			letSleep = false
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
		end

		if letSleep then
			Wait(500)
		end
	end
end)

-- Dragging (Police)
CreateThread(function()
	local wasDragged

	while true do
		Wait(0)
		local plyPed = PlayerPedId()

		if LocalPlayer.state.isCuffed and isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(plyPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Wait(1000)
				end
			else
				wasDragged = false
				isDragged = false
				DetachEntity(plyPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(plyPed, true, false)
		else
			Wait(500)
		end
	end
end)

-- Dragging (Fire Department)
CreateThread(function()
	local wasDragged

	while true do
		Wait(0)
		local plyPed = PlayerPedId()

		if eisDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(edragStatus.EmsId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(plyPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Wait(1000)
				end
			else
				wasDragged = false
				eisDragged = false
				DetachEntity(plyPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(plyPed, true, false)
		else
			Wait(500)
		end
	end
end)

inCustody = function()
  return LocalPlayer.state.isCuffed or LocalPlayer.state.isShackled
end

RegisterNetEvent('prrp_faction:fchatpolice')
AddEventHandler('prrp_faction:fchatpolice', function(title, message)
	if isPlayerWhitelisted and viewfam == true then
		TriggerEvent('chat:addMessage', {
			template = '<div style="color: rgba(179, 177, 253, 1); width: fit-content; max-width: 100%; word-break: break-word;"> (( {0}: {1} )) </div>',
			args = { title, message }
		})
	end
end)

RegisterNetEvent('prrp_faction:fchatems')
AddEventHandler('prrp_faction:fchatems', function(title, message)
	if isPlayerWhitelisted and viewfam == true then
		TriggerEvent('chat:addMessage', {
			template = '<div style="color: rgba(208, 133, 121, 1); width: fit-content; max-width: 100%; word-break: break-word;"> (( {0}: {1} )) </div>',
			args = { title, message }
		})
	end
end)

exports('inCustody', inCustody)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.VehicleSpawnLocation) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			
			if dist < 11 and pedspawneado == false then
				TriggerEvent('prrp_faction:vehiclespawnerPD',v.Cordenadas,v.h)
				pedspawneado = true
			end
			if dist >= 10  then
				pedspawneado = false
                SetEntityAlpha(tunpc, 1, false)
				DeletePed(tunpc)
			end
		end

		for k, v in pairs(Config.VehicleSpawnLocationEMS) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			
			if dist < 11 and pedspawneadoems == false then
				TriggerEvent('prrp_faction:vehiclespawnerEMS',v.Cordenadas,v.h)
				pedspawneadoems = true
			end
			if dist >= 10  then
				pedspawneadoems = false
                SetEntityAlpha(tunpc2, 1, false)
				DeletePed(tunpc2)
			end
		end
	end
end)

local spawnedPeds = {}

CreateThread(function()
	while true do
		Wait(500)
		for k,v in pairs(Config.PedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)

			if distance < Config.DistanceSpawn and not spawnedPeds[k] then
				local spawnedPed = NearPed(v.model, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				spawnedPeds[k] = { spawnedPed = spawnedPed }
			end

			if distance >= Config.DistanceSpawn and spawnedPeds[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Wait(50)
						SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
					end
				end
				DeletePed(spawnedPeds[k].spawnedPed)
				spawnedPeds[k] = nil
			end
		end
	end
end)

function NearPed(model, coords, gender, animDict, animName, scenario)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(50)
	end

	if Config.MinusOne then
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnedPed = CreatePed(Config.GenderNumbers[gender], model, coords.x, coords.y, coords.z, coords.w, false, true)
	end

	SetEntityAlpha(spawnedPed, 0, false)

	if Config.Frozen then
		FreezeEntityPosition(spawnedPed, true)
	end

	if Config.Invincible then
		SetEntityInvincible(spawnedPed, true)
	end

	if Config.Stoic then
		SetBlockingOfNonTemporaryEvents(spawnedPed, true)
	end

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(50)
		end

		TaskPlayAnim(spawnedPed, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

    if scenario then
        TaskStartScenarioInPlace(spawnedPed, scenario, 0, true)
    end

	if Config.FadeIn then
		for i = 0, 255, 51 do
			Wait(50)
			SetEntityAlpha(spawnedPed, i, false)
		end
	end

	return spawnedPed
end

RegisterNetEvent('prrp_faction:vehiclespawnerPD')
AddEventHandler('prrp_faction:vehiclespawnerPD',function(coords,heading)
	local hash = GetHashKey(Config.NPC)  --- change the npc to your liking
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end
    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b")
	while not TaskPlayAnim(tunpc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(10000)
	end
end)

RegisterNetEvent('prrp_faction:vehiclespawnerEMS')
AddEventHandler('prrp_faction:vehiclespawnerEMS',function(coords,heading)
	local hash = GetHashKey(Config.NPCEMS)
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end
    pedspawneadoems = true
	tunpc2 = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc2, true)
    SetBlockingOfNonTemporaryEvents(tunpc2, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b")
	while not TaskPlayAnim(tunpc2, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(10000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

exports['qtarget']:AddBoxZone("pvehiclespawner", vector3(458.1, -1017.28, 28.26 - 0.99), 31.6, 26.8, {
    name= "pvehiclespawner",
    heading= 90.22,
    debugPoly= false,
    minZ= 28.0,
    maxZ= 30.0,
    }, {
    options = {
        {
            event = 'prrp_faciton:vehicleSelectorPD',
            icon = "fas fa-university",
            label = "Police vehicle selection",
			job = "police"
        },
    },
    distance = 3.5
})

exports['qtarget']:AddBoxZone("emsvehiclespawner", vector3(333.28, -564.51, 28.8 - 0.99), 31.6, 26.8, {
    name= "emsvehiclespawner",
    heading= 154.58,
    debugPoly= false,
    minZ= 28.0,
    maxZ= 30.0,
    }, {
    options = {
        {
            event = 'prrp_faciton:vehicleSelectorEMS',
            icon = "fas fa-university",
            label = "EMS vehicle selection",
			job = "ambulance"
        },
    },
    distance = 3.5
})


RegisterNetEvent('prrp_faciton:vehicleSelectorPD')
AddEventHandler('prrp_faciton:vehicleSelectorPD', function()
	local vehicles = {}
	local authorizedVehicles = Config.AuthorizedVehicles[ESX.PlayerData.job.grade_name]

	if authorizedVehicles then
    	for k,v in pairs(authorizedVehicles) do
        	table.insert(vehicles, {
            	header = v.label,
            	context = '',
            	event = 'prrp_faction:spawnjobvehiclePD',
                args = { v.model }
        	})
    	end
    	TriggerEvent('nh-context:createMenu', vehicles)
	end
end)

RegisterNetEvent('prrp_faction:spawnjobvehiclePD')
AddEventHandler('prrp_faction:spawnjobvehiclePD', function(model)
	for k, v in pairs(Config.SpawnVehicle) do
		ESX.Game.SpawnVehicle(model, v.coords, v.heading, function(vehicle)
			TaskWarpPedIntoVehicle(ESX.PlayerData.ped, vehicle, -1)
			lib.notify({ type = 'inform', description = 'Your vehicle has been released' })
			TriggerServerEvent('garage:addKeys', GetVehicleNumberPlateText(vehicle))
		end)
	end
end)

RegisterNetEvent('prrp_faciton:vehicleSelectorEMS')
AddEventHandler('prrp_faciton:vehicleSelectorEMS', function()
	local vehicles = {}
	local authorizedVehicles = Config.AuthorizedVehiclesEMS[ESX.PlayerData.job.grade_name]

	if authorizedVehicles then
    	for k,v in pairs(authorizedVehicles) do
        	table.insert(vehicles, {
            	header = v.label,
            	context = '',
                event = 'prrp_faction:spawnjobvehicleEMS',
                args = { v.model }
        	})
    	end
    	TriggerEvent('nh-context:createMenu', vehicles)
	end
end)

RegisterNetEvent('prrp_faction:spawnjobvehicleEMS')
AddEventHandler('prrp_faction:spawnjobvehicleEMS', function(model)
	for k, v in pairs(Config.SpawnVehicleEMS) do
		ESX.Game.SpawnVehicle(model, v.coords, v.heading, function(vehicle)
			TaskWarpPedIntoVehicle(ESX.PlayerData.ped, vehicle, -1)
			lib.notify({ type = 'inform', description = 'Your vehicle has been released' })
			TriggerServerEvent('garage:addKeys', GetVehicleNumberPlateText(vehicle))
		end)
	end
end)