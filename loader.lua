local GameID = game.GameId
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer

--------------------------------------------------
-- GameId check
--------------------------------------------------
local Scripts = {
	[3150475059] = "https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/ff2loader.lua", -- ff2
	[184199275] = "https://api.luarmor.net/files/v3/loaders/bc4438f2488e366d2848d39ddb70cacc.lua", -- UF
	[4931927012] = "https://api.luarmor.net/files/v3/loaders/40ef3f5eb3cede5e90381a450c3a6e40.lua", -- BL
	[8558141897] = "https://api.luarmor.net/files/v3/loaders/12dd49556b1b655239cedce85454bdcd.lua", -- FLAG
	[6505338302] = "https://api.luarmor.net/files/v3/loaders/a3d0a148118f11cf089a486b7bcc0c9d.lua", -- FBL
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
