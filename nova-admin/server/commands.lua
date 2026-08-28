local function has(src, command)
    if not NovaAdminConfig.Commands[command] then return false end
    return NovaAdmin.RequireAdmin(src)
end

RegisterCommand(NovaAdminConfig.OpenCommand, function(src)
    if not has(src, 'menu') and not NovaAdmin.IsAdmin(src) then return end

    TriggerClientEvent('nova-admin:client:open', src)
end, false)

RegisterCommand('kick', function(src, args)
    if not has(src, 'kick') then return end

    local target = tonumber(args[1])
    table.remove(args, 1)

    local reason = #args > 0 and table.concat(args, ' ') or 'Kicked by an administrator.'
    local ok, errorReason = NovaAdmin.Kick(src, target, reason)

    if not ok and errorReason then
        TriggerClientEvent('nova-admin:client:notify', src, errorReason, 'error')
    end
end, false)

RegisterCommand('announce', function(src, args)
    if not NovaAdmin.RequireAdmin(src) then return end

    local message = table.concat(args, ' ')

    if message == '' then
        TriggerClientEvent('nova-admin:client:notify', src, 'Usage: /announce [message]', 'error')
        return
    end

    TriggerClientEvent('nova-admin:client:announce', -1, message:sub(1, 250))
end, false)

RegisterCommand('freeze', function(src, args)
    if not has(src, 'freeze') then return end

    local target = tonumber(args[1])
    if not target or not GetPlayerName(target) then return end

    TriggerClientEvent('nova-admin:client:freeze', target)

    TriggerClientEvent('nova-admin:client:notify', src,
        ('Freeze toggled for %s.'):format(GetPlayerName(target)), 'success')
end, false)

RegisterCommand('bring', function(src, args)
    if not has(src, 'bring') then return end

    local target = tonumber(args[1])
    if not target or not GetPlayerName(target) then return end

    local adminPed = GetPlayerPed(src)
    local coords = GetEntityCoords(adminPed)

    TriggerClientEvent('nova-admin:client:teleport', target, coords.x, coords.y, coords.z)

    TriggerClientEvent('nova-admin:client:notify', src, 'Player brought to you.', 'success')
end, false)

RegisterCommand('goto', function(src, args)
    if not has(src, 'goto') then return end

    local target = tonumber(args[1])
    if not target or not GetPlayerName(target) then return end

    local targetPed = GetPlayerPed(target)
    local coords = GetEntityCoords(targetPed)

    TriggerClientEvent('nova-admin:client:teleport', src, coords.x, coords.y, coords.z)

    TriggerClientEvent('nova-admin:client:notify', src, 'Teleported to player.', 'success')
end, false)
