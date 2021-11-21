TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("::{korioz#0110}::jobs_civil:pay")
AddEventHandler("::{korioz#0110}::jobs_civil:pay", function(money, whoim, ntm2)
    local _source = source
    if whoim:len() == 10 and ntm2:len() == 17 then
    if money < 1000 then
        local xPlayer = ESX.GetPlayerFromId(_source)
        TriggerEvent('::{korioz#0110}::esx:customDiscordLog', "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") - JOBS CIVIL ARGENT : " .. money)
        xPlayer.addAccountMoney('cash', money)
    else
        TriggerEvent('BanSql:ICheatServer', _source)
    end
else
    TriggerEvent('BanSql:ICheatServer', _source)
end
end)

