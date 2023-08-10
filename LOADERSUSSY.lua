--LOCALS

local placeId = game.PlaceId

--PLACEIDS

local BAPN = 147848991
local DBHBE = 5952445986
local AB = 8573962925
local BM2LOBBY = 969669348
local BM2GAME = 2819998741
local BM2RANKED = 5965084607
local DH = 2788229376
local DHVC = 7213786345

--SHORTCUTS

local BAPNSCRIPT = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/BAPN.lua"
local DBSCRIPT = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/DynastyBattlegrounds.lua"
local UNIVERSAL = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/Universal.lua"
local ABSCRIPT = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/AB.lua"
local BM2SCRIPT = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/BM2.lua"
local DHSCRIPT = "https://raw.githubusercontent.com/wowpkw/PkwsHBEv2/main/DH.lua"

--LOADER
if placeId == (BAPN) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(BAPNSCRIPT))();
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
elseif placeId == (DBHBE) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(DBSCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
elseif placeId == (AB) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(ABSCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
	end
elseif placeId == (DH) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(DHSCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
elseif placeId == (DHVC) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(DHSCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
    elseif placeId == (BM2LOBBY) then
    local success, result = pcall(function()
    game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "YOU ARE IN THE LOBBY. PLEASE JOIN A GAME",
		Text = " ",
	}
)
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
  elseif placeId == (BM2GAME) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(BM2SCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
 elseif placeId == (BM2RANKED) then
    local success, result = pcall(function()
        loadstring(game:HttpGet(BM2SCRIPT))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
else
    local success, result = pcall(function()
        loadstring(game:HttpGet(UNIVERSAL))()
    end)
    
    if success then
        print("Loadstring executed successfully for placeId "..placeId.."!")
    else
        warn("Error while executing loadstring for placeId "..placeId..":", result)
    end
end
