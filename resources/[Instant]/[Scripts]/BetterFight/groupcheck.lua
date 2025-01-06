-- Server-side script (can be added to your server's main script or a separate resource file)

RegisterCommand("viewgroup", function(source, args, rawCommand)
    local userId = source -- The ID of the player who ran the command
    local playerGroup = getPlayerGroup(userId) -- Function to get the player's group

    -- Check if the player has a group
    if playerGroup then
        -- Check if the player is in 'group.user' or 'group.admin'
        if playerGroup == "group.user" or playerGroup == "group.admin" then
            -- Display the group details to the user
            TriggerClientEvent('chat:addMessage', userId, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "[Group Info]", "You belong to group: " .. playerGroup }
            })
        else
            -- Inform the player they do not have the necessary permissions
            TriggerClientEvent('chat:addMessage', userId, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "[Error]", "You don't have permission to view the group details." }
            })
        end
    else
        -- Inform the player if they do not belong to any group
        TriggerClientEvent('chat:addMessage', userId, {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "[Error]", "You are not part of any group." }
        })
    end
end, false)

-- Function to get the player's group (dummy example, adjust to your framework)
function getPlayerGroup(userId)
    -- Replace with the actual logic to fetch the player's group (e.g., from a database or permission system)
    -- This is just an example:
    if userId == 1 then  -- Example: player with ID 1 is in 'group.admin'
        return "group.admin"
    elseif userId == 2 then  -- Example: player with ID 2 is in 'group.user'
        return "group.user"
    else
        return nil -- No group
    end
end