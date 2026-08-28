local Players = {}

local function identifier(src)
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if id:sub(1,8) == 'license:' then return id end
    end
end

local function loadPlayer(src)
    local lic = identifier(src)
    if not lic then return end

    local row = MySQL.single.await('SELECT * FROM players WHERE license = ?', {lic})

    if not row then
        MySQL.insert.await(
            'INSERT INTO players (license,name,cash,bank,job,job_grade,onduty) VALUES (?,?,?,?,?,?,?)',
            {lic, GetPlayerName(src) or 'New Citizen', 500, 5000, 'unemployed', 0, 0}
        )
        row = MySQL.single.await('SELECT * FROM players WHERE license = ?', {lic})
    end

    Players[src] = row
    TriggerClientEvent('nova:playerLoaded', src, row)
end

local function savePlayer(src)
    local p = Players[src]
    if not p then return end

    MySQL.update.await([[
        UPDATE players
        SET name=?, cash=?, bank=?, job=?, job_grade=?, onduty=?
        WHERE license=?
    ]], {p.name,p.cash,p.bank,p.job,p.job_grade,p.onduty,p.license})
end

AddEventHandler('playerJoining', function()
    loadPlayer(source)
end)

AddEventHandler('playerDropped', function()
    savePlayer(source)
    Players[source] = nil
end)

RegisterNetEvent('nova:requestPlayer', function()
    loadPlayer(source)
end)

RegisterNetEvent('nova:setJobFromCore', function(job, grade)
    local src = source
    if not Players[src] then return end
    Players[src].job = job
    Players[src].job_grade = tonumber(grade) or 0
    Players[src].onduty = 0
    savePlayer(src)
    TriggerClientEvent('nova:playerLoaded', src, Players[src])
end)

exports('GetPlayer', function(src)
    return Players[src]
end)
