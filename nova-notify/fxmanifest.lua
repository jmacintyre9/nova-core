fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'nova-notify'
author 'Nova Development'
description 'Nova RP notification system'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/notify.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}
