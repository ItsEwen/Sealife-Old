TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj)
    ESX = obj
end)

local staff = {}
local allreport = {}
local reportcount = {}
ESX.AddCommand('report', function(source, args, user)
    local xPlayerSource = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT jail_time FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayerSource.identifier
    }, function(result)
        if result[1] and result[1].jail_time > 0 then
            TriggerClientEvent('chatMessage', source, "^1[Assistance]", {5, 300, 400}, "^2 Vous ne pouvez pas faire de report en prison !")
            return
        else
            local isadded = false
            for k,v in pairs(reportcount) do
                if v.id == source then
                    isadded = true
                end
            end
            if not isadded then
                table.insert(reportcount, { 
                    id = source,
                    gametimer = 0
                })
            end
            for k,v in pairs(reportcount) do
                if v.id == source then
                    if v.gametimer + 60000 > GetGameTimer() and v.gametimer ~= 0 then
                        TriggerClientEvent('chatMessage', source, "^1[Assistance] ", {5, 300, 400}, "^5 Vous devez attendre 60s avant de faire de nouveau un report !")
                        return
                    else
                        v.gametimer = GetGameTimer()
                    end
                end
            end
            TriggerClientEvent('chatMessage', source, "^1[Assistance] ", {0, 0, 0}, "^5 Votre Report a bien été envoyé !")
            PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "SunLite", content = "```ID : " .. source .. "\nName : " .. GetPlayerName(source) .. "\nMessage : " .. table.concat(args, " ") .. "```"}), { ['Content-Type'] = 'application/json' })
            table.insert(allreport, {
                id = source,
                name = GetPlayerName(source),
                reason = table.concat(args, " ")
            })
            local xPlayers = ESX.GetPlayers()
            for i = 1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                if xPlayer and xPlayer.getLevel() > 0 then
                    TriggerClientEvent('::{korioz#0110}::esx:showAdvancedNotification', xPlayer.source, 'Nouveau Report', "~r~"..GetPlayerName(source).." ["..xPlayer.source.."]", "~r~Raison~s~ : "..table.concat(args, " ").."", 'CHAR_SUNLITE', 2)
                    TriggerClientEvent("Ayzwen:RefreshReport", xPlayer.source)
                end
            end
        end
    end)
end, {help = "Signaler un joueur ou un problème", params = { {name = "report", help = "Ce que vous voulez signaler"} }})

--[[ESX.AddCommand('gf', function(source, args, user)
    TriggerClientEvent("::{korioz#0110}::esx_ambulancejob:revive", source)
end, {help = "Se revive bande de fdp", params = {}})

ESX.AddCommand('arme', function(source, args, user)
    TriggerClientEvent("arme:event", source)
end, {help = "Se donne arme fdp", params = {}})]]--

ESX.AddCommand('id', function(source, args, user)
    TriggerClientEvent('chatMessage', source, "^2[Assistance] ", {5, 300, 400}, "^5 Votre ID est le ".. source .. " !")
end, {help = "Connaitre votre ID", params = {}})

