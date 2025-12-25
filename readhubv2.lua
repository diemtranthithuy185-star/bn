-- READ HUB V2 | ALL GAME
-- Style Redz Hub
-- By Rin Dev

if game.CoreGui:FindFirstChild("READHUBV2") then
    game.CoreGui.READHUBV2:Destroy()
end

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

LP.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "READHUBV2"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,420,0,300)
Main.Position = UDim2.new(0.5,-210,0.5,-150)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "👑 READ HUB V2 | ALL GAME"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255,0,0)
Title.BackgroundTransparency = 1

local Min = Instance.new("TextButton", Main)
Min.Size = UDim2.new(0,40,0,40)
Min.Position = UDim2.new(1,-40,0,0)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 25
Min.TextColor3 = Color3.new(1,1,1)
Min.BackgroundTransparency = 1

local Tabs = Instance.new("Frame", Main)
Tabs.Size = UDim2.new(0,120,1,-40)
Tabs.Position = UDim2.new(0,0,0,40)
Tabs.BackgroundColor3 = Color3.fromRGB(30,30,30)

local Pages = Instance.new("Frame", Main)
Pages.Size = UDim2.new(1,-120,1,-40)
Pages.Position = UDim2.new(0,120,0,40)
Pages.BackgroundTransparency = 1

Min.MouseButton1Click:Connect(function()
    Tabs.Visible = not Tabs.Visible
    Pages.Visible = not Pages.Visible
end)

local function Tab(name, page)
    local b = Instance.new("TextButton", Tabs)
    b.Size = UDim2.new(1,0,0,40)
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.MouseButton1Click:Connect(function()
        for _,v in pairs(Pages:GetChildren()) do
            v.Visible = false
        end
        page.Visible = true
    end)
end

local function Page()
    local p = Instance.new("Frame", Pages)
    p.Size = UDim2.new(1,0,1,0)
    p.Visible = false
    p.BackgroundTransparency = 1
    return p
end

local function Button(parent,text,y,func)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0.9,0,0,35)
    b.Position = UDim2.new(0.05,0,0,y)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BackgroundColor3 = Color3.fromRGB(45,45,45)
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(func)
end

local MainPage = Page()
local PlayerPage = Page()
local InfoPage = Page()

Tab("🏠 Main", MainPage)
Tab("👤 Player", PlayerPage)
Tab("ℹ Info", InfoPage)

MainPage.Visible = true

Button(MainPage,"🔄 Rejoin Server",10,function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LP)
end)

Button(PlayerPage,"⚡ Speed 60",10,function()
    LP.Character.Humanoid.WalkSpeed = 60
end)

Button(PlayerPage,"🦘 Jump 120",55,function()
    LP.Character.Humanoid.JumpPower = 120
end)

Button(PlayerPage,"👁 ESP Player",100,function()
    for _,v in pairs(Players:GetPlayers()) do
        if v ~= LP and v.Character and not v.Character:FindFirstChild("ESP") then
            local h = Instance.new("Highlight", v.Character)
            h.Name = "ESP"
            h.FillColor = Color3.fromRGB(255,0,0)
        end
    end
end)

Button(InfoPage,"READ HUB V2",10,function() end)
Button(InfoPage,"By Rin Dev",55,function() end)
