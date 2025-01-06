RegisterNetEvent('duty:offpd')
AddEventHandler('duty:offpd', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'police' and xPlayer.job.name ~= 'offpolice' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this' })
    elseif xPlayer.job.name ~= 'police' and xPlayer.job.name == 'offpolice' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You are already off duty' })
    else
        if xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
            xPlayer.setJob('offpolice', 0)
        elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
            xPlayer.setJob('offpolice', 1)
        elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
            xPlayer.setJob('offpolice', 2)
        elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
            xPlayer.setJob('offpolice', 3)
        elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
            xPlayer.setJob('offpolice', 4)
        end
        TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have went off-duty' })
    end
end)

RegisterNetEvent('duty:onpd')
AddEventHandler('duty:onpd', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'police' and xPlayer.job.name ~= 'offpolice' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this' })
    elseif xPlayer.job.name ~= 'offpolice' and xPlayer.job.name == 'police' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You are already on duty' })
    else
        if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
            xPlayer.setJob('police', 0)
        elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
            xPlayer.setJob('police', 1)
        elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
            xPlayer.setJob('police', 2)
        elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
            xPlayer.setJob('police', 3)
        elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
            xPlayer.setJob('police', 4)
        end
        TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have went on-duty' })
    end
end)

RegisterNetEvent('duty:offfd')
AddEventHandler('duty:offfd', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'ambulance' and xPlayer.job.name ~= 'offambulance' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this' })
    elseif xPlayer.job.name ~= 'ambulance' and xPlayer.job.name == 'offambulance' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You are already off duty' })
    else
        if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
            xPlayer.setJob('offambulance', 0)
        elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
            xPlayer.setJob('offambulance', 1)
        elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
            xPlayer.setJob('offambulance', 2)
        elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
            xPlayer.setJob('offambulance', 3)
        end
        TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have went off-duty' })
    end
end)

RegisterNetEvent('duty:onfd')
AddEventHandler('duty:onfd', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name ~= 'ambulance' and xPlayer.job.name ~= 'offambulance' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You don\'t have access to this' })
    elseif xPlayer.job.name ~= 'offambulance' and xPlayer.job.name == 'ambulance' then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'You are already on duty' })
    else
        if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
            xPlayer.setJob('ambulance', 0)
        elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
            xPlayer.setJob('ambulance', 1)
        elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
            xPlayer.setJob('ambulance', 2)
        elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
            xPlayer.setJob('ambulance', 3)
        end
        TriggerClientEvent('ox_lib:notify', source, { type = 'inform', description = 'You have went on-duty' })
    end
end)