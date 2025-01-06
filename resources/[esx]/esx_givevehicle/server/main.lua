ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('givecar', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local id = tonumber(args[1])
	local xTarget = ESX.GetPlayerFromId(id)
	local model = args[2]
	
	if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'leadadmin' or xPlayer.getGroup() == 'management' then
		if id ~= nil then
			TriggerClientEvent('esx_giveownedcar:setVehicleOwned', id, model, xTarget.getName())
		else
			TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid ID' })
		end
	else
		TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this.' })
	end
end)

RegisterCommand('delcarplate', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local id = tonumber(args[1])
	local xTarget = ESX.GetPlayerFromId(id)
	local model = args[2]

	if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'leadadmin' or xPlayer.getGroup() == 'management' then
		if args[1] == nil then
			TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Invalid plate' })
		else
			local plate = args[1]
			if #args > 1 then
				for i=2, #args do
					plate = plate.." "..args[i]
				end		
			end
			plate = string.upper(plate)
			
			local result = MySQL.Sync.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			})
			if result == 1 then
				TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = string.format('You have deleted a vehicle with the plate of %s', plate) })
			elseif result == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('del_car_error', plate))
			end		
		end
	else
		TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this.' })
	end		
end)

--functions--

RegisterServerEvent('esx_giveownedcar:setVehicle')
AddEventHandler('esx_giveownedcar:setVehicle', function (vehicleProps)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	}, function ()
		if Config.ReceiveMsg then
			TriggerClientEvent('esx:showNotification', _source, _U('received_car', string.upper(vehicleProps.plate)))
		end
	end)
end)

RegisterServerEvent('esx_giveownedcar:printToConsole')
AddEventHandler('esx_giveownedcar:printToConsole', function(msg)
	print(msg)
end)

ESX.RegisterServerCallback('esx_givecarkeys:requestPlayerCars', function(source, cb, plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local found = false

			for i=1, #result, 1 do

				local vehicleProps = json.decode(result[i].vehicle)

				if trim(vehicleProps.plate) == trim(plate) then
					found = true
					break
				end

			end

			if found then
				cb(true)
			else
				cb(false)
			end

		end
	)
end)

RegisterServerEvent('esx_givecarkeys:frommenu')
AddEventHandler('esx_givecarkeys:frommenu', function ()
	TriggerClientEvent('esx_givecarkeys:keys', source)
end)


RegisterServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId')
AddEventHandler('esx_givecarkeys:setVehicleOwnedPlayerId', function (playerId, vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate
	},

	function (rowsChanged)
		TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = 'You have got a new car with plate ' ..vehicleProps.plate, vehicleProps.plate })
	end)
end)

function trim(s)
    if s ~= nil then
		return s:match("^%s*(.-)%s*$")
	else
		return nil
    end
end

RegisterCommand('vsell', function(source, args, rawCommand)
	local id = tonumber(args[1])
	
	TriggerClientEvent('esx_givecarkeys:keys', source, id)
end)