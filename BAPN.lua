-- other
_G.Version = "1.0.3" -- VERSION (if you plan to update)
local httpService = game:GetService("HttpService")
local discord = "https://discord.gg/C3rDj9WqvV"
-- gui creation
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Pkw's BAPN.HBE",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Legacy,
    Link = "https://github.com/wowpkw/PkwsHBEv2/tree"
}

local Tab = GUI:Tab{
	Name = "Be-A-Parkour-Ninja-HBE-V".._G.Version,
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
	loadstring(game:HttpGet("https://raw.githubusercontent.com/wowpkw/thingsimayneed/main/sendreportviawebhook%2Blogger.lua"))();
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
getgenv().EnumSize = _G.HeadSize
getgenv().EnumColor = _G.Color
getgenv().EnumKey = Enum.KeyCode.P

local Player: Player, Enabled: boolean = game:GetService('Players').LocalPlayer, true
local Character = Player.Character or Player.CharacterAdded
local Mouse = Player:GetMouse()

-- // Functionality
function Modify() -- /* ON */
   for _,v in pairs(game:GetService('Players'):GetPlayers()) do
       if v.Name ~= Player.Name then
           pcall(function()
               v.Character.HumanoidRootPart.Size, v.Character.HumanoidRootPart.Transparency = Vector3.new(EnumSize, EnumSize, EnumSize), .99
               v.Character.HumanoidRootPart.Color = EnumColor
               v.Character.HumanoidRootPart.CanCollide = false

               for _,v in pairs(v.Character:GetDescendants()) do
                   if v.Name == "nG1#8Bg#hj6pP8mXQUlURh1Mtw4hAXCG4cBLVfFsF0RJru#!a7" then
                       return
                   end
               end

               local ESP = Instance.new("Highlight", v.Character) -- Set the character variable to the character model of the targeted player
               ESP.Name = "nG1#8Bg#hj6pP8mXQUlURh1Mtw4hAXCG4cBLVfFsF0RJru#!a7"
               ESP.FillColor = Color3.new(0, 0, 0)
               ESP.FillTransparency = _G.Transparency
               ESP.OutlineColor = EnumColor
               ESP.OutlineTransparency = 0
               ESP.Adornee = v.Character.Head
            end)
       end
   end
end

function Normalize()  -- /* OFF */
   for _,v in pairs(game:GetService('Players'):GetPlayers()) do
       if v.Name ~= Player.Name then
           pcall(function()
               v.Character.HumanoidRootPart.Size, v.Character.HumanoidRootPart.Transparency = Vector3.new(2, 2, 1), 1
               v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
               v.Character.HumanoidRootPart.CanCollide = false

               for _,v in pairs(v.Character:GetDescendants()) do
                   if v.Name == "nG1#8Bg#hj6pP8mXQUlURh1Mtw4hAXCG4cBLVfFsF0RJru#!a7" then
                       v:Destroy()
                   end
               end
            end)
       end
   end
end

game:GetService('UserInputService').InputBegan:Connect(function(input, index)
   if index then return end
   if input.KeyCode == EnumKey then
       if Enabled == nil then -- /* ON */
           Enabled = true Modify()
           game:GetService("StarterGui"):SetCore("SendNotification", {
               Title = "Enabled!";
               Text = tostring(Player.Name);
           })
       elseif Enabled == true then -- /* OFF */
           Enabled = nil Normalize()
           game:GetService("StarterGui"):SetCore("SendNotification", {
               Title = "Disabled!";
               Text = tostring(Player.Name);
           })
       end
   end
end)

game:GetService('RunService').RenderStepped:Connect(function()
   if Enabled == true then
       Modify()
   end
end)
end
}
