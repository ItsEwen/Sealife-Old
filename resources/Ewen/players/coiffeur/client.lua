local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg, hasPaid
local coiffureprice = 100
local barbeprice = 100
local maquillageeprice = 100

Panel = {
	ColourPanel = {
        index_one = 1,
        index_two = 1,
        Color = RageUI.PanelColour.HairCut
	},

	ColourPanel2 = {
        index_one = 1,
        index_two = 1,
        Color = RageUI.PanelColour.HairCut
	},
	
	PercentagePanel = {
		index = 0,
        itemIndex = 10,
        MinText = '0%',
        HeaderText = 'opacity',
        MaxText = '100%'
	}
}

BarberShop = {

    Coiffures = {
        {Label = 'Coiffure N°1',    Value = 1},
        {Label = 'Coiffure N°2',    Value = 2},
        {Label = 'Coiffure N°3',    Value = 3},
        {Label = 'Coiffure N°4',    Value = 4},
        {Label = 'Coiffure N°5',    Value = 5},
        {Label = 'Coiffure N°6',    Value = 6},
        {Label = 'Coiffure N°7',    Value = 7},
        {Label = 'Coiffure N°8',    Value = 8},
        {Label = 'Coiffure N°9',    Value = 9},
        {Label = 'Coiffure N°10',   Value = 10},
        {Label = 'Coiffure N°11',   Value = 11},
        {Label = 'Coiffure N°12',   Value = 12},
        {Label = 'Coiffure N°13',   Value = 13},
        {Label = 'Coiffure N°14',   Value = 14},
        {Label = 'Coiffure N°15',   Value = 15},
        {Label = 'Coiffure N°16',   Value = 16},
        {Label = 'Coiffure N°17',   Value = 17},
        {Label = 'Coiffure N°18',   Value = 18},
        {Label = 'Coiffure N°19',   Value = 19},
        {Label = 'Coiffure N°20',   Value = 20},
        {Label = 'Coiffure N°21',   Value = 21},
        {Label = 'Coiffure N°22',   Value = 22},
        {Label = 'Coiffure N°23',   Value = 23},
        {Label = 'Coiffure N°24',   Value = 24},
        {Label = 'Coiffure N°25',   Value = 25},
        {Label = 'Coiffure N°26',   Value = 26},
        {Label = 'Coiffure N°27',   Value = 27},
        {Label = 'Coiffure N°28',   Value = 28},
        {Label = 'Coiffure N°29',   Value = 29},
        {Label = 'Coiffure N°30',   Value = 30},
        {Label = 'Coiffure N°31',   Value = 31},
        {Label = 'Coiffure N°32',   Value = 32},
        {Label = 'Coiffure N°33',   Value = 33},
        {Label = 'Coiffure N°34',   Value = 34},
        {Label = 'Coiffure N°35',   Value = 35},
        {Label = 'Coiffure N°36',   Value = 36},
        {Label = 'Coiffure N°37',   Value = 37},
        {Label = 'Coiffure N°38',   Value = 38},
        {Label = 'Coiffure N°39',   Value = 39},
        {Label = 'Coiffure N°40',   Value = 40},
        {Label = 'Coiffure N°41',   Value = 41},
        {Label = 'Coiffure N°42',   Value = 42},
        {Label = 'Coiffure N°43',   Value = 43},
        {Label = 'Coiffure N°44',   Value = 44},
        {Label = 'Coiffure N°45',   Value = 45},
        {Label = 'Coiffure N°46',   Value = 46},
        {Label = 'Coiffure N°47',   Value = 47},
        {Label = 'Coiffure N°48',   Value = 48},
        {Label = 'Coiffure N°49',   Value = 49},
        {Label = 'Coiffure N°50',   Value = 50},
        {Label = 'Coiffure N°51',   Value = 51},
        {Label = 'Coiffure N°52',   Value = 52},
        {Label = 'Coiffure N°53',   Value = 53},
        {Label = 'Coiffure N°54',   Value = 54},
        {Label = 'Coiffure N°55',   Value = 55},
        {Label = 'Coiffure N°56',   Value = 56},
        {Label = 'Coiffure N°57',   Value = 57},
        {Label = 'Coiffure N°58',   Value = 58},
        {Label = 'Coiffure N°59',   Value = 59},
        {Label = 'Coiffure N°60',   Value = 60},
        {Label = 'Coiffure N°61',   Value = 61},
        {Label = 'Coiffure N°62',   Value = 62},
        {Label = 'Coiffure N°63',   Value = 63},
        {Label = 'Coiffure N°64',   Value = 64},
        {Label = 'Coiffure N°65',   Value = 65},
        {Label = 'Coiffure N°66',   Value = 66},
        {Label = 'Coiffure N°67',   Value = 67},
        {Label = 'Coiffure N°68',   Value = 68},
        {Label = 'Coiffure N°69',   Value = 69},
        {Label = 'Coiffure N°70',   Value = 70},
        {Label = 'Coiffure N°71',   Value = 71},
        {Label = 'Coiffure N°72',   Value = 72},
        {Label = 'Coiffure N°73',   Value = 73},
        {Label = 'Coiffure N°74',   Value = 74},
        {Label = 'Coiffure N°75',   Value = 75},
        {Label = 'Coiffure N°76',   Value = 76},
        {Label = 'Coiffure N°77',   Value = 77},
        {Label = 'Coiffure N°78',   Value = 78},
        {Label = 'Coiffure N°79',   Value = 79},
        {Label = 'Coiffure N°80',   Value = 80},
        {Label = 'Coiffure N°81',   Value = 81},
        {Label = 'Coiffure N°82',   Value = 82},
        {Label = 'Coiffure N°83',   Value = 83},
        {Label = 'Coiffure N°84',   Value = 84},
        {Label = 'Coiffure N°85',   Value = 85},
        {Label = 'Coiffure N°86',   Value = 86},
        {Label = 'Coiffure N°87',   Value = 87},
        {Label = 'Coiffure N°88',   Value = 88},
        {Label = 'Coiffure N°89',   Value = 89},
        {Label = 'Coiffure N°90',   Value = 90},
        {Label = 'Coiffure N°91',   Value = 91},
        {Label = 'Coiffure N°92',   Value = 92},
        {Label = 'Coiffure N°93',   Value = 93},
        {Label = 'Coiffure N°94',   Value = 94},
        {Label = 'Coiffure N°95',   Value = 95},
        {Label = 'Coiffure N°96',   Value = 96},
        {Label = 'Coiffure N°97',   Value = 97}
    },

    Barbes = {
        {Label = 'Coiffure N°1',    Value = 1},
        {Label = 'Coiffure N°2',    Value = 2},
        {Label = 'Coiffure N°3',    Value = 3},
        {Label = 'Coiffure N°4',    Value = 4},
        {Label = 'Coiffure N°5',    Value = 5},
        {Label = 'Coiffure N°6',    Value = 6},
        {Label = 'Coiffure N°7',    Value = 7},
        {Label = 'Coiffure N°8',    Value = 8},
        {Label = 'Coiffure N°9',    Value = 9},
        {Label = 'Coiffure N°10',   Value = 10},
        {Label = 'Coiffure N°11',   Value = 11},
        {Label = 'Coiffure N°12',   Value = 12},
        {Label = 'Coiffure N°13',   Value = 13},
        {Label = 'Coiffure N°14',   Value = 14},
        {Label = 'Coiffure N°15',   Value = 15},
        {Label = 'Coiffure N°16',   Value = 16},
        {Label = 'Coiffure N°17',   Value = 17},
        {Label = 'Coiffure N°18',   Value = 18},
        {Label = 'Coiffure N°19',   Value = 19},
        {Label = 'Coiffure N°20',   Value = 20},
        {Label = 'Coiffure N°21',   Value = 21},
        {Label = 'Coiffure N°22',   Value = 22},
        {Label = 'Coiffure N°23',   Value = 23},
        {Label = 'Coiffure N°24',   Value = 24},
        {Label = 'Coiffure N°25',   Value = 25},
        {Label = 'Coiffure N°26',   Value = 26},
        {Label = 'Coiffure N°27',   Value = 27},
        {Label = 'Coiffure N°28',   Value = 28}
    },

    Maquillages = {
        {Label = 'Maquillage N°',   Value = 1},
        {Label = 'Maquillage N°',   Value = 2},
        {Label = 'Maquillage N°',   Value = 3},
        {Label = 'Maquillage N°',   Value = 4},
        {Label = 'Maquillage N°',   Value = 5},
        {Label = 'Maquillage N°',   Value = 6},
        {Label = 'Maquillage N°',   Value = 7},
        {Label = 'Maquillage N°',   Value = 8},
        {Label = 'Maquillage N°',   Value = 9},
        {Label = 'Maquillage N°',   Value = 10},
        {Label = 'Maquillage N°',   Value = 11},
        {Label = 'Maquillage N°',   Value = 12},
        {Label = 'Maquillage N°',   Value = 13},
        {Label = 'Maquillage N°',   Value = 14},
        {Label = 'Maquillage N°',   Value = 15},
        {Label = 'Maquillage N°',   Value = 16},
        {Label = 'Maquillage N°',   Value = 17},
        {Label = 'Maquillage N°',   Value = 18},
        {Label = 'Maquillage N°',   Value = 19},
        {Label = 'Maquillage N°',   Value = 20},
        {Label = 'Maquillage N°',   Value = 21},
        {Label = 'Maquillage N°',   Value = 22},
        {Label = 'Maquillage N°',   Value = 23},
        {Label = 'Maquillage N°',   Value = 24},
        {Label = 'Maquillage N°',   Value = 25},
        {Label = 'Maquillage N°',   Value = 26},
        {Label = 'Maquillage N°',   Value = 27},
        {Label = 'Maquillage N°',   Value = 28},
        {Label = 'Maquillage N°',   Value = 29},
        {Label = 'Maquillage N°',   Value = 30},
        {Label = 'Maquillage N°',   Value = 31},
        {Label = 'Maquillage N°',   Value = 32},
        {Label = 'Maquillage N°',   Value = 33},
        {Label = 'Maquillage N°',   Value = 34},
        {Label = 'Maquillage N°',   Value = 35},
        {Label = 'Maquillage N°',   Value = 36},
        {Label = 'Maquillage N°',   Value = 37},
        {Label = 'Maquillage N°',   Value = 38},
        {Label = 'Maquillage N°',   Value = 39},
        {Label = 'Maquillage N°',   Value = 40},
        {Label = 'Maquillage N°',   Value = 41},
        {Label = 'Maquillage N°',   Value = 42},
        {Label = 'Maquillage N°',   Value = 43},
        {Label = 'Maquillage N°',   Value = 44},
        {Label = 'Maquillage N°',   Value = 45},
        {Label = 'Maquillage N°',   Value = 46},
        {Label = 'Maquillage N°',   Value = 47},
        {Label = 'Maquillage N°',   Value = 48},
        {Label = 'Maquillage N°',   Value = 49},
        {Label = 'Maquillage N°',   Value = 50},
        {Label = 'Maquillage N°',   Value = 51},
        {Label = 'Maquillage N°',   Value = 52},
        {Label = 'Maquillage N°',   Value = 53},
        {Label = 'Maquillage N°',   Value = 54},
        {Label = 'Maquillage N°',   Value = 55},
        {Label = 'Maquillage N°',   Value = 56},
        {Label = 'Maquillage N°',   Value = 57},
        {Label = 'Maquillage N°',   Value = 58},
        {Label = 'Maquillage N°',   Value = 59},
        {Label = 'Maquillage N°',   Value = 60},
        {Label = 'Maquillage N°',   Value = 61},
        {Label = 'Maquillage N°',   Value = 62},
        {Label = 'Maquillage N°',   Value = 63},
        {Label = 'Maquillage N°',   Value = 64},
        {Label = 'Maquillage N°',   Value = 65},
        {Label = 'Maquillage N°',   Value = 66},
        {Label = 'Maquillage N°',   Value = 67},
        {Label = 'Maquillage N°',   Value = 68},
        {Label = 'Maquillage N°',   Value = 69},
        {Label = 'Maquillage N°',   Value = 70},
        {Label = 'Maquillage N°',   Value = 71}
    }
}


