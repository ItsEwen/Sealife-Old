Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
local noclip = false
openAdminMenu = function()
    local menu = RageUI.CreateMenu('SeA-Admin', "Menu Admin by Sea-Shops")
    if staffmode then
        staffmodText = '~r~Désactivé le mode Staff'
    else
        staffmodText = '~g~Activé le mode Staff'
    end
    local refreshlist = true
    RageUI.Visible(menu, not RageUI.Visible(menu))
    local playersCount = 0
    local staffCount = 0
    while menu do
        Citizen.Wait(0)
        RageUI.IsVisible(menu, function()
            if not staffmode then
                RageUI.Separator('~r~Vous n\'êtes pas en service')
            else
                RageUI.Separator('~g~Vous êtes en service')
            end
            RageUI.Checkbox(staffmodText, nil, staffmode, {}, {
                onChecked = function()
                    staffmode = true
                    staffmodText = '~r~Désactivé le mode Staff'
                end,
                onUnChecked = function()
                    staffmode = false
                    staffmodText = '~g~Activé le mode Staff'
                end,
            })
            if staffmode then
                RageUI.Separator('~g~Actions Joueurs')
                RageUI.Separator('Joueurs en ligne : ~g~'.. playersCount .. '~w~ Staff en Ligne : ~r~'.. staffCount)
                RageUI.Button('Raffraichir la liste', 'Appuie ici pour raffraichir la liste des joueurs', {}, refreshlist, {
                    onSelected = function()
                        if refreshlist then
                            refreshlist = false
                            Citizen.SetTimeout(15000, function()
                                refreshlist = true
                            end)
                        else
                            ESX.ShowNotification('~r~Erreur ~w~~n~Vous devez attendre avant de faire cette action')
                        end
                end})
                RageUI.Button('Liste des Joueurs', nil, {RightLabel = playersCount}, true, {
                    onSelected = function()

                end})
                RageUI.Button('Liste des Staff', nil, {RightLabel = staffCount}, true, {
                    onSelected = function()

                end})
                RageUI.Separator('~g~Actions Principal')
                RageUI.Checkbox('Noclip', nil, noclip, {RightLabel = 'BIND : ~g~F3'}, {
                    onChecked = function()
                        noclip = true
                        ToogleNoClip()
                    end,
                    onUnChecked = function()
                        noclip = false
                        ToogleNoClip()
                    end,
                })
                RageUI.Checkbox('Activer les noms', nil, showname, {}, {
                    onChecked = function()
                        showname = true
                    end,
                    onUnChecked = function()
                        showname = false
                    end,
                })
            end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

RegisterCommand('staff', function()
    if ESX.GetPlayerData()['group'] ~= 'user' then
        openAdminMenu()
    end
end)

RegisterCommand('noclip', function()
    if staffmode then
        if ESX.GetPlayerData()['group'] ~= 'user' then
            if noclip then
                ToogleNoClip()
                noclip = false
            else
                ToogleNoClip()
                noclip = true
            end
        end
    end
end)
RegisterKeyMapping('noclip', 'Activer le Noclip ', 'keyboard', 'F3')