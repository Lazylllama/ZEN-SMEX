# Zen X 

> How to use packages
> 1. paste the script on top of ur script
> 2. examples are in there so
 ```lua
local function load(package)
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
end

  --// load packages \\--
  local utilities = load('utilities')
  print(utilities:getUserId(game.Players.LocalPlayer.Name))
```


> most scripts are open source 
