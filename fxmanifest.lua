fx_version 'bodacious'
game 'gta5'

author 'Thomapp'
description 'Token Security Script.'

client_script 'client.lua'
export 'GetPlayerToken'

server_script { 'server.lua', 'config.lua' }
server_export 'VerifyToken'