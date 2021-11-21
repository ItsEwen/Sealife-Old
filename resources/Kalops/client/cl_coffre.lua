local PersonalMenu = {
    sale = nil,
    WeaponData = {},
}

WeaponBlackList = {
    ["WEAPON_MUSKET"] = true,
    ["WEAPON_NIGHTSTICK"] = true,
    ["WEAPON_STUNGUN"] = true,
    ["WEAPON_COMBATPISTOL"] = true,
    ["WEAPON_PUMPSHOTGUN"] = true,
    ["WEAPON_CARBINERIFLE"] = true
}

Citizen.CreateThread(function()

    PersonalMenu.WeaponData = ESX.GetWeaponList()

    for i = 1, #PersonalMenu.WeaponData, 1 do
        if PersonalMenu.WeaponData[i].name == 'WEAPON_UNARMED' then
            PersonalMenu.WeaponData[i] = nil
        else
            PersonalMenu.WeaponData[i].hash = GetHashKey(PersonalMenu.WeaponData[i].name)
        end
    end

end)
local arrayWeight = {

    armor = 3,
    bandage = 0.5,
    beer = 1,
    blowpipe = 3,
    bread = 0.5,
    burger = 0.8,	
    carokit = 3,
    carotool = 4,
    cigarette = 0.1,
    clip = 1,
    coca = 0.5,
    coke = 1,
    coke_coupe = 1,	
    coke_pooch = 2,
    cola = 0.5,
    cutter = 2,
    fishandchips = 1,
    fixkit = 2,
    fixtool = 4,
    id_card_f = 2,
    limonade = 0.5,
    medikit = 2,
    meth = 1,
    meth_coupe = 1,
    meth_pooch = 2,
    oeuvreart = 8,
    oeuvreart_luxe = 8,
    peinture = 10,
    peinture_luxe = 10,
    phone= 1,
    radio = 3,
    redbull = 0.3,
    secure_card = 2,
    tequila = 2,	
    ventouse = 3,
    vodka = 2,
    water = 0.8,	
    weed = 1,
    weed_pooch = 2,
    whisky = 2,

    -- armes
    WEAPON_COMBATPISTOL = 1000, -- poid poir une munnition
    WEAPON_NIGHTSTICK       = 500,
    WEAPON_STUNGUN          = 1000,
    WEAPON_FLASHLIGHT       = 500,
    WEAPON_FLAREGUN         = 1000,
    WEAPON_FLARE            = 1000,
    WEAPON_COMBATPISTOL     = 2500,
    WEAPON_HEAVYPISTOL      = 4000,
    WEAPON_ASSAULTSMG       = 7000,
    WEAPON_COMBATPDW        = 7000,
    WEAPON_BULLPUPRIFLE     = 8000,
    WEAPON_PUMPSHOTGUN      = 8000,
    WEAPON_BULLPUPSHOTGUN   = 10000,
    WEAPON_CARBINERIFLE     = 10000,
    WEAPON_ADVANCEDRIFLE    = 10000,
    WEAPON_MARKSMANRRIFLE   = 15000,
    WEAPON_SNIPERRIFLE      = 15000,
    WEAPON_FIREEXTINGUISHER = 1500, 
    GADGET_PARACHUTE        = 5000,
    WEAPON_BAT              = 1500,
    WEAPON_PISTOL           = 5000,

    -- argent
    dirtycash = 0, -- poids pour un argent sale

}

VehicleLimit = {
    [0] = 30, --Compact
    [1] = 40, --Sedan
    [2] = 80, --SUV
    [3] = 60, --Coupes
    [4] = 60, --Muscle
    [5] = 60, --Sports Classics
    [6] = 60, --Sports
    [7] = 30, --Super
    [8] = 15, --Motorcycles
    [9] = 160, --Off-road
    [10] = 200, --Industrial
    [11] = 100, --Utility
    [12] = 180, --Vans
    [13] = 5, --Cycles
    [14] = 150, --Boats
    [15] = 150, --Helicopters
    [16] = 150, --Planes
    [17] = 225, --Service
    [18] = 70, --Emergency
    [19] = 300, --Military
    [20] = 750, --Commercial
    [21] = 0, --Trains
}

