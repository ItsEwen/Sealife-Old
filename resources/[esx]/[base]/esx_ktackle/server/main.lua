TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{korioz#0110}::esx_kekke_tackle:tryTackle')
AddEventHandler('::{korioz#0110}::esx_kekke_tackle:tryTackle', function(target)
	local _source = source
	if target ~= -1 then
		TriggerClientEvent('::{korioz#0110}::esx_kekke_tackle:getTackled', target, _source)
		TriggerClientEvent('::{korioz#0110}::esx_kekke_tackle:playTackle', _source)
	else
		DropPlayer(source, "Tes nul arrete de cheat stp :)")
	end
end)