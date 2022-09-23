fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'AwayFromKane (#0001) & Razer (#3458)'
description 'Mercy Collective - Drug Tables'

client_scripts {
    'client/cl_*.lua',
}

shared_script {
    'shared/sh_*.*',
}

server_scripts {
    'server/sv_*.lua',
}

escrow_ignore {
    'client/cl_main.lua',
    'server/sv_main.lua',
    'shared/sh_config.lua',
  }