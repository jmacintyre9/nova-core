NovaAdmin = NovaAdmin or {}
NovaAdmin.Utils = {}

function NovaAdmin.Utils.Trim(value)
    return tostring(value or ''):gsub('^%s+', ''):gsub('%s+$', '')
end

function NovaAdmin.Utils.Debug(...)
    if NovaAdminConfig.Debug then
        print('[NOVA-ADMIN]', ...)
    end
end
