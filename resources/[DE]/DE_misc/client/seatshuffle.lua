local disableShuffle = true

function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) and disableShuffle then
			if GetPedInVehicleSeat(vehicle, 0) == playerPed then
				if GetIsTaskActive(playerPed, 165) then
					SetPedIntoVehicle(playerPed, vehicle, 0)
				end
			end
		end
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	local playerPed = PlayerPedId()

	if IsPedInAnyVehicle(playerPed, false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuff", function(source, args, raw)
    TriggerEvent("SeatShuffle")
end)