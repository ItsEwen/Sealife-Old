PersonalMenu = {
    cardList = {
        "Montrer",
        "Regarder"
    },
    vehList = {
        "Avant Gauche",
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite"
    },
    vehList2 = {
        "Avant Droite",
        "Arrière Gauche",
        "Arrière Droite",
        "Avant Gauche",
    },
    cardIndex = 1,
    cardButton = 1,
    vehIndex = 1,
    vehButton = 1,
    vehIndex2 = 1,
    veh2Button = 1,
    DoorState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
        Hood = false,
        Trunk = false
    },
    WindowState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
    },
}

function OpenPersonalMenu()
    local menu = RageUI.CreateMenu("Menu Personnel", "Actions disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~].")
            
            RageUI.Button('Mon Inventaire', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    Wait(150)
                    OpenInventoryMenu()
            end})
            RageUI.Button('Mes armes', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    Wait(150)
                    OpenWeaponMenu()
            end})
            RageUI.Button('Mon portefeuille', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    Wait(150)
                    OpenPortefeilleMenu()
            end})
            RageUI.Button('Mes accéssoires', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    Wait(150)
                    OpenAccessMenu()
            end})
            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                RageUI.Button('Gestion véhicule', nil, { RightLabel = "→→→" }, true, {
                    onSelected = function()
                        Wait(150)
                        OpenActionVehicleMenu()
                end})
            else
                RageUI.Button('~m~Gestion véhicule', nil, {}, nil, {
                    onSelected = function()
                end})
            end
            RageUI.Button('Animation', nil, {}, true, {onSelected = function() ExecuteCommand('emotemenu') end});
            RageUI.Button('Parametre', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    OpenSettingsMenu()
                end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenInventoryMenu()
    local menu = RageUI.CreateMenu("Mon Inventaire", "Contenu de vos poches :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            ESX.PlayerData = ESX.GetPlayerData()
            RageUI.Separator('Poids > '.. GetCurrentWeight() + 0.0 .. '/' .. ESX.PlayerData.maxWeight + 0.0)
            for i = 1, #ESX.PlayerData.inventory do
                if ESX.PlayerData.inventory[i].count > 0 then
                    RageUI.Button("• "..ESX.PlayerData.inventory[i].label, nil, { RightLabel = "Quantité(s) : ~r~x"..ESX.PlayerData.inventory[i].count }, true, {
                        onSelected = function()
                            OpenItemActionsMenu(ESX.PlayerData.inventory[i])
                        end
                    })
                end
            end

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPersonalMenu()
        end
    end
end

function GetCurrentWeight()
	local currentWeight = 0

	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].count > 0 then
			currentWeight = currentWeight + (ESX.PlayerData.inventory[i].weight * ESX.PlayerData.inventory[i].count)
		end
	end

	return currentWeight
end

function OpenItemActionsMenu(item)
    local menu = RageUI.CreateMenu(item.label, "Actions")
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Separator("Quantité : "..item.count)
            RageUI.Button("Utiliser", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    variable = KeyboardInput('Ecrivez OUI/NON pour utiliser', ('Ecrivez OUI/NON pour utiliser'), '', 30)
                    if variable == 'OUI' or variable == 'oui' then
                        TriggerServerEvent('::{korioz#0110}::esx:useItem', item.name)
                 end
            end
            })
            RageUI.Button("Donner", nil, { RightLabel = "→→→" }, closestPlayer ~= -1 and closestDistance <= 3, {
                onHovered = function()
                    if closestPlayer ~= -1 and closestDistance <= 3 then
                        PlayerMarker(closestPlayer)
                    end
                end,
                onSelected = function()
                    variable = KeyboardInput('Ecrivez OUI/NON pour donner', ('Ecrivez OUI/NON pour donner'), '', 30)
                    if variable == 'OUI' or variable == 'oui' then
                    local sonner, quantity = CheckQuantity(KeyboardInput("", 'Nombres d\'items que vous voulez donner', 'Nombres d\'items que vous voulez donner', 100))
                    if sonner then
                        local closestPed = GetPlayerPed(closestPlayer)
                        if IsPedOnFoot(closestPed) then
                            if quantity > item.count then
                                ESX.ShowNotification("~r~Nombres d'items invalide !")
                            else
                                TriggerServerEvent('::{korioz#0110}::esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', item.name, quantity)
                                TriggerServerEvent('ewen:notification', 'item_standard', item.name, GetPlayerServerId(closestPlayer))
                                RageUI.GoBack()
                            end
                            ESX.ShowNotification("~b~SeaLife  ~w~~n~Vous avez donné : ~r~x"..quantity .. ' '.. item.name)
                        else 
                            ESX.ShowNotification("~r~Tu dois decendre du véhicule !")
                        end
                    end
                 end
            end
            })
            RageUI.Button("Jeter", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    if item.canRemove then 
                        variable = KeyboardInput('Ecrivez OUI/NON pour jeter', ('Ecrivez OUI/NON pour jeter'), '', 30)
                        if variable == 'OUI' or variable == 'oui' then
                        local post, quantity = CheckQuantity(KeyboardInput("", 'Nombres d\'items que vous voulez jeter', 'Nombres d\'items que vous voulez jeter', 100))
                        if post then
                            if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                TriggerServerEvent('::{korioz#0110}::esx:dropInventoryItem', 'item_standard', item.name, quantity)
                                RageUI.GoBack()
                                ESX.ShowNotification("~b~SeaLife  ~w~~n~Vous avez jetez : ~r~x"..quantity .. ' '.. item.label)
                            end
                        end
                    end
                    else
                        ESX.ShowNotification("Vous ne pouvez pas jeter cet item")
                    end
                end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenInventoryMenu()
        end
    end
end

function OpenWeaponMenu()
    local menu = RageUI.CreateMenu("Mes armes", "Contenu de vos poches :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            for i = 1, #Player.WeaponData, 1 do
                if HasPedGotWeapon(PlayerPedId(), Player.WeaponData[i].hash, false) then
                    local ammo = GetAmmoInPedWeapon(PlayerPedId(), Player.WeaponData[i].hash)

                    RageUI.Button("• "..Player.WeaponData[i].label, nil, { RightLabel = "Munition(s) : ~r~x"..ammo }, true, {
                        onSelected = function()
                            Wait(150)
                            OpenWeaponActionsMenu(Player.WeaponData[i])
                        end
                    })
            
                end
            end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPersonalMenu()
        end
    end
end

function OpenWeaponActionsMenu(weapon)
    local menu = RageUI.CreateMenu(weapon.label, "Actions")
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local ammo = GetAmmoInPedWeapon(PlayerPedId(), weapon.hash)

    RageUI.Visible(menu, not RageUI.Visible(menu))
    
    while menu do
        Wait(0)
        
        RageUI.IsVisible(menu, function()
            RageUI.Separator("Munition(s) : "..ammo)
            RageUI.Button("Jeter", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    variable = KeyboardInput('Ecrivez OUI/NON pour jeter', ('Ecrivez OUI/NON pour jeter'), '', 30)
                    if variable == 'OUI' or variable == 'oui' then
                    if IsPedOnFoot(PlayerPedId()) then
                        TriggerServerEvent('::{korioz#0110}::esx:dropInventoryItem', 'item_weapon', weapon.name)
                        RageUI.GoBack()
                        ESX.ShowNotification("~b~SeaLife  ~w~~n~Vous avez jetez : ~r~"..weapon.label)
                    else
                        ESX.ShowNotification("~r~Impossible de jeter l'armes dans un véhicule")
                    end
                end
            end
            })
            RageUI.Button("Donner", nil, { RightLabel = "→→→" }, closestPlayer ~= -1 and closestDistance <= 3, {
                onHovered = function()
                    if closestPlayer ~= -1 and closestDistance <= 3 then
                        PlayerMarker(closestPlayer)
                    end
                end,
                onSelected = function()
                    variable = KeyboardInput('Ecrivez OUI/NON pour donner', ('Ecrivez OUI/NON pour donner'), '', 30)
                    if variable == 'OUI' or variable == 'oui' then
                    local closestPed = GetPlayerPed(closestPlayer)
                    if IsPedOnFoot(closestPed) then
                        TriggerServerEvent('ewen:transferweapon', GetPlayerServerId(closestPlayer), weapon.name)
                        TriggerServerEvent('ewen:notification', 'weapon', weapon.label, GetPlayerServerId(closestPlayer))
                        RageUI.GoBack()
                    else
                        ESX.ShowNotification('Impossible de donner une arme dans un véhicule')
                    end
                end
            end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenWeaponMenu()
        end
    end
end

function OpenPortefeilleMenu()
    local menu = RageUI.CreateMenu("Mon Portefeuille", "Informations :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            --@TODO : facture
            RageUI.Button("Métier :", nil, {RightLabel = "~b~"..ESX.PlayerData.job.label .. ' '.. ESX.PlayerData.job.grade_label}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Button("Organisation :", nil, {RightLabel = "~b~"..ESX.PlayerData.job2.label .. ' '.. ESX.PlayerData.job2.grade_label}, true, {
                onSelected = function()
                    
                end
            })
            RageUI.Separator("")
            for i = 1, #ESX.PlayerData.accounts, 1 do
                if ESX.PlayerData.accounts[i].name == 'cash' then
                    RageUI.Button("Votre liquide", nil, {RightLabel = "~b~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).."$ ~s~→→→"}, true, {
                        onSelected = function()
                            Wait(150)
                            OpenOptionMoneyMenu(false)
                        end
                    })
                end
            end
            for i = 1, #ESX.PlayerData.accounts, 1 do
                if ESX.PlayerData.accounts[i].name == 'dirtycash' then
                    RageUI.Button("Votre argent Sale", nil, {RightLabel = "~r~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).."$ ~s~→→→"}, true, {
                        onSelected = function()
                            Wait(150)
                            OpenOptionMoneyMenu(true)
                        end
                    })
                end
            end
            RageUI.Button('Mes Factures', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    Wait(150)
                    OpenFactureMenu()
            end})
            RageUI.List('Carte d\'identité :', PersonalMenu.cardList, PersonalMenu.cardIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    PersonalMenu.cardIndex = Index;
                    PersonalMenu.cardButton = Index;
                end,
                onSelected = function()
                    if PersonalMenu.cardButton == 1 then 
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3 then
                            TriggerServerEvent('ewen:identity', 2, GetPlayerServerId(closestPlayer))
                        else
                            ESX.ShowNotification('~b~SeaLife ~w~~n~Aucun joueurs au alentours')
                        end
                    elseif PersonalMenu.cardButton == 2 then
                        TriggerServerEvent('ewen:identity', 1)
                    end
                end
            })
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPersonalMenu()
        end
    end
end
local BillData = nil
function OpenFactureMenu()
    local menu = RageUI.CreateMenu("Mes Factures", "Voici vos factures")
	ESX.TriggerServerCallback('ewen:getFactures', function(bills) BillData = bills end)
    RageUI.Visible(menu, not RageUI.Visible(menu))
    Wait(150)
    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            if #BillData ~= 0 then
                for i = 1, #BillData, 1 do
                    RageUI.Button(BillData[i].label, nil, {RightLabel = '$' .. ESX.Math.GroupDigits(BillData[i].amount)}, true, {
                        onSelected = function()
                            variable = KeyboardInput('Ecrivez OUI/NON pour payer la facture', ('Ecrivez OUI/NON pour facture'), '', 30)
                            if variable == 'OUI' or variable == 'oui' then
                            ESX.TriggerServerCallback('::{korioz#0110}::esx_billing:payBill', function()
                            end, BillData[i].id)
                        end
                        OpenFactureMenu()
                    end})
                end
            else
                RageUI.Separator('~r~')
                RageUI.Separator('~r~Vous n\'avez pas de facture')
                RageUI.Separator('~r~')
            end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPortefeilleMenu()
        end
    end
end

function OpenConfirmDemissionMenu(secondJob)
    local menu = RageUI.CreateMenu("Confirmation", "Voulez-vous vraiment démissionner ?")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Button("Oui", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    if not secondJob then
                        TriggerServerEvent("Core:setJob", "unemployed", 0)
                        RageUI.CloseAll()
                    else
                        TriggerServerEvent("Core:setJob2", "unemployed2", 0)
                        RageUI.CloseAll()
                    end
                end
            })
            RageUI.Button("Non", nil, {RightLabel = "→→→"}, true, {
                onSelected = function()
                    RageUI.CloseAll()
                end
            })
            

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPortefeilleMenu()
        end
    end
end

function OpenOptionMoneyMenu(isBlack)
    local menu = RageUI.CreateMenu("Actions", "Actions :")
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Button("Donner", nil, { RightLabel = "→→→" }, closestPlayer ~= -1 and closestDistance <= 3, {
                onHovered = function()
                    if closestPlayer ~= -1 and closestDistance <= 3 then
                        PlayerMarker(closestPlayer)
                    end
                end,
                onSelected = function()
                    local sonner, quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez donner", '', '', 100))
                    if sonner then
                        if closestDistance ~= -1 and closestDistance <= 3 then
                            local closestPed = GetPlayerPed(closestPlayer)
                            if not IsPedSittingInAnyVehicle(closestPed) then
                                if not isBlack then
                                    for i = 1, #ESX.PlayerData.accounts, 1 do
                                        if ESX.PlayerData.accounts[i].name == 'cash' then
                                            TriggerServerEvent('::{korioz#0110}::esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                            TriggerServerEvent('ewen:notification', 'money', quantity, GetPlayerServerId(closestPlayer))
                                            RageUI.GoBack()
                                        end
                                    end
                                else
                                    for i = 1, #ESX.PlayerData.accounts, 1 do
                                        if ESX.PlayerData.accounts[i].name == 'dirtycash' then
                                            TriggerServerEvent('::{korioz#0110}::esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                            TriggerServerEvent('ewen:notification', 'dirtycash', quantity, GetPlayerServerId(closestPlayer))
                                            RageUI.GoBack()
                                        end
                                    end
                                end
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas faire ceci dans un véhicule !")
                            end
                        else
                            ESX.ShowNotification('Aucun joueur proche !')
                        end
                    else
                        ESX.ShowNotification('Somme invalide')
                    end
                end
            })
            RageUI.Button("Jeter", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez jeter", '', '', 1000))
                    if black then
                        if quantity > ESX.PlayerData.money then
                            ESX.ShowNotification('Somme invalide')
                        else
                            if not IsPedSittingInAnyVehicle(PlayerPedId()) then
                                TriggerServerEvent('::{korioz#0110}::esx:removeInventoryItem', 'item_money', ESX.PlayerData.money, quantity)
                                RageUI.GoBack()
                            else
                                ESX.ShowNotification("~r~Vous ne pouvez pas faire ceci dans un véhicule !")
                            end
                        end
                    else
                        ESX.ShowNotification('Somme invalide')
                    end
                end
            })
        
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPortefeilleMenu()
        end
    end
end

function OpenActionVehicleMenu()
    local menu = RageUI.CreateMenu("Véhicule", "Actions disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            local pPed = PlayerPedId()
            local pVeh = GetVehiclePedIsUsing(pPed)
            local vModel = GetEntityModel(pVeh)
            local vName = GetDisplayNameFromVehicleModel(vModel)
            local vPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(pPed), false)
            local plyVeh = GetVehiclePedIsIn(pPed, false)
            local GetSourcevehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
            local Vengine2 = math.floor(Vengine)

            RageUI.Separator("~r~Information")
            RageUI.Button('Nom du véhicule', nil, { RightLabel = "~b~"..vName }, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Plaque du véhicule', nil, { RightLabel = "~b~"..vPlate }, true, {
                onSelected = function()
                end
            })
            RageUI.Button('Etat du moteur', nil, { RightLabel = "~b~"..Vengine2.."%" }, true, {
                onSelected = function()
                end
            })
            RageUI.Separator("~r~Actions")
            RageUI.Button('Allumer/Eteindre votre moteur', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    if GetIsVehicleEngineRunning(GetSourcevehicle) then
                        SetVehicleEngineOn(GetSourcevehicle, false, false, true)
                        SetVehicleUndriveable(GetSourcevehicle, true)
                    elseif not GetIsVehicleEngineRunning(GetSourcevehicle) then
                        SetVehicleEngineOn(GetSourcevehicle, true, false, true)
                        SetVehicleUndriveable(GetSourcevehicle, false)
                    end
                end
            })
            RageUI.Button("Ouvrir/Fermer le capot", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    if not PersonalMenu.DoorState.Hood then
                        PersonalMenu.DoorState.Hood = true
                        SetVehicleDoorOpen(plyVeh, 4, false, false)
                    elseif PersonalMenu.DoorState.Hood then
                        PersonalMenu.DoorState.Hood = false
                        SetVehicleDoorShut(plyVeh, 4, false, false)
                    end
                end
            })
            RageUI.Button("Ouvrir/Fermer le coffre", nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    if not PersonalMenu.DoorState.Trunk then
                        PersonalMenu.DoorState.Trunk = true
                        SetVehicleDoorOpen(plyVeh, 5, false, false)
                    elseif PersonalMenu.DoorState.Trunk then
                        PersonalMenu.DoorState.Trunk = false
                        SetVehicleDoorShut(plyVeh, 5, false, false)
                    end
                end
            })
            RageUI.List('Gestion des portes', PersonalMenu.vehList, PersonalMenu.vehIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    PersonalMenu.vehIndex = Index;
                    PersonalMenu.vehButton = Index;
                end,
                onSelected = function()
                    if PersonalMenu.vehButton == 1 then 
                        if not PersonalMenu.DoorState.FrontLeft then
                            PersonalMenu.DoorState.FrontLeft = true
                            SetVehicleDoorOpen(plyVeh, 0, false, false)
                        elseif PersonalMenu.DoorState.FrontLeft then
                            PersonalMenu.DoorState.FrontLeft = false
                            SetVehicleDoorShut(plyVeh, 0, false, false)
                        end
                    elseif PersonalMenu.vehButton == 2 then
                        if not PersonalMenu.DoorState.FrontRight then
                            PersonalMenu.DoorState.FrontRight = true
                            SetVehicleDoorOpen(plyVeh, 1, false, false)
                        elseif PersonalMenu.DoorState.FrontRight then
                            PersonalMenu.DoorState.FrontRight = false
                            SetVehicleDoorShut(plyVeh, 1, false, false)
                        end
                    elseif PersonalMenu.vehButton == 3 then
                        if not PersonalMenu.DoorState.BackLeft then
                            PersonalMenu.DoorState.BackLeft = true
                            SetVehicleDoorOpen(plyVeh, 2, false, false)
                        elseif PersonalMenu.DoorState.BackLeft then
                            PersonalMenu.DoorState.BackLeft = false
                            SetVehicleDoorShut(plyVeh, 2, false, false)
                        end
                    elseif PersonalMenu.vehButton == 4 then
                        if not PersonalMenu.DoorState.BackRight then
                            PersonalMenu.DoorState.BackRight = true
                            SetVehicleDoorOpen(plyVeh, 3, false, false)
                        elseif PersonalMenu.DoorState.BackRight then
                            PersonalMenu.DoorState.BackRight = false
                            SetVehicleDoorShut(plyVeh, 3, false, false)
                        end
                    end
                end
            })
            RageUI.List('Gestion des fenetres', PersonalMenu.vehList2, PersonalMenu.vehIndex2, nil, {}, true, {
                onListChange = function(Index, Item)
                    PersonalMenu.vehIndex2 = Index;
                    PersonalMenu.veh2Button = Index;
                end,
                onSelected = function()
                    if PersonalMenu.veh2Button == 1 then 
                        if not PersonalMenu.WindowState.FrontLeft then
                            PersonalMenu.WindowState.FrontLeft = true
                            RollUpWindow(plyVeh, 1)
                        elseif PersonalMenu.WindowState.FrontLeft then
                            PersonalMenu.WindowState.FrontLeft = false
                            RollDownWindow(plyVeh, 1)
                         end
                    elseif PersonalMenu.veh2Button == 2 then
                        if not PersonalMenu.WindowState.FrontRight then
                            PersonalMenu.WindowState.FrontRight = true
                            RollUpWindow(plyVeh, 2)
                        elseif PersonalMenu.WindowState.FrontRight then
                            PersonalMenu.WindowState.FrontRight = false
                            RollDownWindow(plyVeh, 2)
                        end
                    elseif PersonalMenu.veh2Button == 3 then
                        if not PersonalMenu.WindowState.BackLeft then
                            PersonalMenu.WindowState.BackLeft = true
                            RollUpWindow(plyVeh, 3)
                        elseif PersonalMenu.WindowState.BackLeft then
                            PersonalMenu.WindowState.BackLeft = false
                            RollDownWindow(plyVeh, 3)
                        end
                    elseif PersonalMenu.veh2Button == 4 then
                        if not PersonalMenu.WindowState.BackRight then
                            PersonalMenu.WindowState.BackRight = true
                            RollUpWindow(plyVeh, 4)
                        elseif PersonalMenu.WindowState.BackRight then
                            PersonalMenu.WindowState.BackRight = false
                            RollDownWindow(plyVeh, 4)
                        end
                    end
                end
            })
            
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPersonalMenu()
        end
    end
