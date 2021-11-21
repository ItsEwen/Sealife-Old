local Server = GetConvar('sv_type', 'FA')
local Servers = {
	['FA'] = {
		webhook = "https://canary.discord.com/api/webhooks/806237610376036382/Lt5iCvfygXdjKbJYs8XVbduIbdPFmipdHxhhg2XxweUMlGXTORG_REule9RVzq_Hiy14",
		drugs = {
			WeedField = vector3(826.27, 2192.02, 52.4),
			WeedProcessing = vector3(-1146.794, 4940.908, 222.26),
			WeedDealer = vector3(364.350, -2065.05, 21.74),
			CokeField = vector3(-106.441, 1910.979, 196.936),
			CokeProcessing = vector3(722.438, 4190.06, 41.09),
			CokeDealer = vector3(724.99, -1189.87, 24.27),
			MethField = vector3(1195.62, -3253.07, 7.1),
			MethProcessing = vector3(611.86, -3062.82, 6.07),
			MethDealer = vector3(-382.76, -2265.58, 7.61),
			OpiumField = vector3(1444.35, 6332.3, 23.96),
			OpiumProcessing = vector3(2165.724, 3379.376, 46.43),
			OpiumDealer = vector3(3817.0505, 4441.494, 2.810)
		}
	}
}

exports('GetData', function(key)
	return Servers[Server][key]
end)