RegisterServerEvent("Ayzwen:GiveItem")
AddEventHandler("Ayzwen:GiveItem", function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Item ! " .. "\n\nItem Name : " .. item .. "```" }), { ['Content-Type'] = 'application/json' })
        xPlayer.addInventoryItem(item, 1)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:GiveWeapon")
AddEventHandler("Ayzwen:GiveWeapon", function(Arme)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Weapon ! " .. "\n\nWeapon Name : " .. Arme .. "```" }), { ['Content-Type'] = 'application/json' })
        xPlayer.addWeapon(Arme, 150)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:LogsPed")
AddEventHandler("Ayzwen:LogsPed", function(Ped)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Transformation ! " .. "\n\nPed name : " .. Ped .. "```" }), { ['Content-Type'] = 'application/json' })
        --xPlayer.addWeapon(Arme, 150)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:SendLogs")
AddEventHandler("Ayzwen:SendLogs", function(action)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : ".. action .." !```" }), { ['Content-Type'] = 'application/json' })
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:onStaffJoin")
AddEventHandler("Ayzwen:onStaffJoin", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.getLevel() > 0 then
            TriggerClientEvent('::{korioz#0110}::esx:showAdvancedNotification', xPlayer.source, "Cardinal", "~r~System", "~r~"..GetPlayerName(source).."~s~ ~g~a pris~s~ son service", 'CHAR_SUNLITE', 3)
        end
    end
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Active Staff Mode !```" }), { ['Content-Type'] = 'application/json' })
        table.insert(staff, source)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:onStaffLeave")
AddEventHandler("Ayzwen:onStaffLeave", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer and xPlayer.getLevel() > 0 then
            TriggerClientEvent('::{korioz#0110}::esx:showAdvancedNotification', xPlayer.source, "Cardinal", "~r~System", "~r~"..GetPlayerName(source).."~s~ ~r~a quitté~s~ son service", 'CHAR_SUNLITE', 3)
        end
    end
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Redevient humain !```" }), { ['Content-Type'] = 'application/json' })
        table.remove(staff, source)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:Jail")
AddEventHandler("Ayzwen:Jail", function(id, temps)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Jail !\n\nJail Info\nName : " .. GetPlayerName(id) .. "\nTime : ".. temps .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerEvent("::{korioz#0110}::esx_jail:sendToJail", id, temps)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:GiveMoney")
AddEventHandler("Ayzwen:GiveMoney", function(type, money)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Money ! " .. "\n\nAmount : " .. money .. "\nType : " .. type .. "```" }), { ['Content-Type'] = 'application/json' })
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Money ! " .. "\n\nAmount : " .. money .. "\nType : " .. type .. "```" }), { ['Content-Type'] = 'application/json' })
        if type == "cash" then
            xPlayer.addAccountMoney('cash', money)
        end
        if type == "bank" then
            xPlayer.addAccountMoney('bank', money)
        end
        if type == "dirtycash" then
            xPlayer.addAccountMoney('dirtycash', money)
        end
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:teleport")
AddEventHandler("Ayzwen:teleport", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Teleport to Players ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("Ayzwen:teleport", source, GetEntityCoords(GetPlayerPed(id)))
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:teleportTo")
AddEventHandler("Ayzwen:teleportTo", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Teleport Players to Admin ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("Ayzwen:teleport", id, GetEntityCoords(GetPlayerPed(source)))
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:Revive")
AddEventHandler("Ayzwen:Revive", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Revive ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("::{korioz#0110}::esx_ambulancejob:revive", id)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:teleportcoords")
AddEventHandler("Ayzwen:teleportcoords", function(id, coords)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        TriggerClientEvent("Ayzwen:teleport", id, vector3(215.76, -810.12, 30.73))
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:setGroup")
AddEventHandler("Ayzwen:setGroup", function(id, group)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/801881254655819797/9scyAtCRfLL_iH_gYDifdp1sF_TYZZVcFu6cOvxccVDauZCI2pm1JXRHeCt1-IrKhbBT", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Group ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Group : " .. group .. "```" }), { ['Content-Type'] = 'application/json' })
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/802150221396181042/oQcfeWoBAgJtp9IDWIKQtg7vOs4S9YTOw5gYUUY4SuRMXTBXtv3BlTtwBkF7gcnHErI2", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Group ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Group : " .. group .. "```" }), { ['Content-Type'] = 'application/json' })
        local xPlayertoset = ESX.GetPlayerFromId(id)
        xPlayertoset.setGroup(group)
    else
        return
    end
end)

RegisterServerEvent("Ayzwen:setPermission")
AddEventHandler("Ayzwen:setPermission", function(id, level)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" or xPlayer.getGroup() == "_dev" then
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/801881254655819797/9scyAtCRfLL_iH_gYDifdp1sF_TYZZVcFu6cOvxccVDauZCI2pm1JXRHeCt1-IrKhbBT", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Permission ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Level : " .. level .. "```" }), { ['Content-Type'] = 'application/json' })
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/802150221396181042/oQcfeWoBAgJtp9IDWIKQtg7vOs4S9YTOw5gYUUY4SuRMXTBXtv3BlTtwBkF7gcnHErI2", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Give Permission ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Level : " .. level .. "```" }), { ['Content-Type'] = 'application/json' })
        local xPlayertoset = ESX.GetPlayerFromId(id)
        xPlayertoset.setLevel(group)
    else
        return
    end
