AddEventHandler('esx:playerDropped', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local job = xPlayer.job.name
        local grade = xPlayer.job.grade

        if job == 'police' or job == 'ambulance' then
            xPlayer.setJob('off' ..job, grade)

	        local inventory = xPlayer.getInventory()

	        for k, v in pairs(inventory) do
	            for _, item in pairs(Config.Clear) do
	                if v.name == item then
	                    xPlayer.removeInventoryItem(v.name, v.count)
	                end
	            end
	        end
	    end
    end
end)

RegisterNetEvent('police:cuff')
AddEventHandler('police:cuff', function(target, playerHeading, playerCoords, playerLocation, type)
    TriggerClientEvent('police:Handcuff', source)
    TriggerClientEvent('player:Handcuff', target, playerHeading, playerCoords, playerLocation, type)
end)

RegisterNetEvent('police:uncuff')
AddEventHandler('police:uncuff', function(target, playerHeading, playerCoords, playerLocation)
    TriggerClientEvent('police:Uncuff', source)
    TriggerClientEvent('player:Uncuff', target, playerHeading, playerCoords, playerLocation)
end)


RegisterNetEvent('police:drag')
AddEventHandler('police:drag', function(target)
    TriggerClientEvent('police:Drag', target, source)
end)

RegisterNetEvent('ems:drag')
AddEventHandler('ems:drag', function(target)
    TriggerClientEvent('ems:Drag', target, source)
end)

RegisterNetEvent('ems:heal')
AddEventHandler('ems:heal', function(target)
    TriggerClientEvent('ems:Heal', target)
end)

RegisterNetEvent('ems:revive')
AddEventHandler('ems:revive', function(target)
    TriggerClientEvent('esx_ambulancejob:revive', target)
end)

RegisterCommand('frevive', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = tonumber(args[1])

    if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
        TriggerClientEvent('esx_ambulancejob:revive', target)
    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this'})
    end
end)

RegisterCommand('bill', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = tonumber(args[1])
    local amount = tonumber(args[2])

    if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
        local xTarget = ESX.GetPlayerFromId(target)

        if xTarget == nil then
            TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid target or person.' })
            return
        end

        if amount == nil then
            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 125%; word-break: break-word; "> ERROR: You need to enter a valid number.</div>'
            })
            return
        end

        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="color: rgba(51, 170, 51, 1); width: fit-content; max-width: 100%; word-break: break-word; ">BILL: You wrote a bill for ${0} dollar(s) to {1}.</div>',
            args = { comma_value(amount), xTarget.getName() }
        })

        TriggerClientEvent('chat:addMessage', xTarget.source, {
            template = '<div style="color: rgba(51, 170, 51, 1); width: fit-content; max-width: 100%; word-break: break-word; ">BILL: You received a bill for ${0} dollar(s) by {1}.</div>',
            args = { comma_value(amount), xPlayer.getName() }
        })

        TriggerClientEvent('esx_faction:fineAnim', source)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
			xTarget.removeAccountMoney('bank', amount)
			account.addMoney(amount)
		end)
    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this.' })
    end
end)

RegisterCommand('seize', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = tonumber(args[1])

    if xPlayer.job.name == 'police' then
        local xTarget = ESX.GetPlayerFromId(target)

        if xTarget == nil then
            TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid target or person.' })
            return
        end


        local inventory = xTarget.getInventory()

        for k, v in pairs(inventory) do
            xTarget.removeInventoryItem(v.name, v.count)
        end
        
        local targetOutput = string.format('Your items were seized by %s', xPlayer.getName())
        TriggerClientEvent('ox_lib:notify', xTarget.source, 'inform', targetOutput)

        local playerOutput = string.format('You have seized %s\'s items.', xTarget.getName())
        TriggerClientEvent('ox_lib:notify', source, 'inform', playerOutput)

    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this.' })
    end
end)

ESX.RegisterServerCallback('DE_faction:checkItem', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(item)
	if xItem.count > 0 then
		xPlayer.removeInventoryItem(item, 1)
		cb(true)
	else
		cb(false)
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You are missing a ' .. xItem.label})
	end
end)

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end