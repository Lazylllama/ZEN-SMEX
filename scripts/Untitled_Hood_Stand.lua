repeat wait() until game:IsLoaded()
pcall(function()
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild('FULLY_LOADED_CHAR')
end)
if getgenv().loaded then
    getgenv().loaded = false
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end
local player = game.Players.LocalPlayer
players = game.Players
local VirtualInputManager = game:GetService('VirtualInputManager')
local gun = "[Revolver]"
table.insert(hosts, "Iaderite")
table.insert(hosts, "V_GLys")
local gunname = "[Revolver] - $1300"
    local randomPlayer = game.Players:GetPlayers()
[math.random(1,#game.Players:GetPlayers())]

local function m1click() 
    VirtualInputManager:SendMouseButtonEvent(0,0,0,true,game,0)
end
function lookAt(chr,target)
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end

local function ApplyPredictionFormula(SelectedPart)
    return SelectedPart.CFrame + (SelectedPart.Velocity * 0.165)
end

function forceReset()
    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v:Destroy()
        end
    end
end

getgenv().selectedpart = nil
local function ApplyPredictionFormula(SelectedPart)
    return SelectedPart.CFrame + (SelectedPart.Velocity * 0.165)
end
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        local SelectedPart = getgenv().selectedpart
        if (k == "Hit" or k == "Target") and getgenv().spinning then
            local Hit = ApplyPredictionFormula(getgenv().selectedpart)
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
    return __index(t, k)
end)

local gun = "[Revolver]"
local gunname = "[Revolver] - $1300"

local orbitDistance = 7
local orbitSpeed = 7

function gunCheck()
    if not player.Backpack:FindFirstChild(gun) and not player.Character:FindFirstChild(gun) then
        repeat
            task.wait()
            player.Character:WaitForChild('HumanoidRootPart').CFrame = workspace.Ignored.Shop:FindFirstChild(gunname).Head.CFrame + Vector3.new(0, -4, 0)
            fireclickdetector(workspace.Ignored.Shop:FindFirstChild(gunname).ClickDetector)
        until player.Backpack:FindFirstChild(gun) 
    end
    if player.Backpack:FindFirstChild(gun) then
        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChild(gun))
        wait(0.1)
        if player.Backpack:FindFirstChild(gun) then
            player.Backpack:FindFirstChild(gun):Destroy()
        end
    end
    if tonumber(player.DataFolder.Inventory["[Revolver]"].Value) < 11 then
        repeat
            task.wait(0.1)
            player.Character:WaitForChild('HumanoidRootPart').CFrame = workspace.Ignored.Shop:FindFirstChild('12 [Revolver Ammo] - $75').Head.CFrame + Vector3.new(0, -4, 0)
            fireclickdetector(workspace.Ignored.Shop:FindFirstChild('12 [Revolver Ammo] - $75').ClickDetector)
        until tonumber(player.DataFolder.Inventory["[Revolver]"].Value) > 300
    end
end

task.spawn(function()
    while task.wait() do
        if getgenv().spinning then
            task.wait(0.7)
            if player.Character:FindFirstChild(gun) then
                if tostring(player.Character:FindFirstChild(gun).Ammo.Value) == "0" then
                    VirtualInputManager:SendKeyEvent(true, "R", false, game)
                end
            end
        end
    end
end)

