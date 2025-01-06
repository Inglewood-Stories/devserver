local passengerDriveBy = true

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerPed = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(playerPed, false)
		local playerID = PlayerId()
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(playerID, false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(playerID, true)
			else
				SetPlayerCanDoDriveBy(playerID, false)
			end
		end
	end
end)