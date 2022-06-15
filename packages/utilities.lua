
getgenv()["laderiteUtilities"] = {}
local Util = getgenv()["laderiteUtilities"]
local players = game.Players
local player = players.LocalPlayer
local chr = player.Character
local hrp = chr.HumanoidRootPart
local humanoid = chr.Humanoid
function Util:getUserId(player)
    return game.Players[player].UserId
end

function Util:getPlayer(id)
    return game.Players:GetPlayerByUserId(id)
end

function Util:teleport(pos)
    player.chr.hrp.CFrame = CFrame.new(pos)
end

function Util:walkSpeed(value)
    humanoid.WalkSpeed = value
end

function Util:jumpPower(value)
    humanoid.JumpPower = value
end

function Util:printCFrame()
    print(hrp.CFrame)
end

function Util:copyCFrame()
    setclipboard(tostring(hrp.CFrame))
end

return Util
--[[local function load(package)
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
end

--// load packages \\--
local utilities = load('utilities')
print(utilities:getUserId(game.Players.LocalPlayer.Name))]]
