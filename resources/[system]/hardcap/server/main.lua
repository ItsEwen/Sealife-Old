local playerCount = 0
local list = {}

RegisterServerEvent('::{korioz#0110}::hardcap:playerActivated')
AddEventHandler('::{korioz#0110}::hardcap:playerActivated', function()
	if not list[source] then
		playerCount = playerCount + 1
		list[source] = true
	end
end)

AddEventHandler('playerDropped', function()
	if list[source] then
		playerCount = playerCount - 1
		list[source] = nil
	end
end)

AddEventHandler('playerConnecting', function(name, setReason)
	local maxClients = GetConvarInt('sv_maxclients', 256)

	if playerCount >= maxClients then
		setReason('Serveur Plein. :(')
		CancelEvent()
	end
end)