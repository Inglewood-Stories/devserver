-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

ESX = nil

local playerData = {}
local shouldStop = true
local currentVersion = "2021.1.5.2"
local isConnected = false

TriggerEvent(ConfigData.sharedObjectName, function(obj) ESX = obj end)

if GetCurrentResourceName() ~= "visn_are" then
	print("^3[veryinsanee's Authentication] ^1Authentication failed: No resource with name 'visn_are' found...")
	return
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function sendToDiscord(message)
	local discordEmbeds = {
		{
			["title"] = message,
			["type"] = "rich",
			["color"] = "16754688",
			["footer"] = {
				["text"] = "Advanced Roleplay Environment",
				["author"] = currentVersion
			}
		}
	}

	if message == nil or message == '' then return end
	PerformHttpRequest(ServerConfig.logWebhookId, function(err, text, headers) end, 'POST', json.encode({ "Advanced Roleplay Environment", embeds = discordEmbeds}), { ['Content-Type'] = 'application/json' })
end

	
ESX.RegisterServerCallback('visn_are:getItemCount', function(source, cb, itemName)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		local item = xPlayer.getInventoryItem(itemName)
		if item == nil then
			cb(0)
			return
		end

		if ServerConfig.requireItems then
			if ServerConfig.jobUnlimitedSupplies then
				if has_value(ServerConfig.medicJobNames, xPlayer.getJob().name) then
					cb(1)
				else
					cb(item.count)
				end
			else
				cb(item.count)
			end
		else
			cb(1)
		end
	end
end)

