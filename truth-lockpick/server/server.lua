RegisterServerEvent('lockpickingSuccess')
AddEventHandler('lockpickingSuccess', function(success)
    local src = source
    if success then
        print(('Player %s successfully completed the minigame!'):format(GetPlayerName(src)))
        -- Add your reward or functionality for successful lockpicking here
    else
        print(('Player %s failed the minigame.'):format(GetPlayerName(src)))
        -- Handle failure case here
    end
end)