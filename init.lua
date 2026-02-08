local ProjectId = "698910339dab15797321e6e7"
local Scripts = {
    [4864117649] = "https://cdn.snc.dev/698910339dab15797321e6e7/8s3ia71wr35", -- utg
    [6331902150] = "https://api.jnkie.com/api/v1/luascripts/public/bc4bd8e1a27fcd9ead2c8986327c15632f180206d2579c6c198ef09649546772/download", -- forsaken
    [8558141897] = "https://api.jnkie.com/api/v1/luascripts/public/211262fe32dfcb5d25a2a3afc47d95f27226ebed0ba5795a1abbe3ffc4bd8ad3/download", -- flag fb
}

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
   game:GetService("Players").LocalPlayer:Kick("Script is currently unavaliable for this game!")
end

print("loader")
