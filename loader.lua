
local GameID = game.GameId
local Exploit = identifyexecutor()

local Player = game:GetService("Players").LocalPlayer
local LogService = game:GetService("LogService")
local ScriptContext = game:GetService("ScriptContext")

-- hi skidders!!!
local Shitsploits = { "Solara", "Xeno" }

local GameIDs = {
    ["3150475059"] = "https://api.luarmor.net/files/v3/loaders/317ec9710555a4bbf0389a4f2c503fae.lua", -- FF2
    ["184199275"] = "https://api.luarmor.net/files/v3/loaders/bc4438f2488e366d2848d39ddb70cacc.lua", -- UF
    ["4931927012"] = "https://api.luarmor.net/files/v3/loaders/40ef3f5eb3cede5e90381a450c3a6e40.lua", -- BL
}

local function Execute(IDs)
    return loadstring(game:HttpGet(IDs[tostring(GameID)]))()
end

-- // Key detection (more detailed kick message because LRM's is not that great)
if not script_key and not getgenv().script_key then
    return Player:Kick("Nova | Please make sure you include the script_key part ABOVE the loadstring, otherwise Luarmor will not be able to recognize that you bought.")
end

if table.find(Shitsploits, Exploit) then
    return Player:Kick("Nova | Executor is not supported by Nova.")
end
