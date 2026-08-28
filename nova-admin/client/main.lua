NovaAdminClient = {
    open = false,
    frozen = false
}

RegisterNetEvent('nova-admin:client:open', function()
    NovaAdminClient.Open()
end)

RegisterNetEvent('nova-admin:client:players', function(players)
    SendNUIMessage({
        action = 'players',
        players = players or {}
    })
end)

RegisterNetEvent('nova-admin:client:notify', function(message, notificationType)
    if GetResourceState(NovaAdminConfig.NotifyResource) == 'started' then
        exports[NovaAdminConfig.NotifyResource]:Notify(message, notificationType)
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(tostring(message))
        EndTextCommandThefeedPostTicker(false, false)
    end
end)

RegisterNetEvent('nova-admin:client:announce', function(message)
    SendNUIMessage({
        action = 'announce',
        message = message
    })
end)

exports('Open', function()
    NovaAdminClient.Open()
end)
