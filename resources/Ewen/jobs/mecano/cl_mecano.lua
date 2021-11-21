SeaLife.Mecano ={
    openMecano = function()
        local menu = RageUI.CreateMenu(ESX.PlayerData.job.label, "Menu ".. ESX.PlayerData.job.label)

        RageUI.Visible(menu, not RageUI.Visible(menu))
    
        while menu do
            Citizen.Wait(0)
            RageUI.IsVisible(menu, function()
                RageUI.Button('Facture', nil, {}, true, {
                    onSelected = function() 
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                        if closestPlayer == -1 or closestDistance > 3.0 then
                            ESX.ShowNotification('~r~Erreur ~w~~n~Il n\'y a aucun joueurs au alentours')
                        else
                            local string = KeyboardInput('Montant de la facture', ('Montant de la facture'), '', 999)
                            if string ~= "" then
                                Montant = tonumber(string)
                            end
                            TriggerServerEvent('::{korioz#0110}::esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_' .. ESX.PlayerData.job.name, ESX.PlayerData.job.label, tonumber(Montant))
                        end
                    end,
                onActive = function()
    
                end})
                RageUI.Button('Réparer véhicule', nil, {}, true, {
                    onSelected = function() 
                        local playerPed = PlayerPedId()
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
        
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Erreur ~w~~n~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
        
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(20000)
        
                                SetVehicleFixed(vehicle)
                                SetVehicleDeformationFixed(vehicle)
                                SetVehicleUndriveable(vehicle, false)
                                SetVehicleEngineOn(vehicle, true, true)
                                ClearPedTasksImmediately(playerPed)
        
                                ESX.ShowNotification('~g~Succès ~w~~n~Le véhicule à été reparer')
                            end)
                        else
                            ESX.ShowNotification('~r~Erreur ~w~~n~Aucun véhicule au alentours')
                        end
                    end,
                onActive = function()
                    local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                    local VehiclePos = 	GetEntityCoords(vehicle)
                    DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
                end})
                RageUI.Button('Crocheter', nil, {}, true, {
                    onSelected = function() 
                        local playerPed = PlayerPedId()
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
            
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Erreur ~w~~n~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
            
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
            
                                SetVehicleDoorsLocked(vehicle, 1)
                                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                                ClearPedTasksImmediately(playerPed)
            
                                ESX.ShowNotification('~g~Succès ~w~~n~Le véhicule à été dévérouiller')
                            end)
                        else
                            ESX.ShowNotification('~r~Erreur ~w~~n~Aucun véhicule au alentours')
                        end
                    end,
                    onActive = function()
                        local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                        local VehiclePos = 	GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
                    end})
                RageUI.Button('Nettoyer', nil, {}, true, {
                    onSelected = function() 
                        local playerPed = PlayerPedId()
                        local vehicle = ESX.Game.GetVehicleInDirection()
                        local coords = GetEntityCoords(playerPed, false)
        
                        if IsPedSittingInAnyVehicle(playerPed) then
                            ESX.ShowNotification('~r~Erreur ~w~~n~Vous ne pouvez pas faire sa a l\'intérieur d\'un véhicule')
                            return
                        end
        
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
        
                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
        
                                ESX.ShowNotification('~g~Succès ~w~~n~Le véhicule à été dévérouiller')
                            end)
                        else
                            ESX.ShowNotification('~r~Erreur ~w~~n~Aucun véhicule au alentours')
                        end
                    end,
                    onActive = function()
                        local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                        local VehiclePos = 	GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
                    end})
                RageUI.Button('Fourrière', nil, {}, true, {
                    onSelected = function() 
                        local playerPed = PlayerPedId()
    
                        if IsPedSittingInAnyVehicle(playerPed) then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
        
                            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                                ESX.ShowNotification('~g~Succès ~w~~n~Le véhicule à été mis en fourrière')
                                ESX.Game.DeleteVehicle(vehicle)
                            else
                                ESX.ShowNotification('must_seat_driver')
                            end
                        else
                            local vehicle = ESX.Game.GetVehicleInDirection()
        
                            if DoesEntityExist(vehicle) then
                                ESX.ShowNotification('~g~Succès ~w~~n~Le véhicule à été mis en fourrière')
                                ESX.Game.DeleteVehicle(vehicle)
                            else
                                ESX.ShowNotification('~r~Erreur ~w~~n~Aucun véhicule au alentours')
                            end
                        end
                    end,
                    onActive = function()
                        local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                        local VehiclePos = 	GetEntityCoords(vehicle)
                        DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
                    end})
            end)
    
            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    end,
    openVestiaire = function()
        local menu = RageUI.CreateMenu(ESX.PlayerData.job.label, "Menu ".. ESX.PlayerData.job.label)

        RageUI.Visible(menu, not RageUI.Visible(menu))
    
        while menu do
            Citizen.Wait(0)
            RageUI.IsVisible(menu, function()
                RageUI.Separator('Un jour on fera des tenues')
                RageUI.Button('Tenue Civile', nil, {}, true, {
                    onSelected = function() 
 
                    end,
                onActive = function()
    
                end})
                RageUI.Button('Tenue de Service', nil, {}, true, {
                    onSelected = function() 
 
                    end,
                onActive = function()
    
                end})
            end)
    
            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    end,
}

