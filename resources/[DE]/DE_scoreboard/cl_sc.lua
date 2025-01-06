ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    Citizen.Wait(2000)

	ESX.TriggerServerCallback('scoreboard:getConnectedPlayers', function(scoreboard)
		UpdatePlayerTable(scoreboard)
	end)
end)

local CD = CD or {}

CD.Scoreboard = {}
CD.Scoreboard.Players = {}
local forceDraw = false
local shouldDraw = false
local shouldOpenMenu = false
local playerList = {}

--shouldDraw = true


function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
  end

function CD.Scoreboard.GetPlayerCount(self)
    local count = 0

    -- for _, player in ipairs(GetActivePlayers()) do
    --     if NetworkIsPlayerActive(player) then count = count + 1 end
    -- end

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then count = count + 1 end
    end

    return count
end

function tablelength(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

Citizen.CreateThread(function()
	local currentItemIndex = 1
	local selectedItemIndex = 1

	WarMenu.CreateMenu('scoreboard', 'Online Players')
    WarMenu.SetMenuX("scoreboard", 0.70)
    WarMenu.SetMenuY("scoreboard", 0.017)
    
	WarMenu.SetSubTitle("scoreboard", "Players")
	WarMenu.SetTitleColor("scoreboard", 135, 206, 250, 255)
    WarMenu.SetTitleBackgroundColor("scoreboard", 0 , 0, 0, 150)
    WarMenu.SetMenuBackgroundColor("scoreboard", 0, 0, 0, 100)
    WarMenu.SetMenuSubTextColor("scoreboard", 255, 255, 255, 255)

    WarMenu.CreateSubMenu('playeroptions', 'scoreboard', 'Player Info')

	while true do
		if WarMenu.IsMenuOpened('scoreboard') then
		-- if WarMenu.Button("Total:", tablelength(ESX.Game.GetAllPlayers()), {r = 135, g = 206, b = 250, a = 150}) then
                
                    
                for k, v in pairs(playerList) do
                    local playerId = GetPlayerFromServerId(v.id)
                    
                    if NetworkIsPlayerActive(playerId) or GetPlayerPed(playerId) == PlayerPedId() then
                        if WarMenu.MenuButton("[".. v.id .."] "..string.upper(v.name), 'playeroptions') then
                            selectedPlayer = v 
                        end
                    else
                        if WarMenu.MenuButton("~y~[".. v.id .."] - instanced?", 'playeroptions', {r = 255, g = 0, b = 0, a = 255}) then
                            selectedPlayer = v 
                        end
                    end
                end
			-- end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('playeroptions') then
            if WarMenu.Button("Selected: "..string.upper(selectedPlayer.steamid)) then
            -- elseif WarMenu.Button("Steam ID: "..string.upper(selectedPlayer.steamid)) then
			elseif WarMenu.Button("Community: "..selectedPlayer.community) then
			elseif WarMenu.Button("Server ID: "..selectedPlayer.id) then
			end
			WarMenu.Display()
		elseif IsControlJustReleased(0, Config.Button) then -- U by default
			WarMenu.OpenMenu('scoreboard')
            TriggerServerEvent('3dme:shareDisplay', 'checks out the individual(s).')
			shouldDraw = true
		else
			shouldDraw = false
		end

		Citizen.Wait(0)
	end
end)

AddEventHandler('playerSpawned', function(spawn)
    return count
end)

--Draw Things
Citizen.CreateThread(function()
    local animationState = false
    while true do
        Citizen.Wait(0)

        if shouldDraw or forceDraw then
            local nearbyPlayers = GetNeareastPlayers()
            for k, v in pairs(nearbyPlayers) do
                local x, y, z = table.unpack(v.coords)
                Draw3DText(x, y, z + 1.1, v.playerId)
            end
        end
    end
end)

function Draw3DText(x, y, z, text)
    -- Check if coords are visible and get 2D screen coords
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        -- Calculate text scale to use
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = 1.8 * (1 / dist) * (1 / GetGameplayCamFov()) * 100

        -- Draw text on screen
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function GetNeareastPlayers()
	local playerPed = PlayerPedId()
	local playerlist = GetActivePlayers()
   --local players, _ = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), Config.DrawDistance)

    local players_clean = {}
    local found_players = false

    for i = 1, #playerlist, 1 do
        found_players = true
        table.insert(players_clean, { playerName = GetPlayerName(playerlist[i]), playerId = GetPlayerServerId(playerlist[i]), coords = GetEntityCoords(GetPlayerPed(playerlist[i])) })
    end
    return players_clean
end

RegisterNetEvent('scoreboard:UpatePlayers')
AddEventHandler('scoreboard:UpatePlayers', function(scoreboard)
	UpdatePlayerTable(scoreboard)
end)

function UpdatePlayerTable(data)
    playerList = {}
    playerList = data
end


-- RegisterNetEvent('scoreboard:AddPlayer')
-- AddEventHandler('scoreboard:AddPlayer', function(data)
--     if playerList[data.id] == nil then
--         playerList[data.id] = data
--     end
-- end)


-- RegisterNetEvent('scoreboard:RemovePlayer')
-- AddEventHandler('scoreboard:RemovePlayer', function(id)
--     for k, v in pairs(playerList) do
--         if k == id then
--             table.remove(playerList, k)
--         end
--     end
-- end)

-- RegisterNetEvent('scoreboard:AddAllPlayers')
-- AddEventHandler('scoreboard:AddAllPlayers', function(data)
--     if playerList[data.id] == nil then
--         playerList[data.id] = data
--     end
-- end)
	