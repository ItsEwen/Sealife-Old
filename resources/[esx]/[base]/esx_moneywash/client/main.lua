-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local HasAlreadyEnteredMarker = false
local CurrentAction = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local isInMarker = false

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), Config.Pos, true) < 2.0 then
			isInMarker = true
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			CurrentAction = 'MoneyWash'
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			_TriggerServerEvent('::{korioz#0110}::esx_moneywash:stopWash')
			CurrentAction = nil
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction ~= nil then
			ESX.ShowHelpNotification('Blanchiment d\'argent')
			if IsControlJustReleased(0, 38) then
				variable = KeyboardInput('Ecrivez OUI/NON pour blanchir', ('Ecrivez OUI/NON pour blanchir'), '', 30)
				if variable == 'OUI' or variable == 'oui' then
				_TriggerServerEvent('::{korioz#0110}::esx_moneywash:startWash')
				CurrentAction = nil
				end
				ESX.ShowNotification("~b~SeaLife\n~w~Vous avez pas accepté de blanchir")
			end
		end
	end
end)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
