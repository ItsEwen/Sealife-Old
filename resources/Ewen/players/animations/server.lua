RegisterServerEvent("ServerEmoteRequest")
AddEventHandler("ServerEmoteRequest", function(target, emoteanim, emotename)
	TriggerClientEvent("ClientEmoteRequestReceive", target, emoteanim, emotename)
end)

RegisterServerEvent("ServerValidEmote") 
AddEventHandler("ServerValidEmote", function(target, requestedemote)
	TriggerClientEvent("SyncPlayEmote", source, requestedemote, true)
	TriggerClientEvent("SyncPlayEmote", target, requestedemote, false)
end)