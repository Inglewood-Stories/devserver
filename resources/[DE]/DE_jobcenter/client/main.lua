ESX              = nil
local PlayerData = {}
local pedspawneado = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local JobCenterCoords = {
    {-118.14, -607.09, 36.28}
}

---- npc spawn

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.ubicacion) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			
			if dist < 11 and pedspawneado == false then
				TriggerEvent('Night:npcenter',v.Cordenadas,v.h)
				pedspawneado = true
			end
			if dist >= 10  then
				pedspawneado = false
                SetEntityAlpha(tunpc, 1, false)
				DeletePed(tunpc)
			end
		end
	end
end)

RegisterNetEvent('Night:npcenter')
AddEventHandler('Night:npcenter',function(coords,heading)
	local hash = GetHashKey(Config.npc)  --- change the npc to your liking
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b")  ---- change the npc animation
	while not TaskPlayAnim(tunpc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

exports['qtarget']:AddBoxZone("jobcenter", vector3(-139.34, -632.25, 168.82), 31.6, 26.8, {
    name= "jobcenter",
    heading= 187.48,
    debugPoly= false,
    minZ= 168.0,
    maxZ= 170.0,
    }, {
    options = {
        {
            event = 'Night:jobchoose',
            icon = "fas fa-university",
            label = "View Job Offerings",
        },
    },
    distance = 3.5
})

RegisterNetEvent('Night:jobchoose')
AddEventHandler('Night:jobchoose', function()
	local jobs = {}
    for k,v in pairs(Config.jobs) do
        table.insert(jobs, {
            header = v.label,
            context = '',
            event = 'Night:jobCenter2',
            args = { v.nombre, v.grado }
        })
    end
    TriggerEvent('nh-context:createMenu', jobs)
end)

RegisterNetEvent('Night:jobCenter2')
AddEventHandler('Night:jobCenter2', function(name, grade)

    TriggerServerEvent('Night:setjob', name, grade)

    for k,v in pairs (Config.Blacklistedjobs) do
        print(v)
        if name == v then 
            TriggerServerEvent('Night:drop','good luck next time bud') 
        end
    end

    if name == 'unemployed' then
        notify('You are now unemployed')
    elseif name == 'garbage' then
        notify('You have been hired as a garbage collector') 
    else
        notify('You are hired') 
    end 
end)

function notify(mensaje)
    if Config.notitype == 'esx' then
        ESX.ShowNotification(mensaje)
    elseif Config.notitype == 'ox_lib' then
        lib.notify({ type = 'inform', description = mensaje })
    end
end

Citizen.CreateThread(function()
    for i = 1, #JobCenterCoords do
        coordJob = JobCenterCoords[i]
        local blip = AddBlipForCoord(coordJob[1], coordJob[2], coordJob[3])

        SetBlipSprite (blip, 525)
		SetBlipScale  (blip, 0.5)
		SetBlipColour (blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Job Center')
		EndTextCommandSetBlipName(blip)
	end
end)
