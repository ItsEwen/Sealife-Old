ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

local arrayWeight = {

  armor = 3,
  bandage = 0.5,
  beer = 1,
  blowpipe = 3,
  bread = 0.5,
  burger = 0.8,	
  carokit = 3,
  carotool = 4,
  cigarette = 0.1,
  clip = 1,
  coca = 0.5,
  coke = 1,
  coke_coupe = 1,	
  coke_pooch = 2,
  cola = 0.5,
  cutter = 2,
  fishandchips = 1,
  fixkit = 2,
  fixtool = 4,
  id_card_f = 2,
  limonade = 0.5,
  medikit = 2,
  meth = 1,
  meth_coupe = 1,
  meth_pooch = 2,
  oeuvreart = 8,
  oeuvreart_luxe = 8,
  peinture = 10,
  peinture_luxe = 10,
  phone= 1,
  radio = 3,
  redbull = 0.3,
  secure_card = 2,
  tequila = 2,	
  ventouse = 3,
  vodka = 2,
  water = 0.8,	
  weed = 1,
  weed_pooch = 2,
  whisky = 2,

  -- armes
  WEAPON_COMBATPISTOL = 1000, -- poid poir une munnition
  WEAPON_NIGHTSTICK       = 500,
  WEAPON_STUNGUN          = 1000,
  WEAPON_FLASHLIGHT       = 500,
  WEAPON_FLAREGUN         = 1000,
  WEAPON_FLARE            = 1000,
  WEAPON_COMBATPISTOL     = 2500,
  WEAPON_HEAVYPISTOL      = 4000,
  WEAPON_ASSAULTSMG       = 7000,
  WEAPON_COMBATPDW        = 7000,
  WEAPON_BULLPUPRIFLE     = 8000,
  WEAPON_PUMPSHOTGUN      = 8000,
  WEAPON_BULLPUPSHOTGUN   = 10000,
  WEAPON_CARBINERIFLE     = 10000,
  WEAPON_ADVANCEDRIFLE    = 10000,
  WEAPON_MARKSMANRRIFLE   = 15000,
  WEAPON_SNIPERRIFLE      = 15000,
  WEAPON_FIREEXTINGUISHER = 1500, 
  GADGET_PARACHUTE        = 5000,
  WEAPON_BAT              = 1500,
  WEAPON_PISTOL           = 5000,

  -- argent
  dirtycash = 0.0, -- poids pour un argent sale

}
local VehicleList = { }
local VehicleInventory = {}

--[[AddEventHandler('onMySQLReady', function ()
	MySQL.Async.execute( 'DELETE FROM `truck_inventory` WHERE `owned` = 0', {})
end)]]

function getItemWeight(item)
  local weight = 0
  local itemWeight = 0
    if item ~= nil then
      itemWeight = 1
      if arrayWeight[item] ~= nil then
        itemWeight = arrayWeight[item]
      end
    end
  return itemWeight
end

function getInventoryWeight(inventory)
  local weight = 0
  local itemWeight = 0
  if inventory ~= nil then
	  for i=1, #inventory, 1 do
	    if inventory[i] ~= nil then
	      itemWeight = 1
	      if arrayWeight[inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[inventory[i].name]
	      end
	      weight = weight + (itemWeight * (inventory[i].count or 1))
	    end
	  end
  end
  return weight
end

function getTotalInventoryWeight(plate)
  local total
  TriggerEvent('esx_truck:getSharedDataStore',plate,function(store)
    local W_weapons = getInventoryWeight(store.get('weapons') or {})
    local W_coffre = getInventoryWeight(store.get('coffre') or {})

    total = W_weapons + W_coffre 
  end)
  return total
end

ESX.RegisterServerCallback('esx_truck:getInventoryV',function(source,cb,plate)
  TriggerEvent('esx_truck:getSharedDataStore',plate,function(store)
    local blackMoney = 0
    local items      = {}
    local weapons    = {}
    weapons = (store.get('weapons') or {})

    local blackAccount = (store.get('dirtycash')) or 0

    if blackAccount ~=0 then
      blackMoney = blackAccount[1].amount
    end

    local coffre = (store.get('coffre') or {})
    for i=1,#coffre,1 do
      table.insert(items,{name=coffre[i].name,count=coffre[i].count,label=ESX.GetItemLabel(coffre[i].name)})
    end

    local weight = getTotalInventoryWeight(plate)
    cb({
    blackMoney = blackMoney,
    items      = items,
    weapons    = weapons,
    weight     = weight
    })
  end)
end)

RegisterServerEvent('esx_truck:getItem')
AddEventHandler('esx_truck:getItem', function(plate, type, item, count)
  local _src = source
  TriggerEvent("ratelimit", _src, "esx_truck:getItem")
  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_standard' then
    TriggerEvent('esx_truck:getSharedDataStore', plate, function(store)
      local coffre = (store.get('coffre') or {})
      for i=1, #coffre,1 do
        if coffre[i].name == item then
          if (coffre[i].count >= count and count > 0) then
            if (xPlayer.getWeight()+(getItemWeight(item)*count)) > ESX.GetConfig().MaxWeight then return TriggerClientEvent("::{korioz#0110}::esx:showNotification", _source, "~r~Vous n'avez pas assez de place sur vous !") end        
            xPlayer.addInventoryItem(item, count)
            --SendLogs(3066993,"Coffre voiture - Retirer","**"..GetPlayerName(_source).."** vient de retirer ***"..count.."*** "..ESX.GetItemLabel(item).." dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841169574782959657/xCW3LmXNExjl0EfR8XcR1czgW2GrkMizcrZZ7n3agbnwACRM6-0ZVQNCR8j8l8BAD5XI")
            if (coffre[i].count - count) == 0 then
              table.remove(coffre,i)
            else
              coffre[i].count = coffre[i].count - count
            end
            break
          else
            TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, '~r~Quantité invalide')
          end
        end
      end


      store.set('coffre',coffre)
    end)
  end

  if type == 'item_account_black' then

    TriggerEvent('esx_truck:getSharedDataStore', plate, function(store)

      local blackMoney = store.get('dirtycash')
      if (blackMoney[1].amount >= count and count > 0) then
        blackMoney[1].amount = blackMoney[1].amount - count
        store.set('dirtycash', blackMoney)
        xPlayer.addAccountMoney("dirtycash", count)
        --SendLogs(3066993,"Coffre voiture - Retirer","**"..GetPlayerName(_source).."** vient de retirer ***"..count.."*** d'argent sale dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841171997333520384/hgBFKC5C53stsSh_-O14D6pO50D19Chru63OIcEdS5HIV02-ZEoTOqGr0ctu6Ka6xSSv")
      else
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source,'Montant invalide')
      end
    end)

  end

  if type == 'item_weapon' then

    TriggerEvent('esx_truck:getSharedDataStore',  plate, function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      local weaponName   = nil
      local ammo         = nil

      for i=1, #storeWeapons, 1 do
        if storeWeapons[i].name == item then

          weaponName = storeWeapons[i].name
          ammo       = storeWeapons[i].ammo

          table.remove(storeWeapons, i)

          break
        end
      end

      -- if (xPlayer.getWeight()+(getItemWeight(item)*count)) > ESX.GetConfig().MaxWeight then return TriggerClientEvent("::{korioz#0110}::esx:showNotification", _source, "~r~Vous n'avez pas assez de place sur vous !") end        

      store.set('weapons', storeWeapons)
      --SendLogs(3066993,"Coffre voiture - Retirer","**"..GetPlayerName(_source).."** vient de retirer ***"..ammo.."*** ***"..ESX.GetWeaponLabel(weaponName).."*** dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841171711407161364/6w08BTbLd7mkp4YHETul3eXkBe3qHsfYaQElPHlo8d0Z1JisuecMNsvNP_6KtsocFCd3")
      xPlayer.addWeapon(weaponName, ammo)

    end)

  end