CoffreMenu = {
    inMenuCoffre = false,
    contenuDuCoffre = {},
    moneyBlack = {},
    BlackMoneyDuCoffre = 0,
    ActualWeight = 0,
}

function openCoffre(veh, plate, class)
    local locked = GetVehicleDoorLockStatus(veh)
  
    if locked == 1 or class == 15 or class == 16 or class == 14 then
        if plate ~= nil or plate ~= "" or plate ~= " " then
            CloseToVehicle = true
            OpenCoffreInventoryMenu(veh, plate, VehicleLimit[class])
        end
    else
        ESX.ShowNotification('Ce coffre est ~r~fermé~s~.')
    end
end
  
function getItemyWeight(item)
    local weight = 0
    local itemWeight = 0
    if item ~= nil then
         itemWeight = 1
         if arrayWeight[item] ~= nil then
              itemWeight = arrayWeight[item]
         end
      end
    return itemWeight
end
  
function dump(o)
     if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
     else
        return tostring(o)
     end
end

  
local function getAllItem(plate)
    ESX.TriggerServerCallback('esx_truck:getInventoryV', function(inventory)
      CoffreMenu.contenuDuCoffre = {}
      CoffreMenu.BlackMoneyDuCoffre = 0
      CoffreMenu.ActualWeight = 0
  
      CoffreMenu.BlackMoneyDuCoffre = inventory.blackMoney

      CoffreMenu.ActualWeight = inventory.weight
    
      for i=1, #inventory.items, 1 do
        local item = inventory.items[i]
        if item.count > 0 then
          table.insert(CoffreMenu.contenuDuCoffre, {label = item.label.." x"..item.count, right = ((getItemyWeight(item.name)*item.count)),  type = 'item_standard', item = item.name})
        end
      end
  
      for i=1, #inventory.weapons, 1 do
        local weapon = inventory.weapons[i]
        table.insert(CoffreMenu.contenuDuCoffre, {label = ESX.GetWeaponLabel(weapon.name)..' avec '..weapon.ammo.." balle", right = (getItemyWeight(weapon.name)), type = 'item_weapon', item = weapon.name, ammo = weapon.ammo})
      end
    end, plate)
end
  
