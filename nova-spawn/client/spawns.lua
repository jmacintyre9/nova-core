function NovaSpawn.GetSpawns()
    return NovaSpawnConfig.Spawns
end

function NovaSpawn.GetSpawn(id)
    for _, spawn in ipairs(NovaSpawnConfig.Spawns) do
        if spawn.id == id then
            return spawn
        end
    end

    return nil
end
