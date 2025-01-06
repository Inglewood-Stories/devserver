Config = {}

Config.VehicleSpawnLocation = {
    {Cordenadas = vector3(458.1, -1017.28, 28.26 - 0.99), h = 90.22}  ---- npc spawn location
}

Config.VehicleSpawnLocationEMS = {
    {Cordenadas = vector3(333.28, -564.51, 28.8 - 0.99), h = 154.58}  ---- npc spawn location
}

Config.NPC = 's_m_y_cop_01'
Config.NPCEMS = 's_m_y_airworker'

Config.SpawnVehicle = {
	{coords = vector3(442.42, -1021.51, 28.56), heading = 94.59}
}

Config.SpawnVehicleEMS = {
	{coords = vector3(326.86, -568.94, 28.79), heading = 339.44}
}

Config.AuthorizedVehicles = {
	recruit = {
		{model = 'pdcvpi', label = 'Ford Crown Victoria'},
		{model = 'pdimpala', label = 'Chevrolet Impala'},
		{model = 'pdtaurus', label = 'Ford Taurus'}
	},

	officer = {
		{model = 'pdcvpi', label = 'Ford Crown Victoria'},
		{model = 'pdimpala', label = 'Chevrolet Impala'},
		{model = 'pdcharger', label = 'Dodge Charger'}
	},

	sergeant = {
		{model = 'pdcvpi', label = 'Ford Crown Victoria'},
		{model = 'pdimpala', label = 'Chevrolet Impala'},
		{model = 'pdcharger', label = 'Dodge Charger'},
		{model = 'pdfpiu', label = 'Ford Explorer'},
		{model = 'um10sho', label = 'Unmarked 2010 Ford SHO'},
		{model = 'um14charger', label = 'Unmarked 2014 Dodge Charger'}
	},

	lieutenant = {
		{model = 'pdcvpi', label = 'Ford Crown Victoria'},
		{model = 'pdimpala', label = 'Chevrolet Impala'},
		{model = 'pdcharger', label = 'Dodge Charger'},
		{model = 'pdfpiu', label = 'Ford Explorer'},
		{model = 'pdtahoe', label = 'Chevrolet Tahoe'},
		{model = 'um10sho', label = 'Unmarked 2010 Ford SHO'},
		{model = 'um14charger', label = 'Unmarked 2014 Dodge Charger'},
		{model = 'um14ss', label = 'Unmarked 2014 Chevrolet SS'}
	},

	boss = {
		{model = 'pdcvpi', label = 'Ford Crown Victoria'},
		{model = 'pdimpala', label = 'Chevrolet Impala'},
		{model = 'pdcharger', label = 'Dodge Charger'},
		{model = 'pdfpiu', label = 'Ford Explorer'},
		{model = 'pdtahoe', label = 'Chevrolet Tahoe'},
		{model = 'pdtruck', label = 'Ford F150'},
		{model = 'um14charger', label = 'Unmarked 2014 Dodge Charger'},
		{model = 'um16tahoe', label = 'Unmarked 2016 Chevrolet Tahoe'},
		{model = 'um20ram', label = 'Unmarked 2020 Dodge Ram'}
	}
}

Config.AuthorizedVehiclesEMS = {
	ambulance = {
		{model = 'ambulance', label = 'Ambulance Truck'}
	},

	doctor = {
		{model = 'ambulance', label = 'Ambulance Truck'}
	},

	chief_doctor = {
		{model = 'ambulance', label = 'Ambulance Truck'}
	},

	boss = {
		{model = 'ambulance', label = 'Ambulance Truck'}
	}
}

Config.WhitelistedJobs = {
	"police",
	"ambulance"
}

Config.Invincible = true -- Is the ped going to be invincible?

Config.Frozen = true -- Is the ped frozen in place?

Config.Stoic = true -- Will the ped react to events around them?

Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)

