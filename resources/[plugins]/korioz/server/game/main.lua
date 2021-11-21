--[[ Game ]]--


ESX.AddGroupCommand('announce', "admin", function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "ANNONCE", {255, 0, 0}, table.concat(args, " "))
end, {help = "Announce a message to the entire server", params = { {name = "announcement", help = "The message to announce"} }})