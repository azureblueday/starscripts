local GameID = game.GameId
local Exploit = identifyexecutor()
print("Loader v4")
local Player = game:GetService("Players").LocalPlayer
local LogService = game:GetService("LogService")
local ScriptContext = game:GetService("ScriptContext")
local poop = { "Solara", "Xeno" }

local GameIDs = {
	["3150475059"] = "https://api.luarmor.net/files/v3/loaders/57c6826164fad71af5d942b845fb90c4.lua", -- UF
	["184199275"] = "https://api.luarmor.net/files/v3/loaders/797b0bfb251db8e98838c64d841da259.lua", -- UF
	["4931927012"] = "https://api.luarmor.net/files/v3/loaders/bbe30263c9d61ae388ed5acf5340fe2f.lua", -- BL
	["6505338302"] = "https://api.luarmor.net/files/v3/loaders/b13d4af2baa338fa59b1d62e0fda61cc.lua", -- FBL
}

local function Execute(IDs)
    return loadstring(game:HttpGet(IDs[tostring(GameID)]))()
end

-- // Key detection (more detailed kick message because LRM's is not that great)
if not script_key and not getgenv().script_key then
    return Player:Kick("Nova | Invalid Key! Make a ticket if you had a key.")
end

-- // LogService/ScriptContext error detection bypass
if GameID == 3150475059 and not table.find(poop, Exploit) then
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


if table.find(poop, Exploit) then

    return Player:Kick(`Yuna | {Exploit} is not supported by Yuna.`)

elseif Exploit == "Codex" then
    Player:Kick("Nova | Use Delta for mobile.")
elseif GameIDs[tostring(GameID)] then
    if tostring(GameID) == "3032132418" then
        for x, y in getconnections(game:GetService("LogService").MessageOut) do
        	if y.Function == nil or typeof(getfenv(y.Function).script) == 'table' then
        		continue
        	end
        	y:Disable()
        end
    end
    Execute(GameIDs)
end
