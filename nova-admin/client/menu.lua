function NovaAdminClient.Open()
    if NovaAdminClient.open then return end

    NovaAdminClient.open = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'open'
    })

    TriggerServerEvent('nova-admin:server:requestPlayers')
end

function NovaAdminClient.Close()
    NovaAdminClient.open = false
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'close'
    })
end

RegisterNUICallback('close', function(_, cb)
    NovaAdminClient.Close()
    cb({ok = true})
end)

RegisterNUICallback('refresh', function(_, cb)
    TriggerServerEvent('nova-admin:server:requestPlayers')
    cb({ok = true})
end)

RegisterNUICallback('kick', function(data, cb)
    TriggerServerEvent('nova-admin:server:kick', tonumber(data.id), data.reason)
    cb({ok = true})
end)

RegisterNUICallback('heal', function(data, cb)
    TriggerServerEvent('nova-admin:server:heal', tonumber(data.id))
    cb({ok = true})
end)

RegisterNUICallback('revive', function(data, cb)
    TriggerServerEvent('nova-admin:server:revive', tonumber(data.id))
    cb({ok = true})
end)

RegisterNUICallback('freeze', function(data, cb)
    TriggerServerEvent('nova-admin:server:freeze', tonumber(data.id))
    cb({ok = true})
end)
