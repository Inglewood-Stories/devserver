fx_version 'cerulean'
game 'gta5'

description 'Faction system for Project Reality'

lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua',
}

server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'configs/config.lua',
	'server/**/*.lua',
}

client_scripts {
  'configs/config.lua',
  'client/**/*.lua',
}

dependecies {
	'async',
	'mysql-async',
}