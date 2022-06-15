repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild('Loaded').Value == true
repeat wait() until (#game:GetService("Workspace"):WaitForChild('Mobs'):GetChildren()) > 0
if workspace.Mobs:FindFirstChild("Queen's Egg") then
    repeat wait() until workspace.Mobs:FindFirstChild('Hive Guard') -- wanna kill the guards before it goes to the queen egg in hive raid
end

abort = false
-- detect if outdated script
globalversion = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/version.lua'))()
local promptOverlay = game.CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
promptOverlay.DescendantAdded:Connect(function(Err)
    if Err.Name == "ErrorTitle" and getgenv().settings['autoreconnect'] then
        if string.find(Err.Text, "Disconnected") or string.find(Err.Text, "Teleport Failed") then
            game.Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            game:GetService("TeleportService"):Teleport("2990100290", game.Players.LocalPlayer)
        end
    end
end)

local function load(package)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
end

--// load packages \\--
load('mod')
load('log')
load('commands')

function detectOutdatedScript()
    if not getgenv().settings or not getgenv().settings['version'] then
        return true
    end
    if getgenv().settings['version'] ~= globalversion then
        return true
    end
    return false
end


function getTypeOfServer()
    if workspace:FindFirstChild('BossSETTINGS') then
        return "Raid"
    else
        if workspace:FindFirstChild('W1') or workspace:FindFirstChild('World2') then
            return "Lobby"
        end
    end
end


function getTableSize(table)
    local count = 0
    for _,v in pairs(table) do
        count = count + 1
    end
    return count
end

function getRandomButtonResponse()
    local s = {"ok i go now ty","ight thanks sexy man","alright bro thanks :))))","ty baby girl","Ok UwU","omg outdated script?!?! ok i go get new script cuz im pro :D"}
    return tostring(s[math.random(1,getTableSize(s))])
end

if detectOutdatedScript() then
    local prompt = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/prompt.lua', true))()
    prompt.createPrompt("OUTDATED SCRIPT", "Hi, you're using an outdated script. Go join the discord or head over to the v3rm thread to get the updated script.", getRandomButtonResponse(), true, function(close)
        close()
    end)
end

function invitePlayer(plr)
    local args = {[1] = "Invite",[2] = game:GetService("Players")[plr]}
    game:GetService("ReplicatedStorage").Events.partyEvent:FireServer(unpack(args))
end

if getgenv().settings['autojoin']['enabled'] then
    local userFound
    for _,v in pairs(game.Players:GetPlayers()) do
        if v.Name == getgenv().settings['autojoin']['usertojoin'] then
            userFound = v.Name
        end
    end
    if not userFound then
        while wait(1) do
            local args = {[1] = getgenv().settings['autojoin']['usertojoin'],[2] = "Teleport"}
            game:GetService("ReplicatedStorage").Events.teleport:InvokeServer(unpack(args))
        end
    end
end
function everyoneIsIn()
    wait()
    plrtable = {}
    for _,v in pairs(getgenv().settings['waitforjoiners']['joiners']) do
        if game:GetService("Players").LocalPlayer.PlayerGui.Partylist.Frame:FindFirstChild(v) then
            table.insert(plrtable, v)
        end
    end
    if getTableSize(plrtable) == getTableSize(getgenv().settings['waitforjoiners']['joiners']) then
        plrtable = {}
        return true
    end
    plrtable = {}
    return false
end

function waitForJoiners()
    if getTypeOfServer() == "Lobby" then
        if getgenv().settings['waitforjoiners']['host'] == game.Players.LocalPlayer.Name then
            repeat
                wait()
                for _,v in pairs(getgenv().settings['waitforjoiners']['joiners']) do
                    if game.Players:FindFirstChild(v) then
                        invitePlayer(v)
                        local playerJoined = game:GetService("Players").LocalPlayer.PlayerGui.Partylist.Frame:WaitForChild(v)
                        wait(0.2)
                    end
                end
            until everyoneIsIn()
        end
    end
end


local VirtualInputManager = game:GetService('VirtualInputManager')
VirtualInputManager:SendKeyEvent(true, "U", false, game) -- get rid of the 'click any button' screen
task.wait()
VirtualInputManager:SendKeyEvent(false, "U", false, game)

coroutine.resume(coroutine.create(function()
    thetime = getgenv().settings['leavetimer']
    while task.wait() do
        if thetime == 0 and getTypeOfServer() == "Raid" then
            print'Leave timer reached, leaving.'
            local args = {[1] = "home"}
            game:GetService("ReplicatedStorage").MapSelection:FireServer(unpack(args))
            wait(3)
            game.Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            game:GetService("TeleportService"):Teleport("2990100290", game.Players.LocalPlayer)
        else
            thetime = thetime - 1
        end
        task.wait(1)
    end
end))

if getgenv().settings['waitforjoiners']['enabled'] then
    waitForJoiners()
end

if getTypeOfServer() == "Lobby" then
    if table.find(getgenv().settings['waitforjoiners']['joiners'], game.Players.LocalPlayer.Name) then
        while wait() do
            for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.RaidsGUI:GetChildren()) do
                if v.Name == "Invite" then
                    if v.TextLabel.Text ~= "ZephsyJ" and string.find(v.TextLabel.Text, getgenv().settings['waitforjoiners']['host']) then
                        local button = v:WaitForChild("YES")
                        for i,v in pairs(getconnections(button.MouseButton1Click)) do
                            v:Fire()
                        end
                    end
                end
            end
        end
    end
