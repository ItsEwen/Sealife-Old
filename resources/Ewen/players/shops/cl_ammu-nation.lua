local AmmuItem = {
    --{name = 'knife', label = 'Couteau', price = 1000},
    {name = 'weapon_bat', label = 'Batte de Baseball', price = 15000},
    {name = 'weapon_knuckle', label = 'Poing Américain', price = 15000},
    {name = 'weapon_nightstick', label = 'Matraque', price = 15000}
}

local AmmuItemGold = {
    {name = 'weapon_knife', label = 'Couteau - Vip ~y~Gold', price = 15000},
    {name = 'weapon_battleaxe', label = 'Hache de Combat - Vip ~y~Gold', price = 15000},
    {name = 'weapon_poolcue', label = 'Queue de billard - Vip ~y~Gold', price = 15000},
}

local AmmuItemDiamond = {
    {name = 'weapon_snspistol', label = 'Pistolet SNS - Vip ~b~Diamond', price = 50000},
    {name = 'weapon_pistol', label = 'Berreta - Vip ~b~Diamond', price = 75000},
}

local MunitionsItem = {
    {name = 'pistol_box', label = 'Boite de 45ACP', desc = 'Cette boite contient 12 Balles de 45ACP', price = 180},
    {name = 'smg_box', label = 'Boite de 9mm', desc = 'Cette boite contient 12 Balles de 9mm', price = 240},
    {name = 'rifle_box', label = 'Boite de 5.56', desc = 'Cette boite contient 12 Balles de 5.56', price = 300},
    {name = 'mg_box', label = 'Boite de 7.62', desc = 'Cette boite contient 12 Balles de 7.62', price = 360},
    {name = 'shotgun_box', label = 'Boite de Calibre 12', desc = 'Cette boite contient 12 Balles de Calibre 12', price = 600},
    {name = 'pistol_ammo', label = 'Balle de 45ACP', desc = nil, price = 15},
    {name = 'smg_ammo', label = 'Balle de 9mm', desc = nil, price = 20},
    {name = 'rifle_ammo', label = 'Balle de 5.56', desc = nil, price = 25},
    {name = 'mg_ammo', label = 'Balle de 7.62', desc = nil, price = 30},
    {name = 'shotgun_ammo', label = 'Balle de Calibre 12', desc = nil, price = 50}
}

function AmmuNation()
    if exports.Kalops:GetLevel() >= 3 then
        local menu = RageUI.CreateMenu("Ammu-Nation", "Articles disponibles :")

        RageUI.Visible(menu, not RageUI.Visible(menu))

        while menu do
            Wait(0)
            RageUI.IsVisible(menu, function()

            for k,v in pairs(AmmuItem) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                    onSelected = function()
                        OpenMenuPaiement(v.name, v.price)
                    end
                })
            end
            for k,v in pairs(AmmuItemGold) do
                
                RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                    onSelected = function()
                        local vip = exports.Kalops:GetVIP()
                        print(vip)
                        if vip ~= 0 then
                            OpenMenuPaiement(v.name, v.price)
                        else
                            ESX.ShowNotification('~b~Sea~w~Life~w~~n~Vous devez être minimum VIP ~y~Gold')
                        end
                    end
                })
            end
            for k,v in pairs(AmmuItemDiamond) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                    onSelected = function()
                        local vip = exports.Kalops:GetVIP()
                        print(vip)
                        if vip == 2 then
                            OpenMenuPaiement(v.name, v.price)
                        else
                            ESX.ShowNotification('~b~Sea~w~Life~w~~n~Vous devez être minimum VIP ~b~Diamond')
                        end
                    end
                })
            end
            --RageUI.Button('Munitions', nil, {RightLabel = ">"}, true, {
            --    onSelected = function()
            --        OpenMunitions()
            --    end
            --})
            end, function()
            end)

            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    else
        ESX.ShowNotification('~b~Sea~w~Life ~w~~n~Vous devez être niveau 3 afin d\'acceder à l\'armurerie')
    end
end

function OpenMunitions()
    local menu = RageUI.CreateMenu("Ammu-Nation", "Articles disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

        for k,v in pairs(MunitionsItem) do
            RageUI.Button(v.label, v.desc, {RightLabel = "~g~".. v.price.."$"}, true, {
                onSelected = function()
                    OpenMenuPaiement(v.name, v.price)
                end
            })
        end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end