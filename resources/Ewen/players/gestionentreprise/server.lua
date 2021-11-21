RegisterServerEvent('ewen:promouvoirplayerjob')
AddEventHandler('ewen:promouvoirplayerjob', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == getMaximumGrade(sourceXPlayer.job.name) - 1) then
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, targetXPlayer.job.grade + 1)

			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)
RegisterServerEvent('ewen:retrogradationjob')
AddEventHandler('ewen:retrogradationjob', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 0) then
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			local newgrade = targetXPlayer.job.grade - 1
			targetXPlayer.setJob(targetXPlayer.job.name, newgrade)

			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('ewen:recrutementjob')
AddEventHandler('ewen:recrutementjob', function(target, job, grade)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' then
		targetXPlayer.setJob(job, grade)
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
	end
end)

RegisterServerEvent('ewen:virerjob')
AddEventHandler('ewen:virerjob', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
		targetXPlayer.setJob('unemployed', 0)
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)


-- GANG

RegisterServerEvent('ewen:promouvoirplayergang')
AddEventHandler('ewen:promouvoirplayergang', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == tonumber(getMaximumGrade(sourceXPlayer.job2.name)) - 1) then
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) + 1)

			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('ewen:retrogradationgang')
AddEventHandler('ewen:retrogradationgang', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == 0) then
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) - 1)

			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('ewen:recrutementgang')
AddEventHandler('ewen:recrutementgang', function(target, job, grade)
	print('ok')
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' then
		print('ok2')
		targetXPlayer.setJob2(job, grade)
		print('ok3')
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
	end
end)

RegisterServerEvent('ewen:virergang')
AddEventHandler('ewen:virergang', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
		targetXPlayer.setJob2('unemployed2', 0)
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('::{korioz#0110}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)