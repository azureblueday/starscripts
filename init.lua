local ProjectId = "698910339dab15797321e6e7"
print("loader v0.9.2")
local Scripts = {
    [4864117649] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebb01m0001ffa5g5590gfg", -- utg
    [6331902150] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebc6wa0003ffa57d8vnhw4", -- forsaken
    [8558141897] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmlebcr4t0005ffa5lxdsbfga", -- flag fb
    [3150475059] = "https://bastiondev.org/api/loader/cmle54vwo0001fam85t16u67z?script=cmm05gshm000d10pmkkh6fbw4", -- ff2
}

local Script = Scripts[game.GameId]
if Script then
    loadstring(game:HttpGet(Script))()
else
   game:GetService("Players").LocalPlayer:Kick("Script is currently unavaliable for this game!")
end
