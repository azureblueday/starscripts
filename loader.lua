local GameID = game.GameId
local PlaceID = game.PlaceId
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer
print("Loader v3")
local dogshit = identifyexecutor()
local shit = { "Solara", "Xeno", "Fluxus" }

if table.find(shit, dogshit) then
	player:Kick("Nova | Your executor is not supported, please refer to our website for supported executors")
end
-- normal
local Scripts = {
	[3150475059] = "https://api.luarmor.net/files/v3/loaders/57c6826164fad71af5d942b845fb90c4.lua", -- UF
	[184199275] = "https://api.luarmor.net/files/v3/loaders/797b0bfb251db8e98838c64d841da259.lua", -- UF
	[4931927012] = "https://api.luarmor.net/files/v3/loaders/bbe30263c9d61ae388ed5acf5340fe2f.lua", -- BL
	[6505338302] = "https://api.luarmor.net/files/v3/loaders/b13d4af2baa338fa59b1d62e0fda61cc.lua", -- FBL
}

local scriptUrl = Scripts[game.GameId]

if not scriptUrl then
	player:Kick("Nova | This game is not supported.")
	return
end

--------------------------------------------------
-- Load script
--------------------------------------------------

if game.PlaceId == 8204899140 or game.PlaceId == 104709320604721 then
	loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/8b8e3627cb1da16755aa3dc0e56f103f.lua"))()
	print("Loaded Bypass!")
end

local success, err = pcall(function()
	loadstring(game:HttpGet(scriptUrl))()
end)

if not success then
	player:Kick("Failed to load script. Rejoin.")
end
