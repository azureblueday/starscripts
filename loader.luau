-- Get current PlaceId
local placeId = game.placeId
loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/sUNC2.luau"))()

-- field goal sim
if placeId == 9030362964 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/FieldGoalSimulator.luau"))()

-- hide and seek extreme
elseif placeId == 205224386 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/HideAndSeekExtreme.luau"))()

-- ff2
elseif placeId == 8206123457 or placeId == 8204899140 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b33d0876666b47fb92d777ced3602632.lua"))()

-- blindshot

elseif placeId == 118614517739521 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/BlindShot.luau"))()

-- FALLBACK
else
    game.Players.LocalPlayer:Kick("Nova Hub | Unsupported Game!")
end
