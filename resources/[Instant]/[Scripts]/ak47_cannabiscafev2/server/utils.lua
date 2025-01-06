ESX = ESX or nil
if ESX == nil then
	TriggerEvent(Config.SharedObjectName, function(obj) ESX = obj end)
end

TriggerEvent('esx_society:registerSociety', 'cannabiscafe', 'cannabiscafe', 'society_cannabiscafe', 'society_cannabiscafe', 'society_cannabiscafe', {type = 'private'})
TriggerEvent('society:registerSociety', 'cannabiscafe', 'cannabiscafe', 'society_cannabiscafe', 'society_cannabiscafe', 'society_cannabiscafe', {type = 'private'})

function getSocietyMoney()
	local money = nil
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cannabiscafe', function(account)
       money = account.money
    end)
    while money == nil do Citizen.Wait(0) end
    return money
end

function addSocietyMoney(money)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cannabiscafe', function(account)
       account.addMoney(money)
    end)
end

function removeSocietyMoney(money)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cannabiscafe', function(account)
       account.removeMoney(money)
    end)
end

function CanCarryItem(xPlayer, item, count)
	if Config.CheckCanCarryItem then
		if type(xPlayer.canCarryItem) == "table" or type(xPlayer.canCarryItem) == "function" then
	        return xPlayer.canCarryItem(item, count)
	    else
	    	local xItem = xPlayer.getInventoryItem(item)
	        if xItem.limit ~= -1 and (xItem.count + count) > xItem.limit then
	            return false
	        else
	            return true
	        end
	    end
	else
		return true
	end
end

function PlayerCanPay(xPlayer, price, payment)
    if payment == 'cash' then
        return xPlayer.getAccount('money').money >= price
    else
        return xPlayer.getAccount('bank').money >= price
    end
end

function PayTheBill(xPlayer, payment, price)
    if payment == 'cash' then
        xPlayer.removeMoney(price)
    else
        xPlayer.removeAccountMoney('bank', price)
    end
end

function GetItemLabel(item)
    local label = ESX.GetItemLabel(item)
    if label then
        return label
    else
        print("^1 Item: ^3["..item.."]^1 is Missing^0")
        return item
    end
end

RegisterServerEvent('ak47_cannabiscafev2:PlayWithinDistance')
AddEventHandler('ak47_cannabiscafev2:PlayWithinDistance', function(coords , maxDistance, soundFile)
    TriggerClientEvent('ak47_cannabiscafev2:PlayWithinDistance', -1, coords, maxDistance, soundFile)
end)