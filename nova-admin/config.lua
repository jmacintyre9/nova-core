NovaAdminConfig = {
    CoreResource = 'nova-core',
    NotifyResource = 'nova-notify',

    OpenCommand = 'admin',
    DefaultPermission = 'admin',

    -- ACE permissions are used by default.
    AcePermission = 'nova.admin',

    AllowSelfActions = false,

    Commands = {
        kick = true,
        ban = true,
        freeze = true,
        teleport = true,
        bring = true,
        goto = true,
        setjob = true,
        givecash = true
    }
}