end

coroutine.resume(coroutine.create(function()
    if getgenv().settings['waitforjoiners']['enabled'] then
        if getTypeOfServer() == "Raid" then
        local d = game.Players:WaitForChild(getgenv().settings['waitforjoiners']['host'], 20)
            if not d then
                local args = {[1] = "home"}
                game:GetService("ReplicatedStorage").MapSelection:FireServer(unpack(args))
                wait(3)
                game.Players.LocalPlayer:Kick("\nRejoining...")
                wait()
                game:GetService("TeleportService"):Teleport("2990100290", game.Players.LocalPlayer)
            end
        end
    end
end))

coroutine.resume(coroutine.create(function(v)
    while wait(1) do
        if getgenv().settings['autojoinraid']['enabled'] then
            if workspace:FindFirstChild('W1') or workspace:FindFirstChild('QuestNPCs') then
                if getgenv().settings['waitforjoiners']['enabled'] then
                    if not table.find(getgenv().settings['waitforjoiners']['joiners'], game.Players.LocalPlayer.Name) then
                        local dungeon = getgenv().settings['autojoinraid']['dungeon']
                        local hardcore = getgenv().settings['autojoinraid']['hardcore']
                        local args = {[1] = "Raid", [2] = dungeon, [3] = hardcore}
                        game:GetService("ReplicatedStorage").Events.raidEvent:FireServer(unpack(args))
                    end
                else
                    local dungeon = getgenv().settings['autojoinraid']['dungeon']
                    local hardcore = getgenv().settings['autojoinraid']['hardcore']
                    local args = {[1] = "Raid", [2] = dungeon, [3] = hardcore}
                    game:GetService("ReplicatedStorage").Events.raidEvent:FireServer(unpack(args))
                end
            end
        end
    end
end))

function swingdasword()
    local args = {[1] = "Slash"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
    local args = {[1] = "T"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args)) 
    local args = {[1] = "E"}
    game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
end

function lookAt(chr,target) -- found this func somewhere
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position 
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end

pcall(function()
function sell()
    if getgenv().settings['autosell']['enabled'] then
        for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.ScrollingFrame:GetChildren()) do
            if v:IsA('TextButton') and v:FindFirstChild('ItemName').Value ~= "" then
                local name = v.ItemName.Value
                local ID = v.ID.Value
                
                if table.find(getgenv().settings['autosell']['items'], name) then
                    
                    local args = {[1] = "Sell",[2] = {[1] = {[1] = ID}}}
                    game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                end
            end
        end
    end
end
end)

sell()
        
