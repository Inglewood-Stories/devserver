-------------------------------------------------------------------------------
-- Chat Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/ooc', 'A global out of character chat.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
})
TriggerEvent('chat:addSuggestion', '/aooc', 'A global out of character chat for staff.', { 
    { name = 'message', help = 'Message you wish to send. ' } 
})
TriggerEvent('chat:addSuggestion', '/me', 'Displays an action or emote your character is performing.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
})
TriggerEvent('chat:addSuggestion', '/my', 'Displays an action or emote your character is performing but instead you get the Firstname Lastname\'s prefix.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
})
TriggerEvent('chat:addSuggestion', '/do', 'Used if you want to ask something roleplay wise or something that can\'t begin with your character name.', { 
    { name = 'action', help = 'Action you wish to send. ' } 
})
TriggerEvent('chat:addSuggestion', '/revive', 'Revive someone back to life.', { 
    { name = 'id', help = 'The id of the specified person you wish to revive. ' } 
})
TriggerEvent('chat:addSuggestion', '/wallet', 'Check how much cash you have in your pockets', {})
TriggerEvent('chat:addSuggestion', '/job', 'Shows what job you have.', {})
TriggerEvent('chat:addSuggestion', '/togglepm', 'Toggle your Private Messages.', {})
TriggerEvent('chat:addSuggestion', '/smode', 'Streamer Mode for Staff.', {})
-------------------------------------------------------------------------------
-- Player Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/report', 'Send a report against another player to online administrators.', { 
    { name = 'action', help = 'Details about the report.' } 
})
TriggerEvent('chat:addSuggestion', '/dice', 'Roll a pair of dice.', { 
    { name = 'action', help = 'Dice pair number 1-3.' } 
})
TriggerEvent('chat:addSuggestion', '/closeticket', 'Close your report.', {})
TriggerEvent('chat:addSuggestion', '/id', 'Check your server ID.', {})
TriggerEvent('chat:addSuggestion', '/pm', 'Send a private message to the specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to message.' },
    { name = 'message', help = 'Message you wish to send the person.'} 
})
-------------------------------------------------------------------------------
-- Police Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/jail', 'Sends a player off to prison for a specified amount of time.', {
    { name = 'id', help = 'The id of the specified person you wish to jail.'},
    { name = 'time', help = 'The amount of time you wish to jail the person for.'}
})
TriggerEvent('chat:addSuggestion', '/fsv', 'Spawn a emergency vehicle.', {
    { name = 'id', help = 'The id of the vehicle you want to spawn. (1-13).'}
})
TriggerEvent('chat:addSuggestion', '/fcolors', 'Vehicle Tints.', {})
TriggerEvent('chat:addSuggestion', '/fclean', 'Clean Vehicle.', {})
TriggerEvent('chat:addSuggestion', '/fcolorcombinations', 'Vehicle Color Combinations.', {})
TriggerEvent('chat:addSuggestion', '/911', 'What is your emergency?', {
    { name = 'message', help = 'The emergency you wish to state.'}
})

TriggerEvent('chat:addSuggestion', '/fimpound', 'Impound a vehicle that is unoccupied.', {})

TriggerEvent('chat:addSuggestion', '/register', 'Register your name to the MDT database.', {})

TriggerEvent('chat:addSuggestion', '/mdt', 'Opens the police department MDT.', {})
TriggerEvent('chat:addSuggestion', '/ambulance', 'Opens the ambulance MDT.', {})

-------------------------------------------------------------------------------
-- Staff Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/noclip', 'Enable and disable noclip.', {})

TriggerEvent('chat:addSuggestion', '/announce', 'Send a announcement to all users', { 
    { name = 'action', help = 'Details about the announcement' } 
})

TriggerEvent('chat:addSuggestion', '/sc', 'Send a message to administrators and testers.', { 
    { name = 'action', help = 'Details about the message.' } 
})

TriggerEvent('chat:addSuggestion', '/forceskin', 'Enables skin menu.', {
    { name = 'id', help = 'The id of the specified person you wish to grant the menu.'}
})
TriggerEvent('chat:addSuggestion', '/givelicense', 'Grant a license to a specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to grant a license to.' },
    { name = 'licenseType', help = 'Type of license you want to grant.'} 
})
TriggerEvent('chat:addSuggestion', '/removelicense', 'Remove a license from a specified person.', { 
    { name = 'id', help = 'The id of the specified person you wish to remove a license from.' },
    { name = 'licenseType', help = 'Type of license you want to remove.'} 
})

TriggerEvent('chat:addSuggestion', '/cw', 'Car whisper.', {})

TriggerEvent('chat:addSuggestion', '/carwhisper', 'Car whisper.', {})

TriggerEvent('chat:addSuggestion', '/l', 'Talk low.', {})

TriggerEvent('chat:addSuggestion', '/low', 'Talk low.', {})

TriggerEvent('chat:addSuggestion', '/s', 'Say.', {})

TriggerEvent('chat:addSuggestion', '/say', 'Say.', {})

