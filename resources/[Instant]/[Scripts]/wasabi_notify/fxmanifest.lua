-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Wasabi Advanced Notification System'
author 'Wasabi Scripts'
version '1.0.6'

ui_page 'ui/index.html'
files { 'ui/*', 'ui/**/*' }

client_scripts { 'game/client/*.lua' }
server_script 'game/updater.lua'

shared_script 'config.lua'

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'