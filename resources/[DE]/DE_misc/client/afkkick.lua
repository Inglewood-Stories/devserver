local afkTimeout = 1800 -- AFK kick time limit in seconds
local timer = 0

local currentPosition  = nil
local previousPosition = nil
local currentHeading   = nil
local previousHeading  = nil

Citizen.CreateThread(function()
	while true do
		local sleep = 1000

		playerPed = PlayerPedId()
		if playerPed then
			currentPosition = GetEntityCoords(playerPed, true)
			currentHeading  = GetEntityHeading(playerPed)

			if currentPosition == previousPosition and currentHeading == previousHeading then
				if timer > 0 then
					if timer == math.ceil(afkTimeout / 4) then
						local output = string.format('You will be kicked in %s seconds for being inactive.', timer)
						chatnotify(output)
					end

					timer = timer - 1
				else
					TriggerServerEvent('afkkick:kickplayer')
				end
			else
				timer = afkTimeout
			end

			-- (always) update variables
			previousPosition = currentPosition
			previousHeading  = currentHeading
		end
		Citizen.Wait(sleep)
	end
end)

function chatnotify(text)
	TriggerEvent("chat:addMessage", {
	template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 300%; word-break: break-word; "> {0} </div>',
	args = { text }
	})
end