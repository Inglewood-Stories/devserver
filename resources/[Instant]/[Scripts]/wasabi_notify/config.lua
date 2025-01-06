-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

---------------------
-- UPDATE SETTINGS --
---------------------
Config.CheckForUpdates = true -- Check for updates(Recommended: true)

----------------------
-- DEFAULT SETTINGS --
----------------------
Config.Default = {
    position = 'top-right',                     -- position options: 'center', 'top-right', 'top-left', 'right', 'left', 'bottom-right', and 'bottom-left'
    time = 3500,                                -- Time in MS to show notifications by default if not defined
    iconSize = '2rem',                        -- Default icon size if shown and not defined. (Default is 1.5rem)
    fontColor = '#e5e5e5',                      -- Color, hex, etc (default: '#b5b3b3')
    backgroundColor = 'rgba(37, 38, 43, 0.60)', -- Background color of notification (default: 'rgba(80, 80, 80, 0.651)')
}

----------------------------
-- COMPATIBILITY SETTINGS --
----------------------------
-- Switching from another notification system?
-- Save time & effort by enabling this option and automatically
-- replacing functions and events from the following resources:
-- okokNotify,mythic notify, brutal notify.
Config.AutoCompatibility = true

------------------------
-- NOTIFICATION TYPES --
------------------------
Config.NotificationTypes = {

    info = {                                     -- Type of notification to use in 'type' parameter of notification exports
        icon = 'fa-solid fa-circle-exclamation', -- Fontawesome icon to use, or false to not show an icon
        color = '#07B8F9',                       -- Color of the notification gradient 1
        color2 = '#07B8F9',                      -- Color of the notification grandient 2 (if not defined, it will be the same as color)
        sound = true,                            -- Play a sound when the notification is shown
    },

    success = {
        icon = 'fa-solid fa-circle-check',
        color = '#1ce21c',
        color2 = '#3ac93a',
        sound = true,
    },

    error = {
        icon = 'fa-solid fa-circle-xmark',
        color = '#e21c1c',
        color2 = '#c93a3a',
        sound = true,
    },

    warning = {
        icon = 'fa-solid fa-exclamation-triangle',
        color = '#dece21',
        color2 = '#baad1d',
        sound = true,
    }

}
