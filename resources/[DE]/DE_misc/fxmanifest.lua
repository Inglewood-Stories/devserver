fx_version 'adamant'
game 'gta5'

lua54 'yes'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@ox_lib/init.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
}

shared_scripts {
	'config.lua'
}

files {
	'data/weapons/weaponanimations.meta',
	'data/weapons/weapon*.meta'
}

data_file 'WEAPON_ANIMATIONS_FILE'  'data/weapons/weaponanimations.meta'
data_file 'WEAPONINFO_FILE'         'data/weapons/weapon*.meta'