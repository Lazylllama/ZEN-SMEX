-- // dont skid moon!
repeat task.wait() until game:IsLoaded()
pcall(function()
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild('FULLY_LOADED_CHAR')
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/Key2.lua'))()

local function load(package)
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
    end)
end

--// load packages \\--
load('log')
load('mod')
load('commands')

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService('Players')

-- // Vars
local player = players.LocalPlayer
local chr
pcall(function()
repeat task.wait() chr = player.Character until chr
end)
local hrp = chr:WaitForChild('HumanoidRootPart')
local KO = chr.BodyEffects["K.O"]
local mt = getrawmetatable(game)
local backupnamecall = mt.__namecall
local backupnewindex = mt.__newindex
local backupindex = mt.__index 
setreadonly(mt, false)


mt.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" then
        local remoteName = tostring(args[1])
        if remoteName == ".gg/untitledhood" then
            if args[2] == "TeleportDetect" then
                return nil
            end
        end
    end
    
    return backupnamecall(...)
end)

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        local SelectedPart = getgenv().selectedpart
        if (k == "Hit" or k == "Target") then
            local Hit = SelectedPart.CFrame
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
    return __index(t, k)
end)

-- // Functions

function hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

function forceReset()
    for _,v in pairs(chr:GetDescendants()) do
        if v:IsA("BasePart") then
            v:Destroy()
        end
    end
end

function lookAt(chr,target)
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position 
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end

local VirtualInputManager = game:GetService('VirtualInputManager')
local function m1click() 
    VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,0)
    task.wait()
    VirtualInputManager:SendMouseButtonEvent(0,0,0,false,game,0)
end

abort = false
function ATM()
    task.wait(2)
    if not getgenv().zenpassed then
        game:Shutdown()
    end
    for _,v in pairs(workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 1 then
            local part = v.Open
            repeat
                pcall(function()
                    chr.HumanoidRootPart.CFrame = v.Head.CFrame + Vector3.new(3, -2, 0)
                end)
                lookAt(chr, v.Open)
                getgenv().selectedpart = v.Open
                task.wait(0.2)
                m1click()
            until v.Humanoid.Health < 2 or KO.Value == true or abort == true
            task.wait()
            if KO.Value == true then
                forceReset()
            end
            pcall(function()
            chr.HumanoidRootPart.CFrame = v.Open.CFrame + Vector3.new(2, 0, 0)
            end)
            task.wait(0.1)
            for _,v in pairs(workspace.Ignored.Drop:GetChildren()) do
                if v:IsA('Part') and v.Name == "MoneyDrop" then
                    repeat
                        pcall(function()
                            chr.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                        end)
                        fireclickdetector(v:WaitForChild('ClickDetector'))
                        task.wait()
                    until not v:IsDescendantOf(workspace.Ignored.Drop)
                end
            end
        end
    end
    if getgenv().serverhop then
        local num = math.random(5,12)
        game.StarterGui:SetCore("SendNotification", {
            Title = "SERVER HOP DELAY";
            Text = "While farming, roblox ratelimites you due to server hopping too much. Hopefully this delay will somewhat prevent that. Delay: " .. tostring(num);
            Duration = num;
        })
        wait(num)
        hop()
    else 
        ATM() 
    end
end

player.CharacterAdded:Connect(function() ATM() end)
aad = false
function check()
    if not player.Backpack:FindFirstChild('Mask') and not chr:FindFirstChild("Mask") then
        repeat
            task.wait(0.3)
            pcall(function()
            chr.HumanoidRootPart.CFrame = workspace.Ignored.Shop["[Surgeon Mask] - $25"].Head.CFrame + Vector3.new(0, 5, 0)
            end)
            task.wait(0.3)
            fireclickdetector( workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
        until player.Backpack:FindFirstChild('Mask')
        chr.Humanoid:EquipTool(player.Backpack["Mask"])
        task.wait(0.1)
        m1click()
    end
    if not player.Backpack:FindFirstChild('[Double-Barrel SG]') and not chr:FindFirstChild("[Double-Barrel SG]") then
        repeat
            task.wait(0.3)
            chr.HumanoidRootPart.CFrame = workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].Head.CFrame + Vector3.new(0, 5, 0)
            task.wait(0.3)
            fireclickdetector( workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        until player.Backpack:FindFirstChild('[Double-Barrel SG]')
    end
    if player.Backpack:FindFirstChild('[Double-Barrel SG]') then
        chr.Humanoid:EquipTool(player.Backpack:FindFirstChild('[Double-Barrel SG]'))
    end
    if player.DataFolder.Inventory["[Double-Barrel SG]"].Value == "0" then
        chr.Humanoid.Health = 0
    end
    if chr:FindFirstChild("[Double-Barrel SG]") then
        VirtualInputManager:SendKeyEvent(true, "R", false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, "R", false, game)
    end
    aad = true
end

spawn(function()
    while task.wait() do
        check()
    end
end)

repeat task.wait() until aad

spawn(function()
    while task.wait(100) do
        if getgenv().serverhop then hop() end
    end
end)
game.StarterGui:SetCore("SendNotification", {
    Title = "KEY SYSTEM";
    Text = "INFINITE CASH METHOD in .gg/zen, go to roles and react to uhood";
    Duration = 9e9;
})


local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


ATM()
