ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Create your own custom commnads!

RegisterCommand('address', function(source, args, rawCommand)
  local playerCoords, address  = GetEntityCoords(PlayerPedId())
  local street, cross = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local zone = GetLabelText(GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z))
    if cross ~= nil and cross ~= street then
      address = string.format('%s, %s, %s', GetStreetNameFromHashKey(street), GetStreetNameFromHashKey(cross), zone)
    end
    address = string.format('%s, %s', GetStreetNameFromHashKey(street), zone)
    TriggerEvent('chat:addMessage', {
      template = '<div style="color: rgba(255, 255, 255, 1);" class="chat-message"> You are at {0} </div>',
      args = { address }
    })
  end)
  
RegisterNetEvent('fancy_samp:notification')
AddEventHandler('fancy_samp:notification', function(output)
    Notification(output)
end)

RegisterNetEvent('fancy_samp:sendLocal')
AddEventHandler('fancy_samp:sendLocal', function(playerId, title, message)
  local source = PlayerId()
  local target = GetPlayerFromServerId(playerId)

  local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
  local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

  if IsPedInAnyVehicle(sourcePed, false) then
    if target == source then
      TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message text-local">(( (Car Local) ({2}) ({0}): {1} ))</div></div></span>',
        args = { GetPlayerName(source), message, playerId }
      })
    elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 5 then
      TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message text-local">(( (Car Local) ({2}) ({0}): {1} ))</div></div></span>',
        args = { GetPlayerName(source), message, playerId }
      })
    end
  else
    TriggerEvent('fancy_samp:notification', 'You must be in a vehicle to run this command.')
  end
end)

RegisterCommand('911', function(playerId, args, rawCommand)
  if not args[1] then exports['notify']:Error({ title = 'Error', text = 'You must include a message with your 911 call' }) return end

  if dispatchCooldown ~= nil and GetGameTimer() - dispatchCooldown < 30000 then
    TriggerEvent('chat:addMessage', {
      template = '<div class="chat-message text-system">[!]: <span class="text-white">You need to wait a few seconds before sending another nine one one.</span></div>',
    })
    return 
  end

  local dispatchData = exports['cd_dispatch']:GetPlayerInfo()	

  args = table.concat(args, ' ')
  
  TriggerServerEvent('drx_mdt:newDispatch', args, dispatchData.street, false)
  TriggerServerEvent('cd_dispatch:alert:nine', dispatchData, args, false)

  dispatchCooldown = GetGameTimer()
  exports['notify']:Success({ title = 'Success', text = 'Your message has been sent to the authorities' })		
end, false)

RegisterNetEvent('sendMessageAdmin')
AddEventHandler('sendMessageAdmin', function(id, name, message, realName)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
	  ESX.TriggerServerCallback('esx_chatforadmin:GetGroup', function(Group)
	  UserGroup = Group
    if UserGroup ~= 'user' then
      if streamerMode ~= true then
        TriggerEvent('chat:addMessage', {
          template = '<div class="chat-message"> <span style="color: yellow">(Admin) (ID: {2}) {0}: {1}</div>',
          args = {name.." ("..realName..")", message, id}
        })
      end
      end
   end)
end)

RegisterNetEvent('fancy_samp:sendCarWhisper')
AddEventHandler('fancy_samp:sendCarWhisper', function(playerId, title, message)
  local source = PlayerId()
  local target = GetPlayerFromServerId(playerId)

  local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
  local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

  if IsPedInAnyVehicle(sourcePed, false) then
    if target == source then
      TriggerEvent('chat:addMessage', {
        template = '<div style="color: rgba(252, 245, 69, 1); class="chat-message"> (Car Whisper) {0} whispers: {1} </div>',
        args = { title, message }
      })
    elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 5 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="color: rgba(252, 245, 69, 1); class="chat-message"> (Car Whisper) {0} whispers: {1} </div>',
        args = { title, message }
      })
    end
  else
    TriggerEvent('fancy_samp:notification', 'You must be in a vehicle to run this command.')
  end
end)

RegisterNetEvent('cmd:me')
AddEventHandler('cmd:me', function(playerId, title, message, coords)
  local lCoords = GetEntityCoords(GetPlayerPed(-1))
  local eCoords = coords
  local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
  if(distIs <= 15) then
    TriggerEvent('chat:addMessage', {
      template = '<div class="chat-message text-action">* {0} {1}</div></div></span>',
      args = { title, message }
    })
    TriggerServerEvent('esx_logging:MeLogs', message)
  end
end)

RegisterNetEvent('cmd:911')
AddEventHandler('cmd:911', function(playerId, message, title)
    TriggerEvent('chat:addMessage', { template = '<div class="chat-message" style="color: rgba(244, 116, 116, 0.93)"> Report Sent to 911.</div></span>' })
    ESX.TriggerServerCallback('esx_chatforadmin:getJob', function(Job)
        JobGrade = Job
        if JobGrade == 'ambulance' then
          TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message" style="color: rgba(235, 164, 164, 0.93)">(911 Report) ({2}) {1}: {0}</div></div></span>',
            args = { message, title, playerId }
          })
        elseif JobGrade == 'police' then
          TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message" style="color: rgba(164, 199, 235, 0.93)">(911 Report) ({2}) {1}: {0}</div></div></span>',
            args = { message, title, playerId }
          })
        end
    end)
end)

RegisterNetEvent('fancy_samp:sendaooc')
AddEventHandler('fancy_samp:sendaooc', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
	  ESX.TriggerServerCallback('esx_chatforadmin:GetGroup', function(Group)
	  UserGroup = Group
      if UserGroup ~= 'user' then
        TriggerEvent('chat:addMessage', {
          template = '<div class="chat-message text-aooc">(( (AOOC) {0}: {1} ))</div>',
          args = {name.." ("..GetPlayerName(pid)..")", message}
        })
      end
    end)
end)

RegisterNetEvent('cmd:localrp')
AddEventHandler('cmd:localrp', function(playerId, title, message, coords, name)
  local lCoords = GetEntityCoords(GetPlayerPed(-1))
  local eCoords = coords
  local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
  ESX.TriggerServerCallback('esx_chatforadmin:GetGroup', function(Group)
    UserGroup = Group
    if (distIs <= 20) then
        TriggerEvent('chat:addMessage', {
          template = '<div class="chat-message text-local">(( ({2}) ({3}) ({0}): {1} ))</div></div></span>',
          args = { title, message, playerId, name }
        })
    end
  end)
end)
