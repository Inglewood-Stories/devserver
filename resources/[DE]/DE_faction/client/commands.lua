RegisterCommand('soft', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' then return end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  playerHeading = GetEntityHeading(PlayerPedId())
  playerLocation = GetEntityForwardVector(PlayerPedId())
  playerCoords = GetEntityCoords(PlayerPedId())

  if closestPlayer ~= -1 and closestDistance <= 2 then
    TriggerServerEvent('police:cuff', target, playerHeading, playerCoords, playerLocation, 'soft')
  end
end)

RegisterCommand('hardcuff', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' then return end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  playerHeading = GetEntityHeading(PlayerPedId())
  playerLocation = GetEntityForwardVector(PlayerPedId())
  playerCoords = GetEntityCoords(PlayerPedId())

  if closestPlayer ~= -1 and closestDistance <= 2 then
    TriggerServerEvent('police:cuff', target, playerHeading, playerCoords, playerLocation, 'hard')
  end
end)

RegisterCommand('uncuff', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' then return end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  playerHeading = GetEntityHeading(PlayerPedId())
  playerLocation = GetEntityForwardVector(PlayerPedId())
  playerCoords = GetEntityCoords(PlayerPedId())

  if closestPlayer ~= -1 and closestDistance <= 2 then
    TriggerServerEvent('police:uncuff', target, playerHeading, playerCoords, playerLocation)
  end
end)

RegisterCommand('drag', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= 'ambulance' then return end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  if closestPlayer ~= -1 and closestDistance <= 2 then
    if ESX.PlayerData.job.name == 'police' then
      TriggerServerEvent('police:drag', target)
    else
      TriggerServerEvent('ems:drag', target)
    end
  end
end)

RegisterCommand('putincar', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' or ESX.PlayerData.job.name ~= 'ambulance' then return end

  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  if closestPlayer ~= -1 and closestDistance <= 2 then
    TriggerServerEvent('prrp_faction:car', target, 'put')
  end
end)

RegisterCommand('takefromcar', function(playerId, args, rawCommand)
  if ESX.PlayerData.job.name ~= 'police' or ESX.PlayerData.job.name ~= 'ambulance' then return end
  
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  local target = GetPlayerServerId(closestPlayer)

  if closestPlayer ~= -1 and closestDistance <= 2 then
    TriggerServerEvent('prrp_faction:car', target, 'take')
  end
end)