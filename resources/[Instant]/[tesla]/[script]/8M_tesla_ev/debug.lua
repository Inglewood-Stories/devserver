if Config.Debug then
    
    -- Set fuel in chat
    -- /fuel <0.100>
    -- RegisterCommand('charge', function(_, args, _)
        -- local level = args[1]
        -- local vehicle = GetPlayersLastVehicle()
        -- if vehicle then
            -- SetVehicleFuelLevel(vehicle, level / 1.0) -- needs to be float
        -- end
    -- end)

    TriggerEvent('chat:addSuggestion', '/tesladebug', 'Tesla debug features', {{name="models|model3|modelx|cybertruck|roadster|semi|charge", help="Spawn Tesla Model S, Tesla Model 3, Tesla Model X, Tesla Cybertruck, Tesla Roadster, Tesla Cybertruck or charge your Tesla."}})
    RegisterCommand("tesladebug", function(source, args)
        -- Spawns Tesla Model S for testing
        -- Requires playlolly_tesla_models resource to be installed and started
        if(args[1] == "models") then
            local modelHash = GetHashKey('models')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("/models failed. The resource must be installed and started.")
                        DrawNotification(false, false)
                        break
                    end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        -- Spawns Tesla Model 3 for testing
        -- Requires playlolly_tesla_model3 resource to be installed and started
        elseif(args[1] == "model3") then
            local modelHash = GetHashKey('model3')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("/model3 failed. The resource must be installed and started.")
                        DrawNotification(false, false)
                        break
                    end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        -- Spawns Tesla Model X for testing
        -- Requires playlolly_tesla_modelx resource to be installed and started
        elseif(args[1] == "modelx") then
            local modelHash = GetHashKey('modelx')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("/modelx failed. The resource must be installed and started.")
                        DrawNotification(false, false)
                        break
                    end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        -- Spawns Tesla Cybertruck for testing
        -- Requires playlolly_tesla_cybertruck resource to be installed and started
        elseif(args[1] == "cybertruck") then
            local modelHash = GetHashKey('cybertruck')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                       SetNotificationTextEntry("STRING")
                       AddTextComponentSubstringPlayerName("/cybertruck failed. The resource must be installed and started.")
                      DrawNotification(false, false)
                      break
                 end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        -- Spawns Tesla Roadster for testing
        -- Requires playlolly_tesla_roadster resource to be installed and started
        elseif(args[1] == "roadster") then
            local modelHash = GetHashKey('roadster')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("/rodaster failed. The resource must be installed and started.")
                        DrawNotification(false, false)
                        break
                    end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        -- Spawns Tesla Semi for testing
        -- Requires playlolly_tesla_semi resource to be installed and started
        elseif(args[1] == "semi") then
            local modelHash = GetHashKey('semi')
            RequestModel(modelHash)
            Citizen.CreateThread(function()
                local t = 0
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(100)
                    t = t + 100
                    if t > 5000 then
                        SetNotificationTextEntry("STRING")
                        AddTextComponentSubstringPlayerName("/semi failed. The resource must be installed and started.")
                        DrawNotification(false, false)
                        break
                    end
                end
                local ped = GetPlayerPed(-1)
                local vehicle = CreateVehicle(modelHash, GetEntityCoords(ped), GetEntityHeading(ped), 1, 0)
                SetVehicleOnGroundProperly(vehicle)
                SetPedIntoVehicle(ped, vehicle, -1)
                SetModelAsNoLongerNeeded(modelHash)
            end)
        elseif(args[1] == "charge") then
            -- Set fuel in chat
            -- /fuel <0.100>
            local level = args[2]
            local vehicle = GetPlayersLastVehicle()
            if vehicle then
                SetVehicleFuelLevel(vehicle, level / 1.0) -- needs to be float
            end
        end
    end, false)
end
