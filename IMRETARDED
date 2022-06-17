local Lib = {}

local Wap = Instance.new("ScreenGui")
local MainUI = Instance.new("ImageLabel")
local CatList = Instance.new("ImageLabel")
local details = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Carno1 = Instance.new("TextLabel")
local fix = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local CatFrame = Instance.new("ImageButton")
local CatText = Instance.new("TextLabel")
local Fix1 = Instance.new("Frame")
local Categories = Instance.new("Frame")

Wap.Name = "Wap"
Wap.Parent = game.CoreGui
Wap.ResetOnSpawn = false

MainUI.Name = "MainUI"
MainUI.Parent = Wap
MainUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainUI.BackgroundTransparency = 1.000
MainUI.Position = UDim2.new(0.275138855, 0, 0.147420153, 0)
MainUI.Size = UDim2.new(0, 784, 0, 545)
MainUI.Image = "rbxassetid://3570695787"
MainUI.ImageColor3 = Color3.fromRGB(35, 35, 42)
MainUI.ScaleType = Enum.ScaleType.Slice
MainUI.SliceCenter = Rect.new(100, 100, 100, 100)
MainUI.SliceScale = 0.120
local dragger = {};
local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
local inputService = game:GetService('UserInputService');
local heartbeat    = game:GetService("RunService").Heartbeat;
-- // credits to Ririchi / Inori for this cute drag function :)
function dragger.new(frame)
	local s, event = pcall(function()
		return frame.MouseEnter
	end)

	if s then
		frame.Active = true;

		event:connect(function()
			local input = frame.InputBegan:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 then
					local objectPosition = Vector2.new(mouse.X - MainUI .AbsolutePosition.X, mouse.Y - MainUI .AbsolutePosition.Y);
					while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						pcall(function()
							MainUI :TweenPosition(UDim2.new(0, mouse.X - objectPosition.X, 0, mouse.Y - objectPosition.Y), 'Out', 'Linear', 0.1, true);
						end)
					end
				end
			end)

			local leave;
			leave = frame.MouseLeave:connect(function()
				input:disconnect();
				leave:disconnect();
			end)
		end)
	end
end
dragger.new(MainUI)
local toggledpog = true
local pos = UDim2.new(0.275,0,0.147,0)
game:GetService('UserInputService').InputBegan:connect(function(key, gpe)
	if (not gpe) then
		if key.KeyCode == Enum.KeyCode.RightControl then
			toggledpog = not toggledpog;
			if toggledpog then
				pos = MainUI.Position
				MainUI:TweenPosition(UDim2.new(0.5,0,2,0), (toggledpog and 'Out' or 'In'), 'Quad', 0.15, true)
				wait();
			else
				MainUI:TweenPosition(pos, (toggledpog and 'Out' or 'In'), 'Quad', 0.15, true)
			end
		end
	end
end)
CatList.Name = "CatList"
CatList.Parent = MainUI
CatList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CatList.BackgroundTransparency = 1.000
CatList.Position = UDim2.new(-0.000204514479, 0, 0, 0)
CatList.Size = UDim2.new(0, 197, 0, 545)
CatList.Image = "rbxassetid://3570695787"
CatList.ImageColor3 = Color3.fromRGB(52, 52, 63)
CatList.ScaleType = Enum.ScaleType.Slice
CatList.SliceCenter = Rect.new(100, 100, 100, 100)
CatList.SliceScale = 0.120

details.Name = "details"
details.Parent = CatList
details.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
details.BackgroundTransparency = 1.000
details.Size = UDim2.new(0, 196, 0, 74)

Name.Name = "Name"
Name.Parent = details
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0, 58, 0, -4)
Name.Size = UDim2.new(0, 109, 0, 41)
Name.Font = Enum.Font.GothamBlack
Name.Text = "   Name Here"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 14.000
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left