function gettarget()
    local target = game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Crystal') or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChild('Stand')
    if not target then
        target = workspace:WaitForChild('Mobs'):FindFirstChild("Hive Queen") or workspace:WaitForChild('Mobs'):FindFirstChild("Hive Guard") or game:GetService("Workspace"):WaitForChild('Mobs'):FindFirstChildWhichIsA("Model")
    end
    if target then
        if getgenv().settings['farmsettings']['mobsettings'][target.Name] then
            return target, getgenv().settings['farmsettings']['mobsettings'][target.Name]['x'], getgenv().settings['farmsettings']['mobsettings'][target.Name]['y'], getgenv().settings['farmsettings']['mobsettings'][target.Name]['z'], getgenv().settings['farmsettings']['mobsettings'][target.Name]['type']
        else
            return target
        end
    end
end

function farmraid()
    task.wait()
    if getTypeOfServer() == "Raid" then -- make sure its a raid 
        for _,v in pairs(game.Workspace.misc:GetChildren()) do
            if v:FindFirstChild('Beam') then
                game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(23277, 2206, 376)
                repeat
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(1,0,0)
                    wait(0.1)
                until not v:IsDescendantOf(game.Workspace.misc)
            end
        end
        if workspace.misc:FindFirstChild('Rockwall') then
            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
                if v:IsA('TextLabel') then
                    if v.Name == "Speech" then
                        local t = v.Text
                        local foundNumber = string.gsub(t, 'Get behind a wall before the swarm comes %(','')
                        local foundNumber = string.gsub(foundNumber, '%)','')
                        if tonumber(foundNumber) == 1 then
                            pcall(function()
                                repeat
                                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = game:GetService("Workspace").misc:FindFirstChild('Rockwall'):FindFirstChild('Safe').CFrame
                                    task.wait()
                                until not game:GetService("Workspace").misc:FindFirstChild('Rockwall'):IsDescendantOf(game.Workspace) or getgenv().adaffvca
                            end)
                        end
                    end
                end
            end
        end
        if workspace.misc:FindFirstChild('Blackhole') then
            local s,e = pcall(function()
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(100,500,100)
                until not workspace.misc.Blackhole:IsDescendantOf(workspace.misc)
            end)
            if e then
                print(s)
            end
        end
        if workspace.Mobs:FindFirstChild('Hive Guard') then
            for _,v in pairs(workspace.Mobs:GetChildren()) do
                if v.Name == "Hive Guard" then
                    pcall(function()
                        if not workspace.Mobs:FindFirstChild('Hive Queen') then
                            if v.Humanoid.WalkToPoint == Vector3.new(0,0,0) then
                                swing = true
                                repeat
                                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0,0,7)
                                    lookAt(game.Players.LocalPlayer.Character, v.HumanoidRootPart)
                                    task.wait()
                                until abort or getgenv().adaffvca or v.Humanoid.WalkToPoint ~= Vector3.new(0,0,0) or not v:IsDescendantOf(workspace.Mobs)
                                swing = false
                            end
                        end
                    end)
                end
            end
        end

        local mob, x, y, z, type = gettarget()

        if mob then
            if mob.Name == "Sentry" then -- we dont wanna target useless stuff right
                game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(100,500,100)
                task.wait()
                farmraid()
                return
            end

            swing = true
            repeat
                if table.find(getgenv().settings['farmsettings']['silencers'], game.Players.LocalPlayer.Name) then
                    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0,0,5)
                else
                    if not type then
                        if getgenv().adaffvca then
                            return
                        end
                        game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(0,0,getgenv().settings['farmsettings']['range']) 
                    else
                        if type == '+' then
                            if getgenv().adaffvca then
                                return
                            end
                            game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = mob.HumanoidRootPart.CFrame + Vector3.new(x,y,z)
                        else
                            if getgenv().adaffvca then
                                return
                            end
                            game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(x,y,z)
                        end
                    end
                end
                lookAt(game.Players.LocalPlayer.Character, mob.HumanoidRootPart)
                task.wait()
            until abort or getgenv().adaffvca or not mob:IsDescendantOf(workspace.Mobs) or not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health == 0 or mob:FindFirstChild('Humanoid').Health == 0
            swing = false
            abort = false
            getgenv().adaffvca = false
            farmraid()
            return
        else
            if getgenv().settings["teleportinairwhennomob"] then
                game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(100,500,100)
            end
            farmraid()
        end
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(1)
    farmraid()
