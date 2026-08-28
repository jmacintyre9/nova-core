RegisterCommand('myjob', function()
    local job = NovaJobsClient.GetJob()

    if not job then
        NovaJobsClient.Notify('Job data has not loaded yet.', 'error')
        return
    end

    NovaJobsClient.Notify(
        ('%s - %s | Salary: $%s | Duty: %s'):format(
            job.label,
            job.gradeLabel or job.grade,
            job.salary or 0,
            job.onduty and 'ON' or 'OFF'
        ),
        'info'
    )
end, false)
