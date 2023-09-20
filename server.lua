local playersTokens = {}

local GenerateToken = function()
    local token = ""
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    math.randomseed(os.time())

    for i = 1, 32 do
        local character = characters:sub(math.random(1, #characters), math.random(1, #characters))
        token = token .. character
    end

    return token
end

local SetPlayerToken = function(playerSource, token)
    local playerName = GetPlayerName(playerSource)
    playersTokens[playerSource] = token
    TriggerClientEvent("token_security_script:set_client_token", playerSource, token)
end

exports("VerifyToken", function(playerId, token)
    local playerToken = playersTokens[playerId]

    if playerToken and playerToken == token then
        return true
    else
        print((Config.ConsoleMessage):format(GetPlayerName(playerId), playerId, token))
        DropPlayer(playerId, Config.KickMessage)
        return false
    end
end)

AddEventHandler("playerJoining", function()
    local playerSource = source
    local token = GenerateToken()
    SetPlayerToken(playerSource, token)
end)

AddEventHandler("playerDropped", function()
    local playerSource = source
    
    if playersTokens[playerSource] then
        playersTokens[playerSource] = nil
    end
end)