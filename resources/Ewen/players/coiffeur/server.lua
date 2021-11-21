RegisterNetEvent('barber:pay')
AddEventHandler('barber:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('bank', 150)
	TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, '~b~SeaLife ~w~~n~Merci à vous, Bonne journée')
end)

ESX.RegisterServerCallback('barber:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getAccount('bank').money >= 150)
end)