--==================================================
-- Premium Minimal UI Library
--==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer

local Library = {}

--==================================================
-- THEME
--==================================================
Library.Theme = {
	BG        = Color3.fromRGB(18, 18, 18),
	Panel     = Color3.fromRGB(24, 24, 24),
	Element   = Color3.fromRGB(32, 32, 32),
	Accent    = Color3.fromRGB(90, 140, 255),
	Text      = Color3.fromRGB(235, 235, 235),
	SubText   = Color3.fromRGB(160, 160, 160)
}

--==================================================
-- UTILS
--==================================================
local function corner(obj, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r)
	c.Parent = obj
end

local function tween(obj, props, t)
	TweenService:Create(
		obj,
		TweenInfo.new(t or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		props
	):Play()
end

--==================================================
-- WINDOW
--==================================================
function Library:CreateWindow(title)
	local gui = Instance.new("ScreenGui")
	gui.Name = "PremiumUILib"
	gui.ResetOnSpawn = false
	gui.Parent = Player:WaitForChild("PlayerGui")

	local main = Instance.new("Frame")
	main.Size = UDim2.fromOffset(680, 420)
	main.Position = UDim2.fromScale(0.5, 0.5)
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = self.Theme.BG
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true
	main.Parent = gui
	corner(main, 14)

	-- Title
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -20, 0, 36)
	titleLabel.Position = UDim2.fromOffset(20, 8)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = title
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 18
	titleLabel.TextXAlignment = Left
	titleLabel.TextColor3 = self.Theme.Text
	titleLabel.Parent = main

	-- Tabs panel
	local tabs = Instance.new("Frame")
	tabs.Size = UDim2.fromOffset(160, 360)
	tabs.Position = UDim2.fromOffset(10, 50)
	tabs.BackgroundColor3 = self.Theme.Panel
	tabs.BorderSizePixel = 0
	tabs.Parent = main
	corner(tabs, 12)

	local tabLayout = Instance.new("UIListLayout", tabs)
	tabLayout.Padding = UDim.new(0, 6)

	local pad = Instance.new("UIPadding", tabs)
	pad.PaddingTop = UDim.new(0, 10)
	pad.PaddingLeft = UDim.new(0, 10)
	pad.PaddingRight = UDim.new(0, 10)

	-- Pages
	local pages = Instance.new("Frame")
	pages.Size = UDim2.fromOffset(480, 360)
	pages.Position = UDim2.fromOffset(190, 50)
	pages.BackgroundTransparency = 1
	pages.Parent = main

	local Window = {}

	--==================================================
	-- TAB
	--==================================================
	function Window:CreateTab(name)
		local tabBtn = Instance.new("TextButton")
		tabBtn.Size = UDim2.new(1, 0, 0, 38)
		tabBtn.BackgroundColor3 = Library.Theme.Element
		tabBtn.Text = name
		tabBtn.Font = Enum.Font.Gotham
		tabBtn.TextSize = 14
		tabBtn.TextColor3 = Library.Theme.SubText
		tabBtn.Parent = tabs
		corner(tabBtn, 8)

		local page = Instance.new("ScrollingFrame")
		page.Size = UDim2.fromScale(1, 1)
		page.CanvasSize = UDim2.new(0, 0, 0, 0)
		page.ScrollBarImageTransparency = 1
		page.Visible = false
		page.Parent = pages

		local layout = Instance.new("UIListLayout", page)
		layout.Padding = UDim.new(0, 10)

		local padding = Instance.new("UIPadding", page)
		padding.PaddingTop = UDim.new(0, 10)
		padding.PaddingLeft = UDim.new(0, 10)
		padding.PaddingRight = UDim.new(0, 10)

		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			page.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 10)
		end)

		tabBtn.MouseButton1Click:Connect(function()
			for _,p in pairs(pages:GetChildren()) do
				if p:IsA("ScrollingFrame") then p.Visible = false end
			end
			for _,b in pairs(tabs:GetChildren()) do
				if b:IsA("TextButton") then
					tween(b, {BackgroundColor3 = Library.Theme.Element})
					b.TextColor3 = Library.Theme.SubText
				end
			end
			page.Visible = true
			tween(tabBtn, {BackgroundColor3 = Library.Theme.Accent})
			tabBtn.TextColor3 = Library.Theme.Text
		end)

		if #pages:GetChildren() == 1 then
			page.Visible = true
			tabBtn.TextColor3 = Library.Theme.Text
		end

		local Tab = {}

		--==================================================
		-- BUTTON
		--==================================================
		function Tab:AddButton(text, callback)
			local b = Instance.new("TextButton")
			b.Size = UDim2.new(1, 0, 0, 40)
			b.BackgroundColor3 = Library.Theme.Element
			b.Text = text
			b.Font = Enum.Font.Gotham
			b.TextSize = 14
			b.TextColor3 = Library.Theme.Text
			b.Parent = page
			corner(b, 8)

			b.MouseButton1Click:Connect(function()
				tween(b, {BackgroundColor3 = Library.Theme.Accent}, 0.08)
				task.delay(0.08, function()
					tween(b, {BackgroundColor3 = Library.Theme.Element}, 0.12)
				end)
				pcall(callback)
			end)
		end

		--==================================================
		-- TOGGLE
		--==================================================
		function Tab:AddToggle(text, default, callback)
			local state = default

			local b = Instance.new("TextButton")
			b.Size = UDim2.new(1, 0, 0, 40)
			b.BackgroundColor3 = state and Library.Theme.Accent or Library.Theme.Element
			b.Text = text
			b.Font = Enum.Font.Gotham
			b.TextSize = 14
			b.TextColor3 = Library.Theme.Text
			b.Parent = page
			corner(b, 8)

			b.MouseButton1Click:Connect(function()
				state = not state
				tween(b, {
					BackgroundColor3 = state and Library.Theme.Accent or Library.Theme.Element
				})
				pcall(callback, state)
			end)
		end

		--==================================================
		-- SLIDER (FIXED & SMOOTH)
		--==================================================
		function Tab:AddSlider(text, min, max, default, callback)
			local value = default

			local holder = Instance.new("Frame")
			holder.Size = UDim2.new(1, 0, 0, 52)
			holder.BackgroundColor3 = Library.Theme.Element
			holder.Parent = page
			corner(holder, 8)

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, -20, 0, 22)
			label.Position = UDim2.fromOffset(10, 6)
			label.BackgroundTransparency = 1
			label.Text = text .. ": " .. value
			label.Font = Enum.Font.Gotham
			label.TextSize = 13
			label.TextXAlignment = Left
			label.TextColor3 = Library.Theme.Text
			label.Parent = holder

			local bar = Instance.new("Frame")
			bar.Size = UDim2.new(1, -20, 0, 6)
			bar.Position = UDim2.fromOffset(10, 36)
			bar.BackgroundColor3 = Color3.fromRGB(50,50,50)
			bar.Parent = holder
			corner(bar, 6)

			local fill = Instance.new("Frame")
			fill.Size = UDim2.new((value-min)/(max-min),0,1,0)
			fill.BackgroundColor3 = Library.Theme.Accent
			fill.Parent = bar
			corner(fill, 6)

			local dragging = false

			bar.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
					dragging = true
				end
			end)

			UIS.InputEnded:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
					dragging = false
				end
			end)
