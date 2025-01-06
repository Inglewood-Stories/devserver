local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local hasAlreadyEnteredMarker = false
local allMyOutfits = {}

if not ESX then
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
	end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerLoaded = true
end)

Citizen.CreateThread(function()
	for k,v in ipairs(Config.ClothingShops) do
		local data = v
		if data.blip == true then
			local blip = AddBlipForCoord(data.coords)

			SetBlipSprite (blip, 73)
			SetBlipColour (blip, 0)
			SetBlipScale (blip, 0.7)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('Clothing Shop')
			EndTextCommandSetBlipName(blip)
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in ipairs(Config.BarberShops) do
		local data = v
		if data.blip == true then
			local blip = AddBlipForCoord(data.coords)

			SetBlipSprite (blip, 71)
			SetBlipColour (blip, 0)
			SetBlipScale (blip, 0.7)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('Barber Shop')
			EndTextCommandSetBlipName(blip)
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in ipairs(Config.PlasticSurgery) do
		local data = v
		if data.blip == true then
			local blip = AddBlipForCoord(data.coords)

			SetBlipSprite (blip, 71)
			SetBlipColour (blip, 0)
			SetBlipScale (blip, 0.7)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName('Plastic Surgery')
			EndTextCommandSetBlipName(blip)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerCoords, isInClothingShop, isInBarberShop, isInPlasticSurgery, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, false, false, nil, true
		local sleep = 2000
		for k,v in pairs(Config.ClothingShops) do
			local data = v
			local distance = #(playerCoords - data.coords)

			if distance < Config.DrawDistance then
				sleep = 0
				if distance < data.MarkerSize.x then
					isInClothingShop, currentZone = true, k
				end
			end
		end

		for k,v in pairs(Config.BarberShops) do
			local data = v
			local distance = #(playerCoords - data.coords)

			if distance < Config.DrawDistance then
				sleep = 0
				if distance < Config.MarkerSize.x then
					isInBarberShop, currentZone = true, k
				end
			end
		end

		for k,v in pairs(Config.PlasticSurgery) do
			local data = v
			local distance = #(playerCoords - data.coords)

			if distance < Config.DrawDistance then
				sleep = 0
				if distance < data.MarkerSize.x then
					isInPlasticSurgery, currentZone = true, k
				end
			end
		end

		if (isInClothingShop and not hasAlreadyEnteredMarker) or (isInClothingShop and LastZone ~= currentZone) then
			hasAlreadyEnteredMarker, LastZone = true, currentZone
			CurrentAction     = 'clothingMenu'
			TriggerEvent('cd_drawtextui:ShowUI', 'show', "Press [E] To Change Clothing ($100)")
		end

		if (isInBarberShop and not hasAlreadyEnteredMarker) or (isInBarberShop and LastZone ~= currentZone) then
			hasAlreadyEnteredMarker, LastZone = true, currentZone
			CurrentAction     = 'barberMenu'
			TriggerEvent('cd_drawtextui:ShowUI', 'show', "Press [E] To Change Hair/Make up ($100)")
		end

		if (isInPlasticSurgery and not hasAlreadyEnteredMarker) or (isInPlasticSurgery and LastZone ~= currentZone) then
			hasAlreadyEnteredMarker, LastZone = true, currentZone
			CurrentAction     = 'surgeryMenu'
			TriggerEvent('cd_drawtextui:ShowUI', 'show', "Press [E] To Enter Plastic Surgery ($300)")
		end

		if not isInClothingShop and not isInBarberShop and not isInPlasticSurgery and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			sleep = 1000
			TriggerEvent('fivem-appearance:hasExitedMarker', LastZone)
			TriggerEvent('cd_drawtextui:HideUI')
		end

		Citizen.Wait(sleep)
	end
end)

