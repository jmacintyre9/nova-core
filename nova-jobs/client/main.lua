NovaJobsClient = {
    Job = nil
}

function NovaJobsClient.GetJob()
    return NovaJobsClient.Job
end

exports('GetJob', function()
    return NovaJobsClient.GetJob()
end)

CreateThread(function()
    Wait(1500)
    TriggerServerEvent('nova-jobs:server:requestJob')
end)
