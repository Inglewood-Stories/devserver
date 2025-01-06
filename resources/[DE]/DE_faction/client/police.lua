-------------------------------------------------------------------------------
-- Eye
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Tracking
-------------------------------------------------------------------------------

exports.qtarget:Player({
    options = {
        {
            event = 'prrp_faction:requestFrisk',
            label = 'Frisk',
            icon = 'fas fa-hands-wash',
            job = 'police',
			num = 1,
        },
        {
            event = 'prrp_faction:requestCuff',
            label = 'Handcuff',
            icon = 'fas fa-hands',
            type = 'soft',
            job = 'police',
			num = 2,
		},
        {
            event = 'prrp_faction:requestCuff',
            label = 'Hardcuff',
            icon = 'fas fa-shoe-prints',
            type = 'hard',
            job = 'police',
			num = 3,
        },
        {
            event = 'prrp_faction:requestDrag',
            label = 'Drag Suspect',
            icon = 'fas fa-people-carry',
            job = 'police',
			num = 4,
        },
        {
            event = 'prrp_faction:requestUncuff',
            label = 'Uncuff',
            icon = 'fas fa-unlink',
            job = 'police',
			num = 5,
        },
    },
    distance = 2
})

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
RegisterNetEvent('player:Handcuff')
AddEventHandler('player:Handcuff', function(heading, coords, location, type)
	local plyPed = PlayerPedId()
	SetCurrentPedWeapon(plyPed, GetHashKey('WEAPON_UNARMED'), true)
	local x, y, z   = table.unpack(coords + location * 1.0)
	SetEntityCoords(plyPed, x, y, z - 1)
	SetEntityHeading(plyPed, heading)
	Citizen.Wait(250)

	ESX.Streaming.RequestAnimDict('mp_arrest_paired', function()
		TaskPlayAnim(plyPed, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8, 3750, 2, 0.0, false, false, false)
	end)

	Citizen.Wait(3760)
	if type == 'hard' then
		TriggerEvent('police:Hardcuff')
		LocalPlayer.state:set('isShackled', true, true)
	elseif type == 'soft' then
		TriggerEvent('police:Softcuff')
		LocalPlayer.state:set('isCuffed', true, true)
	end
end)

RegisterNetEvent('police:Drag')
AddEventHandler('police:Drag', function(cop)
	if LocalPlayer.state.isCuffed then
		isDragged = not isDragged
		dragStatus.CopId = cop
	end
end)

RegisterNetEvent('police:Handcuff')
AddEventHandler('police:Handcuff', function()
	local plyPed = PlayerPedId()

	Citizen.Wait(250)
	ESX.Streaming.RequestAnimDict('mp_arrest_paired', function()
		TaskPlayAnim(plyPed, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8, 3750, 2, 0.0, false, false, false)
	end)
	-- Sound effect maybe (?)
end)

RegisterNetEvent('police:Softcuff')
AddEventHandler('police:Softcuff', function()
	local plyPed = PlayerPedId()

	if LocalPlayer.state.isCuffed then
		ESX.Streaming.RequestAnimDict('mp_arresting', function()
			TaskPlayAnim(plyPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
	  	end)

		SetEnableHandcuffs(plyPed, true)
		DisablePlayerFiring(plyPed, true)
		SetCurrentPedWeapon(plyPed, GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(plyPed, false)
		DisplayRadar(false)
	else
		ClearPedSecondaryTask(plyPed)
		SetEnableHandcuffs(plyPed, false)
		DisablePlayerFiring(plyPed, false)
		SetPedCanPlayGestureAnims(plyPed, true)
		FreezeEntityPosition(plyPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('police:Hardcuff')
AddEventHandler('police:Hardcuff', function()
	local plyPed = PlayerPedId()

	if LocalPlayer.state.isShackled then
        ESX.Streaming.RequestAnimDict('mp_arresting', function()
            TaskPlayAnim(plyPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
        end)

        SetEnableHandcuffs(plyPed, true)
		DisablePlayerFiring(plyPed, true)
		SetCurrentPedWeapon(plyPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(plyPed, false)
		FreezeEntityPosition(plyPed, true)
    else
        ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
    end
end)

RegisterNetEvent('player:Uncuff')
AddEventHandler('player:Uncuff', function(heading, coords, location)
	local plyPed = PlayerPedId()
	local x, y, z = table.unpack(coords + location * 1.0)
	SetEntityCoords(plyPed, x, y, z - 1)
	SetEntityHeading(plyPed, heading)
	Citizen.Wait(250)

    ESX.Streaming.RequestAnimDict('mp_arresting', function()
		TaskPlayAnim(plyPed, 'mp_arresting', 'b_uncuff', 8.0, -8, -1, 2, 0.0, false, false, false)
	end)
	Citizen.Wait(5500)

    if LocalPlayer.state.isCuffed then
        ClearPedTasks(plyPed)
        SetEnableHandcuffs(plyPed, false)
        DisablePlayerFiring(plyPed, false)
        SetPedCanPlayGestureAnims(plyPed, true)
        FreezeEntityPosition(plyPed, false)
        LocalPlayer.state:set('isCuffed', false, true)
    end

    if LocalPlayer.state.isShackled then
        ClearPedTasks(plyPed)
        SetEnableHandcuffs(plyPed, false)
        DisablePlayerFiring(plyPed, false)
        SetPedCanPlayGestureAnims(plyPed, true)
        FreezeEntityPosition(plyPed, false)
        LocalPlayer.state:set('isShackled', false, true)
    end
end)

RegisterNetEvent('police:Uncuff')
AddEventHandler('police:Uncuff', function()
	local plyPed = PlayerPedId()
	Citizen.Wait(250)
	ESX.Streaming.RequestAnimDict('mp_arresting', function()
		TaskPlayAnim(plyPed, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 2, 0.0, false, false, false)
	end)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "handcuff", 1.0)
	Citizen.Wait(5500)
	ClearPedTasks(plyPed)
end)
