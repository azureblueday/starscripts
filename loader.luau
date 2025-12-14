-- Get current PlaceId
local placeId = game.PlaceId
local dogshit = identifyexecutor()
local dogshitlist = { "Solara" }

if table.find(dogshitlist, dogshit) then
    game.Players.LocalPlayer:Kick("ew solara 🤢")
end

-- PLACE 1
if placeId == 9030362964 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/FieldGoalSimulator.luau"))()

-- PLACE 2
elseif placeId == 2222222222 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourname/script2.lua"))()

-- PLACE 3
elseif placeId == 3333333333 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yourname/script3.lua"))()

-- FALLBACK
else
    game.Players.LocalPlayer:Kick("Nova Hub | Unsupported Game!")
end