RegisterCommand('barber', function()
		OpenMenuBarberShop()
end)


function OpenMenuBarberShop()
    local unicorn = RageUI.CreateMenu("Coiffeur", "Menu Coiffeur")

	RageUI.Visible(unicorn, not RageUI.Visible(unicorn))

	while unicorn do
        Citizen.Wait(5)
		RageUI.IsVisible(unicorn, function()

			RageUI.Button('Choisir sa coiffure', nil, {RightLabel = ">"}, true, {      
				onSelected = function()       
                    Coiffure()
				end
			});		

            RageUI.Button('Choisir sa barbe', nil, {RightLabel = ">"}, true, {
				onSelected = function() 
                    Barbe()
                end
			});

			RageUI.Button('Choisir son maquillage', nil, {RightLabel = ">"}, true, {      
				onSelected = function()       
                    Maquillage()
				end
			});
		end)
		
		if not RageUI.Visible(unicorn) then
			unicorn = RMenu:DeleteType('unicorn', true)
		end
	end
end

function Coiffure()
    local coiffure = RageUI.CreateMenu("Choissez votre coupe", "Coiffure disponible")

	RageUI.Visible(coiffure, not RageUI.Visible(coiffure))
	coiffure.EnableMouse = true

	while coiffure do
        Citizen.Wait(5)
		RageUI.IsVisible(coiffure, function()

        for k, v in pairs(BarberShop.Coiffures) do
            RageUI.Button(v.Label, description, {}, true, {

            onActive = function()
				SetPedComponentVariation(GetPlayerPed(-1), 2, v.Value, 0)
                SetPedHairColor(GetPlayerPed(-1), Panel.ColourPanel.index_two, Panel.ColourPanel2.index_two)
            end,

            onSelected = function()
				ESX.TriggerServerCallback('barber:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
						    skin.hair_1 = v.Value
						    skin.hair_2 = 0
						    skin.hair_color_1 = Panel.ColourPanel.index_two
						    skin.hair_color_2 = Panel.ColourPanel2.index_two
							TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
						end)

						TriggerServerEvent('barber:pay')
						hasPaid = true
					else
						ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
						end)

						ESX.ShowNotification('Vous n\'avez pas assez d\'argent')
					end
				end)
            end,
           });
	    end
        end, function()

        for k, v in pairs(BarberShop.Coiffures) do
            RageUI.ColourPanel("Couleur N°1", Panel.ColourPanel.Color, Panel.ColourPanel.index_one, Panel.ColourPanel.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel.lastItem == Panel.ColourPanel.currentItem then
					    Panel.ColourPanel.index_one = MinimumIndex
					    Panel.ColourPanel.index_two = CurrentIndex
				    end
                end
            }, v.Value)
			
            RageUI.ColourPanel("Couleur N°2", Panel.ColourPanel2.Color, Panel.ColourPanel2.index_one, Panel.ColourPanel2.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel2.lastItem == Panel.ColourPanel2.currentItem then
					    Panel.ColourPanel2.index_one = MinimumIndex
					    Panel.ColourPanel2.index_two = CurrentIndex
				    end
                end
            }, v.Value)
		end
	end)
		if not RageUI.Visible(coiffure) then
			coiffure = RMenu:DeleteType('coiffure', true)
		    ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Barbe()
    local barbe = RageUI.CreateMenu("Choissez votre barbe", "Barbe disponible")

	RageUI.Visible(barbe, not RageUI.Visible(barbe))

	while barbe do
        Citizen.Wait(5)
		RageUI.IsVisible(barbe, function()
		barbe.EnableMouse = true

        for k, v in pairs(BarberShop.Barbes) do
            RageUI.Button(v.Label, description, {}, true, {

            onActive = function()
				SetPedHeadOverlay(GetPlayerPed(-1), 1, v.Value, Panel.PercentagePanel.index)
                SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, Panel.ColourPanel.index_two, 0)
            end,			

            onSelected = function()
				ESX.TriggerServerCallback('barber:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
						    skin.beard_1 = v.Value
						    skin.beard_2 = Panel.PercentagePanel.index * 10
						    skin.beard_3 = Panel.ColourPanel.index_two
							TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
						end)

						TriggerServerEvent('barber:pay')
						hasPaid = true
					else
						ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
						end)
						
						ESX.ShowNotification('Vous n\'avez pas assez d\'argent')
					end
				end)
            end,
           });
	    end
        end, function()

        for k, v in pairs(BarberShop.Barbes) do
           RageUI.PercentagePanel(Panel.PercentagePanel.index, 'Opacité de la barbe', Panel.PercentagePanel.MinText, Panel.PercentagePanel.MaxText, {
                onSelected = function(Percentage)
				    if Panel.PercentagePanel.lastItem == Panel.PercentagePanel.currentItem then
					    Panel.PercentagePanel.index = Percentage
				    end
                end
            }, v.Value)

            RageUI.ColourPanel("Couleur N°1", Panel.ColourPanel.Color, Panel.ColourPanel.index_one, Panel.ColourPanel.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel.lastItem == Panel.ColourPanel.currentItem then
					    Panel.ColourPanel.index_one = MinimumIndex
					    Panel.ColourPanel.index_two = CurrentIndex
				    end
                end
            }, v.Value)
			
            RageUI.ColourPanel("Couleur N°2", Panel.ColourPanel2.Color, Panel.ColourPanel2.index_one, Panel.ColourPanel2.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel2.lastItem == Panel.ColourPanel2.currentItem then
					    Panel.ColourPanel2.index_one = MinimumIndex
					    Panel.ColourPanel2.index_two = CurrentIndex
				    end
                end
            }, v.Value)
		end
	end)
	
		if not RageUI.Visible(barbe) then
			barbe = RMenu:DeleteType('barbe', true)
		    ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

