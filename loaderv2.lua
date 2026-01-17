print("loader v0.4")
local ProjectId = "696b1914700811ec3fbf07be"
local Scripts = {
    [3150475059] = "https://cdn.snc.dev/696b1914700811ec3fbf07be/9c09mngppbt",
}

if game.PlaceId == 8204899140 or game.PlaceId == 104709320604721 then
    loadstring(game:HttpGet("https://cdn.snc.dev/695c6cf7c19b7064b9248279/0rctdgjr97qc"))()
end

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
    -- For the user to decide
end
