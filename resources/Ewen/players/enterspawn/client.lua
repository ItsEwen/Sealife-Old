local sexeSelect = 0
local teteSelect = 0
local colorPeauSelect = 0
local cheveuxSelect = 0
local bebarSelect = -1
local poilsCouleurSelect = 0
local ImperfectionsPeau = 0
local face, acne, skin, eyecolor, skinproblem, freckle, wrinkle, hair, haircolor, eyebrow, beard, beardcolor
local camfin = false

PMenu = {}
PMenu.Data = {}

local playerPed = PlayerPedId()
local incamera = false
local board_scaleform
local handle
local board
local board_model = GetHashKey("prop_police_id_board")
local board_pos = vector3(0.0,0.0,0.0)
local overlay
local overlay_model = GetHashKey("prop_police_id_text")
local isinintroduction = false
local pressedenter = false
local introstep = 0
local timer = 0
local inputgroups = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}
local enanimcinematique = false
local guiEnabled = false
local sound = false
local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false
local guiEnabled = false
local sound = false

Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            --TriggerEvent('esx_status:setDisplay', 0.0)
            DisplayRadar(false)
            DisableControlAction(0, 1,   true) -- LookLeftRight
            DisableControlAction(0, 2,   true) -- LookUpDown
            DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(0, 30,  true) -- MoveLeftRight
            DisableControlAction(0, 31,  true) -- MoveUpDown
            DisableControlAction(0, 21,  true) -- disable sprint
            DisableControlAction(0, 24,  true) -- disable attack
            DisableControlAction(0, 25,  true) -- disable aim
            DisableControlAction(0, 47,  true) -- disable weapon
            DisableControlAction(0, 58,  true) -- disable weapon
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 75,  true) -- disable exit vehicle
            DisableControlAction(27, 75, true) -- disable exit vehicle
        end
        Citizen.Wait(500)
    end
end)

function destorycam()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
end

function spawncinematiqueplayer(a)
    guiEnabled = true
    local playerPed = PlayerPedId()
    pressedenter = true
    local introcam
    SetEntityVisible(playerPed, false, false)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    SetFocusEntity(playerPed)
    Wait(1)
    SetOverrideWeather("EXTRASUNNY")
    NetworkOverrideClockTime(19, 0, 0)
    BeginSrl()
    introstep = 1
    isinintroduction = true
    Wait(1)
    DoScreenFadeIn(500)
    if introstep == 1 then
        introcam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
        SetCamActive(introcam, true)
        SetFocusArea(754.2219, 1226.831, 356.5081, 0.0, 0.0, 0.0)
        SetFocusArea(-57.43, -1012.55, 56.26, 0.0, 0.0, 0.0)
        SetCamParams(introcam, 754.2219, 1226.831, 356.5081, -14.367, 0.0, 157.3524, 42.2442, 0, 1, 1, 2)
        SetCamParams(introcam, -57.43, -1012.55, 56.26, -9.6114, 0.0, 157.8659, 44.8314, 120000, 0, 0, 2)
        ShakeCam(introcam, "HAND_SHAKE", 0.50)
        RenderScriptCams(true, false, 3000, 1, 1)
        return
    end
end

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

local waitenterspawn = 500

Citizen.CreateThread(function()
    while true do
        Wait(waitenterspawn)
        local playerPed = PlayerPedId()

        if pressedenter then
            waitenterspawn = 0
            DrawMissionText("Appuyez sur ~g~ENTER ~s~pour valider votre entrée.", 500)
            if IsControlJustPressed(1, 191) then
                ESX.ShowNotification("~g~Vous avez validé votre entrée.")
                destorycam()
                spawncinematiqueplayer(false)
                DoScreenFadeOut(0)
                enanimcinematique = false
                pressedenter = false
                guiEnabled = false
                isinintroduction = false
                TriggerEvent("playerSpawned")
                SetEntityVisible(playerPed, true, false)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                DestroyCam(createdCamera, 0)
                DestroyCam(createdCamera, 0)
                RenderScriptCams(0, 0, 1, 1, 1)
                createdCamera = 0
                ClearTimecycleModifier("scanline_cam_cheap")
                SetFocusEntity(GetPlayerPed(PlayerId()))
                DoScreenFadeIn(1500)
                --TriggerEvent('esx_status:setDisplay', 0.0)
                DisplayRadar(true)
            end
        end
    end
end)

RegisterNetEvent('::{korioz#0110}::esx:playerLoaded')
AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(10)
		end
		if FirstSpawn then
			ESX.TriggerServerCallback('::{korioz#0110}::esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin ~= nil then
                    TriggerEvent('::{korioz#0110}::skinchanger:loadSkin', skin)
                    spawncinematiqueplayer()
				end
			end)
			FirstSpawn = false
		end
	end)
end)