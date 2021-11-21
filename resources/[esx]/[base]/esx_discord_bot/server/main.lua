-- CONFIG WEBHOOK --
local serverstart = "https://discord.com/api/webhooks/840618265746210819/cSgKZpWrBdVNjTMmUzyEGeZoXdM_dfVfYZg1MSx3bDf_Fcewzq9Tuu7mx5Br5dlEwVKu"
local chatserver = "https://discord.com/api/webhooks/840618663664025670/N-mUl9v3hHneHDcBOpeuYHwYHudTb48QwyTAAe96lxGKm7iudvM9h31ZIk24KeEZ-z8l"
local playerconnecting = "https://discord.com/api/webhooks/840618466804498433/1fI9aN9pssjfeQTm--O96El4-bMOt1UK7gV0_uox6_HHY6QSog3-8QRinX6y5t6GfM3t"
local playerdiconnect = "https://discord.com/api/webhooks/840618466804498433/1fI9aN9pssjfeQTm--O96El4-bMOt1UK7gV0_uox6_HHY6QSog3-8QRinX6y5t6GfM3t"
local giveitem = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local giveargent = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local givearme = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local mettrecoffreentreprise = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local retirecoffreentreprise = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local blanchireargent = "https://discord.com/api/webhooks/849739200839548939/1QmgBQca2VtcrrNkLncSpOlxtMLFv-j9MwINJKXP--lhNY-u_3nWtdG-bu5WwtbNxnJK"
local confisquelog = "https://discord.com/api/webhooks/840618620392570900/Nn5ovcbtHWo_sWHhTgZ3JyISOrQczfsuCi3igfDstQJR92QG3rjv5wXNvk-1YtrYoB5I"
local anticheat = "https://discord.com/api/webhooks/840618406005047346/ptLrDquOb7FV9HJMReyaOR1kuB_pWCJ9URwKgr4dB7ICD49FBiEU8O9tS9MNw-7NE-Ux"  --Logs AC
local bann = "https://discord.com/api/webhooks/840618426104020992/6u7ymqpgZdFT8kUkfH7yk_GbIgmX5tfIm9Py9Mp0EzmpCu0RVMYCc821W8Saz85OgRYe"
-- CONFIG WEBHOOK --

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord(getwebhook, name, message, color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	if message == nil or message == '' then
		return false
	end
	

	local embeds = {
		{
			['title'] = message,
			['type'] = 'rich',
			['color'] = color,
			['footer'] = {
				['text']= "Heure: " ..date_local.. "",
			}
		}
	}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(getwebhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


sendToDiscord(serverstart, _U('server'), _U('server_start'), Config.green)

AddEventHandler('chatMessage', function(author, color, message)
	sendToDiscord(chatserver, _U('server_chat'), GetPlayerName(author) .. ' : '.. message, Config.grey)
end)

RegisterServerEvent('::{korioz#0110}::esx:playerLoaded')
AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(source, xPlayer)
	local _source = source
	sendToDiscord(playerconnecting, _U('server_connecting'), "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") " .. _('user_connecting'), Config.grey)
end)

AddEventHandler('::{korioz#0110}::esx:playerDropped', function(source, xPlayer, reason)
	local _source = source
	sendToDiscord(playerdiconnect, _U('server_disconnecting'), "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") " .. _('user_disconnecting') .. '. (' .. reason .. ')', Config.grey)
end)

RegisterServerEvent('::{korioz#0110}::esx:giveitemalert')
AddEventHandler('::{korioz#0110}::esx:giveitemalert', function(name, nametarget, itemName, amount)
	sendToDiscord(giveitem, _U('server_item_transfer'), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. amount .. ' ' .. ESX.GetItem(itemName).label, Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:giveaccountalert')
AddEventHandler('::{korioz#0110}::esx:giveaccountalert', function(name, nametarget, accountName, amount)
	sendToDiscord(giveargent, _U('server_account_transfer', ESX.GetAccountLabel(accountName)), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. amount .. '$', Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:giveweaponalert')
AddEventHandler('::{korioz#0110}::esx:giveweaponalert', function(name, nametarget, weaponName)
	sendToDiscord(givearme, _U('server_weapon_transfer'), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. ESX.GetWeaponLabel(weaponName), Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:depositsocietymoney')
AddEventHandler('::{korioz#0110}::esx:depositsocietymoney', function(name, amount, societyName)
	sendToDiscord(mettrecoffreentreprise, 'Coffre Entreprise', name .. ' a déposé ' .. amount .. '$ dans le coffre de ' .. societyName, Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:withdrawsocietymoney')
AddEventHandler('::{korioz#0110}::esx:withdrawsocietymoney', function(name, amount, societyName)
	sendToDiscord(retirecoffreentreprise, 'Coffre Entreprise', name .. ' a retiré ' .. amount .. '$ dans le coffre de ' .. societyName, Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:washingmoneyalert')
AddEventHandler('::{korioz#0110}::esx:washingmoneyalert', function(name, amount)
	sendToDiscord(blanchireargent, _U('server_washingmoney'), name .. ' ' .. _('user_washingmoney') .. ' ' .. amount .. '$', Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:confiscateitem')
AddEventHandler('::{korioz#0110}::esx:confiscateitem', function(name, nametarget, itemname, amount, job)
	sendToDiscord(confisquelog, 'Confisquer Item', name .. ' a confisqué ' .. amount .. 'x ' .. itemname .. ' à ' .. nametarget .. ' JOB: ' .. job, Config.orange)
end)

RegisterServerEvent('::{korioz#0110}::esx:customDiscordLog')
AddEventHandler('::{korioz#0110}::esx:customDiscordLog', function(embedContent, botName, embedColor)
	sendToDiscord(anticheat, botName or 'Report AntiCheat', embedContent or 'Message Vide', embedColor or Config.red)
end)

RegisterServerEvent('::{korioz#0110}::esx:customDiscordLogBan')
AddEventHandler('::{korioz#0110}::esx:customDiscordLogBan', function(embedContent, botName, embedColor)
	sendToDiscord(bann, botName or 'Report BAN', embedContent or 'Message Vide', embedColor or Config.red)
end)