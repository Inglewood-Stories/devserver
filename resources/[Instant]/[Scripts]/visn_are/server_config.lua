-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

ServerConfig = {}

ServerConfig.medicJobNames = {"ambulance"} -- The name of the jobs who should do medic things. Sewing, giving blood infusions.. 
ServerConfig.dateFormat = "%d.%m.%Y - %H:%M" -- The date format at the activity history
ServerConfig.medicNameInActivityHistory = false -- Shows the name of medic in the activity history
ServerConfig.activityHistorySeperator = "::" -- The seperator between date and action in the activity history
ServerConfig.requireItems = true -- Checks if the player has enough of the item
ServerConfig.stateSaving = true -- Saves the data of a patient after disconnect
ServerConfig.discordKillLogs = false -- Discord kill logs
ServerConfig.logWebhookId = "" -- Discord webhook url
ServerConfig.showCharacterName = false -- Shows the character name of the patient in the title of the men
ServerConfig.jobNeededForMedicalOperations = true -- When enabled, jobs are required which are defined in ServerConfig.medicJobNames
ServerConfig.jobUnlimitedSupplies = false -- If true, the players, which own the job, doensn't need items
ServerConfig.tableName = "users"
ServerConfig.columnName = "healthData"
ServerConfig.identifierColumn = "identifier"
ServerConfig.updateFrequency = 60000 * 5 -- In milliseconds (in this 1000ms = 1 second = 60000ms = 1 minute * 5 = 5 minutes)
ServerConfig.securityKey = "chaplionmalenski"

-- Leaked By: Leaking Hub | J. Snow | leakinghub.com