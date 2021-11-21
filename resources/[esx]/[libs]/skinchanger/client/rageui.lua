local open = false

local indexface2 = {}
local comp = {}
local isCameraActive = false
local FirstSpawn, zoomOffset, camOffset, heading = true, 0.0, 0.0, 90.0

local function CreateSkinCam()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end

	SetCamActive(cam, true)
	RenderScriptCams(true, true, 500, true, true)

	isCameraActive = true
	SetCamRot(cam, 0.0, 0.0, 270.0, true)
	SetEntityHeading(playerPed, 90.0)
end

local function DeleteSkinCam()
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil
end

function RefreshData()
    TriggerEvent("::{korioz#0110}::skinchanger:getData", function(comp_, max)
        open = true
        comp = comp_
        for k,v in pairs(comp) do
            if v.value ~= 0 then
                indexface2[v.name] = v.value
            else
                indexface2[v.name] = 1
            end
            for i,value in pairs(max) do
                if i == v.name then
                    comp[k].max = value
                    comp[k].table = {}
                    for i = 0, value do
                        table.insert(comp[k].table, i)
                    end
                    break
                end
            end
        end
    end)
end

function SkinChanger()
    local face = RageUI.CreateMenu(GetPlayerName(PlayerId()), "Faite votre personnage")

    RageUI.Visible(face, not RageUI.Visible(face))
    CreateSkinCam()
    zoomOffset = comp[1].zoomOffset
    camOffset = comp[1].camOffset
	FreezeEntityPosition(GetPlayerPed(-1), true)
    while face do
        Citizen.Wait(0)
        RageUI.IsVisible(face, function()
            for k,v in pairs(comp) do
                if v.table[1] ~= nil then
                    RageUI.List(v.label, v.table, indexface2[v.name], nil, {}, true, {
                        onListChange = function(indexface, Items)
                            indexface2[v.name] = indexface;
                            TriggerEvent("::{korioz#0110}::skinchanger:change", v.name, indexface - 1)
                            if v.componentId ~= nil then
                                SetPedComponentVariation(GetPlayerPed(-1), v.componentId, indexface - 1, 0, 2)
                            end
                        end,
                        onSelected = function(indexface, Items)
							openValidate()
                        end,
                        onActive = function()
                            zoomOffset = comp[k].zoomOffset
                            camOffset = comp[k].camOffset
                        end,
                    })
                end
            end
        end, function()
    end)
        if not RageUI.Visible(face) then
            DeleteSkinCam()
			FreezeEntityPosition(GetPlayerPed(-1), false)
            face = RMenu:DeleteType('face', true)
        end
    end
end

function openValidate()
    local face = RageUI.CreateMenu(GetPlayerName(PlayerId()), "Faite votre personnage")

    RageUI.Visible(face, not RageUI.Visible(face))
    while face do
        Citizen.Wait(0)
        RageUI.IsVisible(face, function()
			RageUI.Button('Continuer de modifier mon personnage', nil, {}, true, {
				onSelected = function() 
					RefreshData()
					SkinChanger()
				end
			});
			RageUI.Button('~g~Validé le personnage', nil, {}, true, {
				onSelected = function() 
					TriggerEvent('::{korioz#0110}::skinchanger:getSkin', function(skin)
						TriggerServerEvent('::{korioz#0110}::esx_skin:save', skin)
						TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin)
					end)
					RageUI.CloseAll()
					ESX.ShowNotification('~b~Sea~w~Life ~w~~n~Bienvenue sur le Serveur ~n~Bon jeu à vous !')
				end
			});
        end, function()
    end)
        if not RageUI.Visible(face) then
            DeleteSkinCam()
			FreezeEntityPosition(GetPlayerPed(-1), false)
            face = RMenu:DeleteType('face', true)
        end
    end
end

RegisterNetEvent('ewen:openSkinMenu')
AddEventHandler('ewen:openSkinMenu', function()
    RefreshData()
    SkinChanger()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isCameraActive then
			DisableControlAction(2, 30, true)
			DisableControlAction(2, 31, true)
			DisableControlAction(2, 32, true)
			DisableControlAction(2, 33, true)
			DisableControlAction(2, 34, true)
			DisableControlAction(2, 35, true)
			DisableControlAction(0, 25, true) -- Input Aim
			DisableControlAction(0, 24, true) -- Input Attack

			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed, false)

			local angle = heading * math.pi / 180.0

			local theta = {
				x = math.cos(angle),
				y = math.sin(angle)
			}

			local pos = {
				x = coords.x + (zoomOffset * theta.x),
				y = coords.y + (zoomOffset * theta.y)
			}

			local angleToLook = heading - 140.0

			if angleToLook > 360 then
				angleToLook = angleToLook - 360
			elseif angleToLook < 0 then
				angleToLook = angleToLook + 360
			end

			angleToLook = angleToLook * math.pi / 180.0

			local thetaToLook = {
				x = math.cos(angleToLook),
				y = math.sin(angleToLook)
			}

			local posToLook = {
				x = coords.x + (zoomOffset * thetaToLook.x),
				y = coords.y + (zoomOffset * thetaToLook.y),
			}

			SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
			PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
		end
	end
end)

Citizen.CreateThread(function()
	local angle = 90

	while true do
		Citizen.Wait(0)
		if isCameraActive then
			if IsDisabledControlPressed(0, 108) then
				angle = angle - 1
			elseif IsDisabledControlPressed(0, 109) then
				angle = angle + 1
			end

			if angle > 360 then
				angle = angle - 360
			elseif angle < 0 then
				angle = angle + 360
			end

			heading = angle + 0.0
		else
			Citizen.Wait(500)
		end
	end
end)