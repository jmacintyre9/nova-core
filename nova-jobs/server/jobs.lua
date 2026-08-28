function NovaJobs.SetJob(src, jobName, grade)
    src = tonumber(src)
    grade = tonumber(grade) or 0

    local player = NovaJobs.GetPlayer(src)
    if not player then return false, 'player_not_found' end

    local job = NovaJobs.BuildJob(jobName, grade, false)
    if not job then return false, 'invalid_job' end

    player.job = job

    -- If the core provides a player object, keep its job in sync.
    local ok = pcall(function()
        if exports[NovaJobsConfig.CoreResource].SetJob then
            exports[NovaJobsConfig.CoreResource]:SetJob(src, job)
        end
    end)

    TriggerClientEvent('nova-jobs:client:updateJob', src, job)
    TriggerClientEvent('nova-jobs:client:notify', src,
        ('Job changed to %s (%s).'):format(job.label, job.gradeLabel), 'success')

    NovaJobs.Utils.Debug(('Player %s changed job to %s grade %s'):format(src, jobName, grade))
    return true
end

function NovaJobs.SetDuty(src, state)
    local player = NovaJobs.GetPlayer(src)
    if not player or not player.job then return false end

    player.job.onduty = state == true
    TriggerClientEvent('nova-jobs:client:updateJob', src, player.job)

    TriggerClientEvent('nova-jobs:client:notify', src,
        player.job.onduty and 'You are now on duty.' or 'You are now off duty.',
        'info')

    return true
end

RegisterNetEvent('nova-jobs:server:setJob', function(jobName, grade)
    NovaJobs.SetJob(source, jobName, grade)
end)

RegisterNetEvent('nova-jobs:server:setDuty', function(state)
    NovaJobs.SetDuty(source, state)
end)

RegisterNetEvent('nova-jobs:server:requestJob', function()
    local src = source
    local job = NovaJobs.GetJob(src)
    if job then
        TriggerClientEvent('nova-jobs:client:updateJob', src, job)
    end
end)
