CreateThread(function()
    while true do
        Wait(NovaJobsConfig.PaycheckInterval)

        for _, src in ipairs(GetPlayers()) do
            src = tonumber(src)

            local player = NovaJobs.GetPlayer(src)
            local job = player and player.job

            if job and job.salary and job.salary > 0 then
                if not NovaJobsConfig.RequireDutyForPay or job.onduty then
                    -- Nova-Core currently exposes the player object directly.
                    -- Update the account and tell the client about the payment.
                    if player.accounts and player.accounts.bank ~= nil then
                        player.accounts.bank = player.accounts.bank + job.salary
                        TriggerClientEvent('nova-jobs:client:paycheck', src, job.salary)
                    else
                        NovaJobs.Utils.Debug(('Could not pay %s: bank account unavailable'):format(src))
                    end
                end
            end
        end
    end
end)
