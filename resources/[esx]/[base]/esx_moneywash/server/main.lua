local PlayersWashing = {}

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
	PlayersWashing[source] = nil
end)

local function WashMoney(xPlayer)
	SetTimeout(3000, function()
		if PlayersWashing[xPlayer.source] then
			local xAccount = xPlayer.getAccount('dirtycash')

			if xAccount.money < Config.Slice then
				TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, ('Vous n\'avez pas assez d\'argent pour blanchir, il vous faut : $%s'):format(Config.Slice))
			else
				local washedMoney = math.floor(Config.Slice / Config.Percentage)
					
				xPlayer.removeAccountMoney('dirtycash', Config.Slice)
				xPlayer.addAccountMoney('cash', washedMoney)
				sendToDiscord('SeaLife - LOGS', '[BLANCHICHIENNE] ' ..xPlayer.getName().. ' viens de blanchir ' ..washedMoney.. '', 3145658)


				WashMoney(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{korioz#0110}::esx_moneywash:startWash')
AddEventHandler('::{korioz#0110}::esx_moneywash:startWash', function()
	PlayersWashing[source] = true
	TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, 'Vous êtes en train de blanchir l\'argent sale.')
	WashMoney(ESX.GetPlayerFromId(source))
end)

RegisterServerEvent('::{korioz#0110}::esx_moneywash:stopWash')
AddEventHandler('::{korioz#0110}::esx_moneywash:stopWash', function()
	PlayersWashing[source] = nil
	TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, 'Vous, vous éloignez du point du blanchissement.')
end)

function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = "https://discord.com/api/webhooks/861663583112265758/EP_LtK7TLPjwRkVWwGogwo94t_N9_QZuVu9iIHpVUSeYVjb1XGl4-L95VSvxfIBU1eFI"
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
	{
		["title"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "Heure: " ..date_local.. "",
		},
	}
}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end 