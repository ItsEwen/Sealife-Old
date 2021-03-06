RegisterServerEvent('ewen:createmecano')
AddEventHandler('ewen:createmecano', function(namejob, labeljob, PosVestiaire, PosCustom, PosBoss)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() == '_dev' then
        MySQL.Async.execute("INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES (@name, @label, @whitelisted) ", {
            ['@name'] = namejob,
            ['@label'] = labeljob,
            ['@whitelisted'] = 1
        })
        MySQL.Async.execute("INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (@job_name, @grade, @name, @label, @salary, @skin_male, @skin_female)", {
            ['@job_name'] = namejob,
            ['@grade'] = 2,
            ['@name'] = "boss",
            ['@label'] = "PDG",
            ['@salary'] = 5000,
            ['@skin_male'] = "{}",
            ['@skin_female'] = "{}"
        })
        MySQL.Async.execute("INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (@job_name, @grade, @name, @label, @salary, @skin_male, @skin_female)", {
            ['@job_name'] = namejob,
            ['@grade'] = 1,
            ['@name'] = "responsable",
            ['@label'] = "Responsable",
            ['@salary'] = 2500,
            ['@skin_male'] = "{}",
            ['@skin_female'] = "{}"
        })
        MySQL.Async.execute("INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES (@job_name, @grade, @name, @label, @salary, @skin_male, @skin_female)", {
            ['@job_name'] = namejob,
            ['@grade'] = 0,
            ['@name'] = "employer",
            ['@label'] = "Employer",
            ['@salary'] = 2500,
            ['@skin_male'] = "{}",
            ['@skin_female'] = "{}"
        })
        MySQL.Async.execute("INSERT INTO `entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosBoss`) VALUES (@type, @name, @label, @PosVestiaire, @PosCustom, @PosBoss) ", {
            ['@type'] = 'M??cano',
            ['@name'] = namejob,
            ['@label'] = labeljob,
            ['@PosVestiaire'] = json.encode(PosVestiaire),
            ['@PosCustom'] = json.encode(PosCustom),
            ['@PosBoss'] = json.encode(PosBoss)
        })
        MySQL.Async.execute("INSERT INTO `society` (`name`, `money`, `moneysale`, `data`) VALUES (@name, @money, @moneysale, @data) ", {
            ['@name'] = namejob,
            ['@money'] = 0,
            ['@moneysale'] = 0,
            ['@data'] = '[]'
        })
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, '~b~SeaLife ~w~~n~Le Job ?? ??t?? cr??e avec succ??s, Attendez le prochain reboot.')
    else
        DropPlayer(source, 'D??synchronisation avec la cr??ation de M??cano')
    end
end)

local EntrepriseList = {}

Citizen.CreateThread(function()
    Wait(1500)
    print('Initialisation des M??canos...')
    MySQL.Async.fetchAll('SELECT * FROM entreprise', {}, function(Entreprise)
        for i=1, #Entreprise, 1 do
            EntrepriseList[i] = {}
            EntrepriseList[i].type =  Entreprise[i].type 
            EntrepriseList[i].name = Entreprise[i].name
            EntrepriseList[i].label = Entreprise[i].label
            EntrepriseList[i].PosVestiaire = json.decode(Entreprise[i].PosVestiaire)
            EntrepriseList[i].PosCustom = json.decode(Entreprise[i].PosCustom)
            EntrepriseList[i].PosBoss = json.decode(Entreprise[i].PosBoss)
            print("M??cano (".. i ..") charg?? !")
        end
    end)
end)

RegisterServerEvent('ewen:initMecano')
AddEventHandler('ewen:initMecano', function()
	TriggerClientEvent('ewen:receiveMecano', source, EntrepriseList)
end)