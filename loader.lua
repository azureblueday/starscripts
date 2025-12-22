local GameID = game.GameId
local dogshitstuff = identifyexecutor()
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer

local dogshit = { "Solara", "Xeno" }

if table.find(dogshit, dogshitstuff) then
    return Player:Kick("Nova | Executor is not supported by Nova.")
end

--------------------------------------------------
-- GameId check
--------------------------------------------------
local Scripts = {
	[3150475059] = "https://api.luarmor.net/files/v3/loaders/317ec9710555a4bbf0389a4f2c503fae.lua", -- ff2
	[184199275] = "https://api.luarmor.net/files/v3/loaders/bc4438f2488e366d2848d39ddb70cacc.lua", -- UF
	[4931927012] = "https://api.luarmor.net/files/v3/loaders/40ef3f5eb3cede5e90381a450c3a6e40.lua", -- BL
}

local scriptUrl = Scripts[game.GameId]

if not scriptUrl then
	player:Kick("Nova | This game is not supported.")
	return
end

--------------------------------------------------
-- Load script
--------------------------------------------------
local success, err = pcall(function()
	loadstring(game:HttpGet(scriptUrl))()
end)

if not success then
	player:Kick("Failed to load script. Rejoin.")
end