AddEventHandler('fivem-appearance:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			if IsControlPressed(1,  38) then
				Citizen.Wait(500)

				if CurrentAction == 'clothingMenu' then

					TriggerEvent("fivem-appearance:clothingShop")

				end

				if CurrentAction == 'barberMenu' then

					TriggerEvent("fivem-appearance:barberMenu")

				end

				if CurrentAction == 'surgeryMenu' then

					TriggerEvent("fivem-appearance:surgeryMenu")

				end
			end
		end
	end
end)

RegisterNetEvent('fivem-appearance:clothingShop', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "Change clothing",
            context = "",
			event = "fivem-appearance:clothingMenu"
        },
        {
            header = "Change Outfit",
            context = "",
            event = "fivem-appearance:pickNewOutfit"
        },
		{
            header = "Save New Outfit",
            context = "",
			event = "fivem-appearance:saveOutfit"
        },
		{
            header = "Delete Outfit",
            context = "",
            event = "fivem-appearance:deleteOutfitMenu"
        }
    })
end)

RegisterNetEvent('fivem-appearance:clothingMenu', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = false,
		components = true,
		props = true
	}
	
	ESX.TriggerServerCallback('fivem-appearance:checkMoney', function(hasMoney)
		if hasMoney then
			exports['fivem-appearance']:startPlayerCustomization(function (appearance)
				if (appearance) then
					TriggerServerEvent('fivem-appearance:save', appearance)
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				else
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				end
			end, config)
		end
	end)
end)

RegisterNetEvent('fivem-appearance:barberMenu', function()
	local config = {
		ped = false,
		headBlend = false,
		faceFeatures = false,
		headOverlays = true,
		components = false,
		props = false
	}
	
	ESX.TriggerServerCallback('fivem-appearance:checkMoney', function(hasMoney)
		if hasMoney then
			exports['fivem-appearance']:startPlayerCustomization(function (appearance)
				if (appearance) then
					TriggerServerEvent('fivem-appearance:save', appearance)
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				else
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				end
			end, config)
		end
	end)
end)

RegisterNetEvent('fivem-appearance:surgeryMenu', function()
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true
	}
	
	ESX.TriggerServerCallback('fivem-appearance:checkMoneySurgery', function(hasMoney)
		if hasMoney then
			exports['fivem-appearance']:startPlayerCustomization(function (appearance)
				if (appearance) then
					TriggerServerEvent('fivem-appearance:save', appearance)
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				else
					if Config.UseLegacy then
						ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
					end
				end
			end, config)
		end
	end)
end)

RegisterNetEvent('fivem-appearance:pickNewOutfit', function()
	TriggerEvent('fivem-appearance:getOutfits')
    TriggerEvent('nh-context:createMenu', {
        {
            header = "< Go Back",
            context = "",
            event = "fivem-appearance:clothingShop"
        },
    })
	Citizen.Wait(300)
	for i=1, #allMyOutfits, 1 do
		TriggerEvent('nh-context:createMenu', {
			{
				header = allMyOutfits[i].name,
				context = "",
				event = 'fivem-appearance:setOutfit',
				args = { allMyOutfits[i].pedModel, allMyOutfits[i].pedComponents, allMyOutfits[i].pedProps }
			},
		})
	end
end)

RegisterNetEvent('fivem-appearance:getOutfits')
AddEventHandler('fivem-appearance:getOutfits', function()
	TriggerServerEvent('fivem-appearance:getOutfits')
end)

RegisterNetEvent('fivem-appearance:sendOutfits')
AddEventHandler('fivem-appearance:sendOutfits', function(myOutfits)
	local Outfits = {}
	for i=1, #myOutfits, 1 do
		table.insert(Outfits, {id = myOutfits[i].id, name = myOutfits[i].name, pedModel = myOutfits[i].ped, pedComponents = myOutfits[i].components, pedProps = myOutfits[i].props})
	end
	allMyOutfits = Outfits
end)

