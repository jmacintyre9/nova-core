RegisterNetEvent('nova-admin:client:freeze', function()
    NovaAdminClient.frozen = not NovaAdminClient.frozen

    FreezeEntityPosition(PlayerPedId(), NovaAdminClient.frozen)

    NovaAdminClient.Notify(
        NovaAdminClient.frozen and 'You have been frozen.' or 'You have been unfrozen.',
        'info'
    )
end)

RegisterNetEvent('nova-admin:client:teleport', function(x, y, z)
    local ped = PlayerPedId()

    RequestCollisionAtCoord(x, y, z)
    SetEntityCoords(ped, x, y, z, false, false, false, false)
end)

RegisterNetEvent('nova-admin:client:heal', function()
    local ped = PlayerPedId()
    SetEntityHealth(ped, GetEntityMaxHealth(ped))

    NovaAdminClient.Notify('You have been healed.', 'success')
end)

RegisterNetEvent('nova-admin:client:revive', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    NetworkResurrectLocalPlayer(
        coords.x, coords.y, coords.z,
        GetEntityHeading(ped),
        true,
        false
    )

    ClearPedBloodDamage(ped)
    SetEntityHealth(ped, GetEntityMaxHealth(ped))

    NovaAdminClient.Notify('You have been revived.', 'success')
end)

function NovaAdminClient.Notify(message, notificationType)
    if GetResourceState(NovaAdminConfig.NotifyResource) == 'started' then
        exports[NovaAdminConfig.NotifyResource]:Notify(message, notificationType)
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(tostring(message))
        EndTextCommandThefeedPostTicker(false, false)
    end
end