end)

RegisterServerEvent('esx_truck:putItem')
AddEventHandler('esx_truck:putItem', function(plate, type, item, count,max)
  local _src = source
  TriggerEvent("ratelimit", _src, "esx_truck:putItem")
  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)
  local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)
  
  if type == 'item_standard' then

    local playerItemCount = xPlayer.getInventoryItem(item).count

    if (playerItemCount >= count and count > 0 )then

      TriggerEvent('esx_truck:getSharedDataStore', plate, function(store)
        local found = false
        local coffre = (store.get('coffre') or {})


        for i=1,#coffre,1 do
          if coffre[i].name == item then
            coffre[i].count = coffre[i].count + count
            found = true
          end
        end
        if not found then
          table.insert(coffre, {
            name = item,
            count = count
          })
        end
        if (getTotalInventoryWeight(plate)+(getItemWeight(item)*count)) > max then
            TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'plus de place dans le ~r~ coffre')
        else
          store.set('coffre', coffre)
          --SendLogs(15158332,"Coffre voiture - Déposer","**"..GetPlayerName(_source).."** vient de déposer ***"..count.."*** ***"..ESX.GetItemLabel(item).."*** dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841169574782959657/xCW3LmXNExjl0EfR8XcR1czgW2GrkMizcrZZ7n3agbnwACRM6-0ZVQNCR8j8l8BAD5XI")
          xPlayer.removeInventoryItem(item, count)
        end
      end)

    else
      TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Quantité invalide')
    end

  end

  if type == 'item_account_black' then

    local playerAccountMoney = xPlayer.getAccount(item).money


    if (playerAccountMoney >= count and count > 0) then

      TriggerEvent('esx_truck:getSharedDataStore', plate , function(store)

        local blackMoney = (store.get('dirtycash') or nil)
        if blackMoney ~= nil then
          blackMoney[1].amount = blackMoney[1].amount + count
        else
          blackMoney = {}
          table.insert(blackMoney,{amount=count})
        end

          xPlayer.removeAccountMoney(item, count)
          store.set('dirtycash', blackMoney)
          --SendLogs(15158332,"Coffre voiture - Déposer","**"..GetPlayerName(_source).."** vient de déposer ***"..count.."*** Argent sale dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841171997333520384/hgBFKC5C53stsSh_-O14D6pO50D19Chru63OIcEdS5HIV02-ZEoTOqGr0ctu6Ka6xSSv")
      end)

    else
      TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Montant invalide')
    end

  end


  if type == 'item_weapon' then

    TriggerEvent('esx_truck:getSharedDataStore', plate, function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      table.insert(storeWeapons, {
        name = item,
        ammo = count
      })
      if (getTotalInventoryWeight(plate)+(getItemWeight(item)))>max then
          TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'plus de place dans le ~r~ coffre')
      else
        store.set('weapons', storeWeapons)
        xPlayer.removeWeapon(item)
        --SendLogs(15158332,"Coffre voiture - Déposer","**"..GetPlayerName(_source).."** vient de déposer ***"..count.."*** ***"..ESX.GetWeaponLabel(item).."*** dans le véhicule ***"..plate.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/841171711407161364/6w08BTbLd7mkp4YHETul3eXkBe3qHsfYaQElPHlo8d0Z1JisuecMNsvNP_6KtsocFCd3")
      end
    end)

  end

end)