local mt = getrawmetatable(game)
local backupnamecall = mt.__namecall
local backupnewindex = mt.__newindex
local backupindex = mt.__index 
setreadonly(mt, false)

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