ESX.RegisterServerCallback('visn_are:removeItem', function(source, cb, itemName, itemCount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then

		xPlayer.removeInventoryItem(itemName, itemCount)

		cb(true)
	end
end)

ESX.RegisterServerCallback('visn_are:getTime', function(source, cb)
	cb(os.time())
end)

ESX.RegisterServerCallback('visn_are:isPlayerUnconscious', function(source, cb, targetSource)
	if playerData[source] == nil then
		cb(false)
	end

	cb(playerData[source].isUnconscious)
end)

RegisterServerEvent("visn_are:killLog")
AddEventHandler("visn_are:killLog", function(message)
	if ServerConfig.discordKillLogs then
		sendToDiscord(message)
	end
end)

ESX.RegisterServerCallback('visn_are:getBodyPartInfo', function(source, cb, playerId, bodyPart)
	local checkerPlayer = ESX.GetPlayerFromId(source)
	local victimPlayer = ESX.GetPlayerFromId(playerId)
	local bodyPartInfo = {}
	local display = ""

	if playerId == 0 then
		TriggerClientEvent('visn_are:getBodyInfo', source)
	else
		TriggerClientEvent('visn_are:getBodyInfo', playerId)
	end

	Citizen.Wait(100)
		
	bodyPartInfo["bodyPartDamage"] = playerData[playerId].bodyPartDamage
	bodyPartInfo["bloodParts"] = playerData[playerId].bloodParts
	bodyPartInfo["needSewed"] = playerData[playerId].needSewed
	bodyPartInfo["victimPulse"] = playerData[playerId].bodyPulse
	bodyPartInfo["victimPain"] = playerData[playerId].bodyPain
	bodyPartInfo["victimInPain"] = playerData[playerId].bodyInPain
	bodyPartInfo["victimBloodLevel"] = playerData[playerId].bodyBloodLevel
	bodyPartInfo["victimBleeding"] = playerData[playerId].victimBleeding
	bodyPartInfo["isUnconscious"] = playerData[playerId].isUnconscious
	bodyPartInfo["appliedTourniquets"] = playerData[playerId].appliedTourniquets
	bodyPartInfo["inBodybag"] = playerData[playerId].inBodybag
	if ServerConfig.showCharacterName then
		bodyPartInfo["menuTitle"] = victimPlayer.getName()
	else
		bodyPartInfo["menuTitle"] = _translate("menuTitle")
	end
-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
	bodyPartInfo["logs"] = playerData[playerId].logs
	bodyPartInfo["source"] = playerId
	bodyPartInfo["recievingBloodInfusion"] = playerData[playerId].recievingBloodInfusion
	bodyPartInfo["bloodPressureL"] = playerData[playerId].bloodPressureL
	bodyPartInfo["bloodPressureH"] = playerData[playerId].bloodPressureH
	
	if ServerConfig.jobNeededForMedicalOperations then
		if has_value(ServerConfig.medicJobNames, checkerPlayer.getJob().name) then
			bodyPartInfo["isMedic"] = true
		else
			bodyPartInfo["isMedic"] = false
		end
	else
		bodyPartInfo["isMedic"] = true
	end

	cb(bodyPartInfo)
end)

RegisterServerEvent('visn_are:sendBodyInfo')
AddEventHandler('visn_are:sendBodyInfo', function(bodyInfo)
	playerData[source] = bodyInfo
end)

RegisterServerEvent('visn_are:sendLiquid')
AddEventHandler('visn_are:sendLiquid', function(playerId, liquidType, bodyPart)
	TriggerClientEvent('visn_are:receiveLiquid', playerId, liquidType, bodyPart)
end)

RegisterServerEvent('visn_are:sendInfusion')
AddEventHandler('visn_are:sendInfusion', function(playerId, infusionType, infusionAmount)
	TriggerClientEvent('visn_are:receiveInfusion', playerId, infusionType, infusionAmount)
end)

RegisterServerEvent('visn_are:sendAlpha')
AddEventHandler('visn_are:sendAlpha', function(alpha)
	TriggerClientEvent('visn_are:sendAlpha', -1, source, alpha)
end)

RegisterServerEvent('visn_are:sendPainkillers')
AddEventHandler('visn_are:sendPainkillers', function(playerId)
	TriggerClientEvent('visn_are:receivePainkillers', playerId)
end)

RegisterServerEvent('visn_are:createObject')
AddEventHandler('visn_are:createObject', function(data)
	TriggerClientEvent(json.decode(data).eventName, json.decode(data).target, tostring(data))
	print("[visn_are] Creating object with data", json.encode(data))
end)

RegisterServerEvent('visn_are:sendBandage')
AddEventHandler('visn_are:sendBandage', function(playerId, bodyPart, bandageType)
	if bandageType == 'BANDAGE_NORMAL' then
		TriggerClientEvent('visn_are:reduceBloodLevel', playerId, bodyPart, 1)
		TriggerClientEvent('visn_are:reduceDamageLevel', playerId, bodyPart, 1)
	end

	if bandageType == 'BANDAGE_ELASTIC' then
		TriggerClientEvent('visn_are:reduceBloodLevel', playerId, bodyPart, 2)
		TriggerClientEvent('visn_are:reduceDamageLevel', playerId, bodyPart, 1)
	end

	if bandageType == 'BANDAGE_QUICKCLOT' then
		TriggerClientEvent('visn_are:reduceBloodLevel', playerId, bodyPart, 1)
		TriggerClientEvent('visn_are:reduceDamageLevel', playerId, bodyPart, 1)
	end

	if bandageType == 'BANDAGE_PACKING' then
		TriggerClientEvent('visn_are:reduceBloodLevel', playerId, bodyPart, 1)
		TriggerClientEvent('visn_are:reduceDamageLevel', playerId, bodyPart, 1)
	end
end)

RegisterServerEvent('visn_are:removeTourniquet')
AddEventHandler('visn_are:removeTourniquet', function(playerId, bodyPart)
	TriggerClientEvent('visn_are:removeTourniquet', playerId, bodyPart)
end)

RegisterServerEvent('visn_are:sendTourniquet')
AddEventHandler('visn_are:sendTourniquet', function(playerId, bodyPart)
	TriggerClientEvent('visn_are:receiveTourniquet', playerId, bodyPart)
end)

RegisterServerEvent('visn_are:sendEmergencyReviveKit')
AddEventHandler('visn_are:sendEmergencyReviveKit', function(playerId)
	TriggerClientEvent('visn_are:receiveEmergencyReviveKit', playerId)
end)

RegisterServerEvent('visn_are:sendSurgicalKit')
AddEventHandler('visn_are:sendSurgicalKit', function(playerId, bodyPart)
	TriggerClientEvent('visn_are:receiveSurgicalKit', playerId, bodyPart)
end)
-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
RegisterServerEvent('visn_are:addLog')
AddEventHandler('visn_are:addLog', function(senderId, playerId, logType)
	local medicPlayer = ESX.GetPlayerFromId(senderId)
	
	if ServerConfig.medicNameInActivityHistory then
		TriggerClientEvent('visn_are:receiveLog', playerId, senderId, logType, os.date(" " .. ServerConfig.activityHistorySeperator .. " " .. medicPlayer.getName() .. " " .. ServerConfig.activityHistorySeperator .. " " .. ServerConfig.dateFormat))
	else
		TriggerClientEvent('visn_are:receiveLog', playerId, senderId, logType, os.date(" " .. ServerConfig.activityHistorySeperator .. " " .. ServerConfig.dateFormat))
	end
end)

RegisterServerEvent('visn_are:sendCPR')
AddEventHandler('visn_are:sendCPR', function(playerId)
	TriggerClientEvent('visn_are:receiveCPR', playerId)
end)

RegisterServerEvent('visn_are:pullOutVehicle')
AddEventHandler('visn_are:pullOutVehicle', function(playerId)
	TriggerClientEvent('visn_are:pullOutVehicle', playerId)
end)

RegisterServerEvent('visn_are:putInVehicle')
AddEventHandler('visn_are:putInVehicle', function(playerId)
	TriggerClientEvent('visn_are:putInVehicle', playerId)
end)

RegisterServerEvent('visn_are:sendDefibrilator')
AddEventHandler('visn_are:sendDefibrilator', function(playerId)
	TriggerClientEvent('visn_are:receiveDefibrilator', playerId)
end)

RegisterServerEvent('InteractSound_SV_M:PlayWithinDistance')
AddEventHandler('InteractSound_SV_M:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
	TriggerClientEvent('InteractSound_CL_M:PlayWithinDistance', -1, GetEntityCoords(GetPlayerPed(source)), maxDistance, soundFile, soundVolume)
end)

RegisterServerEvent('visn_are:bodybag:triggerSync')
AddEventHandler('visn_are:bodybag:triggerSync', function(target)
	TriggerClientEvent('visn_are:bodybag:putInBag', target)
end)

RegisterServerEvent('visn_are:sync')
AddEventHandler('visn_are:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('visn_are:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('visn_are:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('visn_are:stopCarry')
AddEventHandler('visn_are:stopCarry', function(targetSrc)
	TriggerClientEvent('visn_are:stopCarry', source)
	TriggerClientEvent('visn_are:stopCarry', targetSrc)
end)

function savePlayers()
	Citizen.CreateThread(function()
		local start = os.time()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

			if playerData[xPlayer.source] ~= nil then
				MySQL.Async.execute('UPDATE `' .. ServerConfig.tableName .. '` SET `' .. ServerConfig.columnName .. '` = @healthData WHERE `' .. ServerConfig.identifierColumn .. '` = @identifier', {
					['@identifier'] = xPlayer.identifier,
					['@healthData'] = json.encode(playerData[xPlayer.source]),
				})
				Citizen.Wait(50)
			end
		end

		print("^3[Advanced Roleplay Environment] ^7Saved " .. #xPlayers .. " players. Time: " .. start - os.time() .. "ms")
		Citizen.Wait(ServerConfig.updateFrequency)
		savePlayers()
	end)
end

initLanguages()
print("^3[veryinsanee's Authentication] ^6Resource (Advanced Roleplay Environment) finished loading!")
-- Leaked By: Leaking Hub | J. Snow | leakinghub.com