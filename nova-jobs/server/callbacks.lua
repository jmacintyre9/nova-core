RegisterNetEvent('nova-jobs:server:getJob', function(requestId)
    local src = source
    local job = NovaJobs.GetJob(src)
    TriggerClientEvent('nova-jobs:client:getJobResult', src, requestId, job)
end)
