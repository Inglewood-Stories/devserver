JAM.VehicleShop = {}
local JVS = JAM.VehicleShop
JVS.ESX = JAM.ESX

JVS.DrawTextDist = 4.0
JVS.MenuUseDist = 3.0
JVS.SpawnVehDist = 50.0
JVS.VehRetDist = 5.0

JVS.CarDealerJobLabel = "cardealer"
JVS.DealerMarkerPos = vector3(-33.79, -1101.7, 25.30)

-- Why vector4's, you ask?
-- X, Y, Z, Heading.

JVS.PurchasedCarPos = vector4(-31.06, -1090.79, 26.42, 340.0)
JVS.PurchasedUtilPos = vector4(-17.88, -1113.94, 26.67, 158.04)

JVS.SmallSpawnVeh = 'sultan'
JVS.SmallSpawnPos = vector4(-52.08, -1095.08, 25.98, 203.66)

JVS.LargeSpawnVeh = 'towtruck'
JVS.LargeSpawnPos = vector4(-18.57, -1103.14, 26.67, 159.95)

JVS.DisplayPositions = {
	[1] = vector4(-48.75, -1100.55, 25.42, 14.82),
	[2] = vector4(-41.24, -1102.21, 25.42, 5.41),
	[3] = vector4(-36.72, -1098.15, 25.42, 101.16),
	[4] = vector4(-45.2, -1094.01, 25.42, 154.2),
	[5] = vector4(-45.39, -1100.96, 25.42, 2.08)
}

JVS.Blips = {
	CityShop = {
		Zone = "Porter Deluxe Motorsports",
		Sprite = 225,
		Scale = 0.5,
		Display = 4,
		Color = 4,
		Pos = { x = -54.02, y = -1110.43, z = 28.00 },
	},
}
