local SafeZoneListe = {
	vector3(-821.2, -127.65, 28.18),
	vector3(218.76, -802.87, 30.09),
	vector3(429.54, -981.86, 30.71),
	vector3(233.12, -419.19, -118.2), 
	vector3(245.5, -324.2, -118.77),
	vector3(-38.22, -1100.84, 26.42),
	vector3(238.25, -406.03, 47.92), 
	vector3(295.68, -586.45, 43.14),
	vector3(-211.34, -1322.06, 30.89),
	vector3(1642.58, 2569.52, 45.56), -- ZONE SAFE Prison
	vector3(207.88, -190.37, 54.6) -- NOUVEAU CONCESS
}

Citizen.CreateThread(function()
	while true do
        local isProche = false
        for k,v in pairs(SafeZoneListe) do
			local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), v)
			if dist < 1000 and ESX.PlayerData.job.name == 'unemployed' then
                isProche = true
                local bind = {
                    {group = 2, key = 37, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 140, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 24, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 69, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 92, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 106, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 168, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 160, message = '~r~Vous êtes dans une zone à grande influence'},
                    {group = 0, key = 160, message = '~r~Vous êtes dans une zone à grande influence'}
                }
                SetCanAttackFriendly(PlayerPedId(), false, false)
                DisablePlayerFiring(PlayerPedId(), true)
                for i = 1, #bind, 1 do
                    DisableControlAction(bind[i].group, bind[i].key, true)
                    if IsDisabledControlJustPressed(bind[i].group, bind[i].key) then
                        ESX.ShowNotification(bind[i].message)
                    end
                end
			end
        end
        
		if isProche then
			Wait(0)
		else
			Wait(750)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        for _,player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(-1)
            local everyone = GetPlayerPed(player)
            local everyoneveh = GetVehiclePedIsUsing(everyone)
            if IsPedInAnyVehicle(everyone, false) then
                SetEntityNoCollisionEntity(ped, everyoneveh, false)
                SetEntityNoCollisionEntity(everyoneveh, ped, false)
            else
                SetEntityNoCollisionEntity(ped, everyone, false)
            end
        end
    end
end)