Carno1.Name = "Carno1"
Carno1.Parent = details
Carno1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Carno1.BackgroundTransparency = 1.000
Carno1.Position = UDim2.new(0, 69, 0, 27)
Carno1.Size = UDim2.new(0, 87, 0, 22)
Carno1.Font = Enum.Font.Code
Carno1.Text = "V.G Hub"
Carno1.TextColor3 = Color3.fromRGB(97, 97, 97)
Carno1.TextScaled = true
Carno1.TextSize = 14.000
Carno1.TextWrapped = true
Carno1.TextXAlignment = Enum.TextXAlignment.Left
spawn(function()
while wait(2) do
	local text = "   "..game.Players.LocalPlayer.Name
	for i = 1,#text,1 do
		Name.Text = string.sub(text,1,i)
		wait(0.08)
	end
end end)
fix.Name = "fix"
fix.Parent = details
fix.BackgroundColor3 = Color3.fromRGB(52, 52, 63)
fix.BorderSizePixel = 0
fix.Position = UDim2.new(0.862244904, 0, -0.0675675869, 0)
fix.Size = UDim2.new(0, 28, 0, 48)

Logo.Name = "Logo"
Logo.Parent = details
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0, 0, 0.0458715595, 0)
Logo.Size = UDim2.new(0, 50, 0, 50)
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Fetch the thumbnail
local userId = player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size48x48
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

Logo.Image = content

UIListLayout.Parent = CatList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = CatList
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)
CatFrame.Name = "CatFrame"
CatFrame.Parent = MainUI
CatFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
CatFrame.BackgroundTransparency = 1.000
CatFrame.Position = UDim2.new(0.249844611, 0, 0, 0)
CatFrame.Size = UDim2.new(0, 588, 0, 48)
CatFrame.Image = "rbxassetid://2790389767"
CatFrame.ImageColor3 = Color3.fromRGB(0, 170, 127)
CatFrame.ScaleType = Enum.ScaleType.Slice
CatFrame.SliceCenter = Rect.new(8, 8, 248, 248)

CatText.Name = "CatText"
CatText.Parent = CatFrame
CatText.AnchorPoint = Vector2.new(0.5, 0.5)
CatText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CatText.BackgroundTransparency = 1.000
CatText.BorderSizePixel = 0
CatText.Position = UDim2.new(0.5, 0, 0.5, 0)
CatText.Size = UDim2.new(1, 0, 1, 0)
CatText.Font = Enum.Font.GothamSemibold
CatText.Text = "Select Tab"
CatText.TextColor3 = Color3.fromRGB(255, 255, 255)
CatText.TextSize = 14.000

Fix1.Name = "Fix1"
Fix1.Parent = CatFrame
Fix1.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
Fix1.BorderSizePixel = 0
Fix1.Size = UDim2.new(0, 12, 0, 48)

