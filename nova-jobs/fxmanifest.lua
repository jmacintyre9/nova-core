fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'nova-jobs'
author 'Nova Development'
description 'Modular job system for Nova Core'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/utils.lua',
    'shared/jobs.lua'
}

server_scripts {
    'server/main.lua',
    'server/jobs.lua',
    'server/paychecks.lua',
    'server/commands.lua',
    'server/callbacks.lua'
}

client_scripts {
    'client/main.lua',
    'client/jobs.lua',
    'client/notifications.lua',
    'client/commands.lua'
}
