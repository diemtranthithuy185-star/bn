-- READHUB MAIN
-- Rin Dev / KingMod

local Player = game.Players.LocalPlayer

-- UI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "READHUB_GUI"

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 420, 0, 260)
Main.Position = UDim2.new(0.32, 0, 0.28, 0)
Main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

-- LOGO
local Logo = Instance.new("TextLabel", Main)
Logo.Size = UDim2.new(0,70,0,70)
Logo.Position = UDim2.new(0.03,0,0.06,0)
Logo.Text = "👑"
Logo.TextScaled = true
Logo.BackgroundTransparency = 1

-- TITLE
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(0.7,0,0.18,0)
Title.Position = UDim2.new(0.25,0,0.06,0)
Title.Text = "READHUB"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(0,170,255)
Title.BackgroundTransparency = 1

-- SUBTITLE
local Sub = Instance.new("TextLabel", Main)
Sub.Size = UDim2.new(0.7,0,0.1,0)
Sub.Position = UDim2.new(0.25,0,0.22,0)
Sub.Text = "V1 | By Rin Dev"
Sub.TextScaled = true
Sub.TextColor3 = Color3.fromRGB(200,200,200)
Sub.BackgroundTransparency = 1

-- BUTTON FUNCTION
local function CreateButton(text, posY)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.8,0,0.14,0)
    btn.Position = UDim2.new(0.1,0,posY,0)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)
    return btn
end

local AutoFarm = CreateButton("AUTO FARM : OFF", 0.42)
local ESP = CreateButton("ESP PLAYER : OFF", 0.60)

-- CLOSE
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0,35,0,35)
Close.Position = UDim2.new(0.91,0,0.04,0)
Close.Text = "X"
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(255,70,70)
Close.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", Close)

-- LOGIC
local autofarm = false
AutoFarm.MouseButton1Click:Connect(function()
    autofarm = not autofarm
    AutoFarm.Text = autofarm and "AUTO FARM : ON" or "AUTO FARM : OFF"
    print("READHUB | AutoFarm:", autofarm)
end)

local esp = false
ESP.MouseButton1Click:Connect(function()
    esp = not esp
    ESP.Text = esp and "ESP PLAYER : ON" or "ESP PLAYER : OFF"
    print("READHUB | ESP:", esp)
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
