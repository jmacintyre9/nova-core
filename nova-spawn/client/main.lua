NovaSpawn = {
    Open = false,
    Selected = nil
}

local function spawnPlayer(spawn)
    if not spawn or not spawn.coords then return end

    local ped = PlayerPedId()
    local c = spawn.coords

    DoScreenFadeOut(500)
    Wait(600)

    RequestCollisionAtCoord(c.x, c.y, c.z)
    SetEntityCoordsNoOffset(ped, c.x, c.y, c.z, false, false, false)
    SetEntityHeading(ped, c.w or 0.0)
    FreezeEntityPosition(ped, false)

    Wait(1000)
    DoScreenFadeIn(750)

    NovaSpawn.Close()
end

RegisterNetEvent('nova-spawn:client:open', function()
    NovaSpawn.OpenSelector()
end)

RegisterNetEvent('nova-identity:client:loaded', function()
    if NovaSpawnConfig.OpenAfterIdentity then
        Wait(500)
        NovaSpawn.OpenSelector()
    end
end)

RegisterCommand('spawn', function()
    NovaSpawn.OpenSelector()
end, false)

exports('OpenSpawnSelector', function()
    NovaSpawn.OpenSelector()
end)

exports('SpawnAt', function(spawnId)
    for _, spawn in ipairs(NovaSpawnConfig.Spawns) do
        if spawn.id == spawnId then
            spawnPlayer(spawn)
            return true
        end
    end

    return false
end)

RegisterNUICallback('spawn', function(data, cb)
    for _, spawn in ipairs(NovaSpawnConfig.Spawns) do
        if spawn.id == data.id then
            NovaSpawn.Selected = spawn
            spawnPlayer(spawn)
            break
        end
    end

    cb({ok = true})
end)

RegisterNUICallback('close', function(_, cb)
    NovaSpawn.Close()
    cb({ok = true})
end)

CreateThread(function()
    while true do
        if NovaSpawn.Open then
            if NovaSpawnConfig.HideRadar then
                DisplayRadar(false)
            end
            Wait(0)
        else
            Wait(500)
        end
    end
end)