end)
workspace:WaitForChild('Mobs').ChildAdded:Connect(function(v) -- for shadow palace and crystal caverns 
    if v.Name == "Stand" or "Crystal" then
        abort = true
        farmraid()
    end
end)

workspace.misc.ChildAdded:Connect(function(v) -- for hive so u dont die
    if v.Name == "Rockwall" then
        abort = true
        farmraid()
    end
end)

pcall(function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetDescendants()) do
        if v:IsA('TextLabel') then
            if v.Name == "Speech" then
                v:GetPropertyChangedSignal('Text'):connect(function()
                    local t = v.Text
                    if string.find(t, "Get behind a wall") then
                        local foundNumber = string.gsub(t, 'Get behind a wall before the swarm comes %(','')
                        local foundNumber = string.gsub(foundNumber, '%)','')
                        if tonumber(foundNumber) == 1 then
                            abort = true
                            farmraid()
                        end
                    end
                end)
            end
        end
    end
end)

game.Workspace.misc.DescendantAdded:connect(function(v)
    if v.Name == "Beam" then
        getgenv().adaffvca = true
        farmraid()
    end
end)

coroutine.resume(coroutine.create(function() -- gotta be safe.. also swinging dont matter much in end game anyway
    while task.wait(0.1) do
        if swing then
            if getgenv().settings['farmsettings']['autoswing'] then
                swingdasword()
                wait(0.4)
            end
        end
    end        
end))

coroutine.resume(coroutine.create(function()
    while wait(0.5) do
        if getgenv().settings['autoopencrystalbags'] then
            local args = {[1] = "Open",[2] = "666"}
            game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
            local args = {[1] = "Open",[2] = "6666"}
            game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
            local args = {[1] = "Open",[2] = "66666"}
            game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))                                
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while wait() do
        if autodrankthepotions or getgenv().settings['autodrinkpotions'] then 
            game:GetService("ReplicatedStorage").Events.drink:FireServer()
        end
    end
end))

coroutine.resume(coroutine.create(function()
    pcall(function()
        while wait(3) do
            for _,v in pairs(game:GetService("Workspace").RandomKey:GetChildren()) do
                pcall(function()
                    if v:IsA('Model') then
                        fireclickdetector(v.Click.ClickDetector)
                    end
                end)
            end
            fireclickdetector(workspace.Obby.Box.Click.ClickDetector)
        end
    end) 
end))

for _,v in pairs(workspace.Mobs:GetChildren()) do
    if v.Name == "Damage Egg" or v.Name == "Egg" then
        v:Destroy()
    end
end
local startTime = tick()
game.StarterGui:SetCore("SendNotification", {
Title = "Discord";
Text = "the discord is https://discord.com/invite/mwfAyYZ57P";
Duration = math.huge;
})

coroutine.resume(coroutine.create(function()
farmraid()
end))

coroutine.resume(coroutine.create(function()
    while wait(1) do
        if (doautoskill or getgenv().settings['autoskill']['autoskill1']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "Q", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "Q", false, game)
        end
        wait()
        if (doautoskill or getgenv().settings['autoskill']['autoskill2']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "E", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "E", false, game)
        end
        wait()
        if (doautoskill or getgenv().settings['autoskill']['autoskill3']) and not workspace:FindFirstChild('W1') and not workspace:FindFirstChild('QuestNPCs') then
            VirtualInputManager:SendKeyEvent(true, "R", false, game)
            wait()
            VirtualInputManager:SendKeyEvent(false, "R", false, game)
        end
    end
end))

