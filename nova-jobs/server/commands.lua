RegisterCommand('job', function(src)
    if src == 0 then return end

    local job = NovaJobs.GetJob(src)
    if not job then
        TriggerClientEvent('nova-jobs:client:notify', src, 'Job data is unavailable.', 'error')
        return
    end

    TriggerClientEvent('nova-jobs:client:notify', src,
        ('Job: %s | Grade: %s | Salary: $%s | Duty: %s'):format(
            job.label,
            job.gradeLabel or job.grade,
            job.salary or 0,
            job.onduty and 'ON' or 'OFF'
        ),
        'info')
end, false)

RegisterCommand('duty', function(src)
    if src == 0 then return end

    local job = NovaJobs.GetJob(src)
    if not job or job.name == 'unemployed' then
        TriggerClientEvent('nova-jobs:client:notify', src, 'You do not have a duty-based job.', 'error')
        return
    end

    NovaJobs.SetDuty(src, not job.onduty)
end, false)

RegisterCommand('setjob', function(src, args)
    if src ~= 0 then
        TriggerClientEvent('nova-jobs:client:notify', src,
            'Use the server console for this command in this starter build.', 'error')
        return
    end

    local target = tonumber(args[1])
    local jobName = args[2]
    local grade = tonumber(args[3]) or 0

    if not target or not jobName then
        print('Usage: setjob [playerId] [job] [grade]')
        return
    end

    local ok, reason = NovaJobs.SetJob(target, jobName, grade)
    if not ok then
        print(('Nova Jobs error: %s'):format(reason))
    end
end, false)
