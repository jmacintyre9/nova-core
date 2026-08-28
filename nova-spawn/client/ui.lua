function NovaSpawn.OpenSelector()
    if NovaSpawn.Open then return end

    NovaSpawn.Open = true

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        spawns = NovaSpawnConfig.Spawns
    })

    if NovaSpawnConfig.HideRadar then
        DisplayRadar(false)
    end
end

function NovaSpawn.Close()
    NovaSpawn.Open = false

    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'close'
    })

    NovaSpawn.DestroyPreviewCamera()

    if NovaSpawnConfig.HideRadar then
        DisplayRadar(true)
    end
end

RegisterNUICallback('preview', function(data, cb)
    local spawn = NovaSpawn.GetSpawn(data.id)

    if spawn then
        NovaSpawn.CreatePreviewCamera(spawn)
    end

    cb({ok = true})
end)
