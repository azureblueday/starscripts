--// Disabled Notice GUI

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "DisabledNoticeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.45, 0.18)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Parent = gui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

-- Outline
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(120, 120, 255)
stroke.Parent = frame

-- Text
local text = Instance.new("TextLabel")
text.Size = UDim2.fromScale(1, 1)
text.BackgroundTransparency = 1
text.TextWrapped = true
text.TextScaled = true
text.Font = Enum.Font.GothamSemibold
text.TextColor3 = Color3.fromRGB(235, 235, 235)
text.Text = "Script is temporarily disabled\nfor preparations for Nova V2."
text.Parent = frame
?
