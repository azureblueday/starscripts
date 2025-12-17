-- Get current PlaceId
local placeId = game.PlaceID

-- field goal sim
if placeId == 9030362964 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/FieldGoalSimulator.luau"))()

-- hide and seek extreme
elseif placeId == 205224386 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/HideAndSeekExtreme.luau"))()

-- ff2
elseif placeId == 8206123457 or placeId == 8204899140 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/FootballFusion2.luau"))()

-- FALLBACK
else
    game.Players.LocalPlayer:Kick("Nova Hub | Unsupported Game!")
end
