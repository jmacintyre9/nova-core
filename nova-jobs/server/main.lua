NovaJobs = NovaJobs or {}
NovaJobs.Players = {}

local function getCorePlayer(src)
    local ok, player = pcall(function()
        return exports[NovaJobsConfig.CoreResource]:GetPlayer(src)
    end)

    if ok then return player end
    return nil
end

function NovaJobs.GetPlayer(src)
    return NovaJobs.Players[tonumber(src)] or getCorePlayer(src)
end

function NovaJobs.GetJob(src)
    local player = NovaJobs.GetPlayer(src)
    if not player then return nil end

    -- Supports the object shape used by the Nova-Core provided with this project.
    if player.job then return player.job end
    return nil
end

function NovaJobs.SetLocalPlayerJob(src, job)
    local player = NovaJobs.GetPlayer(src)
    if not player then return false end
    player.job = job
    return true
end

exports('GetJob', function(src)
    return NovaJobs.GetJob(src)
end)

exports('SetJob', function(src, jobName, grade)
    return NovaJobs.SetJob(src, jobName, grade)
end)

AddEventHandler('playerDropped', function()
    NovaJobs.Players[source] = nil
end)
