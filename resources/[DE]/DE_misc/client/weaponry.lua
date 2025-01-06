Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()

		if IsPedArmed(playerPed, 6) then
        	DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            HideHudComponentThisFrame(14)
        end

        if IsControlPressed(0, 25)
	        then DisableControlAction(0, 22, true)
        end
        Citizen.Wait(5)
    end
end)