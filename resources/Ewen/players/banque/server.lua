RegisterServerEvent('ewen:retraitMoney')
AddEventHandler('ewen:retraitMoney', function(withdraw)
  local xPlayer    = ESX.GetPlayerFromId(source)
  local money = tonumber(withdraw)
  if xPlayer.getAccount('bank').money >= money then
    xPlayer.removeAccountMoney('bank', money)
    xPlayer.addAccountMoney('cash', money)
    xPlayer.showNotification('~b~SeaLife ~n~~w~Tu as retiré : ~g~'.. money.. '$')
  else
    xPlayer.showNotification('~b~SeaLife ~n~~w~Ton solde n\'est pas suffisant !')
  end
end)

RegisterServerEvent('ewen:addMoney')
AddEventHandler('ewen:addMoney', function(deposit)
  local xPlayer    = ESX.GetPlayerFromId(source)
  local money = tonumber(deposit)
  if xPlayer.getAccount('cash').money >= money then
    xPlayer.addAccountMoney('bank', money)
    xPlayer.removeAccountMoney('cash', money)
    xPlayer.showNotification('~b~SeaLife ~n~~w~Tu as déposé : ~g~'.. money.. '$')
  else
    xPlayer.showNotification('~b~SeaLife ~n~~w~Ton solde n\'est pas suffisant !')
  end
end)