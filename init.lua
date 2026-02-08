print("loader v0.5")
local Scripts = {
    [4864117649] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmle5rbyo0001ysz7c4juqu48",
}


local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
    print("unsupported game")
end
