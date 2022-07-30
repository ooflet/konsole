-- Please excuse my absolute fucking trash code

_G.KommandLibrary = {}

_G.KommandLibrary.Output = {}
_G.KommandLibrary.PackageManager = {}
_G.KommandLibrary.Tabs = {}
_G.KommandLibrary.Info = {}

local KonsoleExecuted = false
local ClientLog = game.CoreGui:WaitForChild("Kommand"):WaitForChild("ConsoleWindow"):WaitForChild("Console"):WaitForChild("ClientLog")

if game.CoreGui:FindFirstChild("Kommand") then
	KonsoleExecuted = true	
else
	error("Konsole not found!")	
end

local ErrorColor = Color3.fromRGB(255, 0, 0)
local WarningColor = Color3.fromRGB(255, 170, 0)
local OutputColor = Color3.fromRGB(255, 255, 255)
local InfoColor = Color3.fromRGB(0, 85, 255)

function _G.KommandLibrary.Output:OutputText(Message, Type, Prefix, Color)
	if Type == Enum.MessageType.MessageError then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = ErrorColor
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "🛑 "..Message
		TextLabel.TextColor3 = ErrorColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	elseif Type == Enum.MessageType.MessageWarning then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = WarningColor
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "⚠️ "..Message
		TextLabel.TextColor3 = WarningColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	elseif Type == Enum.MessageType.MessageOutput then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = OutputColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	elseif Type == Enum.MessageType.MessageInfo then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = InfoColor
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()	
	elseif Type == "Custom" then
		local TextLabel = Instance.new("TextBox")
		TextLabel.Name = Message
		TextLabel.Parent = ClientLog
		TextLabel.AutomaticSize = Enum.AutomaticSize.Y
		TextLabel.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 0, 0)
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.Text = "-- "..Message
		TextLabel.TextColor3 = Color
		TextLabel.TextSize = 16.000
		TextLabel.TextWrapped = true
		TextLabel.ClearTextOnFocus = false
		TextLabel.TextEditable = false
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.RichText = true
		TextLabel.TextTransparency = 1
		game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()	
	end
end

function _G.KommandLibrary.Tabs:CreateTab()
	local Tab = Instance.new("ImageButton")
	local Container = Instance.new("Frame")
	local Color = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local UICorner = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local Exit = Instance.new("TextButton")
	local Color_2 = Instance.new("Frame")

	Tab.Name = "Terminal"
	Tab.Parent = game.CoreGui.Kommand.ConsoleWindow.TopBar.Tabs
	Tab.Active = false
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1.000
	Tab.BorderSizePixel = 0
	Tab.Selectable = false
	Tab.Size = UDim2.new(0, 0, 0, 25)
	Tab.ClipsDescendants = true
	Tab.AutomaticSize = Enum.AutomaticSize.X

	Container.Name = "Container"
	Container.Parent = Tab
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.Size = UDim2.new(0, 0, 0, 20)
	Container.AutomaticSize = Enum.AutomaticSize.X

	Color.Name = "Color"
	Color.Parent = Container
	Color.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Color.BorderSizePixel = 0
	Color.Size = UDim2.new(0, 0, 0, 25)
	Color.AutomaticSize = Enum.AutomaticSize.XY

	Title.Name = "Title"
	Title.Parent = Color
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.LayoutOrder = 2
	Title.Size = UDim2.new(0, 0, 1, 0)
	Title.Font = Enum.Font.RobotoMono
	Title.Text = "Terminal"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 16.000
	Title.AutomaticSize = Enum.AutomaticSize.X

	UIPadding.Parent = Color
	UIPadding.PaddingBottom = UDim.new(0, 5)
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingRight = UDim.new(0, 10)
	UIPadding.PaddingTop = UDim.new(0, 5)

	UICorner.Parent = Color

	UIListLayout.Parent = Color
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	Exit.Name = "Exit"
	Exit.Parent = Color
	Exit.Active = false
	Exit.BackgroundTransparency = 1
	Exit.BorderSizePixel = 0
	Exit.LayoutOrder = 2
	Exit.Selectable = false
	Exit.Size = UDim2.new(0, 10, 1, 0)
	Exit.Font = Enum.Font.SciFi
	Exit.Text = "x"
	Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Exit.TextSize = 16.000

	Color_2.Name = "Color"
	Color_2.Parent = Container
	Color_2.AnchorPoint = Vector2.new(0, 1)
	Color_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Color_2.BorderSizePixel = 0
	Color_2.Position = UDim2.new(0, 0, 1, 5)
	Color_2.Size = UDim2.new(1, 0, 0, 8)
	Color_2.ZIndex = 0

	Container.Position = UDim2.fromScale(0,1)
	Container:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5)

	Container.MouseButton1Click:Connect(function()
		for i, obj in pairs(game.Players.LocalPlayer.PlayerGui.Kommand.ConsoleWindow.TopBar.Tabs:GetDescendants()) do
			if obj.Name == "Color" or obj.Name == "Color_2" then
				game:GetService("TweenService"):Create(obj, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
			end
		end
		game:GetService("TweenService"):Create(Color, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(75,75,75)}):Play()
		game:GetService("TweenService"):Create(Color_2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(75,75,75)}):Play()
	end)

	Exit.MouseButton1Click:Connect(function()
		Container.Position = UDim2.fromScale(0,0)
		Container:TweenPosition(UDim2.new(0,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5)
		wait(0.5)
		Tab:Destroy()
	end)	
end

return _G.KommandLibrary