function Maquillage()
    local maquillage = RageUI.CreateMenu("Choissez votre maquillage", "Maquillage disponible")

	RageUI.Visible(maquillage, not RageUI.Visible(maquillage))
	maquillage.EnableMouse = true

	while maquillage do
        Citizen.Wait(5)
		RageUI.IsVisible(maquillage, function()

        for k, v in pairs(BarberShop.Maquillages) do
            RageUI.Button(v.Label .. '' .. v.Value, description, {}, true, {

            onActive = function()
				SetPedHeadOverlay(GetPlayerPed(-1), 4, v.Value, Panel.PercentagePanel.index)
				SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 2, Panel.ColourPanel.index_two, Panel.ColourPanel2.index_two)
            end,

            onSelected = function()
				ESX.TriggerServerCallback('barber:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
						    skin.makeup_1 = v.Value
						    skin.makeup_2 = Panel.PercentagePanel.index * 10
						    skin.makeup_3 = Panel.ColourPanel.index_two
						    skin.makeup_4 = Panel.ColourPanel2.index_two
							TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
						end)

						TriggerServerEvent('barber:pay')
						hasPaid = true
					else
						ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
						end)

						ESX.ShowNotification('Vous n\'avez pas assez d\'argent')
					end
				end)
            end,
           });
	    end
        end, function()
        for k, v in pairs(BarberShop.Maquillages) do
           RageUI.PercentagePanel(Panel.PercentagePanel.index, 'Opacité du maquillage', Panel.PercentagePanel.MinText, Panel.PercentagePanel.MaxText, {
                onSelected = function(Percentage)
				    if Panel.PercentagePanel.lastItem == Panel.PercentagePanel.currentItem then
					    Panel.PercentagePanel.index = Percentage
				    end
                end
            }, v.Value)

            RageUI.ColourPanel("Couleur N°1", Panel.ColourPanel.Color, Panel.ColourPanel.index_one, Panel.ColourPanel.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel.lastItem == Panel.ColourPanel.currentItem then
					    Panel.ColourPanel.index_one = MinimumIndex
					    Panel.ColourPanel.index_two = CurrentIndex
				    end
                end
            }, v.Value)
			
            RageUI.ColourPanel("Couleur N°2", Panel.ColourPanel2.Color, Panel.ColourPanel2.index_one, Panel.ColourPanel2.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
				    if Panel.ColourPanel2.lastItem == Panel.ColourPanel2.currentItem then
					    Panel.ColourPanel2.index_one = MinimumIndex
					    Panel.ColourPanel2.index_two = CurrentIndex
				    end
                end
            }, v.Value)
		end
	end)
	
		if not RageUI.Visible(maquillage) then
			maquillage = RMenu:DeleteType('maquillage', true)
		    ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin)
			    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin) 
		    end)
		end
	end
end

Coiffeur = {}

Coiffeur.Shops = {
	{vector3(-814.3, -183.8, 36.6)},
	{vector3(136.8, -1708.4, 28.3)},
	{vector3(-1282.6, -1116.8, 6.0)},
	{vector3(1931.5, 3729.7, 31.8)},
	{vector3(1212.8, -472.9, 65.2)},
	{vector3(-32.9, -152.3, 56.1)},
	{vector3(-278.1, 6228.5, 30.7)}
}

Citizen.CreateThread(function()
	while true do
		local Open = false

        for _,v in pairs(Coiffeur.Shops) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v[1]) < 5 then
                Open = true
                ESX.ShowHelpNotification('~g~Coiffeur ~n~~f~Appuyez sur ~r~~INPUT_CONTEXT~ ~f~pour intéragir')
                if IsControlJustPressed(1,51) then
                    OpenMenuBarberShop()
                end
            end
        end

        for _,v in pairs(Coiffeur.Shops) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v[1]) < 100 then
                Open = true
                DrawMarker(27, v[1], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 128, 255, 150, false, true, 2, false, false, false, false)
            end
        end
        
		if Open then
			Wait(0)
		else
			Wait(500)
		end
	end
end)