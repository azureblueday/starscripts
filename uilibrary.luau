--==================================================
-- Custom UI Library (Left Tabs)
--==================================================

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Library = {}
Library.Theme = {
	Background = Color3.fromRGB(20,20,20),
	Secondary = Color3.fromRGB(30,30,30),
	Accent = Color3.fromRGB(0,170,255),
	Text = Color3.fromRGB(255,255,255)
}

--==================================================
-- Utility
--==================================================
local function round(num, decimals)
	decimals = decimals or 0
	local mult = 10^decimals
	return math.floor(num * mult + 0.5) / mult
end

--==================================================
-- Create Window
--==================================================
function Library:CreateWindow(title)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = Player:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false

	local Main = Instance.new("Frame")
	Main.Size = UDim2.fromOffset(650, 420)
	Main.Position = UDim2.fromScale(0.5, 0.5)
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = self.Theme.Background
	Main.BorderSizePixel = 0
	Main.Parent = ScreenGui
	Main.Active = true
	Main.Draggable = true

	Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

	-- Title
	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 0, 40)
	Title.BackgroundTransparency = 1
	Title.Text = title
	Title.TextColor3 = self.Theme.Text
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 18
	Title.Parent = Main

	-- Close (LeftCtrl)
	UIS.InputBegan:Connect(function(i,gp)
		if not gp and i.KeyCode == Enum.KeyCode.LeftControl then
			ScreenGui.Enabled = not ScreenGui.Enabled
		end
	end)

	-- Tabs
	local Tabs = Instance.new("Frame")
	Tabs.Size = UDim2.new(0, 150, 1, -40)
	Tabs.Position = UDim2.fromOffset(0, 40)
	Tabs.BackgroundColor3 = self.Theme.Secondary
	Tabs.BorderSizePixel = 0
	Tabs.Parent = Main

	local TabsLayout = Instance.new("UIListLayout", Tabs)
	TabsLayout.Padding = UDim.new(0, 6)

	-- Pages
	local Pages = Instance.new("Frame")
	Pages.Size = UDim2.new(1, -150, 1, -40)
	Pages.Position = UDim2.fromOffset(150, 40)
	Pages.BackgroundTransparency = 1
	Pages.Parent = Main

	local Window = {}

	--==================================================
	-- Create Tab
	--==================================================
	function Window:CreateTab(name)
		local TabButton = Instance.new("TextButton")
		TabButton.Size = UDim2.new(1, -10, 0, 40)
		TabButton.BackgroundColor3 = Library.Theme.Background
		TabButton.Text = name
		TabButton.TextColor3 = Library.Theme.Text
		TabButton.Font = Enum.Font.Gotham
		TabButton.TextSize = 14
		TabButton.Parent = Tabs
		Instance.new("UICorner", TabButton)

		local Page = Instance.new("ScrollingFrame")
		Page.Size = UDim2.fromScale(1, 1)
		Page.CanvasSize = UDim2.new(0,0,0,0)
		Page.ScrollBarImageTransparency = 1
		Page.Visible = false
		Page.Parent = Pages

		local Layout = Instance.new("UIListLayout", Page)
		Layout.Padding = UDim.new(0, 8)

		Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Page.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 10)
		end)

		TabButton.MouseButton1Click:Connect(function()
			for _,v in pairs(Pages:GetChildren()) do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Page.Visible = true
		end)

		Page.Visible = (#Pages:GetChildren() == 1)

		local Tab = {}

		--==================================================
		-- Button
		--==================================================
		function Tab:AddButton(text, callback)
			local B = Instance.new("TextButton")
			B.Size = UDim2.new(1,-10,0,40)
			B.BackgroundColor3 = Library.Theme.Secondary
			B.Text = text
			B.TextColor3 = Library.Theme.Text
			B.Font = Enum.Font.Gotham
			B.TextSize = 14
			B.Parent = Page
			Instance.new("UICorner", B)

			B.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end

		--==================================================
		-- Toggle
		--==================================================
		function Tab:AddToggle(text, default, callback)
			local T = Instance.new("TextButton")
			T.Size = UDim2.new(1,-10,0,40)
			T.BackgroundColor3 = Library.Theme.Secondary
			T.Text = text
			T.TextColor3 = Library.Theme.Text
			T.Font = Enum.Font.Gotham
			T.TextSize = 14
			T.Parent = Page
			Instance.new("UICorner", T)

			local state = default

			local function refresh()
				T.BackgroundColor3 = state and Library.Theme.Accent or Library.Theme.Secondary
			end
			refresh()

			T.MouseButton1Click:Connect(function()
				state = not state
				refresh()
				pcall(callback, state)
			end)
		end

		--==================================================
		-- Slider
		--==================================================
		function Tab:AddSlider(text, min, max, default, callback)
			local Holder = Instance.new("Frame")
			Holder.Size = UDim2.new(1,-10,0,50)
			Holder.BackgroundColor3 = Library.Theme.Secondary
			Holder.Parent = Page
			Instance.new("UICorner", Holder)

			local Label = Instance.new("TextLabel")
			Label.Size = UDim2.new(1,-10,0,20)
			Label.Position = UDim2.fromOffset(5,0)
			Label.BackgroundTransparency = 1
			Label.TextColor3 = Library.Theme.Text
			Label.Font = Enum.Font.Gotham
			Label.TextSize = 13
			Label.Text = text .. ": " .. default
			Label.Parent = Holder

			local Bar = Instance.new("Frame")
			Bar.Size = UDim2.new(1,-10,0,8)
			Bar.Position = UDim2.fromOffset(5,30)
			Bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
			Bar.Parent = Holder
			Instance.new("UICorner", Bar)

			local Fill = Instance.new("Frame")
			Fill.Size = UDim2.new((default-min)/(max-min),0,1,0)
			Fill.BackgroundColor3 = Library.Theme.Accent
			Fill.Parent = Bar
			Instance.new("UICorner", Fill)

			local dragging = false
			Bar.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
				end
			end)
			UIS.InputEnded:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			UIS.InputChanged:Connect(function(i)
				if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
					local pct = math.clamp((i.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X,0,1)
					local val = round(min + (max-min)*pct,2)
					Fill.Size = UDim2.new(pct,0,1,0)
					Label.Text = text .. ": " .. val
					pcall(callback,val)
				end
			end)
		end

		--==================================================
		-- Dropdown
		--==================================================
		function Tab:AddDropdown(text, options, callback)
			local Open = false

			local D = Instance.new("TextButton")
			D.Size = UDim2.new(1,-10,0,40)
			D.BackgroundColor3 = Library.Theme.Secondary
			D.Text = text
			D.TextColor3 = Library.Theme.Text
			D.Font = Enum.Font.Gotham
			D.TextSize = 14
			D.Parent = Page
			Instance.new("UICorner", D)

			local List = Instance.new("Frame")
			List.Size = UDim2.new(1,-10,0,#options*35)
			List.BackgroundColor3 = Library.Theme.Background
			List.Visible = false
			List.Parent = Page
			Instance.new("UICorner", List)

			local L = Instance.new("UIListLayout", List)

			for _,opt in ipairs(options) do
				local O = Instance.new("TextButton")
				O.Size = UDim2.new(1,0,0,35)
				O.BackgroundTransparency = 1
				O.Text = opt
				O.TextColor3 = Library.Theme.Text
				O.Font = Enum.Font.Gotham
				O.TextSize = 13
				O.Parent = List

				O.MouseButton1Click:Connect(function()
					D.Text = text .. ": " .. opt
					List.Visible = false
					Open = false
					pcall(callback,opt)
				end)
			end

			D.MouseButton1Click:Connect(function()
				Open = not Open
				List.Visible = Open
			end)
		end

		--==================================================
		-- TextBox
		--==================================================
		function Tab:AddTextbox(placeholder, callback)
			local B = Instance.new("TextBox")
			B.Size = UDim2.new(1,-10,0,40)
			B.BackgroundColor3 = Library.Theme.Secondary
			B.PlaceholderText = placeholder
			B.Text = ""
			B.TextColor3 = Library.Theme.Text
			B.Font = Enum.Font.Gotham
			B.TextSize = 14
			B.Parent = Page
			Instance.new("UICorner", B)

			B.FocusLost:Connect(function()
				pcall(callback,B.Text)
			end)
		end

		--==================================================
		-- Keybind
		--==================================================
		function Tab:AddKeybind(text, defaultKey, callback)
			local key = defaultKey

			local B = Instance.new("TextButton")
			B.Size = UDim2.new(1,-10,0,40)
			B.BackgroundColor3 = Library.Theme.Secondary
			B.Text = text .. ": " .. key.Name
			B.TextColor3 = Library.Theme.Text
			B.Font = Enum.Font.Gotham
			B.TextSize = 14
			B.Parent = Page
			Instance.new("UICorner", B)

			B.MouseButton1Click:Connect(function()
				B.Text = text .. ": ..."
				local conn
				conn = UIS.InputBegan:Connect(function(i)
					if i.KeyCode ~= Enum.KeyCode.Unknown then
						key = i.KeyCode
						B.Text = text .. ": " .. key.Name
						conn:Disconnect()
					end
				end)
			end)

			UIS.InputBegan:Connect(function(i,gp)
				if not gp and i.KeyCode == key then
					pcall(callback)
				end
			end)
		end

		return Tab
	end

	return Window
end

return Library
