fx_version 'cerulean'
game 'gta5'

description 'made by MEENO'

lua54 'yes'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua',
	'locales/de.lua',
	'locales/tw.lua',
	'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
	'locales/de.lua',
	'locales/tw.lua',
	'locales/en.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

dependency {
	'es_extended',
	'esx_vehicleshop'
}