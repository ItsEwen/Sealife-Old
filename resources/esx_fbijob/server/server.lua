TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_police:PriseEtFinservice')
AddEventHandler('esx_police:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'fbi' then
			TriggerClientEvent('police:InfoService', xPlayers[i], _raison, name)
		end
	end
end)

RegisterServerEvent('esx__policejob:drag')
AddEventHandler('esx__policejob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'fbi' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('esx__policejob:drag', target, xPlayer.source)
		end
	else
		print(('esx_policejob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx__policejob:putInVehicle')
AddEventHandler('esx__policejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'fbi' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('esx__policejob:putInVehicle', target)
		end
	else
		print(('esx_policejob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx__policejob:OutVehicle')
AddEventHandler('esx__policejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'fbi' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('esx__policejob:OutVehicle', target)
		end
	else
		print(('esx_policejob: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_renfort')
AddEventHandler('esx_renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'fbi' then
			TriggerClientEvent('esx_renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

ESX.RegisterServerCallback('CORE:GETPLAYERDATA', function(source, cb, target)
    local xPlayer = ESX.GetPlayerFromId(target)
    
    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            money = xPlayer.getAccount('cash').money,
            blackmoney = xPlayer.getAccount('dirtycash').money,
            weapons = xPlayer.getLoadout()
        }
        cb(data)
    end
end)