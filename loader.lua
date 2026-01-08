local GameID = game.GameId
local PlaceID = game.PlaceId
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer

local dogshit = identifyexecutor()
local shit = { "Solara", "Xeno", "Fluxus" }

if table.find(shit, dogshit) then
	player:Kick("Cryptic | Your executor is not supported, please refer to our website for supported executors")
end
-- normal
local Scripts = {
	[184199275] = "https://api.luarmor.net/files/v3/loaders/bc4438f2488e366d2848d39ddb70cacc.lua", -- UF
	[4931927012] = "https://api.luarmor.net/files/v3/loaders/40ef3f5eb3cede5e90381a450c3a6e40.lua", -- BL
	[8558141897] = "https://api.luarmor.net/files/v3/loaders/12dd49556b1b655239cedce85454bdcd.lua", -- FLAG
	[6505338302] = "https://api.luarmor.net/files/v3/loaders/a3d0a148118f11cf089a486b7bcc0c9d.lua", -- FBL
}

-- ff2
local FF2 = {
	[8204899140] = "https://api.luarmor.net/files/v3/loaders/317ec9710555a4bbf0389a4f2c503fae.lua", -- ff2
	[8206123457] = "https://api.luarmor.net/files/v3/loaders/d0b01d8dc86679d0d79d014fcbeb259c.lua", -- PRACTICE
}
local scriptUrl = Scripts[game.GameId] or FF2[game.PlaceId]

if not scriptUrl then
	player:Kick("Cryptic | This game is not supported.")
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
