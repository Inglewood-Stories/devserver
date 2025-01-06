ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local dutyPolice, dutyEms, dutyMechanic, dutyTaxi = 0, 0, 0, 0

RegisterCommand('cash', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local getMoney = xPlayer.getAccount('money').money
	local plyMon = comma_value(getMoney)

	TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have $' .. plyMon .. ' in cash' })
end)

RegisterCommand('bank', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	local getBank = xPlayer.getAccount('bank').money
	local plyBank = comma_value(getBank)

	TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have $' .. plyBank .. ' in your bank account' })
end)

RegisterCommand('job', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'Job: ' .. xPlayer.job.label .. ' - ' .. xPlayer.job.grade_label })
end)

RegisterCommand('id', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
  
    TriggerClientEvent("chat:addMessage", source, {
        template = '<div style="color: rgba(175, 175, 175, 1); width: fit-content; max-width: 300%; word-break: break-word; "> (ID {0}) {1} | {2} </div>',
        args = { source, xPlayer.getName(), GetPlayerName(source) }
    })
end)

RegisterCommand('lookup', function(source, args, rawCommand)
	local id = tonumber(args[1])
	local xTarget = ESX.GetPlayerFromId(id)

	if id then
		TriggerClientEvent('commands:lookup', source, id, xTarget.getName(), GetPlayerName(id))
	else
		TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid Player ID' })
	end
end)

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end