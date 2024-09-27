local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local Script = {
	Functions = {},
	ESPSettings = {
		DepthMode = "AlwaysOnTop",
		FillColor = {
			R = 0,
			G = 0,
			B = 0,
		},
		FillTransparency = 0.5,
		OutlineColor = {
			R = 0,
			G = 0,
			B = 0,
		},
		OutlineTransparency = 0.5,
	},
	ColorPresets = {
		Error = "rgb(240, 40, 10)",
		Success = "rgb(40, 240, 10)",
		Info = "rgb(40, 10, 240)",
		Warning = "rgb(240, 240, 10)",
		Default = "rgb(255, 255, 255)"
	},
}
local PlayerTable = {}
local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()

local Window = ImGui:CreateWindow({
	Title = "MinimalESP | _seasonal_",
	Size = UDim2.fromOffset(350, 500),
	Position = UDim2.new(0.45, 0, 0.5, 0),

	--// Styles
	Colors = {
		Window = {
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.05,
			ResizeGrip = {
				TextColor3 = Color3.fromRGB(0, 0, 0)
			},
			
			TitleBar = {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				[{
					Recursive = true,
					Name = "ToggleButton"
				}] = {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				}
			},
		},
		CheckBox = {
			Tickbox = {
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				Tick = {
					ImageColor3 = Color3.fromRGB(255, 255, 255)
				}
			}
		},
		Slider = {
			Grab = {
				BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			},
			BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		},
		CollapsingHeader = {
			TitleBar = {
				BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			}
		}
	}
})


local main = Window:CreateTab({
	Name = "Main",
	Visible = true
})

local enable_esp = main:Checkbox({
	Label = "Enable ESP",
	Value = false,
	Callback = function(self, Value)
		if Value then
			for _,v in pairs(plrs:GetPlayers()) do
				Script.Functions.ApplyESP(v)
				Script.Functions.ConnectPlayer(v)
			end
		else
			for _,v in pairs(plrs:GetPlayers()) do
				if v.Character:FindFirstChild("Highlight") then
					v.Character:FindFirstChild("Highlight").Enabled = false
				end
			end
		end
	end,
})

main:Combo({
	Selected = "AlwaysOnTop", --// Cancels Placeholder 
	Label = "DepthMode",
	Items = {
		"AlwaysOnTop",
		"Occluded"
	},
	Callback = function(self, Value)
		Script.ESPSettings.DepthMode = Value
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").DepthMode = Script.ESPSettings.DepthMode
			end
		end
	end,
})

main:Separator({
	Text = "Fill"
})

local fill_rgb = main:TreeNode({
	Title = "FillRGB",
})

fill_rgb:Slider({
	Label = "R",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.FillColor.R = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").FillColor = Color3.fromRGB(Script.ESPSettings.FillColor.R, Script.ESPSettings.FillColor.G, Script.ESPSettings.FillColor.B)
			end
		end
	end,
})
fill_rgb:Slider({
	Label = "G",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.FillColor.G = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").FillColor = Color3.fromRGB(Script.ESPSettings.FillColor.R, Script.ESPSettings.FillColor.G, Script.ESPSettings.FillColor.B)
			end
		end
	end,
})
fill_rgb:Slider({
	Label = "B",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.FillColor.B = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").FillColor = Color3.fromRGB(Script.ESPSettings.FillColor.R, Script.ESPSettings.FillColor.G, Script.ESPSettings.FillColor.B)
			end
		end
	end,
})

main:Slider({
	Label = "Transparency",
	Format = "%.d/%s", 
	Value = 0.5,
	MinValue = 0,
	MaxValue = 1,

	Callback = function(self, Value)
		Script.ESPSettings.FillTransparency = Value
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").FillTransparency = Script.ESPSettings.FillTransparency
			end
		end
	end,
})

main:Separator({
	Text = "Outline"
})

local outline_rgb = main:TreeNode({
	Title = "OutlineRGB",
})

outline_rgb:Slider({
	Label = "R",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.OutlineColor.R = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").OutlineColor = Color3.fromRGB(Script.ESPSettings.OutlineColor.R, Script.ESPSettings.OutlineColor.G, Script.ESPSettings.OutlineColor.B)
			end
		end
	end,
})
outline_rgb:Slider({
	Label = "G",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.OutlineColor.G = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").OutlineColor = Color3.fromRGB(Script.ESPSettings.OutlineColor.R, Script.ESPSettings.OutlineColor.G, Script.ESPSettings.OutlineColor.B)
			end
		end
	end,
})
outline_rgb:Slider({
	Label = "B",
	Format = "%.d/%s", 
	Value = 1,
	MinValue = 0,
	MaxValue = 255,

	Callback = function(self, Value)
		local Rounded = math.floor(Value)
		Script.ESPSettings.OutlineColor.B = Rounded
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").OutlineColor = Color3.fromRGB(Script.ESPSettings.OutlineColor.R, Script.ESPSettings.OutlineColor.G, Script.ESPSettings.OutlineColor.B)
			end
		end
	end,
})

main:Slider({
	Label = "Transparency",
	Format = "%.d/%s", 
	Value = 0.5,
	MinValue = 0,
	MaxValue = 1,

	Callback = function(self, Value)
		Script.ESPSettings.OutlineTransparency = Value
		for _,v in pairs(plrs:GetPlayers()) do
			if v.Character:FindFirstChild("Highlight") then
				v.Character:FindFirstChild("Highlight").OutlineTransparency = Script.ESPSettings.OutlineTransparency
			end
		end
	end,
})



local debug = Window:CreateTab({
	Name = "Debug",
	Visible = false
})

