local loader = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local mainframe = Instance.new("Frame")
local logo = Instance.new("ImageLabel")
local durationHolder = Instance.new("Frame")
local duration = Instance.new("Frame")
local title = Instance.new("TextLabel")
local hello = Instance.new("TextLabel")
local desc = Instance.new("TextLabel")
local logo2 = Instance.new("ImageLabel")

--Properties:

loader.Name = "loader"
loader.Parent = game.CoreGui
loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = loader
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 1.000
main.Size = UDim2.new(0, 1170, 0, 635)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)

mainframe.Name = "mainframe"
mainframe.Parent = main
mainframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainframe.Position = UDim2.new(0.309624672, 0, 0.308661401, 0)
mainframe.Size = UDim2.new(0, 445, 0, 242)

logo.Name = "logo"
logo.Parent = mainframe
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 1.000
logo.Position = UDim2.new(0.0134831369, 0, 0.0289256275, 0)
logo.Size = UDim2.new(0, 21, 0, 21)
logo.Image = "http://www.roblox.com/asset/?id=8889875684"

durationHolder.Name = "durationHolder"
durationHolder.Parent = mainframe
durationHolder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
durationHolder.BorderSizePixel = 0
durationHolder.Position = UDim2.new(0, 0, 0.991735518, 0)
durationHolder.Size = UDim2.new(0, 445, 0, 2)

duration.Name = "duration"
duration.Parent = durationHolder
duration.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
duration.BorderSizePixel = 0
duration.Position = UDim2.new(0, 0, 0.991729736, 0)
duration.Size = UDim2.new(0, 0, 0, 2)

title.Name = "title"
title.Parent = mainframe
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.0741572976, 0, 0.0371900797, 0)
title.Size = UDim2.new(0, 42, 0, 17)
title.Font = Enum.Font.GothamBold
title.Text = "Zen X"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left

hello.Name = "hello"
hello.Parent = mainframe
hello.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hello.BackgroundTransparency = 1
hello.Position = UDim2.new(0.0337078646, 0, 0.219008267, 0)
hello.Size = UDim2.new(0, 287, 0, 23)
hello.Font = Enum.Font.GothamBold
hello.Text = "Hello, OnlyTwentyCharacters!"
hello.TextColor3 = Color3.fromRGB(255, 255, 255)
hello.TextScaled = true
hello.TextSize = 14.000
hello.TextWrapped = true
hello.TextXAlignment = Enum.TextXAlignment.Left

desc.Name = "desc"
desc.Parent = mainframe
desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
desc.BackgroundTransparency = 1
desc.Position = UDim2.new(0.0337078646, 0, 0.311294794, 0)
desc.Size = UDim2.new(0, 238, 0, 14)
desc.Font = Enum.Font.GothamBold
desc.Text = "Please wait while we load Zen X.."
desc.TextColor3 = Color3.fromRGB(255, 255, 255)
desc.TextScaled = true
desc.TextSize = 14.000
desc.TextStrokeTransparency = 0.400
desc.TextTransparency = 0.330
desc.TextWrapped = true
desc.TextXAlignment = Enum.TextXAlignment.Left

logo2.Name = "logo2"
logo2.Parent = mainframe
logo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo2.BackgroundTransparency = 1.000
logo2.Position = UDim2.new(0.404494375, 0, 0.487603307, 0)
logo2.Size = UDim2.new(0, 84, 0, 84)
logo2.Image = "http://www.roblox.com/asset/?id=8889875684"

hello.Text = "Hello, " .. game.Players.LocalPlayer.Name .. "!"

getgenv()["ZenXLoader"] = {}
local loader = getgenv()["ZenXLoader"]

function loader:SetProgress(n)
    duration:TweenSize(UDim2.new(0, n, 0, 2), 'Out', 1, true)
end

function loader:Delete()
    loader:Destroy()
end

return loader
