NovaNotify = NovaNotify or {}

function NovaNotify.Show(message, notificationType, duration)
    notificationType = notificationType or 'info'
    duration = tonumber(duration) or NovaNotifyConfig.Duration

    if not NovaNotifyConfig.Types[notificationType] then
        notificationType = 'info'
    end

    SendNUIMessage({
        action = 'notify',
        message = tostring(message),
        type = notificationType,
        duration = duration,
        position = NovaNotifyConfig.Position,
        maxVisible = NovaNotifyConfig.MaxVisible,
        typeData = NovaNotifyConfig.Types[notificationType]
    })
end

function NovaNotify.Clear()
    SendNUIMessage({
        action = 'clear'
    })
end

exports('Notify', function(message, notificationType, duration)
    NovaNotify.Show(message, notificationType, duration)
end)

exports('Clear', function()
    NovaNotify.Clear()
end)

RegisterNetEvent('nova-notify:client:notify', function(message, notificationType, duration)
    NovaNotify.Show(message, notificationType, duration)
end)

RegisterNetEvent('nova-notify:client:clear', function()
    NovaNotify.Clear()
end)
