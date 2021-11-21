-- Début de la maintenance

local Licensestaff = {
    Staff = {
        ["license:2f6f3783213a1c8e9ab170544949530bbb4c6b75"] = true,
        ["license:39f63bebd637b1bbef4af058de70e9052f66e2ba"] = true,
        ["license:b90704455b3efdd5907547511ac05e09eb931f67"] = true,
        ["license:9a7f449d01e674f9678c03957b9b9aad8185d8b4"] = true,
        ["license:c32571e6ff464ec90d6588b575929d4350fc410b"] = true,
        ["license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260"] = true,
        ["license:ed7a81b2b525f9c98eb3a3a607ab3aa9f6255f66"] = true,
        ["license:b3ac67bb27e84fcb6c5ce99861be6487f27333fb"] = true
    },
}

local maintenance = false

local function getLicense(src)
     for k,v in pairs(GetPlayerIdentifiers(src))do
          if string.sub(v, 1, string.len("license:")) == "license:" then
               return v
          end
     end
end

local function devStart(state)
     if state then
        maintenance = true
          local xPlayers = ESX.GetPlayers()
          for i = 1, #xPlayers, 1 do
               if not Licensestaff.Staff[getLicense(xPlayers[i])] then
                    print("Le joueur ^4"..GetPlayerName(xPlayers[i]).."^0 connexion ^1reffusé^0 (^5Dev^0)")
                    DropPlayer(xPlayers[i], "\nInformation\nLe serveur est actuellement en maintenance !")
               else
                    print("Le joueur ^4"..GetPlayerName(xPlayers[i]).."^0 connexion ^2accepté^0 (^5Dev^0)")
               end
          end
     else
        maintenance = false
     end
end

Citizen.CreateThread(function()
    devStart(maintenance)
end)

AddEventHandler('playerConnecting', function(name, setReason)
    if maintenance then
         if not Licensestaff.Staff[getLicense(source)] then
            print("Le joueur ^4"..name.."^0 connexion ^1reffusé^0 (^5Maintenance^0)")
            setReason("\n\nServeur en maintenance, plus d'informations sur discord !\n\nhttps://discord.gg/qe8HCx4AhT")
            CancelEvent()
            return
         end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(60*1000*4)
        if maintenance then
            print("Maintenance ^2détecté^0 !")
            local xPlayers = ESX.GetPlayers()
            for i = 1, #xPlayers, 1 do
                 if not Licensestaff.Staff[getLicense(xPlayers[i])] then
                      print("Le joueur ^4"..GetPlayerName(xPlayers[i]).."^0 est ^1reffusé^0 dans la maintenance et je le kick .")
                      DropPlayer(xPlayers[i], "\nInformation\nLe serveur est actuellement en maintenance !")
                 else
                      print("Le joueur ^4"..GetPlayerName(xPlayers[i]).."^0 est ^2accepté^0 dans la maintenance .")
                 end
            end
        else
            print("Maintenance ^1non détecté^0 !")
        end
    end
end)

RegisterCommand("maintenance", function(source)
    if source == 0 then
         if not maintenance then
              print("Maintenance ^2actif^0 !")
              devStart(true)
         else
              print("Maintenance non ^1actif^0 !")
              devStart(false)
         end
    end
end)

-- Fin de la maintenance