function spin(target, stomp, op)
    if not getgenv().spinning then
        local locPlayer = game.Players.LocalPlayer
        local mCos = math.cos
        local mSin = math.sin
        
        local time = 0
        
        local heartBeat
        local target = target
        local stomp = stomp
        getgenv().spinning = true
        abort = true
        task.wait()
        abort = false
        heartBeat = game:GetService('RunService').Heartbeat:Connect(function(dt) 
            time = time + dt
            local targPlayer = game.Players:FindFirstChild(target)
            if targPlayer then
                local targChr = targPlayer.Character
                local selfChr = locPlayer.Character
                local forceField
                if targChr then
                    forceField = targChr:FindFirstChild('Forcefield')
                end
                if (targChr and selfChr) and players:FindFirstChild(target) and not players[target].BodyEffects["K.O"].Value and getgenv().spinning and not forceField and not abort then
                    gunCheck()
                    local targPos = targChr.HumanoidRootPart.Position
                    selfChr.HumanoidRootPart.CFrame = CFrame.new(
                        targPos + Vector3.new(
                            mCos(time * orbitSpeed) * orbitDistance, 
                            0, 
                            mSin(time * orbitSpeed) * orbitDistance
                        ), targPos
                    ) 

                    getgenv().selectedpart = players[target].Character.HumanoidRootPart
                    lookAt(player.Character, players[target].Character.HumanoidRootPart)
                    m1click()
                elseif stomp and not players[target].BodyEffects["Dead"].Value then
                    pcall(function()
                        player.Character:WaitForChild('HumanoidRootPart').CFrame = players[target].Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                        game:GetService("ReplicatedStorage")['.gg/untitledhood']:FireServer("Stomp")
                    end)
                elseif players[target].BodyEffects["Dead"].Value then
                    heartBeat:Disconnect()
                    getgenv().spinning = false
                    abort = false
                    if autokill then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(578.9550170898438, 90.28351593017578, -820.1714477539062)
                        elseif op ~= nil then
                        player.Character.HumanoidRootPart.CFrame = game.Players[op].Character.HumanoidRootPart.CFrame
                    end
                else
                    heartBeat:Disconnect()
                    getgenv().spinning = false
                    abort = false
                    if autokill then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(578.9550170898438, 90.28351593017578, -820.1714477539062)
                    elseif op ~= nil then
                        player.Character.HumanoidRootPart.CFrame = game.Players[op].Character.HumanoidRootPart.CFrame
                    end
                end
            else
                heartBeat:Disconnect()
                getgenv().spinning = false
                abort = false
                if autokill then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(578.9550170898438, 90.28351593017578, -820.1714477539062)
                    elseif op ~= nil then
                    player.Character.HumanoidRootPart.CFrame = game.Players[op].Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end
end

function savePlayer(target)
    abort = true
    if players[target].BodyEffects["K.O"].Value then
        repeat
            player.Character.HumanoidRootPart.CFrame = players[target].Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer("Grabbing",false)
            task.wait(0.2)
        until players[target].BodyEffects:FindFirstChild('KOED_DEBUG')
        task.wait()
        player.Character.HumanoidRootPart.CFrame = CFrame.new(820.9390869140625, 89.80995178222656, -1083.58154296875)
    end
    wait(1)
    game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer("Grabbing",false)
    abort = false
end

function bringPlayer(target, plr)
    abort = true    
    local pos = game.Players[plr].Character.HumanoidRootPart.CFrame
    spin(target, false)
    pcall(function()
        repeat
            player.Character.HumanoidRootPart.CFrame = players[target].Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer("Grabbing",false)
            task.wait()
        until players[target].BodyEffects:FindFirstChild('KOED_DEBUG')
    end)
    player.Character.HumanoidRootPart.CFrame = pos
    chat('Here is ' .. msg[2] .. ', ' .. plr)
    wait(1)
    game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer("Grabbing",false)
    abort = false
end
stompConnections = {}
function autoStompAll()
    local function registerStompUser(v)
        if not table.find(getgenv().hosts, v.Name) or not table.find(getgenv().users, v.Name) then 
            local con = v.BodyEffects['K.O']:GetPropertyChangedSignal('Value'):Connect(function()
                if autostomp then
                    if v.BodyEffects['K.O'].Value then
                        abort = true
                        repeat
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(v.Character.HumanoidRootPart.Position.X, v.Character.HumanoidRootPart.Position.Y, v.Character.HumanoidRootPart.Position.Z)) * CFrame.new(0,3,0)
                            game:GetService("ReplicatedStorage")['.gg/untitledhood']:FireServer("Stomp")
                            task.wait()
                        until v.BodyEffects['Dead'].Value or not v.BodyEffects['K.O'].Value
                        abort = false
                        chat("I've stomped " .. v.DisplayName)
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(820.9390869140625, 89.80995178222656, -1083.58154296875)
                    end
                end
            end)
            table.insert(stompConnections, con)
        end
    end
    if not autostomp then
        autostomp = true
        for _,v in pairs(game.Players:GetPlayers()) do
            registerStompUser(v)
        end
        task.wait()
        chat('Autostomping everyone who gets knocked.')
    else
        autostomp = false
        for _,v in pairs(stompConnections) do
            v:Disconnect()
        end
        task.wait()
        chat('No longer autostomping')
    end
end

local Heartbeat = game:GetService("RunService").Heartbeat
local Animate = player.Character.Animate
local standConnections = {}
function stand(user)
    if not abort then
        abort = true
        task.wait()
        abort = false
        local heartBeat
        local v = game.Players[user]
        local d = game.Players[user].DisplayName
        for _,v in pairs(standConnections) do
            v:Disconnect() 
        end
        local con = Heartbeat:Connect(function()
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.CFrame.lookVector * -4 + Vector3.new(0,2,3)
            end)
        end)
        table.insert(standConnections, con)
        chat('By your side, ' .. d)
    end