local function creatMenu(plate) -- Gestion menu et submenu
    RMenu.Add("dynamicMenuCoffre", "dynamicMenuCoffre_main", RageUI.CreateMenu("","Actions disponibles",0,0,"root_cause","sealifebanner"))
    RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_main').Closed = function()
        CoffreMenu.inMenuCoffre = false
        local pPed = GetPlayerPed(-1)
        local pCoord = GetEntityCoords(pPed)
        local vCloset, vDistance = ESX.Game.GetClosestVehicle(pCoord, true)
        SetVehicleDoorShut(vCloset, 5, false, false)
    end
  
    RMenu.Add('dynamicMenuCoffre', 'dynamicMenuCoffre_invPlayer', RageUI.CreateSubMenu(RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_main'), "", "Inventaire"))
    RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_invPlayer').Closed = function()
        getAllItem(plate)
        RageUI.GoBack()
    end

    RMenu.Add('dynamicMenuCoffre', 'dynamicMenuCoffre_invVehicule', RageUI.CreateSubMenu(RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_main'), "", "Inventaire du coffre"))
    RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_invVehicule').Closed = function()
        getAllItem(plate)
        RageUI.GoBack()
    end
  
end
  
function OpenCoffreInventoryMenu(lastVeh, plate, max)
      
    creatMenu(plate) -- Charge les menues et submenues
    getAllItem(plate)
    if not CoffreMenu.inMenuCoffre then 
        CoffreMenu.inMenuCoffre = true
        RageUI.Visible(RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_main'), not RageUI.Visible(RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_main')))
  
        Citizen.CreateThread(function()
            while CoffreMenu.inMenuCoffre do
                local playerPed = PlayerPedId()
                local coords    = GetEntityCoords(playerPed, true)
                vehicle = nil
                if IsPedInAnyVehicle(playerPed,  false) then
                    vehicle = 0
                    return
                else
                    if GetVehicleDoorLockStatus(vehicle) == 2 then vehicle = 0 return end
                    vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71)
                end
                Wait(500)
            end
        end)

        Citizen.CreateThread(function()
  
            while CoffreMenu.inMenuCoffre do
                if vehicle ~= 0 then
                    local menu = false
                    dynamicMenu4 = true
    
                    RageUI.IsVisible(RMenu:Get("dynamicMenuCoffre",'dynamicMenuCoffre_main'), true, false, true, function()
                        menu = true
                        RageUI.Separator("~b~Emplacement du coffre : ~s~"..CoffreMenu.ActualWeight.."/"..max)
                        RageUI.Button("Déposer", nil, {RightLabel = "→→"}, true, function(Hovered,Active,Selected)
                        end, RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_invPlayer'))
                        RageUI.Button("Prendre", nil, {RightLabel = "→→"}, true, function(Hovered,Active,Selected)
                        end, RMenu:Get('dynamicMenuCoffre', 'dynamicMenuCoffre_invVehicule'))

                    end, function()    
                    end, 1)

                    RageUI.IsVisible(RMenu:Get("dynamicMenuCoffre",'dynamicMenuCoffre_invVehicule'), true, false, true, function()
                        menu = true
                        if CoffreMenu.BlackMoneyDuCoffre ~= 0 then
                            RageUI.Button("Source inconnue : "..CoffreMenu.BlackMoneyDuCoffre.."~c~$", nil, {RightLabel = "~b~→ Prendre"}, true, function(Hovered,Active,Selected)
                                if Selected then 
                                    local post, quantity = CheckQuantity(KeyboardInput("Combien voulez-vous prendre ?", '', '', 100))
                                    if post then
                                        TriggerServerEvent('esx_truck:getItem', plate, "item_account_black", CoffreMenu.BlackMoneyDuCoffre, quantity, max)
                                    else
                                        ESX.ShowNotification("~r~Quantité invalide.")
                                    end
                                    getAllItem(plate)
                                end
                            end)
                        end
                        for k,v in pairs(CoffreMenu.contenuDuCoffre) do 
                        RageUI.Button(v.label.." (~b~"..v.right.."kg~s~)", nil, {RightLabel = "~b~→ Prendre"}, true, function(Hovered,Active,Selected)
                            if Selected then 
                                if v.type == 'item_standard' then 
                                    local post, quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez prendre", '', '', 100))
                                    if post then
                                        TriggerServerEvent('esx_truck:getItem', plate, v.type, v.item, quantity, max)
                                    else
                                        ESX.ShowNotification("~r~Quantité invalide.")
                                    end
                                elseif v.type == 'item_account' then 
                                    local post, quantity = CheckQuantity(KeyboardInput("Montant que vous souhaiter prendre", '', '', 100))
                                    if post then
                                        TriggerServerEvent('esx_truck:getItem', plate, v.type, v.item, quantity, max)
                                    else
                                        ESX.ShowNotification("~r~Quantité invalide.")
                                    end
                                else
                                    TriggerServerEvent('esx_truck:getItem', plate, v.type, v.item, v.ammo, max)
                                end
                                getAllItem(plate)
                            end
                        end)
                        end
                    end, function()    
                    end, 1)
                    
                    RageUI.IsVisible(RMenu:Get("dynamicMenuCoffre",'dynamicMenuCoffre_invPlayer'), true, false, true, function()
                        menu = true
                        ESX.PlayerData = ESX.GetPlayerData()
                        for i = 1, #ESX.PlayerData.accounts, 1 do
                            if ESX.PlayerData.accounts[i].name == 'dirtycash'  then
                                PersonalMenu.sale = RageUI.Button('Source inconnue : '..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money).."~c~$", nil, {RightLabel = "~b~Déposer~s~ →"}, true, function(Hovered, Active, Selected) 
                                    if Selected then 
                                        local post, quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez déposer", '', '', 100))
                                        if post then
                                            TriggerServerEvent('esx_truck:putItem', plate, 'item_account_black', ESX.PlayerData.accounts[i].name, quantity, max)
                                        else
                                            ESX.ShowNotification("~r~Quantité invalide.")
                                        end
                                        getAllItem(plate)
                                    end
                                end)
                            end
                        end
                        for i = 1, #ESX.PlayerData.inventory do
                            if ESX.PlayerData.inventory[i].count > 0 then
                                RageUI.Button(ESX.PlayerData.inventory[i].label, "Quantité(s) : ~b~x"..ESX.PlayerData.inventory[i].count, {RightLabel = "~b~Déposer~s~ →"}, true, function(Hovered, Active, Selected)
                                    if Selected then 
                                        local post, quantity = CheckQuantity(KeyboardInput("Nombres d'items que vous voulez déposer", '', '', 100))
                                        if post then
                                            TriggerServerEvent('esx_truck:putItem', plate, 'item_standard', ESX.PlayerData.inventory[i].name, quantity, max)
                                        else
                                            ESX.ShowNotification("~r~Quantité invalide.")
                                        end
                                        getAllItem(plate)
                                    end
                                    
                                end)
                            end
                        end
                        for i = 1, #PersonalMenu.WeaponData, 1 do
                            if HasPedGotWeapon(PlayerPedId(), PersonalMenu.WeaponData[i].hash, false) then
                                local ammo = GetAmmoInPedWeapon(Ped, PersonalMenu.WeaponData[i].hash)
                
                                RageUI.Button(PersonalMenu.WeaponData[i].label, "Munition(s) : ~c~x"..ammo, {RightLabel = "~b~Déposer~s~ →"}, true, function(Hovered, Active, Selected)
                                    if Selected then
                                        if WeaponBlackList[PersonalMenu.WeaponData[i].name] then
                                            ESX.ShowNotification("~r~Erreur~s~~n~Vous ne pouvez pas poser cette arme dans le coffre")
                                            return
                                        end
                                        TriggerServerEvent('esx_truck:putItem', plate, "item_weapon", PersonalMenu.WeaponData[i].name, ammo, max)
                                        getAllItem(plate)
                                    end
                                end)
                            end
                        end
                        
                    end, function()    
                    end, 1)
                else
                    CoffreMenu.inMenuCoffre = false
                    RageUI.CloseAll()
                    SetVehicleDoorShut(lastVeh, 5, false, false)
                end
                
                Citizen.Wait(0)
            end
            CoffreMenu.inMenuCoffre = false
            dynamicMenu4 = false
        end)
    end
end

RegisterCommand("openTheCoffre", function(source)
    if not CoffreMenu.inMenuCoffre then
        local pPed = GetPlayerPed(-1)
        local pCoord = GetEntityCoords(pPed)
        local vCloset, vDistance = ESX.Game.GetClosestVehicle(pCoord, true)
        local vPlate = GetVehicleNumberPlateText(vCloset)
        local vClass = GetVehicleClass(vCloset)
        local dist = GetDistanceBetweenCoords(pPed, vDistance, true)
        if dist < 2 then 
            if not IsPedInAnyVehicle(GetPlayerPed(-1), -1) then
                openCoffre(vCloset, vPlate, vClass)
                SetVehicleDoorOpen(vCloset, 5, false, false)
            end
        else 
            ESX.ShowNotification("~r~Il n'y as pas de véhicule proche.")
        end
    end
end)
RegisterKeyMapping('openTheCoffre', 'Ouvrir le coffre', 'keyboard', 'H')

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)

	while (UpdateOnscreenKeyboard() ~= 1) and (UpdateOnscreenKeyboard() ~= 2) do
		DisableAllControlActions(0)
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		return GetOnscreenKeyboardResult()
	else
		return nil
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