Categories.Name = "Categories"
Categories.Parent = MainUI
Categories.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Categories.BackgroundTransparency = 1.000
Categories.ClipsDescendants = true
Categories.Position = UDim2.new(0.25, 0, 0.0880733952, 0)
Categories.Size = UDim2.new(0, 588, 0, 496)
function Lib:Category(name)
	local Main = Instance.new("TextButton")
	local Omegalul = Instance.new("ImageLabel")
	local Main_2 = Instance.new("TextLabel")
	local Main_3 = Instance.new("ScrollingFrame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding_2 = Instance.new("UIPadding")
	Main.Name = name
	Main.Parent = CatList
	Main.Active = false
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BackgroundTransparency = 1.000
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.487309635, 0, 0.190887704, 0)
	Main.Selectable = false
	Main.Size = UDim2.new(1, -5, 0.1193901, -5)
	Main.Font = Enum.Font.GothamSemibold
	Main.Text = name
	Main.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main.TextSize = 14.000

	Omegalul.Name = "Omegalul"
	Omegalul.Parent = Main
	Omegalul.AnchorPoint = Vector2.new(0.5, 0.5)
	Omegalul.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Omegalul.BackgroundTransparency = 1.000
	Omegalul.Position = UDim2.new(0.5, 0, 0.5, 0)
	Omegalul.Size = UDim2.new(1, -8, 1, -8)
	Omegalul.Image = "rbxassetid://3570695787"
	Omegalul.ImageColor3 = Color3.fromRGB(52, 52, 63)
	Omegalul.ScaleType = Enum.ScaleType.Slice
	Omegalul.SliceCenter = Rect.new(100, 100, 100, 100)
	Omegalul.SliceScale = 0.120

	Main_2.Name = name
	Main_2.Parent = Omegalul
	Main_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main_2.BackgroundTransparency = 1.000
	Main_2.BorderSizePixel = 0
	Main_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main_2.Size = UDim2.new(1, 0, 1, 0)
	Main_2.Font = Enum.Font.GothamSemibold
	Main_2.Text = name
	Main_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main_2.TextSize = 14.000

	Main_3.Name = name
	Main_3.Parent = Categories
	Main_3.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
	Main_3.BorderSizePixel = 0
	Main_3.Selectable = false
	Main_3.Visible = false
	Main_3.Size = UDim2.new(0.976190448, 0, 1, 0)
	Main_3.CanvasSize = UDim2.new(0, 0, 0, 0)
	Main_3.ScrollBarThickness = 6

	UIListLayout_2.Parent = Main_3
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 4)

	UIPadding_2.Parent = Main_3
	UIPadding_2.PaddingLeft = UDim.new(0, 8)
	UIPadding_2.PaddingTop = UDim.new(0, 16)
	local cat = {}
	function cat:Slider(name,min,def,max,callback)
		callback = callback or function() end
		local SliderD = Instance.new("ImageLabel")
		local Title = Instance.new("TextLabel")
		local Slider = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local Inner = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		SliderD.Name = "SliderD"
		SliderD.Parent = Main_3
		SliderD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderD.BackgroundTransparency = 1.000
		SliderD.Position = UDim2.new(0.0139372824, 0, 0.0161290932, 0)
		SliderD.Size = UDim2.new(1, -16, 0, 45)
		SliderD.Image = "rbxassetid://3570695787"
		SliderD.ImageColor3 = Color3.fromRGB(25, 25, 25)
		SliderD.ScaleType = Enum.ScaleType.Slice
		SliderD.SliceCenter = Rect.new(100, 100, 100, 100)
		SliderD.SliceScale = 0.120

		Title.Name = "Title"
		Title.Parent = SliderD
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0, 0, 0.0402777791, 0)
		Title.Size = UDim2.new(0, 182, 0, 43)
		Title.Font = Enum.Font.GothamBlack
		Title.Text = "  "..name
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Slider.Name = "Slider"
		Slider.Parent = SliderD
		Slider.Active = false
		Slider.AnchorPoint = Vector2.new(0, 0.5)
		Slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Slider.BorderSizePixel = 0
		Slider.Position = UDim2.new(0.361999959, 0, 0.5, 0)
		Slider.Selectable = false
		Slider.Size = UDim2.new(0, 334, 0, 28)
		Slider.AutoButtonColor = false
		Slider.Text = ""

		UICorner.Parent = Slider

		Inner.Name = "Inner"
		Inner.Parent = Slider
		Inner.Active = false
		Inner.AnchorPoint = Vector2.new(0, 0.5)
		Inner.BackgroundColor3 = Color3.fromRGB(206, 206, 206)
		Inner.BorderSizePixel = 0
		Inner.Position = UDim2.new(0, 0, 0.5, 0)
		Inner.Selectable = false
		Inner.Size = UDim2.new(0, 0, 0, 28)
		Inner.AutoButtonColor = false
		Inner.Text = ""

		UICorner_2.Parent = Inner
		local script = Instance.new('LocalScript', SliderD)

		local default = 20
		local min = 16
		local max = 200
		local Inner = script.Parent.Slider.Inner
		local BG = Inner.Parent
		local old = script.Parent.Title.Text
		local Number = script.Parent.Title
		local mouse = game.Players.LocalPlayer:GetMouse()
		local uis = game:GetService("UserInputService")
		local Value;
		local down = false
		if default ~= min then
			game:GetService("TweenService"):Create(Inner, TweenInfo.new(0.05), {Size = UDim2.new(default/max, 0, 0, 28)}):Play()
			Number.Text = old.. ": "..default       
		end
		local function Activate()
			spawn(function()
				down = true
				Value = math.floor((((tonumber(max) - tonumber(min)) / 336) * Inner.AbsoluteSize.X) +tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				Number.Text = old.. ": "..Value    
				game:GetService("TweenService"):Create(Inner, TweenInfo.new(0.05), {Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 336), 0, 28)}):Play()

				while game:GetService("RunService").RenderStepped:wait() and down do
					Value = math.floor((((tonumber(max) - tonumber(min)) / 336) * Inner.AbsoluteSize.X) +tonumber(min)) or 0
					Number.Text = old.. ": "..Value               
					pcall(function()
						callback(Value)
					end)
					game:GetService("TweenService"):Create(Inner, TweenInfo.new(0.05), {Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 336), 0, 28)}):Play()
				end
			end)
		end
		Inner.MouseButton1Down:Connect(function()
			Activate()
		end)
		BG.MouseButton1Down:Connect(function()
			Activate()
		end)
		uis.InputEnded:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 and down then
				down = false
				Value = math.floor((((tonumber(max) - tonumber(min)) / 336) * Inner.AbsoluteSize.X) +tonumber(min)) or 0
				Number.Text = old.. ": "..Value      
				pcall(function()
					callback(Value)
				end)
				game:GetService("TweenService"):Create(Inner, TweenInfo.new(0.05), {Size = UDim2.new(0, math.clamp(mouse.X - Inner.AbsolutePosition.X, 0, 336), 0, 28)}):Play()
			end        
		end)
		Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,49)
	end
	function cat:Label(name)
		local LabelD = Instance.new("ImageLabel")
		local LabelText = Instance.new("TextLabel")

		LabelD.Name = "LabelD"
		LabelD.Parent = Main_3
		LabelD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LabelD.BackgroundTransparency = 1.000
		LabelD.Position = UDim2.new(0.0139372824, 0, 0.15927425, 0)
		LabelD.Size = UDim2.new(1, -16, 0, 45)
		LabelD.Image = "rbxassetid://3570695787"
		LabelD.ImageColor3 = Color3.fromRGB(35, 35, 42)
		LabelD.ScaleType = Enum.ScaleType.Slice
		LabelD.SliceCenter = Rect.new(100, 100, 100, 100)
		LabelD.SliceScale = 0.120

		LabelText.Name = "LabelText"
		LabelText.Text = name
		LabelText.Parent = LabelD
		LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LabelText.BackgroundTransparency = 1.000
		LabelText.Size = UDim2.new(1, 0, 1, 0)
		LabelText.Font = Enum.Font.GothamBlack
		LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
		LabelText.TextSize = 14.000
		Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,49)
	end
	function cat:Toggle(name,callback)
		callback = callback or function() end
		local ToggleD = Instance.new("ImageButton")
		local Toggle = Instance.new("ImageLabel")
		local Frame = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local Title_2 = Instance.new("TextLabel")

		ToggleD.Name = "ToggleD"
		ToggleD.Parent = Main_3
		ToggleD.Active = false
		ToggleD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleD.BackgroundTransparency = 1.000
		ToggleD.Position = UDim2.new(0.0139372824, 0, 0.15927425, 0)
		ToggleD.Selectable = false
		ToggleD.Size = UDim2.new(1, -16, 0, 45)
		ToggleD.Image = "rbxassetid://3570695787"
		ToggleD.ImageColor3 = Color3.fromRGB(25, 25, 25)
		ToggleD.ScaleType = Enum.ScaleType.Slice
		ToggleD.SliceCenter = Rect.new(100, 100, 100, 100)
		ToggleD.SliceScale = 0.120

		Toggle.Name = "Toggle"
		Toggle.Parent = ToggleD
		Toggle.AnchorPoint = Vector2.new(0, 0.5)
		Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.BackgroundTransparency = 1.000
		Toggle.Position = UDim2.new(0.850000024, 0, 0.5, 0)
		Toggle.Size = UDim2.new(0, 65, 0.600000024, 0)
		Toggle.Image = "rbxassetid://3570695787"
		Toggle.ImageColor3 = Color3.fromRGB(45, 45, 45)
		Toggle.ScaleType = Enum.ScaleType.Slice
		Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
		Toggle.SliceScale = 0.080

		Frame.Parent = Toggle
		Frame.BackgroundColor3 = Color3.fromRGB(206, 206, 206)
		Frame.Size = UDim2.new(0.5, 0, 1, 0)

		UICorner_3.Parent = Frame

		Title_2.Name = "Title"
		Title_2.Parent = ToggleD
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.Position = UDim2.new(0, 0, 0.0402777791, 0)
		Title_2.Size = UDim2.new(0, 182, 0, 43)
		Title_2.Font = Enum.Font.GothamBlack
		Title_2.Text = "  "..name
		Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.TextSize = 14.000
		Title_2.TextXAlignment = Enum.TextXAlignment.Left
		local script = Instance.new('LocalScript', ToggleD)

		local togged = false
		script.Parent.MouseButton1Click:Connect(function()
			if togged == false then
				togged = true
				game.TweenService:Create(script.Parent.Toggle.Frame, TweenInfo.new(0.3), {Position = UDim2.new(0.5,0,0, 0)}):Play()
			else
				togged = false
				game.TweenService:Create(script.Parent.Toggle.Frame, TweenInfo.new(0.3), {Position = UDim2.new(0,0,0, 0)}):Play()
			end
			callback(togged)
		end)
		Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,49)
	end
	function cat:Button(name,callback)
		callback = callback or function()end
		local ButtonD = Instance.new("ImageButton")
		local ButtonText = Instance.new("TextButton")

		ButtonD.Name = "ButtonD"
		ButtonD.Parent = Main_3
		ButtonD.Active = false
		ButtonD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonD.BackgroundTransparency = 1.000
		ButtonD.Position = UDim2.new(0.0139372824, 0, 0.15927425, 0)
		ButtonD.Selectable = false
		ButtonD.Size = UDim2.new(1, -16, 0, 45)
		ButtonD.Image = "rbxassetid://3570695787"
		ButtonD.ImageColor3 = Color3.fromRGB(25, 25, 25)
		ButtonD.ScaleType = Enum.ScaleType.Slice
		ButtonD.SliceCenter = Rect.new(100, 100, 100, 100)
		ButtonD.SliceScale = 0.120

		ButtonText.Name = "ButtonText"
		ButtonText.Parent = ButtonD
		ButtonText.Text = name
		ButtonText.Active = false
		ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonText.BackgroundTransparency = 1.000
		ButtonText.Selectable = false
		ButtonText.Size = UDim2.new(1, 0, 1, 0)
		ButtonText.AutoButtonColor = false
		ButtonText.Font = Enum.Font.GothamBlack
		ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ButtonText.TextSize = 14.000
		local script = Instance.new('LocalScript', ButtonD)

		m=game.Players.LocalPlayer:GetMouse()
		local function CircleClick(Button, X, Y)
			coroutine.resume(coroutine.create(function()
				Button.ClipsDescendants = true
				local Circle = Instance.new("ImageLabel")
				local UICorner_34 = Instance.new("UICorner")
				Circle.Name = "Circle"
				Circle.Parent = Button
				Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Circle.BackgroundTransparency = 1.000
				Circle.ZIndex = 10
				Circle.Image = "rbxassetid://266543268"
				Circle.ImageColor3 = Color3.fromRGB(0, 0, 0)
				Circle.ImageTransparency = 0.500

				UICorner_34.CornerRadius = UDim.new(0, 6)
				UICorner_34.Parent = Circle
				local NewX = X - Circle.AbsolutePosition.X
				local NewY = Y - Circle.AbsolutePosition.Y
				Circle.Position = UDim2.new(0, NewX, 0, NewY)
				local Size = 0
				if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.X
				elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.Y
				elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then                                                                                                                                                                                                                                                                                                                      print("This place uses a model by Come0n.") --please do not remove!
					Size = Button.AbsoluteSize.X
				end
				local Time = 0.5
				Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, -Size/2, 0.5, -Size/2), "Out", "Quad", Time, false, nil)
				for i=1,10 do
					Circle.ImageTransparency = Circle.ImageTransparency + 0.035
					wait(Time/10)
				end
				Circle:Destroy()
			end))
		end
		script.Parent.ButtonText.MouseButton1Click:Connect(function()
			CircleClick(script.Parent,m.X,m.Y)
			callback()
		end)
		Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,49)
	end
	function cat:Dropdown(name,tabl,callback)
		callback=callback or function()end
		local DropdownD = Instance.new("ImageButton")
		local TextLabel = Instance.new("TextLabel")
		local Drop = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local Scroll = Instance.new("ScrollingFrame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		local UIPadding_3 = Instance.new("UIPadding")
		local Mini = Instance.new("ImageButton")

		DropdownD.Name = "DropdownD"
		DropdownD.Parent = Main_3
		DropdownD.Active = false
		DropdownD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownD.BackgroundTransparency = 1.000
		DropdownD.Position = UDim2.new(0.264030606, 0, 0.332110077, 0)
		DropdownD.Selectable = false
		DropdownD.Size = UDim2.new(1, -16, 0, 45)
		DropdownD.Image = "rbxassetid://3570695787"
		DropdownD.ImageColor3 = Color3.fromRGB(25, 25, 25)
		DropdownD.ScaleType = Enum.ScaleType.Slice
		DropdownD.SliceCenter = Rect.new(100, 100, 100, 100)
		DropdownD.SliceScale = 0.120

		TextLabel.Parent = DropdownD
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(0, 182, 0, 43)
		TextLabel.Font = Enum.Font.GothamBlack
		TextLabel.Text = "  "..name
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		Drop.Name = "Drop"
		Drop.Parent = DropdownD
		Drop.BackgroundColor3 = Color3.fromRGB(15, 14, 15)
		Drop.BorderSizePixel = 0
		Drop.ClipsDescendants = true
		Drop.Position = UDim2.new(0, 0, 1, 0)
		Drop.Size = UDim2.new(1, 0, 0, 0)
		Drop.ZIndex = 20

		UICorner_4.CornerRadius = UDim.new(0, 6)
		UICorner_4.Parent = Drop

		Scroll.Name = "Scroll"
		Scroll.Parent = Drop
		Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Scroll.BackgroundTransparency = 1.000
		Scroll.BorderSizePixel = 0
		Scroll.Selectable = false
		Scroll.Size = UDim2.new(1, 0, 1, 0)
		Scroll.ZIndex = 21
		Scroll.CanvasSize = UDim2.new(0, 0, 0, 2)
		Scroll.ScrollBarThickness = 6

		UIListLayout_3.Parent = Scroll
		UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 2)

		UIPadding_3.Parent = Scroll
		UIPadding_3.PaddingTop = UDim.new(0, 2)
		for i,v in pairs(tabl) do
			local Button = Instance.new("TextButton")
			local UICorner_5 = Instance.new("UICorner")
		Button.Name = "Button"
		Button.Parent = Scroll
		Button.BackgroundColor3 = Color3.fromRGB(25, 24, 25)
		Button.BorderSizePixel = 0
		Button.Position = UDim2.new(0, 0, 0.208999932, 0)
		Button.Size = UDim2.new(1, -12, 0, 32)
		Button.ZIndex = 22
		Button.AutoButtonColor = false
		Button.Font = Enum.Font.ArialBold
