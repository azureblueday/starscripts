
local GameID = game.GameId
local Exploit = identifyexecutor()

local Player = game:GetService("Players").LocalPlayer
local LogService = game:GetService("LogService")
local ScriptContext = game:GetService("ScriptContext")

-- // If you're buying yuna then you should prob buy a paid exploit, not just buy only yuna
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

-- // LogService/ScriptContext error detection bypass
if GameID == 3150475059 and not table.find(Shitsploits, Exploit) then
    if hookfunction then
        local Old; Old = hookfunction(LogService.GetLogHistory, function(...)
            local Results = Old(...);

            -- // Remove any potential errors that the game could detect, by default the console has 3 errors in it already
            if #Results > 3 then
                for i = 4, #Results do
                    if type(Results[i]) == "table" and Results[i].messageType == Enum.MessageType.MessageError then
                        table.remove(Results, i);
                    end
                end
            end

            return Results
        end)
    end

    if getconnections then
        for i,v in next, getconnections(ScriptContext.Error) do
            if v.Function then
                v:Disable()
            end
        end
    end
end


if table.find(Shitsploits, Exploit) then
    return Player:Kick("Nova | Executor is not supported by Nova.")
end
