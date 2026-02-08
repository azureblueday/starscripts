print("loader v0.7")
local Scripts = {
    [4864117649] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebb01m0001ffa5g5590gfg", -- utg
    [8558141897] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebcr4t0005ffa5lxdsbfga", -- flag fb
    [6331902150] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebc6wa0003ffa57d8vnhw4", -- forsaken
}
local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
    game.Players.LocalPlayer:Kick("Unsupported Game")
end
