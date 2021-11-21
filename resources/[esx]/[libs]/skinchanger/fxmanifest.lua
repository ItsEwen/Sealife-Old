fx_version('bodacious')
game('gta5')

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

--client_script('@korioz/lib.lua')
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
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/*.lua',
}

dependency('es_extended')