TriggerEvent('chat:addSuggestion', '/sh', 'Shout.', {})

TriggerEvent('chat:addSuggestion', '/shout', 'Shout.', {})

TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport to a waypoint.', {})

TriggerEvent('chat:addSuggestion', '/togooc', 'Enable or disable OOC chat.', {})

TriggerEvent('chat:addSuggestion', '/kick', 'Removes a specified person from the server.', {
    { name = 'id', help = 'The id of the specified person you wish to remove.'},
    { name = 'reason', help = 'The reason you wish to remove the specified person.'}
})
---------------------------------------------------------------------------------------------
-- Credits to Middlestonkz (https://github.com/MiddleSkillz)
-- Unregisters all of the default FiveM commands from chat.

TriggerEvent('chat:removeSuggestion', '/adhesive_cdnKey')
TriggerEvent('chat:removeSuggestion', '/forcelog')
TriggerEvent('chat:removeSuggestion', '/alert_dead')
TriggerEvent('chat:removeSuggestion', '/alert_gps')
TriggerEvent('chat:removeSuggestion', '/alarm_off')
TriggerEvent('chat:removeSuggestion', '/alarm_on')
TriggerEvent('chat:removeSuggestion', '/banner_connecting')
TriggerEvent('chat:removeSuggestion', '/banner_detail')
TriggerEvent('chat:removeSuggestion', '/citizen_dir')
TriggerEvent('chat:removeSuggestion', '/cs')
TriggerEvent('chat:removeSuggestion', '/csa')
TriggerEvent('chat:removeSuggestion', '/csj')
TriggerEvent('chat:removeSuggestion', '/cslap')
TriggerEvent('chat:removeSuggestion', '/csm')
TriggerEvent('chat:removeSuggestion', '/csi')
TriggerEvent('chat:removeSuggestion', '/csnipe')
TriggerEvent('chat:removeSuggestion', '/csped')
TriggerEvent('chat:removeSuggestion', '/cstrip')
TriggerEvent('chat:removeSuggestion', '/cmdlist')
TriggerEvent('chat:removeSuggestion', '/con_disableNonTTYReads')
TriggerEvent('chat:removeSuggestion', '/Discord')
TriggerEvent('chat:removeSuggestion', '/endpoint_add_tcp')
TriggerEvent('chat:removeSuggestion', '/endpoint_add_udp')
TriggerEvent('chat:removeSuggestion', '/ensure')
TriggerEvent('chat:removeSuggestion', '/exec')
TriggerEvent('chat:removeSuggestion', '/fileserver_add')
TriggerEvent('chat:removeSuggestion', '/fileserver_list')
TriggerEvent('chat:removeSuggestion', '/fileserver_remove')
TriggerEvent('chat:removeSuggestion', '/gamename')
TriggerEvent('chat:removeSuggestion', '/gametype')
TriggerEvent('chat:removeSuggestion', '/heartbeat')
TriggerEvent('chat:removeSuggestion', '/load_server_icon')
TriggerEvent('chat:removeSuggestion', '/locale')
TriggerEvent('chat:removeSuggestion', '/mapname')
TriggerEvent('chat:removeSuggestion', '/net_tcpConnLimit')
TriggerEvent('chat:removeSuggestion', '/netlib')
TriggerEvent('chat:removeSuggestion', '/netPort')
TriggerEvent('chat:removeSuggestion', '/onesync')
TriggerEvent('chat:removeSuggestion', '/onesync_automaticResend')
TriggerEvent('chat:removeSuggestion', '/onesync_clearArea')
TriggerEvent('chat:removeSuggestion', '/onesync_distanceCulling')
TriggerEvent('chat:removeSuggestion', '/onesync_distanceCullVehicles')
TriggerEvent('chat:removeSuggestion', '/onesync_enableBeyond')
TriggerEvent('chat:removeSuggestion', '/onesync_enabled')
TriggerEvent('chat:removeSuggestion', '/onesync_enableInfinity')
TriggerEvent('chat:removeSuggestion', '/onesync_forceMigration')
TriggerEvent('chat:removeSuggestion', '/onesync_logFile')
TriggerEvent('chat:removeSuggestion', '/onesync_population')
TriggerEvent('chat:removeSuggestion', '/onesync_radiusFrequency')
TriggerEvent('chat:removeSuggestion', '/onesync_showObjectIds')
TriggerEvent('chat:removeSuggestion', '/onesync_workaround763185')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_getinfo_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_getinfo_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_http_info_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_http_info_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommand_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommand_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommandFlood_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netCommandFlood_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEvent_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEvent_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventFlood_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventFlood_rate')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventSize_burst')
TriggerEvent('chat:removeSuggestion', '/rateLimiter_netEventSize_rate')
TriggerEvent('chat:removeSuggestion', '/rcon_password')
TriggerEvent('chat:removeSuggestion', '/refresh')
TriggerEvent('chat:removeSuggestion', '/restart')
TriggerEvent('chat:removeSuggestion', '/set')
TriggerEvent('chat:removeSuggestion', '/seta')
TriggerEvent('chat:removeSuggestion', '/setr')
TriggerEvent('chat:removeSuggestion', '/sets')
TriggerEvent('chat:removeSuggestion', '/start')
TriggerEvent('chat:removeSuggestion', '/steam_webApiKey')
TriggerEvent('chat:removeSuggestion', '/stop')
TriggerEvent('chat:removeSuggestion', '/sv_authMaxVariance')
TriggerEvent('chat:removeSuggestion', '/sv_authMinTrust')
TriggerEvent('chat:removeSuggestion', '/sv_endpointPrivacy')
TriggerEvent('chat:removeSuggestion', '/sv_endpoints')
TriggerEvent('chat:removeSuggestion', '/sv_enforceGameBuild')
TriggerEvent('chat:removeSuggestion', '/sv_enhancedHostSupport')
TriggerEvent('chat:removeSuggestion', '/sv_entityLockdown')
TriggerEvent('chat:removeSuggestion', '/sv_forceIndirectListing')
TriggerEvent('chat:removeSuggestion', '/sv_hostname')
TriggerEvent('chat:removeSuggestion', '/sv_icon')
TriggerEvent('chat:removeSuggestion', '/sv_infoVersion')
TriggerEvent('chat:removeSuggestion', '/sv_lan')
TriggerEvent('chat:removeSuggestion', '/sv_licenseKey')
TriggerEvent('chat:removeSuggestion', '/sv_licenseKeyToken')
TriggerEvent('chat:removeSuggestion', '/sv_listingHostOverride')
TriggerEvent('chat:removeSuggestion', '/sv_listingIpOverride')
TriggerEvent('chat:removeSuggestion', '/sv_master1')
TriggerEvent('chat:removeSuggestion', '/sv_master2')
TriggerEvent('chat:removeSuggestion', '/sv_master3')
TriggerEvent('chat:removeSuggestion', '/sv_maxClients')
TriggerEvent('chat:removeSuggestion', '/sv_projectDesc')
TriggerEvent('chat:removeSuggestion', '/sv_projectName')
TriggerEvent('chat:removeSuggestion', '/sv_registerMulticastDns')
TriggerEvent('chat:removeSuggestion', '/sv_requestParanoia')
TriggerEvent('chat:removeSuggestion', '/sv_scriptHookAllowed')
TriggerEvent('chat:removeSuggestion', '/sv_tebexSecret')
TriggerEvent('chat:removeSuggestion', '/sv_threadedClientHttp')
TriggerEvent('chat:removeSuggestion', '/sv_useAccurateSends')
TriggerEvent('chat:removeSuggestion', '/svgui')
TriggerEvent('chat:removeSuggestion', '/svgui_disable')
TriggerEvent('chat:removeSuggestion', '/tags')
TriggerEvent('chat:removeSuggestion', '/toggle')
TriggerEvent('chat:removeSuggestion', '/version')
TriggerEvent('chat:removeSuggestion', '/vstr')
TriggerEvent('chat:removeSuggestion', '/Website')
TriggerEvent('chat:removeSuggestion', '/wait')
TriggerEvent('chat:removeSuggestion', '/web_baseUrl')
TriggerEvent('chat:removeSuggestion', '/+vstr')
TriggerEvent('chat:removeSuggestion', '/-vstr')
TriggerEvent('chat:removeSuggestion', '/_crash')
TriggerEvent('chat:removeSuggestion', '/pzcreate')
TriggerEvent('chat:removeSuggestion', '/pzadd')
TriggerEvent('chat:removeSuggestion', '/pzundo')
TriggerEvent('chat:removeSuggestion', '/pzlast')
TriggerEvent('chat:removeSuggestion', '/pzcancel')
TriggerEvent('chat:removeSuggestion', '/pzcomboinfo')
TriggerEvent('chat:removeSuggestion', '/pzfinish')

-------------------------------------------------------------------------------
-- Inventory Commands
-------------------------------------------------------------------------------
TriggerEvent('chat:addSuggestion', '/giveitem', 'Give an item to a player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
})

TriggerEvent('chat:addSuggestion', '/additem', 'Give an item to a player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
})

TriggerEvent('chat:addSuggestion', '/removeitem', 'Remove item from player (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'},
    {name = 'item', help = 'item name', type = 'item'},
    {name = 'count', help = 'item count', type = 'number'}
})

TriggerEvent('chat:addSuggestion', '/clearinv', 'Clear player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
})

TriggerEvent('chat:addSuggestion', '/takeinv', 'Confiscate player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
})

TriggerEvent('chat:addSuggestion', '/returninv', 'Return player inventory (Staff Only)', { 
    {name = 'playerId', help = 'player id', type = 'player'}
})

TriggerEvent('chat:addSuggestion', '/viewinv', 'View player inventory (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
})

TriggerEvent('chat:addSuggestion', '/saveinv', 'Save player inventory (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
})

TriggerEvent('chat:addSuggestion', '/clearevidence', 'Clear Evidence (Staff Only)', {
    {name = 'playerId', help = 'player id', type = 'player'}
})