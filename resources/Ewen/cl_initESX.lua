ESXLoaded = false
ESX = nil
SeaLife = {}
Player = {
    WeaponData = {}
}

function LoadESX()
    while ESX == nil do
        TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end    
    
	ESX.PlayerData = ESX.GetPlayerData()
	Player.WeaponData = ESX.GetWeaponList()

	for i = 1, #Player.WeaponData, 1 do
		if Player.WeaponData[i].name == 'WEAPON_UNARMED' then
			Player.WeaponData[i] = nil
		else
			Player.WeaponData[i].hash = GetHashKey(Player.WeaponData[i].name)
		end
    end
	Wait(1000)
	SeaLife.job = ESX.PlayerData.job.name
	SeaLife.job2 = ESX.PlayerData.job2.name
	SeaLife.joblabel = ESX.PlayerData.job.label
	SeaLife.job2label = ESX.PlayerData.job2.label
	SeaLife.jobgrade = ESX.PlayerData.job.grade_name
	SeaLife.job2grade = ESX.PlayerData.job2.grade_name
	SeaLife.Rank = ESX.GetPlayerData()['group']
	if SeaLife.jobgrade == 'boss' then
        ESX.TriggerServerCallback('::{korioz#0110}::esx_society:getSocietyMoney', function(money)
            SeaLife.societymoney = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job.name)
    end

    if SeaLife.job2grade == 'boss' then
        ESX.TriggerServerCallback('::{korioz#0110}::esx_society:getSocietyMoney', function(money)
            SeaLife.societymoney2 = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job2.name)
    end
    ESXLoaded = true
	ReplaceHudColourWithRgba(116, 0, 201, 255, 255)
    print('ESX Loaded')
end

RegisterNetEvent('::{korioz#0110}::esx:setJob')
AddEventHandler('::{korioz#0110}::esx:setJob', function(job)
	ESX.PlayerData.job = job
	SeaLife.job = ESX.PlayerData.job.name
	SeaLife.joblabel = ESX.PlayerData.job.label
	SeaLife.jobgrade = ESX.PlayerData.job.grade_name
	if SeaLife.jobgrade == 'boss' then
        ESX.TriggerServerCallback('::{korioz#0110}::esx_society:getSocietyMoney', function(money)
            SeaLife.societymoney = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job.name)
    end
end)

RegisterNetEvent('::{korioz#0110}::esx:setJob2')
AddEventHandler('::{korioz#0110}::esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
	SeaLife.job2 = ESX.PlayerData.job2.name
	SeaLife.job2label = ESX.PlayerData.job2.label
	SeaLife.job2grade = ESX.PlayerData.job2.grade_name
	if SeaLife.job2grade == 'boss' then
        ESX.TriggerServerCallback('::{korioz#0110}::esx_society:getSocietyMoney', function(money)
            SeaLife.societymoney2 = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job2.name)
    end
end)

RegisterNetEvent('::{korioz#0110}::esx_addonaccount:setMoney')
AddEventHandler('::{korioz#0110}::esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and SeaLife.jobgrade == 'boss' and 'society_' .. SeaLife.job == society then
		SeaLife.societymoney = ESX.Math.GroupDigits(money)
	end

	if ESX.PlayerData.job2 ~= nil and SeaLife.job2grade == 'boss' and 'society_' .. SeaLife.job2 == society then
		SeaLife.societymoney2 = ESX.Math.GroupDigits(money)
	end
end)

RegisterNetEvent('::{korioz#0110}::esx:setGroup')
AddEventHandler('::{korioz#0110}::esx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('::{korioz#0110}::esx:activateMoney')
AddEventHandler('::{korioz#0110}::esx:activateMoney', function(money)
    ESX.PlayerData.money = money
end)

RegisterNetEvent('::{korioz#0110}::esx:setAccountMoney')
AddEventHandler('::{korioz#0110}::esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

RegisterNetEvent('::{korioz#0110}::esx:playerLoaded')
AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(xPlayer)
    LoadESX() -- @INIT ESX
end)

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end