local Console = debug:Console({
	Text = "Console",
	ReadOnly = true,
	Border = true,
	Fill = false,
	RichText = true,
	Enabled = true,
	AutoScroll = true,
	MaxLines = 1000
})

debug:Button({
	Text = "PlayerTable",
	Callback = function(self)
		for _,v in pairs(PlayerTable) do
			Script.Functions.Log(Console, "Info", "Player: " .. tostring(v.Name), "rgb(0, 0, 255)", true)
		end
	end,
})

debug:Button({
	Text = "RGB",
	Callback = function(self)
		Script.Functions.Log(Console, "Info", "R: "..Script.ESPSettings.FillColor.R.." G: "..Script.ESPSettings.FillColor.G.." B: "..Script.ESPSettings.FillColor.B, "rgb(128, 0, 128)", true)
	end,
})



--// Functions

function Script.Functions.Log(object: any, title: string, description: string, color: string, full: boolean)
	if full then
		object:AppendText("<font color='"..tostring(color).."'>["..tostring(title).."] "..tostring(description).."</font>")
		return
	else
		object:AppendText("<font color='"..tostring(color).."'>["..tostring(title).."]</font>"..tostring(description))
		return
	
	end
end

Script.Functions.Log(Console, "Info", "Script Loaded", Script.ColorPresets.Info, true)
Script.Functions.Log(Console, "Info", "ESP Settings:", "rgb(128, 0, 128)", true)
Script.Functions.Log(Console, "Info", "DepthMode: " .. Script.ESPSettings.DepthMode, "rgb(128, 0, 128)", true)
Script.Functions.Log(Console, "Info", "FillColor: R=" .. Script.ESPSettings.FillColor.R .. " G=" .. Script.ESPSettings.FillColor.G .. " B=" .. Script.ESPSettings.FillColor.B, "rgb(128, 0, 128)", true)
Script.Functions.Log(Console, "Info", "FillTransparency: " .. Script.ESPSettings.FillTransparency, "rgb(128, 0, 128)", true)
Script.Functions.Log(Console, "Info", "OutlineColor: R=" .. Script.ESPSettings.OutlineColor.R .. " G=" .. Script.ESPSettings.OutlineColor.G .. " B=" .. Script.ESPSettings.OutlineColor.B, "rgb(128, 0, 128)", true)
Script.Functions.Log(Console, "Info", "OutlineTransparency: " .. Script.ESPSettings.OutlineTransparency, "rgb(128, 0, 128)", true)

--// Example
--      Script.Functions.Log(Console, "Error", "This is a random description", Script.ColorPresets.Error, true)
--      Script.Functions.Log(Console, "Success", "This is a random description", Script.ColorPresets.Success, true)
--      Script.Functions.Log(Console, "Info", "This is a random description", Script.ColorPresets.Info, true)
--      Script.Functions.Log(Console, "Warning", "This is a random description", Script.ColorPresets.Warning, true)
--      Script.Functions.Log(Console, "Default", "This is a random description", Script.ColorPresets.Default, true)

function Script.Functions.ApplyESP(player: Instance)
	repeat
		task.wait()
	until player.Character

	if player.Character:FindFirstChild("Highlight") then
		player.Character:FindFirstChild("Highlight").Enabled = true

		-- Script.Functions.Log(Console, "Warning", "Highlight Already Applied", Script.ColorPresets.Warning, true)
		return
	end
	local Highlight = Instance.new("Highlight")
	Highlight.Parent = player.Character
	Highlight.DepthMode = Script.ESPSettings.DepthMode
	Highlight.FillColor = Color3.fromRGB(Script.ESPSettings.FillColor.R, Script.ESPSettings.FillColor.G, Script.ESPSettings.FillColor.B)
	Highlight.FillTransparency = Script.ESPSettings.FillTransparency
	Highlight.OutlineColor = Color3.fromRGB(Script.ESPSettings.OutlineColor.R, Script.ESPSettings.OutlineColor.G, Script.ESPSettings.OutlineColor.B)
	Highlight.OutlineTransparency = Script.ESPSettings.OutlineTransparency
	Script.Functions.Log(Console, "Success", "Applied to: "..tostring(player.Name), Script.ColorPresets.Success, true)
end

function Script.Functions.ConnectPlayer(player: Instance)
	if table.find(PlayerTable, player) then
		return
	end

	table.insert(PlayerTable, player)

	player.CharacterAdded:Connect(function()
		if enable_esp.Value then
			Script.Functions.ApplyESP(player)
		end
	end)
end

function Script.Functions.DisableESP()
    for _,v in pairs(plrs:GetPlayers()) do
        if v.Character:FindFirstChild("Highlight") then
            v.Character:FindFirstChild("Highlight").Enabled = false
        end
    end
end

plrs.PlayerAdded:Connect(function(player)
	Script.Functions.Log(Console, "Info", "Player Added: "..tostring(player.Name), Script.ColorPresets.Info, true)

	if enable_esp.Value then
		repeat
			task.wait()
		until player.Character

		Script.Functions.ApplyESP(player)
	end
	Script.Functions.ConnectPlayer(player)
	Script.Functions.Log(Console, "Success", "Connected to: "..tostring(player.Name), Script.ColorPresets.Success, true)
end)

plrs.PlayerRemoving:Connect(function(player)
	if table.find(PlayerTable, player) then
		table.remove(PlayerTable, table.find(PlayerTable, player))
	end
	Script.Functions.Log(Console, "Warning", "Player Removed: "..tostring(player.Name), Script.ColorPresets.Warning, true)
end)
