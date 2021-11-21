Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('::{korioz#0110}::esx:setJob')
AddEventHandler('::{korioz#0110}::esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function openPolice()
	local menu = RageUI.CreateMenu('FBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Alerte FBI', nil, {}, true, {
                onSelected = function() 
                    OpenAlertePolice()
                end,
            onActive = function()

            end})
            RageUI.Button('Intéraction Citoyen', nil, {}, true, {
                onSelected = function() 
                    OpenPoliceCitoyenMenu()
                end,
            onActive = function()

            end})
            RageUI.Button('Intéraction Véhicule', nil, {}, true, {
                onSelected = function()
                    OpenPoliceVehicleMenu()
                end,
            onActive = function()

            end})
            RageUI.Button('Menu Props', nil, {}, true, {
                onSelected = function()
                    OpenPolicePropsMenu()
                end,
            onActive = function()

            end})
            RageUI.Button('Demande de Renfort', nil, {}, true, {
                onSelected = function()
                    OpenPoliceRenfort()
                end,
            onActive = function()

            end})
        end)
        
        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenPoliceRenfort()
	local menu = RageUI.CreateMenu('FIBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Petite demande', nil, {}, true, {
                onSelected = function() 
                    local raison = 'petit'
                    local elements  = {}
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('esx_renfort', coords, raison)
                end,
            onActive = function()
            end})
            RageUI.Button('Moyenne demande', nil, {}, true, {
                onSelected = function() 
                    local raison = 'importante'
                    local elements  = {}
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('esx_renfort', coords, raison)
                end,
            onActive = function()
            end})
            RageUI.Button('Grosse demande', nil, {}, true, {
                onSelected = function() 
                    local raison = 'omgad'
                    local elements  = {}
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('esx_renfort', coords, raison)
                end,
            onActive = function()
            end})
        end)

        if not RageUI.Visible(menu) then
            openPolice()
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenPoliceVehicleMenu()
	local menu = RageUI.CreateMenu('FBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Crocheter Véhicule', nil, {}, true, {
                onSelected = function() 
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    if DoesEntityExist(vehicle) then
                        local plyPed = PlayerPedId()
    
                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                        Citizen.Wait(20000)
                        ClearPedTasksImmediately(plyPed)
    
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', 'Véhicule ~g~dévérouillé~s~', 'CHAR_CARSITE', 1)
                    else
                        ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', '~r~Aucun véhicule~s~ à proximité~s~', 'CHAR_CARSITE', 1)
                    end
                end,
            onActive = function()
                local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                local VehiclePos = 	GetEntityCoords(vehicle)
                DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
            end})
            RageUI.Button('Mettre en fourrière', nil, {}, true, {
                onSelected = function() 
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    local plyPed = PlayerPedId()

                    TaskStartScenarioInPlace(plyPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                    
                    ClearPedTasks(plyPed)
                    Citizen.Wait(4000)
                    ESX.Game.DeleteVehicle(vehicle)
                    ClearPedTasks(plyPed) 
                    ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', _U'impound_successful', 'CHAR_CARSITE', 1)
                end,
            onActive = function()
                local vehicle   = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId(), false), false)
                local VehiclePos = 	GetEntityCoords(vehicle)
                DrawMarker(2, VehiclePos.x, VehiclePos.y, VehiclePos.z+1.8, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 255, 143, 0, 170, false, true, nil, true)
            end})
        end)

        if not RageUI.Visible(menu) then
            openPolice()
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenPolicePropsMenu()
	local menu = RageUI.CreateMenu('FBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Crocheter Véhicule', nil, {}, true, {
                onSelected = function() 
                    spawnObject('prop_roadcone02a')
                end,
            onActive = function()
            end})
            RageUI.Button('Mettre en fourrière', nil, {}, true, {
                onSelected = function() 
                    spawnObject('prop_barrier_work05')
                end,
            onActive = function()
            end})
        end)

        if not RageUI.Visible(menu) then
            openPolice()
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenAlertePolice()
	local menu = RageUI.CreateMenu('FBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Prise de service', nil, {}, true, {
                onSelected = function() 
                    TriggerServerEvent('esx_police:PriseEtFinservice', 'prise')
                end,
            onActive = function()

            end})
            RageUI.Button('Fin de service', nil, {}, true, {
                onSelected = function() 
                    TriggerServerEvent('esx_police:PriseEtFinservice', 'fin')
                end,
            onActive = function()

            end})
            RageUI.Button('Pause', nil, {}, true, {
                onSelected = function() 
                    TriggerServerEvent('esx_police:PriseEtFinservice', 'pause')
                end,
            onActive = function()

            end})
        end)

        if not RageUI.Visible(menu) then
            openPolice()
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenPoliceCitoyenMenu()
	local menu = RageUI.CreateMenu('FBI', "Menu FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Carte d\'identité', nil, {}, true, {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        RageUI.CloseAll()
                        TriggerServerEvent('esx_jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
                end,
            onActive = function()

            end})
            RageUI.Button('Fouiller', nil, {}, true, {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    searchedPly = player
                    if distance ~= -1 and distance <= 3.0 then
                        openInv(GetPlayerServerId(player))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
                end,
            onActive = function()

            end})
            RageUI.Button('Trainer', nil, {}, true, {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        TriggerServerEvent('esx__policejob:drag', GetPlayerServerId(player))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
                end,
            onActive = function()

            end})
            RageUI.Button('Mettre dans le véhicule', nil, {}, true, {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        TriggerServerEvent('esx__policejob:putInVehicle', GetPlayerServerId(player))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
                end,
            onActive = function()

            end})
            RageUI.Button('Sortir dans le véhicule', nil, {}, true, {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        TriggerServerEvent('esx__policejob:OutVehicle', GetPlayerServerId(player))
                    else
                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                    end
                end,
            onActive = function()

            end})
            RageUI.Button('Amende', nil, {}, true, {
                onSelected = function() 
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Erreur ~w~~n~Il n\'y a aucun joueurs au alentours')
                    else
                        local string = KeyboardInput('Montant de la facture', ('Montant de la facture'), '', 999)
                        if string ~= "" then
                            Montant = tonumber(string)
                        end
                        TriggerServerEvent('Core:AddBilling', GetPlayerServerId(closestPlayer), Montant, "Facture police", "society_police")
                    end
                end,
            onActive = function()

            end})
        end)

        if not RageUI.Visible(menu) then
            openPolice()
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

