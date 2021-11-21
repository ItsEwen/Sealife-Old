--[[ Main ]]--
AddEventHandler('korioz:init', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			local Player = LocalPlayer()
			DisablePlayerVehicleRewards(Player.ID)
			SetPlayerHealthRechargeMultiplier(Player.ID, 0.0)
			SetRunSprintMultiplierForPlayer(Player.ID, 1.0)
			SetSwimMultiplierForPlayer(Player.ID, 1.0)
			if Player.IsDriver then
				SetPlayerCanDoDriveBy(Player.ID, false)
			else
				SetPlayerCanDoDriveBy(Player.ID, true)
			end
			if GetPlayerWantedLevel(Player.ID) ~= 0 then
				ClearPlayerWantedLevel(Player.ID)
			end
		end
	end)

	Citizen.CreateThread(function()
			local Player = LocalPlayer()

			AddTextEntry('FE_THDR_GTAO', ('~b~SeaLife ~w~Rôleplay~w~ | Votre ID : ~b~' .. Player.ServerID .. ' ~w~| Pseudo : ~b~' .. Player.Name))
			AddTextEntry('PM_PANE_KEYS', '~b~Configurer vos Touches')
			AddTextEntry('PM_PANE_AUD', '~r~Audio & Son')
			AddTextEntry('PM_PANE_GTAO', '~b~Touches Basique')
			AddTextEntry('PM_PANE_CFX', '~b~SeaLife~w~ Rôleplay')
			AddTextEntry('PM_PANE_LEAVE', '~o~Retourner sur la liste des serveurs.')
			AddTextEntry('PM_PANE_QUIT', '~b~Quitter ~w~SeaLife')
			AddTextEntry('PM_SCR_MAP', '~b~Carte de Los Santos ∑')
			AddTextEntry('PM_SCR_GAM', '~b~Prendre l\'avion')
			AddTextEntry('PM_SCR_INF', '~b~Logs')
			AddTextEntry('PM_SCR_SET', '~b~Configuration')
			AddTextEntry('PM_SCR_STA', '~b~Statistiques')
			AddTextEntry('PM_SCR_RPL', '')
	
			SetDiscordAppId("862457750641705021")
			SetDiscordRichPresenceAsset("logo")
			SetDiscordRichPresenceAssetSmall("logo")
			SetDiscordRichPresenceAssetSmallText("logo")
			SetRichPresence(("%s [%s]"):format(Player.Name, Player.ServerID))
			SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/soon")
			SetDiscordRichPresenceAction(1, "Se-Connecter", "fivem://connect/cfx.re/join/soon")
	end)
end)