local ProjectId = "698910339dab15797321e6e7"
local Scripts = {
    [4864117649] = "https://cdn.snc.dev/698910339dab15797321e6e7/8s3ia71wr35", -- utg
}

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
   game:GetService("Players").LocalPlayer:Kick("Script is currently unavaliable for this game!")
end
