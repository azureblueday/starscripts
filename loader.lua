local Players = game:GetService("Players")
local player = Players.LocalPlayer

--------------------------------------------------
-- Executor check (blacklist)
--------------------------------------------------
if typeof(identifyexecutor) ~= "function" then
	player:Kick("Unsupported executor.")
	return
end

local executorName = identifyexecutor()

-- Executors you want to BAN
local BannedExecutors = {
	["Xeno"] = true,
	["Solara"] = true
}

if BannedExecutors[executorName] then
	player:Kick("Nova | Unsupported Executor: " .. executorName)
	return
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
	player:Kick("This game is not supported.")
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