RegisterNetEvent('fivem-appearance:setOutfit')
AddEventHandler('fivem-appearance:setOutfit', function(ped, components, props)
	local pedModel = ped
	local pedComponents = components
	local pedProps = props
	local playerPed = PlayerPedId()
	local currentPedModel = exports['fivem-appearance']:getPedModel(playerPed)
	if currentPedModel ~= pedModel then
    	exports['fivem-appearance']:setPlayerModel(pedModel)
		Citizen.Wait(500)
		playerPed = PlayerPedId()
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		if Config.UseLegacy then
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		end
	else
		exports['fivem-appearance']:setPedComponents(playerPed, pedComponents)
		exports['fivem-appearance']:setPedProps(playerPed, pedProps)
		local appearance = exports['fivem-appearance']:getPedAppearance(playerPed)
		TriggerServerEvent('fivem-appearance:save', appearance)
		if Config.UseLegacy then
			ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
		end
	end
end)

RegisterNetEvent('fivem-appearance:saveOutfit', function()
    if Config.UseNewNHKeyboard then
        local keyboard, name = exports["nh-keyboard"]:Keyboard({
            header = "Name Outfit", 
            rows = {"Outfit name here"}
        })
        if keyboard then
            if name then
                local playerPed = PlayerPedId()
                local pedModel = exports['fivem-appearance']:getPedModel(playerPed)
                local pedComponents = exports['fivem-appearance']:getPedComponents(playerPed)
                local pedProps = exports['fivem-appearance']:getPedProps(playerPed)
                Citizen.Wait(500)
                TriggerServerEvent('fivem-appearance:saveOutfit', name, pedModel, pedComponents, pedProps)
            end
        end
    else
        local keyboard = exports["nh-keyboard"]:KeyboardInput({
            header = "Name Outfit", 
            rows = {
                {
                    id = 0, 
                    context = ""
                }
            }
        })
        if keyboard ~= nil then
            local playerPed = PlayerPedId()
            local pedModel = exports['fivem-appearance']:getPedModel(playerPed)
            local pedComponents = exports['fivem-appearance']:getPedComponents(playerPed)
            local pedProps = exports['fivem-appearance']:getPedProps(playerPed)
            Citizen.Wait(500)
            TriggerServerEvent('fivem-appearance:saveOutfit', keyboard[1].input, pedModel, pedComponents, pedProps)
            
        end
    end
end)

RegisterNetEvent('fivem-appearance:deleteOutfitMenu', function()
	TriggerEvent('fivem-appearance:getOutfits')
	Citizen.Wait(150)
    TriggerEvent('nh-context:createMenu', {
        {
            header = "< Go Back",
            context = "",
            event = "fivem-appearance:clothingShop"
        },
    })
	for i=1, #allMyOutfits, 1 do
		TriggerEvent('nh-context:createMenu', {
			{
				header = allMyOutfits[i].name,
				context = "",
				event = 'fivem-appearance:deleteOutfit',
				args = { allMyOutfits[i].id }
			},
		})
	end
end)

RegisterNetEvent('fivem-appearance:deleteOutfit')
AddEventHandler('fivem-appearance:deleteOutfit', function(id)
	TriggerServerEvent('fivem-appearance:deleteOutfit', id)
end)

RegisterCommand('clearped', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	if not skin.model then skin.model = 'mp_m_freemode_01' end
	exports['fivem-appearance']:setPlayerAppearance(skin)
	if cb ~= nil then
		cb()
	end
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
	local config = {
		ped = true,
		headBlend = true,
		faceFeatures = true,
		headOverlays = true,
		components = true,
		props = true
	}
	exports['fivem-appearance']:startPlayerCustomization(function (appearance)
		if (appearance) then
			TriggerServerEvent('fivem-appearance:save', appearance)
			if Config.UseLegacy then
			   ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
			end
			if submitCb then submitCb() end
		else
			if cancelCb then cancelCb() end
			if Config.UseLegacy then
			   ESX.SetPlayerData('ped', PlayerPedId()) -- Fix for esx legacy
			end
		end
	end, config)
end)
