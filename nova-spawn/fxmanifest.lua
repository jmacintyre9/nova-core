fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'nova-spawn'
author 'Nova Development'
description 'Nova RP spawn selector'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/spawns.lua',
    'client/camera.lua',
    'client/ui.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}
