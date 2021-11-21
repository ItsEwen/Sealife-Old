fx_version "adamant"

game "gta5"

client_scripts {
    -- RAGEUI
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",
    -- CONTEXTMENU LIBS
    "ContextUI/components/*.lua",
    "ContextUI/ContextUI.lua",
    -- RAGEUI
    "cl_initESX.lua",
    "blips.lua",
    "functions/client.lua",
    "markers.lua",
    "ContextMenu.lua",
    --"[bob74_ipl]/**/*.lua",
    "players/coiffeur/client.lua",
    "players/shops/cl_ammu-nation.lua",
    "players/shops/configbraquagesuperette.lua",
    "players/shops/cl_superettes.lua",
    "players/vêtements/cl_accessories.lua",
    "players/shops/cl_braquagesuperette.lua",
    "players/vip/client.lua",
    "players/vehiclecoffre/client.lua",
    "players/vehiclecoffre/config.lua",
    "players/personalmenu/client.lua",
    "players/personalmenu/others.lua",
    "players/enterspawn/client.lua",
    "players/carwash/client.lua",
    "players/fleeca/config.lua",
    "players/fleeca/client.lua",
    "players/locations/client.lua",
   -- "players/safezone/client.lua",
    "players/banque/client.lua",
    "players/animations/client.lua",
    "players/animations/config.lua",
    -- JOBS
    'jobs/society/client.lua',
    'jobs/mecano/cl_mecano.lua',
    'jobs/farm/client.lua',
    'jobs/farming/client.lua',
    'jobs/menu.lua',
}

server_scripts {
    "@async/async.lua",
    "@mysql-async/lib/MySQL.lua",
    --
    "sv_initESX.lua",
    "maintenance.lua",
    "functions/server.lua",
    "players/banSQL.lua",
    "players/coiffeur/server.lua",
    "players/personalmenu/server.lua",
    "players/vip/server.lua",
    "players/shops/configbraquagesuperette.lua",
    "players/shops/sv_shops.lua",
    "players/shops/sv_braquagesuperette.lua",
    "players/vêtements/sv_accessories.lua",
    "players/carwash/server.lua",
    "players/gestionentreprise/server.lua",
    "players/locations/server.lua",
    "players/fleeca/config.lua",
    "players/fleeca/server.lua",
    "players/vehiclecoffre/server.lua",
    "players/vehiclecoffre/config.lua",
    "players/banque/server.lua",
    "players/animations/server.lua",
    "players/animations/config.lua",
    'jobs/farming/server.lua',
    'jobs/society/server.lua',
    'jobs/farm/server.lua',
    'jobs/mecano/sv_mecano.lua',
}

exports {
    "GetVIP",
}
server_exports {
    "GetVIP",
}

files {
    'html/index.html',
    'html/music/load.mp3',
    'html/img/*.png',
	'html/css/bootstrap.css',
    'html/css/owl.carousel.css',
	'html/css/style.css',
    'html/js/jquery.ajaxchimp.js',
	'html/js/jquery.backstretch.min.js',
    'html/js/jquery-1.11.0.min.js',
	'html/js/lj-safety-first.js',
    'html/js/owl.carousel.min.js',
}

loadscreen 'html/index.html'