end)

RegisterServerEvent("Ayzwen:kick")
AddEventHandler("Ayzwen:kick", function(id, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/801881254655819797/9scyAtCRfLL_iH_gYDifdp1sF_TYZZVcFu6cOvxccVDauZCI2pm1JXRHeCt1-IrKhbBT", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Kick Players ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Reason : " .. reason .. "```" }), { ['Content-Type'] = 'application/json' })
        DropPlayer(id, reason)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:Ban")
AddEventHandler("Ayzwen:Ban", function(id, temps, raison)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://ptb.discord.com/api/webhooks/801881254655819797/9scyAtCRfLL_iH_gYDifdp1sF_TYZZVcFu6cOvxccVDauZCI2pm1JXRHeCt1-IrKhbBT", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Ban Players ! " .. "\n\n" .. "Target Name : " .. GetPlayerName(id) .. "\n" .. "Reason : " .. raison .. "\nTime : " .. temps .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerEvent("SqlBan:AyzwenBan", id, temps, raison, source)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

RegisterServerEvent("Ayzwen:ReportRegle")
AddEventHandler("Ayzwen:ReportRegle", function(idt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        for i, v in pairs(allreport) do
            if i == idt then
                TriggerClientEvent('chatMessage', v.id, "^1[Assistance] ", {5, 300, 400}, "^6 Votre report a été fermé !")
            end
        end
        TriggerClientEvent('::{korioz#0110}::esx:showAdvancedNotification', source, 'Administration', '~r~Informations', 'Le ~r~Report~s~ a bien été cloturé ', 'CHAR_SUNLITE', 2)
        allreport[idt] = nil
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)

ESX.RegisterServerCallback('Ayzwen:retrievePlayers', function(playerId, cb)
    local players = {}
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        table.insert(players, {
            id = "0",
            permission = xPlayer.getLevel(), --xPlayer.getLevel()
            group = xPlayer.getGroup(),
            source = xPlayer.source,
            jobs = xPlayer.getJob().name,
            name = xPlayer.getName()
        })
    end

    cb(players)
end)

ESX.RegisterServerCallback('Ayzwen:retrieveStaffPlayers', function(playerId, cb)
    local playersadmin = {}
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getGroup() ~= "user" then
        table.insert(playersadmin, {
            id = "0",
            permission = xPlayer.getLevel(), --xPlayer.getLevel()
            group = xPlayer.getGroup(),
            source = xPlayer.source,
            jobs = xPlayer.getJob().name,
            name = xPlayer.getName()
        })
    end
end

    cb(playersadmin)
end)

ESX.RegisterServerCallback('Ayzwen:retrieveReport', function(playerId, cb)
    cb(allreport)
end)

RegisterNetEvent("Ayzwen:Message")
AddEventHandler("Ayzwen:Message", function(id, type)
	TriggerClientEvent("Ayzwen:envoyer", id, type)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        PerformHttpRequest("https://discord.com/api/webhooks/825784570594721803/gMIY1Jj144qAEBWi-we-sYlEvLtexTjv-noHkwwFYmgOcMQT_Pio-gJvCG2gI7RhTR55", function(err, text, headers) end, 'POST', json.encode({username = "AdminMenu", content = "```\nName : " .. GetPlayerName(source) .. "\nAction : Jail !\n\nJail Info\nName : " .. GetPlayerName(id) .. "\nTime : ".. temps .. "```" }), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent("Ayzwen:envoyer", id, type)
    else
        TriggerEvent("::{korioz#0110}::BanSql:ICheatServer", source, "Je code avec le cul :p")
    end
end)