end
function unfollow()
    for _,v in pairs(standConnections) do
        print(v)
        v:Disconnect() 
    end
end
function vala(msg)
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if string.sub(string.lower(v.DisplayName),1,string.len(msg)) == string.lower(msg) then
                return v.Name
            end
        end
    end
    return msg
end

function chat(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

spawn(function()
    while wait() do
        if autokill then
            wait(1)
            spin(autokilltarget, true)
        end
    end
end)

local follow = {"I follow you, ","Lets go, ", "Keeping you safe, "}
local summon = {'Hello, ',"At your service, ", "I'm here, ","Let's begin, ", "Waiting for your commands, "}
local prefix = '!'
function register(v)
    if table.find(hosts, v) or table.find(users, v) then 
        game.Players[v].Chatted:Connect(function(val)
            msg = string.split(val," ")
            if msg[2] then
                msg[2] = vala(msg[2])
            end
            if msg[1] == 'kill'..prefix then
                if msg[2] and game.Players:FindFirstChild(msg[2]) then
                    chat('Killing ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                    spin(msg[2], true, v)
                    player.Character.HumanoidRootPart.CFrame = players[v].Character.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
                    chat('I killed ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                end
            elseif msg[1] == 'autokill'..prefix then
                if msg[2] and game.Players:FindFirstChild(msg[2]) then
                    if not autokill then
                        chat('Autokilling ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                        autokilltarget = msg[2]
                        autokill = true
                    else
                        autokill = false
                        autokilltarget = nil
                        wait(1)
                        player.Character.HumanoidRootPart.CFrame = players[v].Character.HumanoidRootPart.CFrame + Vector3.new(0,0,3)
                        chat('Stopped autokilling ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                    end
                end
            elseif msg[1] == 'knock'..prefix then
                if msg[2] and game.Players:FindFirstChild(msg[2]) then
                    chat('Knocking ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                    spin(msg[2], false, v)
                    chat('Knocked ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                end
            elseif msg[1] == 'bring'..prefix then
                if msg[2] and game.Players:FindFirstChild(msg[2]) then
                    chat('Bringing ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                    bringPlayer(msg[2], v)
                end
            elseif msg[1] == 'save'..prefix then
                if msg[2] then
                    chat('Saving ' .. msg[2] .. ', ' .. game.Players[v].DisplayName)
                    savePlayer(msg[2])
                elseif not msg[2] then
                    chat("I'm saving you, " .. game.Players[v].DisplayName)
                    savePlayer(v)
                end
            elseif msg[1] == 'summon'..prefix then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
                chat(summon[math.random(1, #summon)] .. game.Players[v].DisplayName)
            elseif msg[1] == 'tp'..prefix then
                player.Character.HumanoidRootPart.CFrame = game.Players[msg[2]].Character.HumanoidRootPart.CFrame
            elseif msg[1] == 'reset'..prefix then
                abort = true
                task.wait()
                forceReset()
                abort = false
            elseif msg[1] == 'abort'..prefix then
                abort = true
                task.wait()
                abort = false
            elseif msg[1] == 'rejoin'..prefix then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            elseif msg[1] == 'autostomp'..prefix then
                autoStompAll()
            elseif msg[1] == 'say'..prefix then
                task.wait()
                chat(msg[2])
            elseif msg[1] == 'drop'..prefix then
                game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer("Grabbing",false)
            elseif msg[1] == 'follow'..prefix then
                chat(follow[math.random(1, #follow)] .. game.Players[v].DisplayName)
                stand(v)
            elseif msg[1] == 'unfollow'..prefix then
                unfollow()
            elseif msg[1] == 'add'..prefix then
                if table.find(hosts, v) then
                    table.insert(users, msg[2])
                    register(msg[2])
                else
                    chat('lol mans thought he can add himself??')
                end
            end
        end)
        chat('Registered ' .. game.Players[v].DisplayName)
    end
end

for _,v in pairs(game.Players:GetPlayers()) do
    register(v.Name)
end

game.Players.ChildAdded:Connect(function(v)
    register(v.Name)
end)

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if players:FindFirstChild(player) and player.BodyEffects['K.O'].Value then
            forceReset()
        end
    end
end))


getgenv().loaded = true
warn'loaded'
