local pedHeading, pedHash = 206.31, `a_f_y_business_02`

zone = {
	Chantier = vector3(-509.94, -1001.59, 22.55),
}

local travailleZone = {
	{
		zone = vector3(-509.94, -1001.59, 22.55),
		nom = "Chantier",
		blip = 566,
		couleur = 44
	},
}

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(10)
	end

	--ESX.Game.SpawnLocalPed(2, pedHash, zone.LifeInvaders, pedHeading, function(ped)
	--	FreezeEntityPosition(ped, true)
	--	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
	--	SetEntityInvincible(ped, true)
	--	SetBlockingOfNonTemporaryEvents(ped, true)
	--end)

	--local blip = AddBlipForCoord(zone.LifeInvaders)
	--SetBlipSprite(blip, 590)
	--SetBlipScale(blip, 0.8)
	--SetBlipColour(blip, 11)
	--SetBlipAsShortRange(blip, true)

	--BeginTextCommandSetBlipName('STRING')
	--AddTextComponentString("Emploie Intérimaire")
	--EndTextCommandSetBlipName(blip)

	for i = 1, #travailleZone, 1 do
		local blip = AddBlipForCoord(travailleZone[i].zone)

		SetBlipSprite(blip, travailleZone[i].blip)
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, travailleZone[i].couleur)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(travailleZone[i].nom)
		EndTextCommandSetBlipName(blip)
	end
end)