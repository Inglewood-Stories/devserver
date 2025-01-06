-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.PaymentAccount = 'bank' -- Payment account you want to pay from(For example; 'money', 'bank', 'black_money')

Config.ClothingShops = {

	{
		blip = {
			enabled = true, -- Blip enabled?
			sprite = 445,  -- The Blip type. List: https://docs.fivem.net/docs/game-references/blips/#blips
			color = 47, -- The Blip color. List: https://docs.fivem.net/docs/game-references/blips/#blip-colors
			scale = 1.0, -- Size of blip
			string = 'Kick Clothing Store'
		},
		coords = vec3(-886.8336, 1716.0961, 24.5551), -- Nike 1
		distance = 10, -- Distance to show text UI pormpt
		price = 120, -- Price to use this shop(False for free)
	},

	{
		blip = {
			enabled = true, 
			sprite = 445,  
			color = 47, 
			scale = 1.0, 
			string = 'Kick Clothing Store'
		},
		coords = vec3(3.2814, 777.0929, 14.8203), 
		distance = 10,    
		price = 120, 
	},
	
	{
		blip = {
			enabled = true, 
			sprite = 445,  
			color = 47, 
			scale = 1.0, 
			string = 'Kick Clothing Store'
		},
		coords = vec3(301.5474, 1232.4563, 14.6650), 
		distance = 10, 
		price = 120, 
	},

	{
		blip = {
			enabled = true, 
			sprite = 445,  
			color = 47, 
			scale = 1.0, 
			string = 'Kick Clothing Store'
		},
		coords = vec3(1407.5658, 630.5500, 32.5541), 
		distance = 10, 
		price = 120, 
	},

	{
		blip = {
			enabled = false, 
			sprite = 445,  
			color = 47, 
			scale = 1.0, 
			string = 'Gucci Store'
		},
		coords = vec3(66.4875, 1000.7334, 14.7679), 
		distance = 10, 
		price = 120, 
	},
	
}

Config.BarberShops = {

	{
		blip = {
			enabled = false, -- Blip enabled?
			sprite = 71, -- The Blip type. List: https://docs.fivem.net/docs/game-references/blips/#blips
			color = 47, -- The Blip color. List: https://docs.fivem.net/docs/game-references/blips/#blip-colors
			scale = 1.0, -- Size of blip
			string = 'Barber Shop'
		},
		coords = vec3(215.84042358398, 1161.9720458984, 14.68076133728), -- Coords of shop
		distance = 7, -- Distance to show text UI pormpt
		price = 50, -- Price to use this shop(False for free)
	},
	{
		blip = {
			enabled = false, -- Blip enabled?
			sprite = 71, -- The Blip type. List: https://docs.fivem.net/docs/game-references/blips/#blips
			color = 47, -- The Blip color. List: https://docs.fivem.net/docs/game-references/blips/#blip-colors
			scale = 1.0, -- Size of blip
			string = 'Barber Shop'
		},
		coords = vec3(-39.798286437988,927.06842041016,14.859013557434), -- Coords of shop
		distance = 7, -- Distance to show text UI pormpt
		price = 50, -- Price to use this shop(False for free)
	},

}

Config.TattooShops = {

	{
		blip = {
			enabled = true,
			sprite = 75, 
			color = 1, 
			scale = 0.9,
			string = 'Tattoo Shop'
		},
		coords = vec3(1-980.42718505859,1366.6340332031,19.863620758057), 
		distance = 4,
		price = 350,
	},

	

}

-- 	{
-- 		blip = {
-- 			enabled = true,
-- 			sprite = 75, 
-- 			color = 1, 
-- 			scale = 1.0,
-- 			string = 'Tattoo Shop'
-- 		},
-- 		coords = vec3(-1153.6, -1425.6, 4.9), 
-- 		distance = 7,
-- 		price = 350,
-- 	},

-- 	{
-- 		blip = {
-- 			enabled = true,
-- 			sprite = 75, 
-- 			color = 1, 
-- 			scale = 1.0,
-- 			string = 'Tattoo Shop'
-- 		},
-- 		coords = vec3(322.1, 180.4, 103.5), 
-- 		distance = 7,
-- 		price = 350,
-- 	},

-- 	{
-- 		blip = {
-- 			enabled = true,
-- 			sprite = 75, 
-- 			color = 1, 
-- 			scale = 1.0,
-- 			string = 'Tattoo Shop'
-- 		},
-- 		coords = vec3(-3170.0, 1075.0, 20.8), 
-- 		distance = 7,
-- 		price = 350,
-- 	},

