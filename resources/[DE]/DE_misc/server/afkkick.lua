ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('afkkick:kickplayer')
AddEventHandler('afkkick:kickplayer', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	DropPlayer(source, 'you have been kicked for being AFK')
	TriggerClientEvent("chat:addMessage", -1, {
		template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> [Auto-kick] {0} has been kicked for being AFK </div>',
		args = { xPlayer.getName() }
	})
end)