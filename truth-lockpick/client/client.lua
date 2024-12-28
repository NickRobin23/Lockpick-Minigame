local isInMinigame = false

RegisterNetEvent('startLockpickingMinigame')
AddEventHandler('startLockpickingMinigame', function(circleCount, speed)
    if not isInMinigame then
        isInMinigame = true

        -- Start lockpicking animation
        local playerPed = PlayerPedId()
        RequestAnimDict("mini@safe_cracking")
        while not HasAnimDictLoaded("mini@safe_cracking") do
            Wait(0)
        end
        TaskPlayAnim(playerPed, "mini@safe_cracking", "dial_turn_anti_fast", 8.0, -8.0, -1, 1, 0, false, false, false)

        -- Trigger NUI for the minigame
        SendNUIMessage({ action = 'showMinigame', count = circleCount, speed = speed })
        SetNuiFocus(true, true)
    end
end)

RegisterNUICallback('minigameComplete', function(data, cb)
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed) -- Stop animation

    isInMinigame = false
    SetNuiFocus(false, false)
    TriggerServerEvent('lockpicking:complete', data.success)
    cb('ok')
end)

RegisterNUICallback('minigameExit', function(data, cb)
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed) -- Stop animation

    isInMinigame = false
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Command to test the minigame
RegisterCommand("testlockpicking", function(source, args, rawCommand)
    local circleCount = tonumber(args[1]) or 5 -- Default to 5 circles if no argument provided
    local speed = tonumber(args[2]) or 5 -- Default to speed 5 if no argument provided

    TriggerEvent('startLockpickingMinigame', circleCount, speed)
end, false) -- False means any player can use this command
