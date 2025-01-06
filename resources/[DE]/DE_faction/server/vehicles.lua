RegisterNetEvent('prrp_faction:car')
AddEventHandler('prrp_faction:car', function(target, type)
    if type == 'put' then
        TriggerClientEvent('prrp_faction:putInVehicle', target)
    elseif type == 'take' then
        TriggerClientEvent('prrp_faction:pulloutOfVehicle', target)
    end
end)