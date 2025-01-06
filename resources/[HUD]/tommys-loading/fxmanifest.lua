fx_version 'cerulean'
game 'gta5'

description 'Tommy\'s Loading Screen'
version '1.0'

lua54 'yes'
client_script 'client.lua'

file 'config.js'
file 'index.html'
file 'loading_time_extension.js'
files { 'assets/*', 'images/*', }


escrow_ignore {
    'client.lua',
}

loadscreen { 'index.html' }
loadscreen_manual_shutdown 'yes'
dependency '/assetpacks'