ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Varibles --
local HideOOC = false
--------------

AddEventHandler('chatMessage', function(playerId, author, message)
	if message:sub(1, 1) == '/' and playerId > 0 then
		CancelEvent()
		local commandName = message:sub(1):gmatch("%w+")()
		TriggerClientEvent('chat:addMessage', playerId, {args = {'^4ERROR:^0 You have entered an invalid command, please type ^4/helpme^0 for further assistance.'}})
	end
end)

-- Create your own custom commnads!

ESX.RegisterCommand('togooc', {'mod', 'admin', 'management', 'leadadmin', 'owner', 'developer', 'tester', 'gameadmin', 'moderator'}, function(xPlayer,args,user)
	local src = xPlayer.source
	local xPlayer = ESX.GetPlayerFromId(src)
	local disabled = 'OOC has been closed!'
    local oocOff = string.format("%s ", disabled)
    local enabled = 'OOC is now open.'
	local oocOn = string.format("%s ", enabled)
	
	HideOOC = not HideOOC
	
	if HideOOC then
   		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message text-local"><span style="color: red"><b>AdmCmd:</b> {0}</div></div></div>',
			args = {oocOff}
   		})
   		TriggerClientEvent('toggleooc', -1, true)
   	else 
   		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message text-green"><b>AdmCmd:</b> {0}</div></div></div>',
			args = {oocOn}
   		})
   		TriggerClientEvent('toggleooc', -1, false)
	end
end)

ESX.RegisterCommand('announce', {'mod', 'admin', 'management', 'leadadmin', 'owner', 'developer', 'tester', 'gameadmin', 'moderator'}, function(xPlayer, args, rawCommand)
    TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message text-system">SYSTEM<span style="color: white;">: {0}</div></div></span>', args = { table.concat(args, " "), GetPlayerName(xPlayer.source)}})
end)

ESX.RegisterCommand('aooc', {'mod', 'admin', 'management', 'leadadmin', 'owner', 'developer', 'tester', 'gameadmin', 'moderator'}, function(xPlayer, args, rawCommand)
	Group = xPlayer.getGroup()
	args = table.concat(args, ' ')
	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div class="chat-message text-aooc"> (( (AOOC) {3} ({0}):</b> {1} ))</div>',
		args = { GetPlayerName(xPlayer.source), args, xPlayer.source, xPlayer.getName() }
	})
end, false)

RegisterCommand('ooc', function(playerId, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	if HideOOC then Wait(2500) return end
	if playerId == 0 then
		print('fancy_samp: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		Group = xPlayer.getGroup()
		if blacklistKeywords(xPlayer.source, args) then return end
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message text-ooc"> (( (OOC) (ID: {2}) {3} ({0}):</b> {1} ))</div>',
			args = { GetPlayerName(playerId), args, playerId, xPlayer.getName() }
		})
	end
end, false)

RegisterCommand('carwhisper', function(source, args, rawCommand)
	if source == 0 then return end
	local args = table.concat(args, ' ')
	local xPlayer = ESX.GetPlayerFromId(source)
	local name = xPlayer.getName(source)
	if blacklistKeywords(source, args) then return end
	TriggerClientEvent('fancy_samp:sendCarWhisper', -1, source, name, args);
end)

RegisterCommand('cw', function(source, args, rawCommand)
	if source == 0 then return end
	local args = table.concat(args, ' ')
	local xPlayer = ESX.GetPlayerFromId(source)
	local name = xPlayer.getName(source)
	if blacklistKeywords(source, args) then return end
	TriggerClientEvent('fancy_samp:sendCarWhisper', -1, source, name, args);
end)

RegisterCommand('say', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(source, args, "say")
	end
end)

RegisterCommand('s', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(source, args, "say")
	end
end)

RegisterCommand('low', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if xPlayer.source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(xPlayer.source, args, "saylow")
	end
end)

RegisterCommand('l', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if xPlayer.source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(xPlayer.source, args, "saylow")
	end
end)

RegisterCommand('sh', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if xPlayer.source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(xPlayer.source, args, "shout")
	end
end)

RegisterCommand('shout', function(source, args, showError)
	local xPlayer = ESX.GetPlayerFromId(source)
	if blacklistKeywords(source, table.concat(args, ' ')) then return end
	if xPlayer.source == 0 then
		return print('fancy_samp: you can\'t use this command from rcon!')
	else
		args = table.concat(args, ' ')
		maskCheck(xPlayer.source, args, "shout")
	end
end)
