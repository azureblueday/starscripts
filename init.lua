local ProjectId = "698910339dab15797321e6e7"
print("loader v0.9")
local Scripts = {
    [4864117649] = "https://cdn.snc.dev/698910339dab15797321e6e7/8s3ia71wr35", -- utg
    [6331902150] = "https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/forsaken-obfuscated.lua", -- forsaken
    [8558141897] = "https://raw.githubusercontent.com/azureblueday/starscripts/refs/heads/main/flagfb-obfuscated.lua", -- flag fb
}

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
   game:GetService("Players").LocalPlayer:Kick("Script is currently unavaliable for this game!")
end
