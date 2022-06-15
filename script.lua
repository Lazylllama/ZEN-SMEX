local url = "https://raw.githubusercontent.com/laderite/zenx/main/scripts"

local games = {
    [5023820864] = "Trade Tower";
    [4866692557] = "Age of Gays";
    [2990100290] = "RPG Simulator"; -- world 1
    [4628853904] = "RPG Simulator"; -- world 2
    [8328351891] = "Mega Mansion Tycoon";
    [7424863999] = "Super Hero VS God Tycoon";
    [8069117419] = "Demon Soul";
    [7180042682] = "Military Tycoon";
    [7800644383] = "Untitled Hood GUI";
    [9183932460] = "Untitled Hood New GUI";
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.PlaceId] or games[game.GameId]
return loadstring(game:HttpGet(url.. "/"..(name or "Universal")..".lua"))()
