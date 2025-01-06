ESX = nil
local scoreboard = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('scoreboard:getConnectedPlayers', function(source, cb)
	cb(scoreboard)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	scoreboard[playerId] = nil
	TriggerClientEvent('scoreboard:UpatePlayers', -1, scoreboard)
end)

function AddToScoreboard(xPlayer, update)
    local playerId = xPlayer.source
    local communityId = GetIdentifierWithoutSteam(xPlayer.identifier)

    scoreboard[playerId] = {}
    scoreboard[playerId].id = playerId
    scoreboard[playerId].name = xPlayer.getName()
    scoreboard[playerId].steamid = xPlayer.identifier
    scoreboard[playerId].community = tonumber(communityId, 16)

    if update then
        TriggerClientEvent('scoreboard:UpatePlayers', -1, scoreboard)
    end
end

RegisterServerEvent('scoreboard:AddPlayer')
AddEventHandler('scoreboard:AddPlayer', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	AddToScoreboard(xPlayer, true)
end)
function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddToScoreboard(xPlayer, false)
	end

	TriggerClientEvent('scoreboard:UpatePlayers', -1, scoreboard)
end

function GetIdentifierWithoutSteam(identifier)
  return string.gsub(identifier, "steam:", "")
end

TriggerEvent('es:addGroupCommand', 'screfresh', 'admin', function(source, args, user)
	AddPlayersToScoreboard()
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Refresh the scoreboards for all users.' })