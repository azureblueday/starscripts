-- Get current PlaceId
local placeId = game.PlaceId
local dogshit = identifyexecutor()
local dogshitlist = { "Solara" }

if table.find(dogshitlist, dogshit) then
    game.Players.LocalPlayer:Kick("ew solara 🤢")
end

-- field goal sim
if placeId == 9030362964 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/FieldGoalSimulator.luau"))()

-- hide and seek extreme
elseif placeId == 205224386 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/HideAndSeekExtreme.luau"))()

-- PLACE 3
elseif placeId == 3333333333 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourname/script3.lua"))()

-- FALLBACK
else
    game.Players.LocalPlayer:Kick("Nova Hub | Unsupported Game!")
end
