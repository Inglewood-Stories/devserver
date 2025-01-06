local checkState = false

AddEventHandler("playerSpawned", function ()
    if not checkState then
        Citizen.Wait(5000) -- Giving the player extra time to load in
        ShutdownLoadingScreenNui()
        checkState = true
    end
end)