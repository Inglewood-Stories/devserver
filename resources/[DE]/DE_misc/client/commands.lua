TriggerEvent('chat:addSuggestion', '/lookup', 'Look someones information up.', {{ name="id", help="ID of the person you wanna look up."}})
TriggerEvent('chat:addSuggestion', '/id', 'Check your ID.')


RegisterNetEvent('commands:lookup')
AddEventHandler('commands:lookup', function(playerId, charname, playername)
	TriggerEvent("chat:addMessage", {
        template = '<div style="color: rgba(175, 175, 175, 1); width: fit-content; max-width: 300%; word-break: break-word; "> (ID {0}) {1} | {2} </div>',
        args = { playerId, charname, playername }
    })
end)