Button.Text = v
		Button.TextColor3 = Color3.fromRGB(230, 230, 230)
		Button.TextSize = 12.000

		UICorner_5.CornerRadius = UDim.new(0, 6)
			UICorner_5.Parent = Button
			Scroll.CanvasSize = Scroll.CanvasSize + UDim2.new(0,0,0,34)
		end
		Mini.Name = "Mini"
		Mini.Parent = DropdownD
		Mini.Active = false
		Mini.AnchorPoint = Vector2.new(0, 0.5)
		Mini.BackgroundTransparency = 1.000
		Mini.Position = UDim2.new(0.925000012, 0, 0.5, 0)
		Mini.Selectable = false
		Mini.Size = UDim2.new(0, 32, 0, 32)
		Mini.ZIndex = 6
		Mini.Image = "rbxassetid://4370337241"
		Mini.ImageColor3 = Color3.fromRGB(230, 230, 230)
		Mini.ScaleType = Enum.ScaleType.Fit
		local script = Instance.new('LocalScript', DropdownD)


		local cooldown = false 
		local ena = false

		local def = script.Parent.TextLabel.Text
		local old = script.Parent.TextLabel.Text
		script.Parent.MouseButton1Click:Connect(function()
			if ena == false then
				ena = true
				old = script.Parent.TextLabel.Text
				game.TweenService:Create(script.Parent.Mini, TweenInfo.new(0.3), {Rotation = -90}):Play()
				game.TweenService:Create(script.Parent.Drop, TweenInfo.new(0.3), {Size = UDim2.new(1, 0,0, 106)}):Play()
				Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,106)
				script.Parent.TextLabel.Text = "  ..."
				for i,v in pairs(script.Parent.Drop.Scroll:GetChildren()) do
					if v:IsA("TextButton") then
						v.MouseButton1Click:Connect(function()
							ena = false
							game.TweenService:Create(script.Parent.Mini, TweenInfo.new(0.3), {Rotation = 0}):Play()
							game.TweenService:Create(script.Parent.Drop, TweenInfo.new(0.3), {Size = UDim2.new(1, 0,0, 0)}):Play()
							Main_3.CanvasSize = Main_3.CanvasSize - UDim2.new(0,0,0,106)
							callback(v.Text)
							script.Parent.TextLabel.Text = def..": "..v.Text
							cooldown = false 



						end)
					end
				end
			else
				ena = false
				game.TweenService:Create(script.Parent.Mini, TweenInfo.new(0.3), {Rotation = 0}):Play()
				game.TweenService:Create(script.Parent.Drop, TweenInfo.new(0.3), {Size = UDim2.new(1, 0,0, 0)}):Play()
				Main_3.CanvasSize = Main_3.CanvasSize - UDim2.new(0,0,0,106)
				script.Parent.TextLabel.Text = old
			end
		end)
		Main_3.CanvasSize = Main_3.CanvasSize + UDim2.new(0,0,0,49)
	end
	return cat;
