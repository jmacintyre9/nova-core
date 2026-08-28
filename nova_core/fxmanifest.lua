fx_version 'cerulean'
game 'gta5'

author 'NOVA Development'
description 'NOVA SQL Core'
version '1.0.0'

lua54 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_script 'client.lua'
