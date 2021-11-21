

RegisterCommand('createentreprise', function()
    if SeaLife.Rank == '_dev' then
        SeaLife.Job.OpenCreateEntrepriseFarmMenu()
    end
end)

Citizen.CreateThread(function()
    Wait(2000)
    TriggerServerEvent('ewen:initFarmSociety')
end)

local EntrepriseFarmList = {}
local EntrepriseFarmListLoaded = false

RegisterNetEvent('ewen:SendEntrepriseFarmList')
AddEventHandler('ewen:SendEntrepriseFarmList', function(Table)
    EntrepriseFarmList = Table
    EntrepriseFarmListLoaded = true
end)

Citizen.CreateThread(function()
    while not EntrepriseFarmListLoaded do 
        Wait(1)
    end
    
    for k,v in pairs(EntrepriseFarmList) do
        SeaLife.EntrepriseFarmList = v
        local blip = AddBlipForCoord(SeaLife.EntrepriseFarmList.PosBoss.x, SeaLife.EntrepriseFarmList.PosBoss.y, SeaLife.EntrepriseFarmList.PosBoss.z)
        SetBlipSprite(blip, 181)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 18)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~b~Entreprise ~b~|~s~ ".. v.label)
        EndTextCommandSetBlipName(blip)
    end

    while true do
        local isProche = false
        for k,v in pairs(EntrepriseFarmList) do
            SeaLife.EntrepriseFarmList = v
           if SeaLife.job == SeaLife.EntrepriseFarmList.name then
               local CoffreAction = vector3(SeaLife.EntrepriseFarmList.PosBoss.x, SeaLife.EntrepriseFarmList.PosBoss.y, SeaLife.EntrepriseFarmList.PosBoss.z)

               local distanceCoffreAction = Vdist2(GetEntityCoords(PlayerPedId(), false), CoffreAction)

               if distanceCoffreAction < 50 then
                   isProche = true
               end
               if distanceCoffreAction < 3 then
                   ESX.ShowHelpNotification("~b~SeaLife Roleplay\n~b~Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
                   if IsControlJustPressed(1,51) then
                    SeaLife.Job.OpenSocietyMenu({label = SeaLife.joblabel, name = SeaLife.job }, CoffreAction)
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

local farming = false
local WaitFarming = false

Citizen.CreateThread(function()
    while true do
        local Open = false
        for k,v in pairs(EntrepriseFarmList) do
            SeaLife.EntrepriseFarmList = v
            if SeaLife.job == SeaLife.EntrepriseFarmList.name then
                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosRecolte.x,SeaLife.EntrepriseFarmList.PosRecolte.y, SeaLife.EntrepriseFarmList.PosRecolte.z)) < 100 then
                    Open = true
                    if not farming then
                        if not WaitFarming then
                            ESX.ShowHelpNotification('~g~Intéraction ~w~~n~Appuyez sur ~g~E ~w~pour intéragir')
                            if IsControlJustPressed(1,51) then
                                farming = true
                                WaitFarming = true
                                TriggerServerEvent('framework:startActivity', SeaLife.EntrepriseFarmList.PosRecolte, SeaLife.EntrepriseFarmList.RecolteItem, 1, '0', SeaLife.job)
                            end
                        else
                            ESX.ShowHelpNotification('~r~ANTI-GLITCH ~w~~n~Merci de ne pas allez trop vite')
                        end
                    else
                        DrawMissionText("~g~Appuyez sur ~w~E ~g~pour arrêter l\'activité", 100)
                        if IsControlJustPressed(1,51) then
                            farming = false
                            TriggerServerEvent('framework:stopActivity')
                            Wait(5000)
                            WaitFarming = false
                        end
                    end
                end

                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosRecolte.x,SeaLife.EntrepriseFarmList.PosRecolte.y, SeaLife.EntrepriseFarmList.PosRecolte.z)) > 100 and Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosRecolte.x,SeaLife.EntrepriseFarmList.PosRecolte.y, SeaLife.EntrepriseFarmList.PosRecolte.z)) < 105 then
                    farming = false
                    TriggerServerEvent('framework:stopActivity')
                    Wait(5000)
                    WaitFarming = false
                end

                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosTraitement.x,SeaLife.EntrepriseFarmList.PosTraitement.y, SeaLife.EntrepriseFarmList.PosTraitement.z)) > 100 and Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosTraitement.x,SeaLife.EntrepriseFarmList.PosTraitement.y, SeaLife.EntrepriseFarmList.PosTraitement.z)) < 105 then
                    farming = false
                    TriggerServerEvent('framework:stopActivity')
                    Wait(5000)
                    WaitFarming = false
                end

                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosVente.x,SeaLife.EntrepriseFarmList.PosVente.y, SeaLife.EntrepriseFarmList.PosVente.z)) > 100 and Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosVente.x,SeaLife.EntrepriseFarmList.PosVente.y, SeaLife.EntrepriseFarmList.PosVente.z)) < 105 then
                    farming = false
                    TriggerServerEvent('framework:stopActivity')
                    Wait(5000)
                    WaitFarming = false
                end

                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosTraitement.x,SeaLife.EntrepriseFarmList.PosTraitement.y, SeaLife.EntrepriseFarmList.PosTraitement.z)) < 100 then
                    Open = true
                    if not farming then
                        if not WaitFarming then
                            ESX.ShowHelpNotification('~g~Intéraction ~w~~n~Appuyez sur ~g~E ~w~pour intéragir')
                            if IsControlJustPressed(1,51) then
                                farming = true
                                WaitFarming = true
                                TriggerServerEvent('framework:startActivity', SeaLife.EntrepriseFarmList.PosTraitement, SeaLife.EntrepriseFarmList.RecolteItem, 2, SeaLife.EntrepriseFarmList.TraitementItem, SeaLife.job)
                            end
                        else
                            ESX.ShowHelpNotification('~r~ANTI-GLITCH ~w~~n~Merci de ne pas allez trop vite')
                        end
                    else
                        DrawMissionText("~g~Appuyez sur ~w~E ~g~pour arrêter l\'activité", 100)
                        if IsControlJustPressed(1,51) then
                            farming = false
                            TriggerServerEvent('framework:stopActivity')
                            Wait(5000)
                            WaitFarming = false
                        end
                    end
                end

                if Vdist2(GetEntityCoords(PlayerPedId(), false), vector3(SeaLife.EntrepriseFarmList.PosVente.x,SeaLife.EntrepriseFarmList.PosVente.y, SeaLife.EntrepriseFarmList.PosVente.z)) < 100 then
                    Open = true
                    if not farming then
                        
                        if not WaitFarming then
                            ESX.ShowHelpNotification('~g~Intéraction ~w~~n~Appuyez sur ~g~E ~w~pour intéragir')
                            if IsControlJustPressed(1,51) then
                                farming = true
                                TriggerServerEvent('framework:startActivity', SeaLife.EntrepriseFarmList.PosVente, '0', 3, SeaLife.EntrepriseFarmList.TraitementItem, SeaLife.job)
                            end
                        else
                            ESX.ShowHelpNotification('~r~ANTI-GLITCH ~w~~n~Merci de ne pas allez trop vite')
                        end
                    else
                        DrawMissionText("~g~Appuyez sur ~w~E ~g~pour arrêter l\'activité", 100)
                        if IsControlJustPressed(1,51) then
                            farming = false
                            TriggerServerEvent('framework:stopActivity')
                            Wait(5000)
                            WaitFarming = false
                        end
                    end
                end
            end

        end
                
        if Open then
          Wait(0)
      else
          Wait(1000)
      end
    end
end)

RegisterNetEvent('framework:farmanimation')
AddEventHandler('framework:farmanimation', function()
	local dict, anim = 'random@domestic', 'pickup_low'
	local playerPed = PlayerPedId()
    ESX.Streaming.RequestAnimDict(dict)
	TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
end)