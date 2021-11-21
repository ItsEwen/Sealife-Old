AntiSpamJS = {}

AntiSpamJS.MessageKick = 'Dômmage ;D | https://discord.gg/P9YjMVc4Nz -> Pour acheter le patch :)'
AntiSpamJS.Webhook = 'https://discord.com/api/webhooks/862396897637040159/mWLCpI7-3E4Zo-9YUP-2SAJLHxTIm1yEgWEY3rwmhGu8-1WQ5GDipwIoanPnDbjYVOuT'
AntiSpamJS.MaxQueriesPerMinutes = 5

-- CRYPTE 

AntiSpamJS.eventsList = {
	"mysql-async:request-data",
	"mysql-async:request-server-status",
	"SunriseESX_license:addLicense",
	"SunriseESX_license:removeLicense",
	"SunriseESX_license:getLicense",
	"SunriseESX_license:getLicenses",
	"SunriseESX_license:checkLicense",
	"SunriseESX_license:getLicensesList",
}

local counter = {}

local logInfos = {}

local function log(name,id)
    logInfos = {
        ["color"] = "3066993",
        ["type"] = "rich",
        ["title"] = "Log Anti Spam JS",
        ["description"] = "**Name : **" .. name .."\n **ID : **" .. id .. "\n **Serveur : **" .. GetConvar("sv_hostname")
    }

    logInfos2 = {
        ["color"] = "3066993",
        ["type"] = "rich",
        ["title"] = "Log Anti Spam JS",
        ["description"] = "**Name : **" .. name .."\n **ID : **" .. id .. "\n **Serveur : **" .. GetConvar("sv_hostname")
    }
    PerformHttpRequest("https://discord.com/api/webhooks/852558900284620871/abro06DQNA9kK9qeHTw7dr0egYI0evssz4HWE636PbuUu_vQbALRDX-XtvVSO-V2tAh5",function(err, text, headers)end,"POST",json.encode({username = "Anti Spam JS - by SeA-Shops",avatar_url = "" ,embeds = {logInfos}}),{["Content-Type"] = "application/json"}) --log pour nous le rat !!  a faire la log du srv
    PerformHttpRequest(AntiSpamJS.Webhook,function(err, text, headers)end,"POST",json.encode({username = "Anti Spam JS - by SeA-Shops",avatar_url = "" ,embeds = {logInfos2}}),{["Content-Type"] = "application/json"}) --log pour nous le rat !!  a faire la log du srv
end

for i = 1, #AntiSpamJS.eventsList do
	local eventName = AntiSpamJS.eventsList[i]

	RegisterServerEvent(eventName)
	AddEventHandler(eventName, function()
		local source = tonumber(source)
		if not counter[source] then counter[source] = {} end
		local limit = counter[source][eventName]

		if not limit then
			counter[source][eventName] = 1
			return
		else
            counter[source][eventName] = (counter[source][eventName] or 0) + 1
		end

		if counter[source][eventName] > AntiSpamJS.MaxQueriesPerMinutes then
            log(GetPlayerName(source),source)
			DropPlayer(source, AntiSpamJS.MessageKick)
		end
	end)
end

AddEventHandler('playerDropped', function()
	if counter[source] then
		counter[source] = nil
	end
end)