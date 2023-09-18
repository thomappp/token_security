local playerToken = nil

RegisterNetEvent("token_security_script:set_client_token")
AddEventHandler("token_security_script:set_client_token", function(token)
    playerToken = token
end)

-- Exemple : 

TriggerServerEvent("script_name:event_name", playerToken)
