function NovaJobsClient.Notify(message, notificationType)
    notificationType = notificationType or 'info'

    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(
        ('[%s] %s'):format(notificationType:upper(), tostring(message))
    )
    EndTextCommandThefeedPostTicker(false, false)
end

RegisterNetEvent('nova-jobs:client:notify', function(message, notificationType)
    NovaJobsClient.Notify(message, notificationType)
end)

exports('Notify', function(message, notificationType)
    NovaJobsClient.Notify(message, notificationType)
end)
