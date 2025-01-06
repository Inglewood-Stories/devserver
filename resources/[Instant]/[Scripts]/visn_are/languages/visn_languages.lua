local languageCode = ConfigData.primaryLanguage
local languageData

function _translate(translateName, ...) 
    if languageData == nil then
        print("^3[veryinsanee's Authentication] Unknown error while translating: " .. translateName)
        return
    end

    if languageData.messages[translateName] == nil then
        print("^3[veryinsanee's Authentication] Translation \"" .. translateName .. "\" in languages/" .. languageCode .. ".json not avaliable.")
        return
    end

    return string.format(languageData.messages[translateName], ...)
end

function initLanguages()
    languageData = LoadResourceFile(GetCurrentResourceName(), "languages/" .. languageCode .. '.json')

    if languageData == nil then
        print("^3[veryinsanee's Authentication] Language languages/" .. languageCode .. ".json doesn't exist.")
        return
    end

    languageData = json.decode(languageData)

    local count = 0
    for value in pairs(languageData.messages) do
        count = count + 1
    end

    print("^3[veryinsanee's Authentication] ^6Language " .. languageData.languageName .. " (languages/" .. languageData.languageCode .. ".json) from " .. languageData.author .. " with " .. count  .. " translations has been loaded.")
    return languageData
end
