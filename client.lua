local playerToken = nil

RegisterNetEvent("token_security_script:set_client_token")
AddEventHandler("token_security_script:set_client_token", function(token)
    playerToken = token
end)

local DoesPlayerTokenExist = function()
    return playerToken ~= nil
end

exports("GetPlayerToken", function()
    while not DoesPlayerTokenExist() do
        Citizen.Wait(100)
    end

    return playerToken
end)