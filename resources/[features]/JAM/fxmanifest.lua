fx_version 'cerulean'
game 'gta5'

client_scripts {
	-- Base
	'JAM_Main.lua',
	'JAM_Client.lua',
	'JAM_Utilities.lua',
	
	-- Vehicle Shop
	'JAM_VehicleShop/JAM_VehicleShop_Config.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Client.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Utils.lua',
}

server_scripts {	
	-- Base
	'JAM_Main.lua',
	'JAM_Server.lua',
	'JAM_Utilities.lua',

	-- MySQL
	'@mysql-async/lib/MySQL.lua',
	
	-- Vehicle Shop
	'JAM_VehicleShop/JAM_VehicleShop_Config.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Server.lua',
}