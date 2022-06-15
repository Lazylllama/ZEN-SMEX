local commands = {}
local prefix = "/"
local Noclipping = nil
local player = game.Players.LocalPlayer

commands.e = function(arguments)
    local CMD = arguments[1]
    
    if CMD == 'rejoin' or CMD == 'rj' then
        game.Players.LocalPlayer:Kick("Rejoining")
        wait()
        game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
    end
    if CMD == 'serverhop' or CMD == 'shop' then
        -- from cmdx or iy?/ idk
        local x = {}
        for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
            if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
                x[#x + 1] = v.id
            end
        end
        if #x > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
        else
            print('failed to find server')
        end
    end
    -- trash method of korblox
    if CMD == 'korblox' then
        local Leg = 'Right' 
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
            char[Leg..'UpperLeg']:Destroy()
            char[Leg..'LowerLeg']:Destroy()
            char[Leg..'Foot']:Destroy()
            else
                char[Leg..' Leg']:Destroy()
        end
    end
    if CMD == 'zoom' or CMD == 'infzoom' then
        player.CameraMaxZoomDistance = math.huge
    end
    if CMD == 'fov' then
        if game.Workspace:FindFirstChildWhichIsA('Camera') then game.Workspace:FindFirstChildWhichIsA('Camera').FieldOfView = tonumber(arguments[2]) end
    end
    if CMD == 're' then
        player.Character.Humanoid:Destroy()
        wait(0.2)
        for i, v in pairs(player.Character:GetChildren()) do
            v:Destroy()
        end
    end
    if CMD == 'sit' then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    end
    if CMD == 'faceless' or CMD == 'noface' then
        player.Character.Head.face:Destroy()
    end
    if CMD == 'noclip' or CMD == 'unnoclip' then
        if Noclipping then
            Noclipping:Disconnect()
            Clip = true
        else
            Clip = false
            wait(0.1)
            local function NoclipLoop()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                            child.CanCollide = false
                        end
                    end
                end
            end
            Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        end
    end
end

game.Players.LocalPlayer.Chatted:Connect(function(message,recipient)
    message = string.lower(message)
    local splitString = message:split(" ")
    local slashCommand = splitString[1]
    local cmd = slashCommand:split(prefix)
    local cmdName = cmd[2]
    if commands[cmdName] then
        local arguments = {}
        for i = 2, #splitString, 1 do
            table.insert(arguments,splitString[i])
        end
        commands[cmdName](arguments)
    end
end)