game:GetService("Players").LocalPlayer.PlayerGui.Partylist.Redo.Count:GetPropertyChangedSignal('Text'):Connect(function()
    if getgenv().settings['webhook']['enabled'] then
        local content;
        if getgenv().settings['webhook']['pingeveryone'] then
            content = "@everyone"
        end
        if getgenv().settings['webhook']['discordid'] ~= nil then
            content = '<@' .. getgenv().settings['webhook']['discordid'] .. ">"
        end
        if not content then
            content = ""
        end
        local data = {
            ["content"] = content,
            ["embeds"] = {
                {
                    ["title"] = "Successful Raid",
                    ['description'] = [[
                        **User**: ||]] .. game.Players.LocalPlayer.Name .. [[||
                        **Level**: ]] ..  game:GetService("Players").LocalPlayer.PlayerGui.Playerlist.Container.ScrollingFrame[game.Players.LocalPlayer.Name].Stats.Level.Text .. [[
                        **Gold**: ]] .. game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Gold.Amount.Text .. [[
                        **Crystals**: ]] .. game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Crystal.Amount.Text .. [[
                        **Raid Coins**: ]] .. game:GetService("Players").LocalPlayer.PlayerGui.StatsUI.Frame.Currency.Coins.Amount.Text .. [[ 
                        **Completion Time**: ]] .. tostring(tick() - startTime) .. 's',
                    ["type"] = "rich",
                    ["color"] = tonumber(0xcfd9de),
                    ["footer"] = {
                        ["text"] = "RPG Simulator - Zen X";
                        ["icon_url"] = "https://cdn.discordapp.com/attachments/626185393707941889/940776650700914708/228-2280201_transparent-zen-circle-png-zen-circle-png-png-removebg-preview-removebg-preview.png"; -- The image icon you want your footer to have
                    },
                    ["timestamp"] = DateTime.now():ToIsoDate(),
                }
            }
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        
        local headers = {
        ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = getgenv().settings['webhook']['url'], Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
end)


game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(v)
    if v.Name == "Thaw" then
        local button = v:WaitForChild('TextButton')
        while task.wait() do
            for i,v in pairs(getconnections(button.MouseButton1Click)) do
                v:Fire()
            end
        end
    end
end)

game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:connect(function(v)
    if v:IsA('Frame') then
        local text = v:WaitForChild('TextLabel')
        if getgenv().settings['webhook']['enabled'] then
            for _,items in pairs(getgenv().settings['webhook']['itemnotifier']) do
                if string.find(text.Text, items) then
                        local data = 
                        {
                            ["content"] = "@everyone";
                            ["embeds"] = {{
                                ["title"] = "Item Notifier"; 
                                ["description"] = [[
                                    **User**: ||]] .. game.Players.LocalPlayer.Name .. [[||
                                    **Item Name**: ]] .. items,
                                ["color"] = tonumber(0xcfd9de);
                                ["footer"] = {
                                    ["text"] = "RPG Simulator - Zen X";
                                    ["icon_url"] = "https://cdn.discordapp.com/attachments/626185393707941889/940776650700914708/228-2280201_transparent-zen-circle-png-zen-circle-png-png-removebg-preview-removebg-preview.png"; -- The image icon you want your footer to have
                                };
                                ["timestamp"] = DateTime.now():ToIsoDate();
                                
                            }}
                        }
                    
                    local newdata = game:GetService("HttpService"):JSONEncode(data)
                    
                    local headers = {
                    ["content-type"] = "application/json"
                    }
                    request = http_request or request or HttpPost or syn.request
                    local abcdef = {Url = getgenv().settings['webhook']['url'], Body = newdata, Method = "POST", Headers = headers}
                    request(abcdef)
                end
            end
        end
    end
end)

wait(5)
if getTypeOfServer() == "Raid" then
    if getgenv().settings['waitforjoiners']['enabled'] then
        local tablea = {}
        for _,v in pairs(getgenv().settings['waitforjoiners']['joiners']) do
            table.insert(tablea, v)
        end
        table.insert(tablea, getgenv().settings['waitforjoiners']['host'])
        local erra
        for _,v in pairs(tablea) do
            if not game.Players:FindFirstChild(v) then
                erra = true
            end
        end
        if erra then 
            game.Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            game:GetService("TeleportService"):Teleport("2990100290", game.Players.LocalPlayer)
        end
    end
end
