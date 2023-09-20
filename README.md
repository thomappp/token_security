# Token Security Script

Le joueur ne peut pas déclencher un événement depuis son client avec un cheat et un token aléatoire.

# Utilisation et exemples

Client Side :
```lua
local playerToken = exports["token_security_script"]:GetPlayerToken()

RegisterCommand("addmoney", function()

    local data = {
        account = 'cash',
        amount = 1000
    }

    TriggerServerEvent("script:add_money", playerToken, data)
end)
```

Server Side :
```lua
local IsTokenValid = function(playerId, token)
    return exports["token_security_script"]:VerifyToken(playerId, token)
end

RegisterServerEvent("script:add_money")
AddEventHandler("script:add_money", function(token, data)
    local playerSource = source
    
    if IsTokenValid(playerSource, token) then
        print("AddMoney function...")
        -- Add money (data)
    end
end)
```
