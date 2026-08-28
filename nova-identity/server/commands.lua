RegisterCommand('identity', function(src)
    if src == 0 then return end
    TriggerClientEvent('nova-identity:client:open', src)
end, false)

RegisterCommand('characters', function(src)
    if src == 0 then return end
    TriggerClientEvent('nova-identity:client:open', src)
end, false)
