--// Services
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")

--// Mobile-only
if not UserInputService.TouchEnabled then
    return
end

local lp = Players.LocalPlayer
local ctrlHeld = false

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MobileToggleStyle"
gui.ResetOnSpawn = false
gui.Parent = lp:WaitForChild("PlayerGui")

-- Container (so it looks like a UI button, not a Roblox default)
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.fromOffset(78, 26)
button.Position = UDim2.fromOffset(12, 42) -- slightly below top-left icons
button.Text = "Toggle"
button.Font = Enum.Font.GothamMedium
button.TextSize = 13
button.TextColor3 = Color3.fromRGB(230, 230, 230)
button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
button.AutoButtonColor = false
button.BorderSizePixel = 0

-- Rounded corners (pill style)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = button

-- Subtle outline like the screenshot
local stroke = Instance.new("UIStroke")
stroke.Parent = button
stroke.Thickness = 1
stroke.Color = Color3.fromRGB(55, 55, 55)
stroke.Transparency = 0.2

--// CTRL logic
local function setCtrl(state)
    ctrlHeld = state

    VirtualInputManager:SendKeyEvent(
        state,
        Enum.KeyCode.LeftControl,
        false,
        game
    )

    -- Visual feedback (very subtle, like Obsidian)
    button.BackgroundColor3 = state
        and Color3.fromRGB(45, 45, 45)
        or Color3.fromRGB(32, 32, 32)

    button.Text = state and "Toggle • ON" or "Toggle"
end

button.Activated:Connect(function()
    setCtrl(not ctrlHeld)
end)

-- Safety: release CTRL on respawn
lp.CharacterAdded:Connect(function()
    if ctrlHeld then
        setCtrl(false)
    end
end)
