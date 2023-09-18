local playerToken = nil

RegisterNetEvent("binoculars_script:set_client_token")
AddEventHandler("binoculars_script:set_client_token", function(token)
    playerToken = token
end)

-- Exemple : 

TriggerServerEvent("script_name:event_name", playerToken)