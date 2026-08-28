fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'nova-identity'
author 'Nova Development'
description 'Character identity system for Nova Core'
version '1.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/database.lua',
    'server/main.lua',
    'server/commands.lua'
}

client_scripts {
    'client/main.lua',
    'client/identity.lua',
    'client/commands.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}
