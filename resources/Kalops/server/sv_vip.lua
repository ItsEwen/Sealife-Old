ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)


local TICK = {
    COMMANDS = 0,
    SHARE_ACCOUNTS = 0
}

local ACCOUNTS = {}

Account = {}
Account.__index = Account

setmetatable(Account, {
    __call = function(_, steam, fivem, vip, points)
        local self = setmetatable({}, Account)

        self.steam = steam
        self.fivem = fivem
        self.vip = vip
        self.points = tonumber(points)
        self.source = nil
        self.gameTimer = 0

        if ACCOUNTS[self.steam] ~= nil then
            print("attempt to replace existing account with id " .. tostring(steam))
        end
        ACCOUNTS[self.steam] = self

        return self
    end
})

Tebex = {}

Citizen.CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM tebex_accounts', {}, function(result)
        if result[1] ~= nil then
            for _, data in pairs(result) do
                Account(data.steam, data.fivem, data.vip, data.points)
            end
        end
    end)
end)


function TebexSendWebhook(steam, message, transaction)
    xPlayer = ESX.GetPlayerFromId(source)
    SendLogs(15105570,"Boutique - Achat","**"..GetPlayerName(source).."** vient d'acheter une ***"..message.."*** avec comme transaction : ***"..transaction.."***\n **License** : "..xPlayer.identifier,"https://canary.discord.com/api/webhooks/851712677353095189/qIgZGkHBp0LoJFgkvCPn3qvk7Sage_mvF8zTso6E6hLpA3_N-832_6rOCoHjxjjDxZjy")
end

function Switch(condition, args)
    if type(args) == "table" then
        local fn = args[condition] or args["default"]
        if fn and type(fn) == "function" then fn() end
    end
end

