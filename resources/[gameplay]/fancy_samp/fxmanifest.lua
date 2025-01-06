
fx_version 'adamant'
lua54 'yes'
game 'gta5'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/*.lua'
}
client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/*.lua'
}

dependency 'es_extended'