Config.DistanceSpawn = 6.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.GenderNumbers = {
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	-- 24/7 Markets
    {
        model = `mp_m_shopkeep_01`,
        coords = vector4(24.5, -1347.31, 29.5, 271.67),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-46.71, -1758.0, 29.42, 44.28),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(1164.85, -322.67, 69.21, 98.2),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-706.08, -913.6, 19.22, 90.47),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-1820.028, 794.34, 138.09, 131.95),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-3038.96, 584.57, 7.91, 19.54),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-3242.29, 1000.01, 12.83, 353.55),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(549.06, 2671.32, 42.16, 96.29),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(2678.05, 3279.43, 55.24, 330.19),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(1960.12, 3740.01, 32.34, 301.97),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(1698.05, 4922.96, 42.06, 328.62),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(1727.87, 6415.23, 35.04, 243.08),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(2557.19, 380.85, 108.62, 1.61),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-1422.37, -271.12, 46.28, 39.47),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(-548.53, -582.89, 34.68, 179.0),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(169.42, -1547.76, 29.26, 130.66),
		gender = 'male'
    },
	{
        model = `mp_m_shopkeep_01`,
        coords = vector4(812.67, -782.35, 26.17, 268.37),
		gender = 'male'
    },
	{
        model = `a_m_y_indian_01`,
        coords = vector4(48.30, -1476.02, 29.30, 322.74),
		gender = 'male'
    },
	-- Liquor Stores
	{
		model = `cs_joeminuteman`,
		coords = vector4(-2966.46, 390.81, 15.04, 83.71), --  Topanga Canyon Liquor Store
		gender = 'female'
	},
	{
		model = `cs_joeminuteman`,
		coords = vector4(-1486.23, -378.04, 40.16, 134.02), --  Westwood Liquor Store
		gender = 'female'
	},
	{
		model = `cs_joeminuteman`,
		coords = vector4(-1221.99, -908.29, 12.33, 31.07), --  Venice Canals Liquor Store
		gender = 'female'
	},
	{
		model = `cs_joeminuteman`,
		coords = vector4(1134.24, -982.42, 46.42, 278.95), --  Boyle Heights Liquor Store 
		gender = 'female'
	},
	{
		model = `cs_joeminuteman`,
		coords = vector4(1165.9, 2710.88, 38.16, 176.93), --  Boyle Heights Liquor Store 
		gender = 'female'
	},
	{
		model = `cs_joeminuteman`,
		coords = vector4(1392.9, 3606.41, 34.98, 194.94), --  Boyle Heights Liquor Store 
		gender = 'female'
	},
	{
        model = `cs_joeminuteman`,
        coords = vector4(-15.81, -1477.95, 30.64, 93.84),
		gender = 'male'
    },
	{
        model = `cs_joeminuteman`,
        coords = vector4(229.48, -1750.42, 29.25, 29.4),
		gender = 'male'
    },
	{
        model = `cs_joeminuteman`,
        coords = vector4(-6.26, -1822.73, 25.34, 142.05),
		gender = 'male'
    },
	{
		model = `cs_milton`,
		coords = vector4(-1391.71, -605.58, 30.32, 119.87), --  Boyle Heights Liquor Store
		gender = 'female'
	},
	{
		model = `cs_milton`,
		coords = vector4(746.96, -541.18, 28.65, 225.33), --  Boyle Heights Liquor Store
		gender = 'female'
	},
	{
		model = `cs_milton`,
		coords = vector4(129.54, -1284.1, 29.27, 115.17), --  Boyle Heights Liquor Store
		gender = 'female'
	},
	-- Phone Store
	{
		model = `s_m_m_lifeinvad_01`,
		coords = vector4(-527.5, -582.63, 34.68, 176.69),
		gender = 'female'
	},
	-- McDonalds
	{
		model = `mp_f_meth_01`,
		coords = vector4(281.61, -978.84, 29.43, 357.44),
		gender = 'female'
	},
	-- Wingstop
	{
		model = `mp_f_meth_01`,
		coords = vector4(1251.96, -353.61, 69.18, 166.94),
		gender = 'female'
	},
	-- Police armory
	{
		model = `s_m_y_cop_01`,
		coords = vector4(482.59, -995.31, 30.69, 179.74),
		gender = 'female'
	},
	-- Paramedic locker
	{
		model = `s_f_y_scrubs_01`,
		coords = vector4(306.4, -601.6, 43.28, 335.93),
		gender = 'female'
	},
	-- Medicine cabinet
	{
		model = `s_f_y_scrubs_01`,
		coords = vector4(308.97, -562.43, 43.28, 248.44),
		gender = 'female'
	},
}

Config.Elevators = {
  Pillbox = {
    garage_up = vector4(332.0568, -595.6395, 43.2841, 67.3264),
    garage_down = vector4(341.5111, -581.0013, 28.7968, 71.1276),

    helipad_up = vector4(339.0253, -584.1249, 74.1617, 261.3937),
    helipad_down = vector4(327.1117, -603.7762, 43.2841, 159.6370) 
  },
}

Config.Clear = {
	'WEAPON_NIGHTSTICK',
	'WEAPON_FLASHLIGHT',
	'WEAPON_STUNGUN',
	'WEAPON_PISTOL_MK2',
	'WEAPON_PUMPSHOTGUN_MK2',
	'WEAPON_CARBINERIFLE_MK2',
	'ammo-9',
	'ammo-shotgun',
	'ammo-rifle',
	'radio'
}