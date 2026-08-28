NovaJobs = NovaJobs or {}
NovaJobs.Utils = {}

function NovaJobs.Utils.Debug(...)
    if NovaJobsConfig.Debug then
        print('[NOVA-JOBS]', ...)
    end
end

function NovaJobs.Utils.Copy(tbl)
    if type(tbl) ~= 'table' then return tbl end
    local out = {}
    for k, v in pairs(tbl) do out[k] = NovaJobs.Utils.Copy(v) end
    return out
end
