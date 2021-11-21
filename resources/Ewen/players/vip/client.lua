local vipRank = 0

RegisterNetEvent('SeaLifeVIP:updateVip')
AddEventHandler('SeaLifeVIP:updateVip', function(rank)
    vipRank = rank
end)

Citizen.CreateThread(function()
    while not ESXLoaded do
        Wait(1)
    end
    ESX.TriggerServerCallback("SeaLifeVIP:getVip", function(vip) 
        vipRank = vip
    end)
end)

function GetVIP()
    return vipRank
end