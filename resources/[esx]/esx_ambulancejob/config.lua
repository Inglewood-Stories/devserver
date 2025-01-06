Config                            = {}

Config.DrawDistance               = 20.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).

Config.Marker                     = {type = 27, x = 1.0, y = 1.0, z = 1.0, r = 255, g = 255, b = 255, a = 100, rotate = false}

Config.ReviveReward               = 25  -- Revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- Enable anti-combat logging? (Removes Items when a player logs back after intentionally logging out while dead.)

Config.Locale                     = 'en'

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveItemsAfterRPDeath    = true

Config.RespawnPoint = {coords = vector3(309.26, -588.6, 43.26), heading = 65.82}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(299.63, -584.72, 43.26),
			sprite = 61,
			scale  = 0.5,
			color  = 2
		},

		AmbulanceActions = {
			vector3(334.67, -593.0, 43.28 - 0.99)
		},

		Pharmacies = {
			vector3(230.1, -1366.1, -38.5)
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.Framework = 'esx'
Config.MaxDamageLines = 7
Config.AllowClearDamages = true

Config.Ignore = {
	'WEAPON_UNARMED',
    'WEAPON_FISTS',
    'WEAPON_RUN_OVER_BY_CAR',
    'WEAPON_RAMMED_BY_CAR',
}

Config.MeleeWeapons = {
	'WEAPON_KNIFE',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_CROWBAR',
    'WEAPON_GOLFCLUB',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_KNUCKLEDUSTER',
    'WEAPON_MACHETE',
    'WEAPON_FLASHLIGHT',
    'WEAPON_SWITCHBLADE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_BATTLEAXE',
}

function GetPlayer(src)
	if Config.Framework == 'esx' then
		return ESX.GetPlayerFromId(src).getName()
	elseif Config.Framework == 'qbcore' then
		return exports['qb-core']:GetCoreObject().Functions.getfirst
    elseif Config.Framework == 'standalone' then
        return GetPlayerName(src)
	end
end

function isIgnoredWeapon(hash)
	for i = 1, #Config.Ignore do
		local weapon = GetHashKey(Config.Ignore[i])
		if (weapon == hash) then
			return true
		end
	end
	return false
end

function isMeleeWeapon(hash)
	for i = 1, #Config.MeleeWeapons do
		local weapon = GetHashKey(Config.MeleeWeapons[i])
		if (weapon == hash) then
			return true
		end
	end
	return false
end

function Message(data, playerId, target, type) -- You can edit to how your Chat-theme-civ works.
    if type == 1 then
        if data.fatal == true then
			TriggerClientEvent('chat:addMessage', playerId, {
				template = '<div style="color: rgba(255, 255, 255, 1); width: fit-content; max-width: 100%; word-break: break-word;"> {0} </div>',
				args = { data.damage .. ' dmg from ' .. data.weapon .. ' to ' .. data.bone .. ' from ' .. data.distance .. ' meters(s) (Fatal: Yes) at ' .. data.time }
			})
		elseif data.fatal == false then
			TriggerClientEvent('chat:addMessage', playerId, {
				template = '<div style="color: rgba(255, 255, 255, 1); width: fit-content; max-width: 100%; word-break: break-word;"> {0} </div>',
				args = { data.damage .. ' dmg from ' .. data.weapon .. ' to ' .. data.bone .. ' from ' .. data.distance .. ' meters(s) (Fatal: No) at ' .. data.time }
			})
		end
    elseif type == 2 then
        TriggerClientEvent('chat:addMessage', playerId, {
			template = '<div style="color: rgba(255, 255, 255, 1); width: fit-content; max-width: 100%; word-break: break-word;"> Nothing to show </div>',
			args = {}
		})
    elseif type == 3 then
        TriggerClientEvent('chat:addMessage', playerId, { 
            template = '<div style="color: rgba(255, 99, 71, 1); width: fit-content; max-width: 100%; word-break: break-word;"> {0} damages: </div>', 
            args = { GetPlayer(target) } 
        })
    end
end

Config.bodyParts = {
    [11816] = {["part"] = "Pelvis", ["boneIndex"] = 11816},
    [58271] = {["part"] = "Left Thigh", ["boneIndex"] = 58271},
    [47495] = {["part"] = "Mouth", ["boneIndex"] = 47495},
    [14201] = {["part"] = "Left Foot", ["boneIndex"] = 14201},
    [46078] = {["part"] = "Left Knee", ["boneIndex"] = 46078},
    [51826] = {["part"] = "Right Thigh", ["boneIndex"] = 51826},
    [24816] = {["part"] = "Spine", ["boneIndex"] = 24816},
    [52301] = {["part"] = "Right Foot", ["boneIndex"] = 52301},
    [16335] = {["part"] = "Right Knee", ["boneIndex"] = 16335},
    [24817] = {["part"] = "Spine", ["boneIndex"] = 24817},
    [60309] = {["part"] = "Left Hand", ["boneIndex"] = 60309},
    [22711] = {["part"] = "Left Elbow", ["boneIndex"] = 22711},
    [57005] = {["part"] = "Right Hand", ["boneIndex"] = 57005},
    [2992] = {["part"] = "Right Elbow", ["boneIndex"] = 2992},
    [39317] = {["part"] = "Neck", ["boneIndex"] = 39317},
    [31086] = {["part"] = "Head", ["boneIndex"] = 31086},
    [24818] = {["part"] = "Spine", ["boneIndex"] = 24818},
    [64729] = {["part"] = "Left Clavicle", ["boneIndex"] = 64729},
    [26610] = {["part"] = "Left Finger Pinky", ["boneIndex"] = 26610},
    [26611] = {["part"] = "Left Finger Index", ["boneIndex"] = 26611},
    [26612] = {["part"] = "Left Finger Middle", ["boneIndex"] = 26612},
    [26613] = {["part"] = "Left Finger Ring", ["boneIndex"] = 26613},
    [26614] = {["part"] = "Left Finger Thumb", ["boneIndex"] = 26614},
    [10706] = {["part"] = "Right Clavicle", ["boneIndex"] = 10706},
    [58866] = {["part"] = "Right Finger Pinky", ["boneIndex"] = 58866},
    [58867] = {["part"] = "Right Finger Index", ["boneIndex"] = 58867},
    [58868] = {["part"] = "Right Finger Middle", ["boneIndex"] = 58868},
    [58869] = {["part"] = "Right Finger Ring", ["boneIndex"] = 58869},
    [58870] = {["part"] = "Right Finger Thumb", ["boneIndex"] = 58870},
    [21550] = {["part"] = "Face Left CheekBone", ["boneIndex"] = 21550},
    [19336] = {["part"] = "Face Right CheekBone", ["boneIndex"] = 19336},
    [37193] = {["part"] = "Forehead", ["boneIndex"] = 37193},
    [61839] = {["part"] = "Face UpperLip", ["boneIndex"] = 61839},
    [20623] = {["part"] = "Face LowerLip", ["boneIndex"] = 20623},
}

Config.plyWeapons = {
    [tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
    [tostring(GetHashKey('WEAPON_KNIFE'))] = 'Knife',
    [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'Nightstick',
    [tostring(GetHashKey('WEAPON_HAMMER'))] = 'Hammer',
    [tostring(GetHashKey('WEAPON_BAT'))] = 'Baseball Bat',
    [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'Golf Club',
    [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'Crowbar',
    [tostring(GetHashKey('WEAPON_PISTOL'))] = 'Pistol',
    [tostring(GetHashKey('WEAPON_PISTOL_MK2'))] = 'Pistol Mk II',
    [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'Combat Pistol',
    [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'AP Pistol',
    [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'Pistol .50',
    [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'Micro SMG',
    [tostring(GetHashKey('WEAPON_SMG'))] = 'SMG',
    [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'Assault SMG',
    [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'Assault Rifle',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'Carbine Rifle',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE_MK2'))] = 'Carbine Rifle Mk II',
    [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'Advanced Rifle',
    [tostring(GetHashKey('WEAPON_MG'))] = 'MG',
    [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'Combat MG',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'Pump Shotgun',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN_MK2'))] = 'Pump Shotgun Mk II',
    [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'Sawed-Off Shotgun',
    [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'Assault Shotgun',
    [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'Bullpup Shotgun',
    [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'Stun Gun',
    [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'Sniper Rifle',
    [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'Heavy Sniper',
    [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'Remote Sniper',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'Grenade Launcher',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'Smoke Grenade Launcher',
    [tostring(GetHashKey('WEAPON_RPG'))] = 'RPG',
    [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'Passenger Rocket',
    [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'Airstrike Rocket',
    [tostring(GetHashKey('WEAPON_STINGER'))] = 'Stinger [Vehicle]',
    [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'Minigun',
    [tostring(GetHashKey('WEAPON_GRENADE'))] = 'Grenade',
    [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'Sticky Bomb',
    [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'Tear Gas',
    [tostring(GetHashKey('WEAPON_BZGAS'))] = 'BZ Gas',
    [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'Molotov',
    [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'Fire Extinguisher',
    [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'Jerry Can',
    [tostring(GetHashKey('OBJECT'))] = 'Object',
    [tostring(GetHashKey('WEAPON_BALL'))] = 'Ball',
    [tostring(GetHashKey('WEAPON_FLARE'))] = 'Flare',
    [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'Tank Cannon',
    [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Rockets',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'Laser',
    [tostring(GetHashKey('AMMO_RPG'))] = 'Rocket',
    [tostring(GetHashKey('AMMO_TANK'))] = 'Tank',
    [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'Rocket',
    [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'Laser',
    [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'Laser',
    [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'Rammed by Car',
    [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'Bottle',
    [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'Gusenberg Sweeper',
    [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'SNS Pistol',
    [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'Vintage Pistol',
    [tostring(GetHashKey('WEAPON_DAGGER'))] = 'Antique Cavalry Dagger',
    [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'Flare Gun',
    [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'Heavy Pistol',
    [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'Special Carbine',
    [tostring(GetHashKey('WEAPON_MUSKET'))] = 'Musket',
    [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'Firework Launcher',
    [tostring(GetHashKey('WEAPON_CERAMICPISTOL'))] = 'Ceramic Pistol',
    [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'Marksman Rifle',
    [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'Heavy Shotgun',
    [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'Proximity Mine',
    [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'Homing Launcher',
    [tostring(GetHashKey('WEAPON_HATCHET'))] = 'Hatchet',
    [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'Combat PDW',
    [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'Knuckle Duster',
    [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'Marksman Pistol',
    [tostring(GetHashKey('WEAPON_MACHETE'))] = 'Machete',
    [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'Machine Pistol',
    [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'Flashlight',
    [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'Double Barrel Shotgun',
    [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'Compact Rifle',
    [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'Switchblade',
    [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'Heavy Revolver',
    [tostring(GetHashKey('WEAPON_FIRE'))] = 'Fire',
    [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'Heli Crash',
    [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'Run over by Car',
    [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'Hit by Water Cannon',
    [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'Exhaustion',
    [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'Explosion',
    [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'Electric Fence',
    [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'Bleeding',
    [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'Drowning in Vehicle',
    [tostring(GetHashKey('WEAPON_DROWNING'))] = 'Drowning',
    [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'Barbed Wire',
    [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'Vehicle Rocket',
    [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'Bullpup Rifle',
    [tostring(GetHashKey('WEAPON_ASSAULTSNIPER'))] = 'Assault Sniper',
    [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'Rotors',
    [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'Railgun',
    [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'Air Defence Gun',
    [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'Automatic Shotgun',
    [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'Battle Axe',
    [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'Compact Grenade Launcher',
    [tostring(GetHashKey('WEAPON_MINISMG'))] = 'Mini SMG',
    [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'Pipebomb',
    [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'Poolcue',
    [tostring(GetHashKey('WEAPON_WRENCH'))] = 'Wrench',
    [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'Snowball',
    [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'Animal',
    [tostring(GetHashKey('WEAPON_COUGAR'))] = 'Cougar'
}