end
function Lib:SetTop(txt)
	for i1,v1 in pairs(Categories:GetChildren()) do
		if v1.Name == txt then 
			for i,v in pairs(CatList:GetChildren()) do
				if v:IsA("TextButton") then
					if v1.Name == v.Text then
						v1.Visible = true
						game:GetService("TweenService"):Create(v.Omegalul, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(0, 170, 127)}):Play()
						CatText.Text = txt
					end
				end
			end
		elseif Categories:FindFirstChild(txt) == nil then error("Error with processing text... Please check for spelling mistakes.")
		end
	end
end
function Lib:Reload()
	for i,v in pairs(CatList:GetChildren()) do
		if v:IsA("TextButton") then
			v.MouseEnter:Connect(function()
				for i1,v1 in pairs(Categories:GetChildren()) do
					if v1.Name ~= v.Text and v1.Visible == false then
						game:GetService("TweenService"):Create(v.Omegalul, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(170, 170, 255)}):Play()
					end
				end
			end)
			v.MouseLeave:Connect(function()
				for i1,v1 in pairs(Categories:GetChildren()) do
					if v1.Name ~= v.Text and v1.Visible == false then
						game:GetService("TweenService"):Create(v.Omegalul, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(52, 52, 63)}):Play()
					end
				end
			end)
			v.MouseButton1Click:Connect(function()
				for i1,v1 in pairs(Categories:GetChildren()) do
					v1.Visible = false
					if v1.Name == v.Text then
						v1.Visible = true
						CatText.Text = v1.Name
					end
				end
				for i,v2 in pairs(CatList:GetChildren()) do
					if v2:IsA("TextButton") then
						game:GetService("TweenService"):Create(v2.Omegalul, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(52, 52, 63)}):Play()
					end
				end
				game:GetService("TweenService"):Create(v.Omegalul, TweenInfo.new(0.3), {ImageColor3 = Color3.fromRGB(0, 170, 127)}):Play()
			end)
		end
	end
end
game:GetService("UserInputService").MouseIconEnabled = true

game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
return Lib;
