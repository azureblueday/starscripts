-- ass executors
local dogshit = identifyexecutor()
local dogshitlist = { "Solara", "Xeno" }
  
-- game id shit

print("Checking sUNC...")

if table.find(dogshitlist, dogshit) then
    game.Players.LocalPlayer:Kick("Nova | Your executor is not supported by us due to low sUNC, which risks bans as it cannot handle our bypass.")
    print("Executor does not have enough sUNC, safeguards kicking now..")  
end

task.wait(1)

print("sUNC Check passed! Your executor is supported by Nova Hub.")
