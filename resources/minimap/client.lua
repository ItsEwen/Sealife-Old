Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 2.75, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 2.8, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.0, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 20.0, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 30.0, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(5, 55.0, 0.0, 0.1, 2.0, 1.0)
    SetMapZoomDataLevel(6, 450.0, 0.0, 0.1, 1.0, 1.0)
    SetMapZoomDataLevel(7, 4.5, 0.0, 0.0, 0.0, 0.0)
    SetMapZoomDataLevel(8, 11.0, 0.0, 0.0, 2.0, 3.0)
end)

Citizen.CreateThread(function()
    while true do
        Wait(1500)
        if IsPedOnFoot(GetPlayerPed(-1)) then 
            SetRadarZoom(1100)
        elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
            SetRadarZoom(1100)
        end
    end
end)