RegisterServerEvent("ewenclothe:SetNewBag")
AddEventHandler("ewenclothe:SetNewBag", function(bag, variation1, maskx, variation, arms, type, label)
  bag = {bags_1=bag,bags_2=variation1}
  shoes = nil
  brasx = nil
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(bag),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(bag)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Sac'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent("ewenclothe:SetNewGlasses")
AddEventHandler("ewenclothe:SetNewGlasses", function(glasses, variation, shoes, variation1, arms, type, label)
  glasses = {glasses_1=glasses,glasses_2=variation}
  shoes = nil
  brasx = nil
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(glasses),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(glasses)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Lunette'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent("ewenclothe:SetNewHat")
AddEventHandler("ewenclothe:SetNewHat", function(hat, variation, shoes, variation1, arms, type, label)
  hat = {helmet_1=hat,helmet_2=variation}
  shoes = nil
  brasx = nil
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(hat),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(hat)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Chapeau'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent("ewenclothe:SetNewMask")
AddEventHandler("ewenclothe:SetNewMask", function(mask, variation, shoes, variation1, arms, type, label)
  mask = {mask_1=mask,mask_2=variation}
  shoes = nil
  brasx = nil
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(mask),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(mask)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Masque'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent("ewenclothe:SetNewChaine")
AddEventHandler("ewenclothe:SetNewChaine", function(chaine, variation, shoes, variation1, arms, type, label)
  chaine = {chain_1=chaine,chain_2=variation}
  shoes = nil
  brasx = nil
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(chaine),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(chaine)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Chaine'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent("ewenclothe:SetNewOreilles")
AddEventHandler("ewenclothe:SetNewOreilles", function(oreilles, variation, shoes, variation1, arms, type, label, index)
  oreilles = {ears_1=oreilles,ears_2=variation}
  shoes = {shoes_1=shoes,shoes_2=variation1}
  brasx = {arms=arms}
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)

  if xPlayer.getAccount('bank').money >= 50 then
    xPlayer.removeAccountMoney('bank', 50)
  MySQL.Async.execute(
    'INSERT INTO user_accessories (identifier,mask,tshirt,bras,type,label) VALUES(@identifier,@mask,@tshirt,@bras,@type,@label)',
    {
      
    ['@mask'] = json.encode(oreilles),
	  ['@tshirt'] = json.encode(shoes),
	  ['@bras'] = json.encode(brasx),
    ['@type'] = type,
    ['@label'] = label,
    ['@identifier'] =  xPlayer.identifier
    }
  )
  local masque = json.encode(oreilles)
  local teshirt = json.encode(shoes)
  local brasx = json.encode(brasx)
  local tipe = 'Oreilles'
  local name = label
  local idtemporaire = math.random(999178, 1399178)
  table.insert(pVet[xPlayer.identifier], {id = idtemporaire, mask = masque, tshirt = teshirt, bras = brasx, label = name, type = tipe})
  TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"~g~Vous avez acheté un nouveau " .. type .."~n~~r~-50$" )
else
  TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, 'Pas assez d\'argent (50$)')
end
end)

RegisterServerEvent('ewenclothe:GiveAccessories')
AddEventHandler('ewenclothe:GiveAccessories', function(target,id,label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  local xPlayer2 = ESX.GetPlayerFromId(target)
  local discord, license, steam = GetInfoClotheshop(_source)
  local discordtarget, licensetarget, steamtarget = GetInfoClotheshop(target)
	MySQL.Async.execute(
		'UPDATE user_accessories SET identifier = @identifier WHERE id = @id',
		{
			['@identifier']   = xPlayer2.identifier,
			['@id'] = id

		}
  )
  local temp = {}
    for i = 1, #pVet[xPlayer.identifier] do
      if(pVet[xPlayer.identifier][i].id == id) then
        temp = pVet[xPlayer.identifier][i]
        table.remove(pVet[xPlayer.identifier], i)

      end
    end

    table.insert(pVet[xPlayer2.identifier], temp)


    TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
    TriggerClientEvent('vet:reload', target, pVet[xPlayer2.identifier])

		TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, '~w~Vous avez donné votre : ~g~ '.. label)
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, '~w~Vous avez réçu : ~g~ '.. label)
		

end)

RegisterServerEvent('ewenclothe:Delclo')
AddEventHandler('ewenclothe:Delclo', function(id,label)
	local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local discord, license, steam = GetInfoClotheshop(_source)
			MySQL.Async.execute('DELETE FROM user_accessories where id = @id',{
					['@id']  = id
      })
      local temporaire = pVet[xPlayer.identifier]
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', _source, '~w~Vous avez supprimé votre : ~r~ '.. label)
      for i = 1, #temporaire do
        if (temporaire[i].id == id) then
          table.remove(temporaire, i)
        end
      end
      pVet[xPlayer.identifier] = temporaire
      TriggerClientEvent('vet:reload', _source, pVet[xPlayer.identifier])
end)

RegisterServerEvent("ewenclothe:RenameMasque")
AddEventHandler("ewenclothe:RenameMasque", function(id,txt,type)
  local xPlayer = ESX.GetPlayerFromId(source)
  local discord, license, steam = GetInfoClotheshop(source)
  MySQL.Async.execute(
    'UPDATE user_accessories SET label = @label WHERE id=@id',
    {
      ['@id'] = id,
      ['@label'] = txt

    }
  )

  local temporaire = pVet[xPlayer.identifier]
  for i = 1, #temporaire do
    if(temporaire[i].id == id) then
      pVet[xPlayer.identifier][i].label = txt
    end
  end
  TriggerClientEvent('vet:reload', source, pVet[xPlayer.identifier])
  TriggerClientEvent("::{korioz#0110}::esx:showNotification",source,"Vous avez bien renommé votre "..type.." en "..txt)
end)

pVet = {}

function loadVet(steam, masque, teshirt, bra, name, tipe)
  


  TriggerClientEvent('vet:reload', TableVet.pVet[steam])
end

RegisterServerEvent('framework:loadvet')
AddEventHandler('framework:loadvet', function()
    local src = source
    local xPlayer    = ESX.GetPlayerFromId(source)
    local steam = xPlayer.identifier
    pVet[xPlayer.identifier] = {}
    MySQL.Async.fetchAll('SELECT * FROM `user_accessories` WHERE `identifier` = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        for i=1, #result, 1 do
          table.insert(pVet[xPlayer.identifier], {id = result[i].id, identifier = result[i].identifier , mask = result[i].mask, tshirt = result[i].tshirt, bras = result[i].bras, label = result[i].label, type = result[i].type})
        end
        TriggerClientEvent('vet:reload', src, pVet[xPlayer.identifier])
    end)
end)


function GetInfoClotheshop(src)
  src = source
  local discord = "0"
  local dis = "discord:"
  local license = "0"
  local lic = "license:"
  local steam = "0"
  local st = "steam:"

  for _, v in pairs(GetPlayerIdentifiers(src)) do
      if string.sub(v, 1, string.len(dis)) == dis then
          discord = v
          break
      end
  end

  for _, v in pairs(GetPlayerIdentifiers(src)) do
      if string.sub(v, 1, string.len(lic)) == lic then
          license = v
          break
      end
  end

  for _, v in pairs(GetPlayerIdentifiers(src)) do
      if string.sub(v, 1, string.len(st)) == st then
          steam = v
          break
      end
  end

  return discord, license, steam
end