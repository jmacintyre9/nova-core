NovaAdmin = NovaAdmin or {}

function NovaAdmin.IsAdmin(src)
    if src == 0 then
        return true
    end

    return IsPlayerAceAllowed(src, NovaAdminConfig.AcePermission)
end

function NovaAdmin.RequireAdmin(src)
    if NovaAdmin.IsAdmin(src) then
        return true
    end

    TriggerClientEvent('nova-admin:client:notify', src, 'You do not have permission to use Nova Admin.', 'error')
    return false
end

local function targetExists(target)
    target = tonumber(target)
    return target and GetPlayerName(target) ~= nil
end

function NovaAdmin.Kick(src, target, reason)
    if not NovaAdmin.RequireAdmin(src) then return false end
    if not targetExists(target) then return false, 'invalid_target' end

    target = tonumber(target)

    if target == src and not NovaAdminConfig.AllowSelfActions then
        return false, 'self_action'
    end

    reason = reason or 'Kicked by an administrator.'
    DropPlayer(target, reason)

    return true
end

function NovaAdmin.GetPlayers()
    local players = {}

    for _, playerId in ipairs(GetPlayers()) do
        playerId = tonumber(playerId)

        players[#players + 1] = {
            id = playerId,
            name = GetPlayerName(playerId) or 'Unknown',
            ping = GetPlayerPing(playerId)
        }
    end

    return players
end

exports('IsAdmin', function(src)
    return NovaAdmin.IsAdmin(src)
end)

exports('GetPlayers', function()
    return NovaAdmin.GetPlayers()
end)

RegisterNetEvent('nova-admin:server:requestPlayers', function()
    local src = source

    if not NovaAdmin.RequireAdmin(src) then return end

    TriggerClientEvent('nova-admin:client:players', src, NovaAdmin.GetPlayers())
end)

RegisterNetEvent('nova-admin:server:kick', function(target, reason)
    local src = source

    if not NovaAdminConfig.Commands.kick then return end

    local ok, errorReason = NovaAdmin.Kick(src, target, reason)

    if not ok and errorReason then
        TriggerClientEvent('nova-admin:client:notify', src, errorReason, 'error')
    end
end)

RegisterNetEvent('nova-admin:server:announce', function(message)
    local src = source

    if not NovaAdmin.RequireAdmin(src) then return end

    message = tostring(message or ''):sub(1, 250)

    if message == '' then return end

    TriggerClientEvent('nova-admin:client:announce', -1, message)
end)
