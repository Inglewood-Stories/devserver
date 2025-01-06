local firstSpawn = true

isDead, isSearched, medic = false, false, 0
acceptdeathtimerdone = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
	firstSpawn = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx:onPlayerSpawn', function()
	isDead = false

	if firstSpawn then
		firstSpawn = false

		if Config.AntiCombatLog then
			while not ESX.PlayerLoaded do
				Citizen.Wait(1000)
			end

			ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(shouldDie)
				if shouldDie then
					Citizen.Wait(5000)
					SetEntityHealth(PlayerPedId(), 0)
				end
			end)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('blip_hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)

CreateThread(function() -- One Shot Head Shot
    while true do
        Citizen.Wait(0)
		
		local playerPed = PlayerPedId()

        SetPedSuffersCriticalHits(playerPed, true)
	end
end)

-- Disable most inputs when dead
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isDead then
			DisableAllControlActions(0)
			EnableControlAction(0, 47, true)
			EnableControlAction(0, 245, true)
			EnableControlAction(0, 38, true)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isDead and isSearched then
			local playerPed = PlayerPedId()
			local ped = GetPlayerPed(GetPlayerFromServerId(medic))
			isSearched = false

			AttachEntityToEntity(playerPed, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			Citizen.Wait(1000)
			DetachEntity(playerPed, true, false)
			ClearPedTasksImmediately(playerPed)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:clsearch')
AddEventHandler('esx_ambulancejob:clsearch', function(medicId)
	local playerPed = PlayerPedId()

	if isDead then
		local coords = GetEntityCoords(playerPed)
		local playersInArea = ESX.Game.GetPlayersInArea(coords, 50.0)

		for i=1, #playersInArea, 1 do
			local player = playersInArea[i]
			if player == GetPlayerFromServerId(medicId) then
				medic = tonumber(medicId)
				isSearched = true
				break
			end
		end
	end
end)

function OnPlayerDeath()
	isDead = true
	LocalPlayer.state:set('isDead', true, true)

	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
	TriggerEvent("chat:addMessage", {
		template = '<div style="color: rgba(252, 245, 69, 1); width: fit-content; max-width: 300%; word-break: break-word; "> {0} </div>',
		args = { '-> You\'re now dead. You need to wait 5 minutes and then you\'ll get the ability to /acceptdeath.' }
	})
	StartAcceptDeathTimer()
end

RegisterNetEvent('esx_ambulancejob:useItem')
AddEventHandler('esx_ambulancejob:useItem', function(itemName)
	ESX.UI.Menu.CloseAll()

	if itemName == 'medkit' then
		local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end

			TriggerEvent('esx_ambulancejob:heal', 'big', true)
			lib.notify({ type = 'success', description = 'You have used a medkit' })
		end)

	elseif itemName == 'bandage' then
		local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		local playerPed = PlayerPedId()

		ESX.Streaming.RequestAnimDict(lib, function()
			TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

			Citizen.Wait(500)
			while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				Citizen.Wait(0)
				DisableAllControlActions(0)
			end

			TriggerEvent('esx_ambulancejob:heal', 'small', true)
			lib.notify({ type = 'success', description = 'You have used a bandage' })
		end)
	end
end)

function DrawText3D(position, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(position.x,position.y,position.z+1.5)
   
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
	SetTextProportional(true)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(50, 210, 210, 210, 255)
  	SetTextDropShadow()
    SetTextOutline()
	SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function StartAcceptDeathTimer()
	while true do
		Citizen.Wait(0)

		if isDead and not acceptdeathtimerdone then
			Citizen.Wait(300*1000)
			TriggerEvent("chat:addMessage", {
				template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> {0} </div>',
				args = { 'To accept death type /acceptdeath' }
			})
			acceptdeathtimerdone = true
		end
	end
end

RegisterCommand('acceptdeath', function(source, args, rawCommand)
	if isDead and acceptdeathtimerdone then
		RemoveItemsAfterRPDeath()
	elseif not isDead then
		lib.notify({ type = 'error', description = 'You are not dead.' })
	elseif isDead and not acceptdeathtimerdone then
		lib.notify({ type = 'error', description = 'You can\'t do this yet.' })
	end
end)

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	acceptdeathtimerdone = false
	LocalPlayer.state:set('isDead', false, true)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			local formattedCoords = {
				x = Config.RespawnPoint.coords.x,
				y = Config.RespawnPoint.coords.y,
				z = Config.RespawnPoint.coords.z
			}

			ESX.SetPlayerData('loadout', {})
			RespawnPed(PlayerPedId(), formattedCoords, Config.RespawnPoint.heading)
			TriggerEvent("chat:addMessage", {
				template = '<div style="color: rgba(208, 133, 121, 1); width: fit-content; max-width: 300%; word-break: break-word; "> {0} </div>',
				args = { 'EMT: Your medical bills are $1200' }
			})

			DoScreenFadeIn(800)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end

AddEventHandler('esx:onPlayerDeath', function(data)
	OnPlayerDeath()
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	TriggerEvent('esx_inventoryhud:deathStatus', false)
	LocalPlayer.state:set('isDead', false, true)
	FreezeEntityPosition(PlayerPedId(), false)

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	RespawnPed(playerPed, formattedCoords, 0.0)

	DoScreenFadeIn(800)
end)

RegisterNetEvent('esx_ambulancejob:Stopacceptdeath')
AddEventHandler('esx_ambulancejob:Stopacceptdeath', function()
	if acceptdeathtimerdone then
		acceptdeathtimerdone = false
	end
end)