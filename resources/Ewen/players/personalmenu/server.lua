RegisterServerEvent('Core:setJob')
AddEventHandler('Core:setJob', function(job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob(job, grade)	
end)

RegisterServerEvent('Core:setJob2')
AddEventHandler('Core:setJob2', function(job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob2(job, grade)	
end)

RegisterServerEvent('ewen:identity')
AddEventHandler('ewen:identity', function(options, target)
    if options == 1 then 
        -- REGARDER
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(result)

            if result[1] then
                xPlayer.showNotification('~b~SeaLife - Carte d\'identité')
                xPlayer.showNotification('Prénom : ~b~'.. result[1].firstname)
                xPlayer.showNotification('Nom : ~b~'.. result[1].lastname)
                xPlayer.showNotification('Date de naissance : ~b~'.. result[1].dateofbirth)
                xPlayer.showNotification('Sexe : ~b~'.. result[1].sex)
                xPlayer.showNotification('Taille : ~b~'.. result[1].height .. 'cm')
            end

        end)
    elseif options == 2  then
        -- MONTRER
        local xPlayer = ESX.GetPlayerFromId(target)
        local target = ESX.GetPlayerFromId(source)
        MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
            ['@identifier'] = target.identifier
        }, function(result)

            if result[1] then
                xPlayer.showNotification('~b~SeaLife - Carte d\'identité')
                xPlayer.showNotification('Prénom : ~b~'.. result[1].firstname)
                xPlayer.showNotification('Nom : ~b~'.. result[1].lastname)
                xPlayer.showNotification('Date de naissance : ~b~'.. result[1].dateofbirth)
                xPlayer.showNotification('Sexe : ~b~'.. result[1].sex)
                xPlayer.showNotification('Taille : ~b~'.. result[1].height .. 'cm')
            end

        end)
    else
        DropPlayer(source, 'Utilisation Triggers')
    end
end)

RegisterServerEvent('ewen:notification')
AddEventHandler('ewen:notification', function(type, itemTransaction, player, numbers)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromId(player)

    if type == 'money' then
        xPlayer.showNotification("~b~SeaLife  ~w~~n~Vous avez donné ~g~de l'argent en liquide")
        target.showNotification("~b~SeaLife  ~w~~n~Vous avez reçu ~g~de l'argent en liquide, vérifiez vos poches !")
    elseif type == 'dirtycash' then
        xPlayer.showNotification("~b~SeaLife  ~w~~n~Vous avez donné ~r~de l'argent sale")
        target.showNotification("~b~SeaLife  ~w~~n~Vous avez reçu ~r~de l'argent sale, vérifiez vos poches !")
    elseif type == 'item' then
        xPlayer.showNotification("~b~SeaLife  ~w~~n~Vous avez donné ~g~".. numbers .. " " ..itemTransaction)
        target.showNotification("~b~SeaLife  ~w~~n~Vous avez reçu ~g~x".. numbers.. " " ..itemTransaction)
    elseif type == 'weapon' then
        xPlayer.showNotification("~b~SeaLife  ~w~~n~Vous avez donné ~g~".. itemTransaction .. "")
        target.showNotification("~b~SeaLife  ~w~~n~Vous avez reçu ~g~".. itemTransaction .. "")
    end
end)

RegisterServerEvent('ewen:transferweapon')
AddEventHandler('ewen:transferweapon', function(target, weapon)
    itemName = string.upper(weapon)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
    if sourceXPlayer.hasWeapon(itemName) then
        local weaponLabel = ESX.GetWeaponLabel(itemName)
    
        if not targetXPlayer.hasWeapon(itemName) then
            local weaponNum, weapon = sourceXPlayer.getWeapon(itemName)
            itemCount = weapon.ammo
            print(itemName)
            sourceXPlayer.removeWeapon(itemName)
            targetXPlayer.addWeapon(itemName, 250)
        end
    end
end)



ESX.RegisterServerCallback('ewen:getFactures', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

RegisterCommand('goto', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerGroup = xPlayer.getGroup()
  
    if playerGroup ~= 'user' then
        if args[1] == nil then 
            TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, 'Vous devez spécifier un joueur')
            return
        end
        local ped = GetPlayerPed(args[1])
        local playerCoords = GetEntityCoords(ped)
        TriggerClientEvent('framework:tp', source, playerCoords)
    end
end)
  
RegisterCommand('bring', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerGroup = xPlayer.getGroup()

    if playerGroup ~= 'user' then
        if args[1] == nil then 
            TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, 'Vous devez spécifier un joueur')
            return
        end
        local ped = GetPlayerPed(source)
        local playerCoords = GetEntityCoords(ped)
        TriggerClientEvent('framework:tp', args[1], playerCoords)
    end
end)

RegisterNetEvent("Admin:ActionTeleport")
AddEventHandler('Admin:ActionTeleport', function(action, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getGroup() ~= "user" then 
        if action == "teleportto" then 
            local ped = GetPlayerPed(id)
            local coord = GetEntityCoords(ped)
            TriggerClientEvent("Admin:ActionTeleport", _source, "teleportto", coord)
        elseif action == "teleportme" then 
            local ped = GetPlayerPed(_source)
            local coord = GetEntityCoords(ped)
            TriggerClientEvent("Admin:ActionTeleport", id, "teleportme", coord)
        elseif action == "teleportpc" then
            local coord = vector3(215.76, -810.12, 30.73)
            TriggerClientEvent("Admin:ActionTeleport", id, "teleportpc", coord)
        end
    else
        TriggerEvent("BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [téléportation]")
    end
end)