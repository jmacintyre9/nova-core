fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'nova-admin'
author 'Nova Development'
description 'Nova RP administration system'
version '1.0.0'

shared_scripts {
    'config.lua',
    'shared/utils.lua'
}

server_scripts {
    'server/main.lua',
    'server/permissions.lua',
    'server/commands.lua',
    'server/player.lua'
}

client_scripts {
    'client/main.lua',
    'client/menu.lua',
    'client/actions.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}
