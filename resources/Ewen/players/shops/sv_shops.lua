local listeItem = {
    ['phone'] = {name = 'phone', label = 'Téléphone', price = 150, category = 'Superette'},
    ['burger'] = {name = 'burger', label = 'Hamburger', price = 50, category = 'Superette'},
    ['water'] = {name = 'water', label = 'Eau de source', price = 50, category = 'Superette'},
    ['hammer'] = {name = 'hammer', label = 'Marteau', price = 250, category = 'Quincaillerie'},
    ['crowbar'] = {name = 'crowbar', label = 'Pied de Biche', price = 250, category = 'Quincaillerie'},
    ['hatchet'] = {name = 'hatchet', label = 'Hâche', price = 250, category = 'Quincaillerie'},
    ['wrench'] = {name = 'wrench', label = 'Clé Anglaise', price = 250, category = 'Quincaillerie'},
    ['golfclub'] = {name = 'golfclub', label = 'Club de Golf', price = 250, category = 'Quincaillerie'},
    ['knife'] = {name = 'knife', label = 'Couteau', price = 15000, category = 'Ammu-Nation'},
    ['weapon_bat'] = {name = 'weapon_bat', label = 'Batte de Baseball', price = 15000, category = 'Ammu-Nation'},
    ['weapon_nightstick'] = {name = 'weapon_nightstick', label = 'Matraque', price = 15000, category = 'Ammu-Nation'},
    ['weapon_knuckle'] = {name = 'weapon_knuckle', label = 'Poing Américain', price = 15000, category = 'Ammu-Nation'},
    ['weapon_knife'] = {name = 'weapon_knife', label = 'Couteau - Vip ~y~Gold', price = 15000, category = 'Ammu-Nation'},
    ['weapon_battleaxe'] = {name = 'weapon_battleaxe', label = 'Hache de Combat - Vip ~y~Gold', price = 15000, category = 'Ammu-Nation'},
    ['weapon_poolcue'] = {name = 'weapon_poolcue', label = 'Queue de billard - Vip ~y~Gold', price = 15000, category = 'Ammu-Nation'},
    ['weapon_snspistol'] = {name = 'weapon_snspistol', label = 'Pistolet SNS - Vip ~b~Diamond', price = 50000, category = 'Ammu-Nation'},
    ['weapon_pistol'] = {name = 'weapon_pistol', label = 'Berreta - Vip ~b~Diamond', price = 75000, category = 'Ammu-Nation'},
    ['pistol_box'] = {name = 'pistol_box', label = 'Boite de 45ACP', price = 180, category = 'Ammu-Nation'},
    ['smg_box'] = {name = 'smg_box', label = 'Boite de 9mm', price = 240, category = 'Ammu-Nation'},
    ['rifle_box'] = {name = 'rifle_box', label = 'Boite de 5.56', price = 300, category = 'Ammu-Nation'},
    ['mg_box'] = {name = 'mg_box', label = 'Boite de 7.62', price = 360, category = 'Ammu-Nation'},
    ['shotgun_box'] = {name = 'shotgun_box', label = 'Boite de Calibre 12', price = 600, category = 'Ammu-Nation'},
    ['pistol_ammo'] = {name = 'pistol_ammo', label = 'Balle de 45ACP', price = 15, category = 'Ammu-Nation'},
    ['smg_ammo'] = {name = 'smg_ammo', label = 'Balle de 9mm', price = 20, category = 'Ammu-Nation'},
    ['rifle_ammo'] = {name = 'rifle_ammo', label = 'Balle de 5.56', price = 25, category = 'Ammu-Nation'},
    ['mg_ammo'] = {name = 'mg_ammo', label = 'Balle de 7.62', price = 30, category = 'Ammu-Nation'},
    ['shotgun_ammo'] = {name = 'shotgun_ammo', label = 'Balle de Calibre 12', price = 50, category = 'Ammu-Nation'},
    ['radio'] = {name = 'radio', label = 'Radio', price = 75, category = 'Superette'},
    ['cafe'] = {name = 'cafe', label = 'Café - VIP ~y~Gold', price = 50, category = 'Superette'},
    ['donut'] = {name = 'donut', label = 'Donut - VIP ~y~Gold', price = 50, category = 'Superette'},
    ['jusleechi'] = {name = 'jusleechi', label = 'Jus de Leechi - VIP ~y~Diamond', price = 50, category = 'Superette'},
    ['hotdog'] = {name = 'hotdog', label = 'Hot-dog - VIP ~y~Diamond', price = 50, category = 'Superette'},
}

RegisterServerEvent('core:achat')
AddEventHandler('core:achat', function(item, price, type)
    local xPlayer = ESX.GetPlayerFromId(source)

    if listeItem[item] == nil then
        DropPlayer(source, 'Utilisation d\'un Trigger ( LTD )'.. item, price, type)
    else
        if listeItem[item].name == item and listeItem[item].price == tonumber(price) then
            if type == 1 then
                if xPlayer.getAccount('cash').money >= listeItem[item].price then
                    xPlayer.removeAccountMoney('cash', price)
                    if listeItem[item].category == "Ammu-Nation" then
                        xPlayer.addWeapon(listeItem[item].name, 25)
                    else
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    end
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~g~'.. listeItem[item].category.. '~n~~w~Vous avez acheté ~b~'.. listeItem[item].label .. '~w~ pour : '.. listeItem[item].price .. '$')
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~b~Type de paiement : ~w~Liquide') 
                else
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~g~'.. listeItem[item].category ..'~n~~w~Vous n\'avez pas l\'argent nécéssaire')
                end
            elseif type == 2 then
                if tonumber(xPlayer.getAccount('bank').money) >= price then
                    xPlayer.removeAccountMoney('bank', price)
                    if listeItem[item].category == "Ammu-Nation" then
                        xPlayer.addWeapon(listeItem[item].name, 25)
                    else
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    end
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~g~'.. listeItem[item].category.. ' ~n~~w~Vous avez acheté ~b~'.. listeItem[item].label .. '~w~ pour : '.. listeItem[item].price .. '$')
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~b~Type de paiement : ~w~Carte Bancaire')
                else
                    TriggerClientEvent('::{korioz#0110}::esx:showNotification', xPlayer.source, '~g~'.. listeItem[item].category ..'~n~~w~Vous n\'avez pas l\'argent nécéssaire')
                end
            end
        else 
            DropPlayer(source, 'Utilisation d\'un Trigger ( LTD )'.. item, price, type)
        end
    end

end)