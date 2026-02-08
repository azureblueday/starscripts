print("loader v0.6")
local Scripts = {
    [4864117649] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmle5rbyo0001ysz7c4juqu48",
    [8558141897] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmle6k4o00001q4oo5zuaipaa",
    [6331902150] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmle9do8k0001tp4o59y0zfz3",
}
local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
    game.Players.LocalPlayer:Kick("Unsupported Game")
end