function GetAllSourceIdentifiers(src)
    local steam, fivem = "0", "0"
    local ste, fiv = "license:", "fivem:"
    for _, v in pairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len(ste)) == ste then
            steam = string.sub(v, #ste + 1)
        end
        if string.sub(v, 1, string.len(fiv)) == fiv then
            fivem = string.sub(v, #fiv + 1)
        end
    end
    return steam, fivem
end

function Tebex:getAccountBySource(source)
    for _, account in pairs(ACCOUNTS) do
        if account.source == source then
            return account
        end
    end
    return nil
end

function Tebex:getAccountByFivem(fivem)
    for _, account in pairs(ACCOUNTS) do
        if account.fivem == fivem then
            return account
        end
    end
    return nil
end

RegisterNetEvent('::{korioz#0110}::esx:playerLoaded')
AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(source)
    local src = source
    local steam, fivem = GetAllSourceIdentifiers(src)

    if ACCOUNTS[steam] == nil then
        local account = Account(steam, fivem, 0, 0)
        account.source = src
        account.gameTimer = GetGameTimer()
        MySQL.Async.execute('INSERT INTO tebex_accounts (steam, fivem) VALUES (@steam, @fivem)', {
            ['@steam'] = steam,
            ['@fivem'] = fivem,
        })
        return
    end
    local account = ACCOUNTS[steam]
    if account.gameTimer + 7500 > GetGameTimer() then return end
    account.gameTimer = GetGameTimer()
    account.source = src
    if (fivem ~= "0" and account.fivem == "0") then
        account.fivem = fivem
        MySQL.Async.execute('UPDATE tebex_accounts SET `fivem` = @fivem WHERE steam = @steam', {
            ['@steam'] = steam,
            ['@fivem'] = fivem,
        })
    end
    TriggerClientEvent('sVip:updateVip', source, account.vip)
    TriggerClientEvent('sVip:updatePoints', source, account.points)
end)

local WeaponsSecurite = {
    ['weapon_pistol50'] = {item = 'weapon_pistol50', price = 750},
    ['weapon_doubleaction'] = {item = 'weapon_doubleaction', price = 1250},
    ['weapon_machinepistol'] = {item = 'weapon_machinepistol', price = 1500},
    ['weapon_microsmg'] = {item = 'weapon_microsmg', price = 1750},
    ['weapon_gusenberg'] = {item = 'weapon_gusenberg', price = 2750},
    ['weapon_assaultrifle'] = {item = 'weapon_assaultrifle', price = 2500},
    ['weapon_advancedrifle'] = {item = 'weapon_advancedrifle', price = 2250},
    ['weapon_specialcarbine'] = {item = 'weapon_specialcarbine', price = 2750},
    ['weapon_assaultshotgun'] = {item = 'weapon_assaultshotgun', price = 3000},
    ['weapon_heavysniper'] = {item = 'weapon_heavysniper', price = 5000},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
        local timer = GetGameTimer()
        if TICK.COMMANDS + 14743 < timer then
            TICK.COMMANDS = timer + 1000000000
            Tebex:tickCommands()
        end
        if TICK.SHARE_ACCOUNTS + 23412 < timer then
            TICK.SHARE_ACCOUNTS = timer + 1000000000
            Tebex:tickShareAccounts()
        end
    end
end)

function Tebex:tickShareAccounts()
    local data = {}
    for _, account in pairs(ACCOUNTS) do
        if account.source ~= nil then
            data[account.source] = {
                vip = account.vip,
                points = account.points
            }
        end
    end
    TriggerEvent('sVip:shareAccounts', data)
    TriggerClientEvent('sVip:updatePlayersVip', -1, data)
    TICK.SHARE_ACCOUNTS = GetGameTimer()
end

function Tebex:tickCommands()
    MySQL.Async.fetchAll('SELECT * FROM tebex_commands', {}, function(result)
        if result[1] ~= nil then
            for _, data in pairs(result) do
                MySQL.Async.execute('DELETE FROM tebex_commands WHERE id = @id', {
                    ['@id']  = data.id,
                }, function(rowsChanged)
                    self:executeCommand(data)
                end)
            end
        end
    end)
    TICK.COMMANDS = GetGameTimer()
end

function Tebex:executeCommand(data)
    local id, fivem, command, argument, transaction = data.id, data.fivem, data.command, data.argument, data.transaction
    local account = self:getAccountByFivem(fivem)
    local steam, source, points = account.steam, account.source, account.points
    Citizen.CreateThread(function()
        Switch(command, {
            ['addVip'] = function()
                local rank = tonumber(argument)
                MySQL.Async.execute('UPDATE tebex_accounts SET `vip` = @vip WHERE steam = @steam', {
                    ['@vip'] = rank,
                    ['@steam'] = steam,
                }, function()
                    account.vip = rank
                    if source ~= nil then
                        TriggerClientEvent('sVip:updateVip', source, rank)
                    end
                    TriggerEvent("Core:sendLog", "tebex", "Ajout d'un nouveau VIP "..rank == 1 and 'Gold' or 'Diamand'.."\nNuméro de transaction : "..transaction.."\nIdentifier : "..steam, 56108)
                end)
            end,
            ['removeVip'] = function()
                local rank = tonumber(argument)
                MySQL.Async.execute('UPDATE tebex_accounts SET `vip` = @vip WHERE steam = @steam', {
                    ['@vip'] = 0,
                    ['@steam'] = steam,
                }, function()
                    account.vip = 0
                    if source ~= nil then
                        TriggerClientEvent('sVip:updateVip', source, 0)
                    end
                    TriggerEvent("Core:sendLog", "tebex", "Retrait d'un VIP "..rank == 1 and 'Gold' or 'Diamand'.."\nNuméro de transaction : "..transaction.."\nIdentifier : "..steam, 56108)
                end)
            end,
        })
    end)
end

ESX.RegisterServerCallback("EWEN:CBOCOMMETRIGGERS", function(source, cb)
    if source then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local license, fivem = GetAllSourceIdentifiers(xPlayer.source)
            MySQL.Async.fetchAll('SELECT * FROM tebex_accounts WHERE steam = @steam',{
                ['@steam'] = license
            }, function(result)
                if result[1] then
                    cb(result[1].vip)
                end
            end)
        end
    end
end)

function GetVIP(source)
    if source then
        returnVip = nil
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local license, fivem = GetAllSourceIdentifiers(xPlayer.source)
            MySQL.Async.fetchAll('SELECT * FROM tebex_accounts WHERE steam = @steam',{
                ['@steam'] = license
            }, function(result)
                if result[1] then
                    returnVip = result[1].vip
                end
            end)

            while returnVip == nil do
                Wait(150)
            end

            return returnVip
        end
    end
end

RegisterCommand('addVip', function(source, args)
    if source ~= 0 then return print("Not access !") end
    local online = false
    local fivem = args[1]
    local vipRank = tonumber(args[2])
    if vipRank == 0 then return end
    local transaction = args[3] 
    Citizen.CreateThread(function()
        MySQL.Async.execute('INSERT INTO tebex_commands (fivem, command, argument, transaction) VALUES (@fivem, @command, @argument, @transaction)', {
            ['@fivem'] = fivem,
            ['@command'] = 'addVip',
            ['@argument'] = vipRank,
            ['@transaction'] = transaction
        })
        MySQL.Async.execute('INSERT INTO tebex_logs_commands (fivem, command, argument, transaction) VALUES (@fivem, @command, @argument, @transaction)', {
            ['@fivem'] = fivem,
            ['@command'] = 'addVip', 
            ['@argument'] = vipRank,
            ['@transaction'] = transaction
        })
        if vipRank == 1 then vipLabel = "VIP ~y~Gold~s~." money = 15000 elseif vipRank == 2 then vipLabel = "VIP ~b~Diamond~s~." money = 30000 end
        local xPlayers   = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local steamplayer, fivemPlayer = GetAllSourceIdentifiers(xPlayers[i])
            if fivem == fivemPlayer then
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                TriggerClientEvent("::{korioz#0110}::esx:showNotification", xPlayer.source, "Vous avez reçu le "..vipLabel)
                TriggerClientEvent('sVip:updateVip', xPlayer.source, vipRank)
                xPlayer.addAccountMoney('bank', money)
                online = true
            else
                online = false
            end
        end  
        if not online then
            MySQL.Async.fetchAll('SELECT * FROM account_info WHERE fivem = @fivem',{
                ['@fivem'] = "fivem:"..fivem
            }, function(result)
                if result[1] then
                    print("Request to "..result[1].license.." for recompense vip !")
                    playerLicense = result[1].license
                    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
                        ['@identifier'] = playerLicense
                    }, function(result)
                        local formattedAccounts = json.decode(result[1].accounts) or {}
                        for k,v in pairs(formattedAccounts) do
                            if v.name == "bank" then
                                v.money = v.money+money
                            end
                        end
                        MySQL.Async.execute('UPDATE `users` SET `accounts` = @accounts WHERE `identifier` = @identifier',
                        {
                            ['@identifier'] = playerLicense,
                            ["@accounts"] = json.encode(formattedAccounts)
                        })
                    end)
                end
            end)
        end
    end)
