RegisterCommand('notify', function(_, args)
    if #args == 0 then
        NovaNotify.Show('Nova Notify is working.', 'info')
        return
    end

    NovaNotify.Show(table.concat(args, ' '), 'info')
end, false)

RegisterCommand('testnotify', function()
    NovaNotify.Show('Information notification.', 'info')
    Wait(700)
    NovaNotify.Show('Success notification.', 'success')
    Wait(700)
    NovaNotify.Show('Warning notification.', 'warning')
    Wait(700)
    NovaNotify.Show('Error notification.', 'error')
end, false)