-- INVENTAIRE JOUEUR

RegisterNetEvent('framework:openinv')
AddEventHandler('framework:openinv', function(table)
    openInv(table)
end)

function openInv(id)
    local loaded = false
    local data
    local name
    local money
    local blackmoney
   
    ESX.TriggerServerCallback('CORE:GETPLAYERDATA', function(result)
        data = result
        name = result.name
        money = result.money
        blackmoney = result.blackmoney
        loaded = true
    end, id)
    while not loaded do 
        Wait(1)
    end
    local inventaireplayer = RageUI.CreateMenu('Menu Fouille', "Inventaire")
    RageUI.Visible(inventaireplayer, not RageUI.Visible(inventaireplayer))
	while inventaireplayer do
		Citizen.Wait(0)
        RageUI.IsVisible(inventaireplayer, function()
            RageUI.Separator('Argent')
            RageUI.Button('Argent liquide : ', nil, { RightLabel = "Quantité(s) : ~r~"..money ..'$'}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Button('Argent Sale : ', nil, { RightLabel = "Quantité(s) : ~r~"..blackmoney ..'$'}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Separator('Objets')
            for k,v in pairs(data.inventory) do
                if v.count ~= 0 then 
                    RageUI.Button(v.label, nil, { RightLabel = "Quantité(s) : ~r~"..v.count }, true, {
                        onSelected = function()
                            
                        end
                    })
                end
            end
        end)
        if not RageUI.Visible(inventaireplayer) then
            inventaireplayer = RMenu:DeleteType('inventaireplayer', true)
        end
    end
end

RegisterNetEvent('police:InfoService')
AddEventHandler('police:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Prise de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-8\n~w~Information: ~g~Prise de service.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~r~Fin de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-10\n~w~Information: ~r~Fin de service.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~o~Pause de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-6\n~w~Information: ~o~Pause de service.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Mise en standby', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-12\n~w~Information: ~g~Standby, en attente de dispatch.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Control routier', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-48\n~w~Information: ~g~Control routier en cours.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Refus d\'obtempérer', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-30\n~w~Information: ~g~Refus d\'obtempérer / Délit de fuite en cours.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Crime en cours', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-31\n~w~Information: ~g~Crime en cours / poursuite en cours.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

function spawnObject(name)
	local plyPed = PlayerPedId()
	local coords = GetEntityCoords(plyPed, false) + (GetEntityForwardVector(plyPed) * 1.0)

	ESX.Game.SpawnObject(name, coords, function(obj)
		SetEntityHeading(obj, GetEntityPhysicsHeading(plyPed))
		PlaceObjectOnGroundProperly(obj)
	end)
end

function openVestiairePolice()
	local menu = RageUI.CreateMenu('FBI', "Vestiaire FBI")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Fin de service', nil, {}, true, {
                onSelected = function() 
                    ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin)
                    end)
                end,
            onActive = function()
            end})
            RageUI.Separator('↓ ↓ ↓')
            RageUI.Button('Tenue de service', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['recruit_wear'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['recruit_wear'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['recruit_wear'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['recruit_wear'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Separator('↓ ↓ ↓')
            RageUI.Button('Mettre Gilet Cadet', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['gilet_wear'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['gilet_wear'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['gilet_wear'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['gilet_wear'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Button('Enlever Gilet Cadet', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['gilet_wear1'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['gilet_wear1'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['gilet_wear1'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['gilet_wear1'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Button('Mettre Gilet par Balle', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['bullet_wear'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['bullet_wear'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['bullet_wear'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['bullet_wear'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Button('Enlever Gilet par Balle', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['bullet_wear1'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['bullet_wear1'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['bullet_wear1'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['bullet_wear1'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Separator('↓ ↓ ↓')
            RageUI.Button('Tenue Anti-émeute', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['emeute_wear'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['emeute_wear'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['emeute_wear'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['emeute_wear'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
            RageUI.Button('Tenue du S.W.A.T', nil, {}, true, {
                onSelected = function() 
                    TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
                        if skin.sex == 0 then
                            if FBIVestiaire['inter_wear'].male ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['inter_wear'].male)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        else
                            if FBIVestiaire['inter_wear'].female ~= nil then
                                TriggerEvent('::{korioz#0110}::skinchanger:loadClothes', skin, FBIVestiaire['inter_wear'].female)
                            else
                                ESX.ShowNotification('il n\'y a pas d\'uniforme à votre taille...')
                            end
                        end
                    end)
                end,
            onActive = function()
            end})
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

RegisterNetEvent('esx_renfort:setBlip')
AddEventHandler('esx_renfort:setBlip', function(coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-2\n~w~Importance: ~g~Légère.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'importante' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-3\n~w~Importance: ~o~Importante.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'omgad' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowAdvancedNotification('FBI INFORMATIONS', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-99\n~w~Importance: ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 0.7)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

RegisterCommand('fbimenu', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'fbi' then
        openPolice()
    end
end)
RegisterKeyMapping('fbimenu', 'Menu FBI', 'keyboard', 'F6')

Citizen.CreateThread(function()
    while true do
        local isProche = false
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'fbi' then
                local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(128.75, -755.83, 241.15))

                if dist < 50 then
                    isProche = true
                    DrawMarker(25, 128.75, -755.83, 241.15-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 255, 147, 0, 255, false, false, 2, false, false, false, false)
                end
                if dist < 3 then
                    ESX.ShowHelpNotification("~b~Astra\n~w~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                    if IsControlJustPressed(1,51) then
                        openVestiairePolice()
                    end
                end
            end

            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'fbi' then
                local boss = vector3(153.65, -745.43, 241.15)
                local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(153.65, -745.43, 241.15))

                if dist < 50 then
                    isProche = true
                    DrawMarker(25, 153.65, -745.43, 241.15-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 255, 147, 0, 255, false, false, 2, false, false, false, false)
                end
                if dist < 3 then
                    ESX.ShowHelpNotification("~b~Astra\n~w~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                    if IsControlJustPressed(1,51) then
                        TriggerEvent('eSociety:openMenu', {label = 'FBI', name = 'fbi' }, boss)
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