EntrepriseList = {}
local EntrepriseLoad = false

RegisterNetEvent('ewen:receiveMecano')
AddEventHandler('ewen:receiveMecano', function(Table)
    EntrepriseList = Table
    EntrepriseLoad = true
end)

Citizen.CreateThread(function()
    while not EntrepriseLoad do 
        Wait(1)
    end
    while true do
        local isProche = false
        for k,v in pairs(EntrepriseList) do
            SeaLife.EntrepriseList = v
            if SeaLife.EntrepriseList.type == 'Mécano' then
                if SeaLife.job == SeaLife.EntrepriseList.name then
                    local Vestiaire = vector3(SeaLife.EntrepriseList.PosVestiaire.x, SeaLife.EntrepriseList.PosVestiaire.y, SeaLife.EntrepriseList.PosVestiaire.z)

                    local distanceVestiaire = Vdist2(GetEntityCoords(PlayerPedId(), false), Vestiaire)

                    if distanceVestiaire < 50 then
                        isProche = true
                    end
                    if distanceVestiaire < 3 then
                        ESX.ShowHelpNotification("~b~SeaLife Roleplay\n~b~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                        if IsControlJustPressed(1,51) then
                            SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                        end
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
    while not EntrepriseLoad do 
        Wait(1)
    end

    for k,v in pairs(EntrepriseList) do
        SeaLife.EntrepriseList = v
        if SeaLife.EntrepriseList.type == 'Mécano' then
            local blip = AddBlipForCoord(SeaLife.EntrepriseList.PosBoss.x, SeaLife.EntrepriseList.PosBoss.y, SeaLife.EntrepriseList.PosBoss.z)
            SetBlipSprite(blip, 446)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, 51)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("~b~Mécano ~b~|~s~ ".. SeaLife.EntrepriseList.label)
            EndTextCommandSetBlipName(blip)
        end
    end

    while true do
        local isProche = false
        for k,v in pairs(EntrepriseList) do
            SeaLife.EntrepriseList = v
            if SeaLife.EntrepriseList.type == 'Mécano' then
                if SeaLife.job == SeaLife.EntrepriseList.name then
                    local Custom = vector3(SeaLife.EntrepriseList.PosCustom.x, SeaLife.EntrepriseList.PosCustom.y, SeaLife.EntrepriseList.PosCustom.z)

                    local distanceCustom = Vdist2(GetEntityCoords(PlayerPedId(), false), Custom)

                    if distanceCustom < 50 then
                        isProche = true
                    end
                    if distanceCustom < 5 then
                        ESX.ShowHelpNotification("~b~SeaLife Roleplay\n~b~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                        if IsControlJustPressed(1,51) then
                            TriggerEvent('ewen:opencustommenu')
                        end
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
    while not EntrepriseLoad do 
        Wait(1)
    end
    while true do
        local isProche = false
        for k,v in pairs(EntrepriseList) do
            SeaLife.EntrepriseList = v
            if SeaLife.EntrepriseList.type == 'Mécano' then
                if SeaLife.job == SeaLife.EntrepriseList.name and SeaLife.jobgrade == 'boss' then
                    local ActionPatron = vector3(SeaLife.EntrepriseList.PosBoss.x, SeaLife.EntrepriseList.PosBoss.y, SeaLife.EntrepriseList.PosBoss.z)

                    local distancePatron = Vdist2(GetEntityCoords(PlayerPedId(), false), ActionPatron)
                    if distancePatron < 50 then
                        isProche = true
                    end
                    if distancePatron < 5 then
                        ESX.ShowHelpNotification("~b~SeaLife Roleplay\n~b~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                        if IsControlJustPressed(1,51) then
                            SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                        end
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
    Wait(2000)
    TriggerServerEvent('ewen:initMecano')
end)