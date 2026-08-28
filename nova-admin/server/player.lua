RegisterNetEvent('nova-admin:server:heal', function(target)
    local src = source
    if not NovaAdmin.RequireAdmin(src) then return end

    target = tonumber(target)
    if not target or not GetPlayerName(target) then return end

    TriggerClientEvent('nova-admin:client:heal', target)
    TriggerClientEvent('nova-admin:client:notify', src, 'Player healed.', 'success')
end)

RegisterNetEvent('nova-admin:server:revive', function(target)
    local src = source
    if not NovaAdmin.RequireAdmin(src) then return end

    target = tonumber(target)
    if not target or not GetPlayerName(target) then return end

    TriggerClientEvent('nova-admin:client:revive', target)
    TriggerClientEvent('nova-admin:client:notify', src, 'Player revived.', 'success')
end)
