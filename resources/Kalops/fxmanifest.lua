fx_version 'adamant'
games { 'gta5' }

client_scripts {
    -- RageUI
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    "cl_initesx.lua",
    "config.lua",
    "client/*.lua"
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "sv_initesx.lua",
    "config.lua",
    "server/*.lua"
}

exports {
	"GetLevel",
    "GetVIP",
}
server_exports {
    "GetVIP",
}

ui_page 'ui/ui.html'
files {
  'ui/ui.html',
  'ui/css/app.css',
  "ui/input.css",
  'ui/web.js',
}