end

function OpenSettingsMenu()
    local menu = RageUI.CreateMenu("Parametres", "Parametres disponibles :")

    AllPlayers = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(AllPlayers, player)
    end

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            
            RageUI.Button('Parametres visuels', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    OpenVisualSettingsMenu()
                end
            })
            RageUI.Button('Parametres personnel', nil, { RightLabel = "→→→" }, true, {
                onSelected = function()
                    OpenPersonnelSettingMenu()
                end
            })
            RageUI.Button('Joueurs en villes :', nil, { RightLabel = #AllPlayers }, true, {
                onSelected = function()
                end
            })

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenPersonalMenu()
        end
    end
end

function OpenVisualSettingsMenu()
    local menu = RageUI.CreateMenu("Parametres Visuel", "Visuel disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Checkbox('•   Vue & lumières améliorées', description, show1, {}, {
                onChecked = function()
                    SetTimecycleModifier('tunnel')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show1 = Index
                end
            })

            RageUI.Checkbox('•   Vue & lumières améliorées x2', description, show2, {}, {
                onChecked = function()
                    SetTimecycleModifier('CS3_rail_tunnel')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show2 = Index
                end
            })

            RageUI.Checkbox('•   Vue & lumières améliorées x3', description, show3, {}, {
                onChecked = function()
                    SetTimecycleModifier('MP_lowgarage')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show3 = Index
                end
            })

            RageUI.Checkbox('•   Vue lumineux', description, show4, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_vignette_neg')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show4 = Index
                end
            })

            RageUI.Checkbox('•   Vue lumineux x2', description, show5, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_saturation_neg')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show5 = Index
                end
            })

            RageUI.Checkbox('•   Couleurs amplifiées', description, show6, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_saturation')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show6 = Index
                end
            })

            RageUI.Checkbox('•   Noir & blancs', description, show7, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_saturation_neg')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show7 = Index
                end
            })

            RageUI.Checkbox('•   Visual 1', description, show8, {}, {
                onChecked = function()
                    SetTimecycleModifier('yell_tunnel_nodirect')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show8 = Index
                end
            })

            RageUI.Checkbox('•   Blanc', description, show9, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_contrast_neg')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show9 = Index
                end
            })

            RageUI.Checkbox('•   Dégats', description, show10, {}, {
                onChecked = function()
                    SetTimecycleModifier('rply_vignette')
                end,
                onUnChecked = function()
                    SetTimecycleModifier('')
                end,
                onSelected = function(Index)
                    show10 = Index
                end
            })

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenSettingsMenu()
        end
    end
