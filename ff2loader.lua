local PlaceID = game.PlaceId
local Player = game:GetService("Players").LocalPlayer
local player = game:GetService("Players").LocalPlayer

-- ass executors
local dogshit = identifyexecutor()
local dogshitlist = { "Solara", "Xeno" }

print("Checking sUNC...")

if table.find(dogshitlist, dogshit) then
    game.Players.LocalPlayer:Kick("get a new executor gng")
    print("Executor does not have enough sUNC, safeguards kicking now..")  
end

task.wait(1)

print("sUNC Check passed! Your executor is supported by Cryptic.")

local Scripts = {
	[8204899140] = "https://api.luarmor.net/files/v3/loaders/317ec9710555a4bbf0389a4f2c503fae.lua", -- ff2
	[8206123457] = "https://api.luarmor.net/files/v3/loaders/bc4438f2488e366d2848d39ddb70cacc.lua", -- UF
}

