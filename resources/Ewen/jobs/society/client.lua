local List = {
    Actions = {
        "Déposer",
        "Prendre"
    },
    ActionIndex = 1,
    ActionButton = 1
}

local List2 = {
    Actions = {
        "Déposer",
        "Prendre"
    },
    ActionIndex = 1,
    ActionButton = 1
}

SeaLife.Job ={
    BossMenu = function(entreprise)
        local main = RageUI.CreateMenu("Entreprise", "~b~Gestion "..SeaLife.joblabel)
    
        RageUI.Visible(main, not RageUI.Visible(main))
    
        while main do 
            Citizen.Wait(0)
            RageUI.IsVisible(main, function()
                RageUI.Separator('Argent de la société : ~b~'.. SeaLife.societymoney)
                RageUI.Separator('')
                RageUI.Button('Retirer de l\'argent', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            Montant = tonumber(string)
                        end
                        TriggerServerEvent('ewensociety:withdrawMoney', SeaLife.job, tonumber(Montant))
                    end
                });
                RageUI.Button('Deposer de l\'argent', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            Montant = tonumber(string)
                        end
                        TriggerServerEvent('ewensociety:depositMoney', SeaLife.job, tonumber(Montant))
                    end
                });
            end)
            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main', true)
            end
        end
    end,
    OpenSocietyMenu = function(society, position)
        local menu = RageUI.CreateMenu("Coffre", "Actions disponibles :")
        local data 
        local money
        local moneysale
        local load = false
    
        ESX.TriggerServerCallback("Core:GetSocietyInfo", function(result) 
            data = result.data
            money = result.money
            moneysale = result.moneysale
            load = true
        end, society.name)
    
        while not load do 
            Wait(1)
        end
    
        RageUI.Visible(menu, not RageUI.Visible(menu))
    
        while menu do
            Wait(0)
            RageUI.IsVisible(menu, function()
    
                RageUI.Separator("~b~Société : ~s~"..society.label)
                if SeaLife.jobgrade == 'boss' then
                    RageUI.Separator("~b~Argent Liquide : ~s~"..money.."$")
                    RageUI.Separator("~b~Argent Sale : ~s~"..moneysale.."$")
                    RageUI.Separator("")
                    RageUI.List("Actions sur l'argent ", List.Actions, List.ActionIndex, nil, {}, true, {
                        onListChange = function(Index, Item)
                            List.ActionIndex = Index;
                            List.ActionButton = Index;
                        end,
                        onSelected = function()
                            if List.ActionButton == 1 then 
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput('Combien voulez vous déposer ?', '', '', 100)
                                if string ~= "" then
                                    deposit = tonumber(string) 
                                    TriggerServerEvent("Core:ActionMoneyToSocietyCache", society.name, "deposit", deposit)
                                    SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                                end
                            elseif List.ActionButton == 2 then
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput('Combien voulez vous prendre ?', '', '', 100)
                                if string ~= "" then
                                    deposit = tonumber(string) 
                                    TriggerServerEvent("Core:ActionMoneyToSocietyCache", society.name, "take", deposit)
                                    SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                                end
                            end
                        end
                    })
                    RageUI.List("Actions sur l'argent Sale ", List2.Actions, List2.ActionIndex, nil, {}, true, {
                        onListChange = function(Index, Item)
                            List2.ActionIndex = Index;
                            List2.ActionButton = Index;
                        end,
                        onSelected = function()    
                            if List2.ActionButton == 1 then 
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput('Combien voulez vous déposer ?', '', '', 100)
                                if string ~= "" then
                                    deposit = tonumber(string) 
                                    TriggerServerEvent("Core:ActionMoneysaleToSocietyCache", society.name, "deposit", deposit)
                                    SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                                end
                            elseif List2.ActionButton == 2 then
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput('Combien voulez vous prendre ?', '', '', 100)
                                if string ~= "" then
                                    deposit = tonumber(string) 
                                    TriggerServerEvent("Core:ActionMoneysaleToSocietyCache", society.name, "take", deposit)
                                    SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, ActionPatron)
                                end
                            end
                        end
                    })
                end
                RageUI.Button("Désposer dans le coffre", nil, {}, true, {
                    onSelected = function()
                        Wait(150)
                        OpenSocietyPlayerInventoryMenu(society, position)
                    end
                })
                RageUI.Button("Prendre dans le coffre", nil, {}, true, {
                    onSelected = function()
                        Wait(150)
                        OpenSocietyInventoryMenu(society, position, data)
                    end
                })
                RageUI.Button("Action sur la société", nil, {}, true, {
                    onSelected = function()
                        if ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' then
                            Wait(150)
                            OpenSocietyActionSocieteMenu(society, position)
                        else
                            ESX.ShowNotification('~r~Erreur ~w~~n~Vous n\'avez pas les clé du casier')
                        end
                    end
                })
    
            end, function()
            end)
    
            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    end,
    CreateMecano = function()
        local main = RageUI.CreateMenu("Création Mécano", "~b~Création d\'un job Mécano")
    
        RageUI.Visible(main, not RageUI.Visible(main))
    
        while main do 
            Citizen.Wait(0)
            RageUI.IsVisible(main, function()
                RageUI.Button('Name du job ( sans espace )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            namejob = string
                        end
                    end
                });
                if namejob ~= nil then
                    RageUI.Separator(namejob)
                end
                RageUI.Button('Label du job ( Nom affiché au joueurs )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            labeljob = string
                        end
                    end
                });
                if labeljob ~= nil then
                    RageUI.Separator(labeljob)
                end
                RageUI.Button('Position du point de Vestiaire', nil, {}, true, {
                    onSelected = function() 
                        PositionVestiaire = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionVestiaire ~= nil then
                    RageUI.Separator(PositionVestiaire)
                end
                RageUI.Button('Position du point de Custom', nil, {}, true, {
                    onSelected = function() 
                        PositionCustom = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionCustom ~= nil then
                    RageUI.Separator(PositionCustom)
                end
                RageUI.Button('Position du point patron', nil, {}, true, {
                    onSelected = function() 
                        PositionBoss = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionBoss ~= nil then
                    RageUI.Separator(PositionBoss)
                end
                RageUI.Button('~g~Confirmer', nil, {}, true, {
                    onSelected = function() 
                        TriggerServerEvent('ewen:createmecano', namejob, labeljob, PositionVestiaire, PositionCustom, PositionBoss)
                        RageUI.CloseAll()
                    end
                });
            end)
            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main', true)
            end
        end
    end,
    OpenCreateEntrepriseFarmMenu = function()
        local main = RageUI.CreateMenu("Création Entreprise", "~b~Création d\'une entreprise farm")
    
        RageUI.Visible(main, not RageUI.Visible(main))
    
        while main do 
            Citizen.Wait(0)
            RageUI.IsVisible(main, function()
                RageUI.Button('Name du job ( sans espace )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            namejob = string
                        end
                    end
                });
                if namejob ~= nil then
                    RageUI.Separator(namejob)
                end
                RageUI.Button('Label du job ( Nom affiché au joueurs )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            labeljob = string
                        end
                    end
                });
                if labeljob ~= nil then
                    RageUI.Separator(labeljob)
                end
                RageUI.Button('name de l\'item récolte ( sans espace )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            namerecolteitem = string
                        end
                    end
                });
                if namerecolteitem ~= nil then
                    RageUI.Separator(namerecolteitem)
                end
                RageUI.Button('Label de l\'item récolte', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            labelrecolteitem = string
                        end
                    end
                });
                if labelrecolteitem ~= nil then
                    RageUI.Separator(labelrecolteitem)
                end
                RageUI.Button('Position de la récolte', nil, {}, true, {
                    onSelected = function() 
                        PositionRecolte = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionRecolte ~= nil then
                    RageUI.Separator(PositionRecolte)
                end
                RageUI.Button('name de l\'item traitement ( sans espace )', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            nametraitementitem = string
                        end
                    end
                });
                if nametraitementitem ~= nil then
                    RageUI.Separator(nametraitementitem)
                end
                RageUI.Button('Label de l\'item traitement', nil, {}, true, {
                    onSelected = function() 
                        local string = KeyboardInput('Combien ?', ('Combien ?'), '', 999)
                        if string ~= "" then
                            labeltraitementitem = string
                        end
                    end
                });
                if labeltraitementitem ~= nil then
                    RageUI.Separator(labeltraitementitem)
                end
                RageUI.Button('Position du Traitement', nil, {}, true, {
                    onSelected = function() 
                        PositionTraitement = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionTraitement ~= nil then
                    RageUI.Separator(PositionTraitement)
                end
                RageUI.Button('Position de la vente', nil, {}, true, {
                    onSelected = function() 
                        PositionVente = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionVente ~= nil then
                    RageUI.Separator(PositionVente)
                end
                RageUI.Button('Position du coffre entreprise', nil, {}, true, {
                    onSelected = function() 
                        PositionCoffreEntreprise = GetEntityCoords(PlayerPedId(), true)
                    end
                });
                if PositionCoffreEntreprise ~= nil then
                    RageUI.Separator(PositionCoffreEntreprise)
                end
                RageUI.Button('~g~Confirmer', nil, {}, true, {
                    onSelected = function() 
                        print(labeltraitementitem)
                        TriggerServerEvent('ewen:CreateFarmEntreprise', namejob, labeljob, namerecolteitem, labelrecolteitem, PositionRecolte, nametraitementitem, labeltraitementitem, PositionTraitement, PositionVente, PositionCoffreEntreprise)
                        RageUI.CloseAll()
                    end
                });
            end)
            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main', true)
            end
        end
    end
}

RegisterCommand('createmecano', function()
    if SeaLife.Rank == '_dev' then
        SeaLife.Job.CreateMecano()
    end
end)

-- SOCIETYMENU

function OpenSocietyPlayerInventoryMenu(society, position)
    local menu = RageUI.CreateMenu("Déposer", "Contenu de vos poches :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

            RageUI.Separator("~b~Que voulez-vous déposer ?")
            ESX.PlayerData = ESX.GetPlayerData()
            for i = 1, #ESX.PlayerData.inventory do
                if ESX.PlayerData.inventory[i].count > 0 then
                    RageUI.Button("• "..ESX.PlayerData.inventory[i].label, nil, { RightLabel = "Quantité(s) : ~r~x"..ESX.PlayerData.inventory[i].count }, true, {
                        onSelected = function()
                            if UpdateOnscreenKeyboard() == 0 then return end
                            local string = KeyboardInput('Combien voulez vous déposer ?', '', '', 100)
                            if string ~= "" then
                                deposit = tonumber(string)
                                if ESX.PlayerData.inventory[i].count >= deposit then
                                    TriggerServerEvent("Core:AddInventoryToSocietyCache", position, society.name, ESX.PlayerData.inventory[i].name, ESX.PlayerData.inventory[i].label, deposit)
                                else
                                    print('t')
                                    ESX.ShowNotification('~r~Erreur ~w~~n~Tu n\'as pas assez d\'objets sur toi')
                                end
                            end
                        end
                    })
                end
            end

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, position)
        end
    end
end

function OpenSocietyInventoryMenu(society, position, data)
    local menu = RageUI.CreateMenu("Prendre", "Contenu du coffre :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
            RageUI.Separator("~b~Que voulez-vous prendre ?")
            for k,v in pairs(data) do
                RageUI.Button(v.label, nil, {RightLabel = "Quantité(s) : ~r~x"..v.count}, true, {
                    onSelected = function()
                        if UpdateOnscreenKeyboard() == 0 then return end
                        local string = KeyboardInput('Combien voulez vous prendre ?', '', '', 100)
                        if string ~= "" then
                            deposit = tonumber(string) 
                            if v.count >= deposit then
                                TriggerServerEvent("Core:RemoveInventoryToSocietyCache", position, society.name, v.item, v.label, deposit)
                                SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, position)
                            else
                                ESX.ShowNotification('~r~Erreur ~w~~n~Il n\'y a pas assez d\'objets dans le coffre')
                            end
                        end
                    end
                })
            end

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
            SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, position)
        end
    end
end