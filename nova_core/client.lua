local PlayerData = {}

RegisterNetEvent('nova:playerLoaded', function(data)
    PlayerData = data or {}
    TriggerEvent('nova:jobChanged', PlayerData)
end)

CreateThread(function()
    Wait(2000)
    TriggerServerEvent('nova:requestPlayer')
end)

exports('GetPlayerData', function()
    return PlayerData
end)