end

function OpenPersonnelSettingMenu()
    local menu = RageUI.CreateMenu("Parametres Personnel", "Actions disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Button('Sauvegarde mon personnagel', "Possible de faire toute les 15 minutes.", { RightLabel = "→→→" }, not codesCooldown, {
                onSelected = function()
                    TriggerEvent('::{korioz#0110}::esx:updateLastPosition')
                    ESX.ShowNotification("~g~Personnage sauvegardé", false, false, 140)
                    codesCooldown = true
                    Citizen.SetTimeout(15 * 60 * 1000, function()
                        codesCooldown = false
                    end)
                end
            })

            RageUI.Checkbox('Désactiver les coups de crosse', description, coupCrosse, {}, {
                onChecked = function()
                    Citizen.CreateThread(function()
                        while coupCrosse do
                            Citizen.Wait(0)
                            local ped = PlayerPedId()
                            if IsPedArmed(ped, 6) then
                                DisableControlAction(1, 140, true)
                                DisableControlAction(1, 141, true)
                                DisableControlAction(1, 142, true)
                            end
                        end
                    end)
                end,
                onUnChecked = function()
                    coupCrosse = false
                end,
                onSelected = function(Index)
                    coupCrosse = Index
                end
            })


        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            OpenSettingsMenu()
        end
    end
end

function CheckQuantity(number)
    number = tonumber(number)
  
    if type(number) == 'number' then
        number = ESX.Math.Round(number)
        if number > 0 then
            return true, number
        end
    end
  
    return false, number
end

RegisterCommand("openPersonalMenu", function()
    OpenPersonalMenu()
end, false)


RegisterKeyMapping('openPersonalMenu', 'Menu Personnel', 'keyboard', 'F5')

RegisterNetEvent('framework:tp')
AddEventHandler('framework:tp', function(coords)
    SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
end)