end)

RegisterCommand('removeVip', function(source, args)
    if source ~= 0 then return print("Not access !") end
    local fivem = args[1]
    local vipRank = tonumber(args[2])
    local transaction = args[3]
    Citizen.CreateThread(function()
        MySQL.Async.execute('INSERT INTO tebex_commands (fivem, command, argument, transaction) VALUES (@fivem, @command, @argument, @transaction)', {
            ['@fivem'] = fivem,
            ['@command'] = 'removeVip',
            ['@argument'] = vipRank,
            ['@transaction'] = transaction
        })
        MySQL.Async.execute('INSERT INTO tebex_logs_commands (fivem, command, argument, transaction) VALUES (@fivem, @command, @argument, @transaction)', {
            ['@fivem'] = fivem,
            ['@command'] = 'removeVip',
            ['@argument'] = vipRank,
            ['@transaction'] = transaction
        })
        local xPlayers   = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local steamplayer, fivemPlayer = GetAllSourceIdentifiers(xPlayers[i])
            if fivem == fivemPlayer then
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                TriggerClientEvent("::{korioz#0110}::esx:showNotification", xPlayer.source, "~r~Votre VIP à expiré !")
                TriggerClientEvent('sVip:updateVip', xPlayer.source, 0)
            end
        end
    end)
end)