-- 	{
-- 		blip = {
-- 			enabled = true,
-- 			sprite = 75, 
-- 			color = 1, 
-- 			scale = 1.0,
-- 			string = 'Tattoo Shop'
-- 		},
-- 		coords = vec3(1864.6, 3747.7, 33.0), 
-- 		distance = 7,
-- 		price = 350,
-- 	},

-- 	{
-- 		blip = {
-- 			enabled = true,
-- 			sprite = 75, 
-- 			color = 1, 
-- 			scale = 1.0,
-- 			string = 'Tattoo Shop'
-- 		},
-- 		coords = vec3(-293.7, 6200.0, 31.4), 
-- 		distance = 7,
-- 		price = 350,
-- 	},

-- }
-- --=========================================================
--		SOLUTION FOR INVISIBLE PLAYER
--=========================================================

Config.DefaultSkin = {
	["headOverlays"]={
		["eyebrows"]={["style"]=0,["color"]=0,["opacity"]=0},
		["makeUp"]={["style"]=0,["color"]=0,["opacity"]=0},
		["bodyBlemishes"]={["style"]=0,["color"]=0,["opacity"]=0},
		["blush"]={["style"]=0,["color"]=0,["opacity"]=0},
		["ageing"]={["style"]=0,["color"]=0,["opacity"]=0},
		["beard"]={["style"]=0,["color"]=0,["opacity"]=0},
		["moleAndFreckles"]={["style"]=0,["color"]=0,["opacity"]=0},
		["blemishes"]={["style"]=0,["color"]=0,["opacity"]=0},
		["chestHair"]={["style"]=0,["color"]=0,["opacity"]=0},
		["lipstick"]={["style"]=0,["color"]=0,["opacity"]=0},
		["sunDamage"]={["style"]=0,["color"]=0,["opacity"]=0},
		["complexion"]={["style"]=0,["color"]=0,["opacity"]=0}
	},
	["faceFeatures"]={
		["jawBoneWidth"]=0,
		["chinBoneLowering"]=0,
		["eyesOpening"]=0,
		["eyeBrownHigh"]=0,
		["jawBoneBackSize"]=0,
		["cheeksBoneHigh"]=0,
		["eyeBrownForward"]=0,
		["nosePeakHigh"]=0,
		["neckThickness"]=0,
		["nosePeakLowering"]=0,
		["chinBoneLenght"]=0,
		["noseWidth"]=0,
		["noseBoneHigh"]=0,
		["chinBoneSize"]=0,
		["nosePeakSize"]=0,
		["cheeksBoneWidth"]=0,
		["noseBoneTwist"]=0,
		["chinHole"]=0,
		["cheeksWidth"]=0,
		["lipsThickness"]=0
	},
	["headBlend"]={
		["shapeMix"]=0,
		["shapeSecond"]=0,
		["skinSecond"]=0,
		["shapeFirst"]=0,
		["skinMix"]=0,
		["skinFirst"]=0
	},
	["components"]={
		{["drawable"]=0,["texture"]=0,["component_id"]=0},
		{["drawable"]=0,["texture"]=0,["component_id"]=1},
		{["drawable"]=0,["texture"]=0,["component_id"]=2},
		{["drawable"]=0,["texture"]=0,["component_id"]=3},
		{["drawable"]=0,["texture"]=0,["component_id"]=4},
		{["drawable"]=0,["texture"]=0,["component_id"]=5},
		{["drawable"]=0,["texture"]=0,["component_id"]=6},
		{["drawable"]=0,["texture"]=0,["component_id"]=7},
		{["drawable"]=0,["texture"]=0,["component_id"]=8},
		{["drawable"]=0,["texture"]=0,["component_id"]=9},
		{["drawable"]=0,["texture"]=0,["component_id"]=10},
		{["drawable"]=0,["texture"]=0,["component_id"]=11}
	},
	["props"]={
		{["drawable"]=-1,["prop_id"]=1,["texture"]=-1},
		{["drawable"]=-1,["prop_id"]=2,["texture"]=-1},
		{["drawable"]=-1,["prop_id"]=6,["texture"]=-1},
		{["drawable"]=-1,["prop_id"]=7,["texture"]=-1},
		{["drawable"]=-1,["prop_id"]=0,["texture"]=-1}
	},
	["hair"]={
		["style"]=0,
		["highlight"]=0,
		["color"]=0
	},
	["tattoos"]={},
	["eyeColor"]=-1,
	["model"]="mp_m_freemode_01"
}
