RegisterNetEvent('nova-jobs:client:updateJob', function(job)
    NovaJobsClient.Job = job

    if job then
        print(('[NOVA-JOBS] %s - %s'):format(job.label, job.gradeLabel or job.grade))
    end
end)

RegisterNetEvent('nova-jobs:client:paycheck', function(amount)
    NovaJobsClient.Notify(('Paycheck received: $%s'):format(amount), 'success')
end)

RegisterNetEvent('nova-jobs:client:getJobResult', function(_, job)
    NovaJobsClient.Job = job
end)
