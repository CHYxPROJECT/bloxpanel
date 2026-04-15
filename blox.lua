-- ============================================================
--   BLOX PANEL  ·  by NanaChan
--   Blox Fruits  ·  Compatible with Delta Executor
--   VERSION: 4.0 (Cyberpunk Matrix Edition + True Silent Aim)
-- ============================================================

-- ============================================================
--  [0] ADVANCED MATRIX INTRO - CYBERPUNK EDITION
-- ============================================================
local function RunIntro()
    local TS2 = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "MatrixIntro"
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    pcall(function() introGui.Parent = game:GetService("CoreGui") end)
    if not introGui.Parent then
        introGui.Parent = LP:WaitForChild("PlayerGui")
    end

    -- Main Background with gradient
    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 5, 10)
    bg.BorderSizePixel = 0

    -- Animated gradient
    local grad = Instance.new("UIGradient", bg)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 5, 15)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 20, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 15)),
    })
    grad.Rotation = 45

    -- Rotate gradient
    task.spawn(function()
        while bg.Parent do
            grad.Rotation = grad.Rotation + 0.3
            task.wait(0.05)
        end
    end)

    -- Scan lines effect
    local scanLines = Instance.new("Frame", bg)
    scanLines.Size = UDim2.new(1,0,1,0)
    scanLines.BackgroundTransparency = 0.95
    scanLines.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    scanLines.ZIndex = 2

    local scanPattern = Instance.new("UIGradient", scanLines)
    scanPattern.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255)),
    })
    scanPattern.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.9),
        NumberSequenceKeypoint.new(0.5, 1),
        NumberSequenceKeypoint.new(1, 0.9),
    })

    -- Title with glow
    local titleContainer = Instance.new("Frame", bg)
    titleContainer.Size = UDim2.new(1,0,0,100)
    titleContainer.Position = UDim2.new(0,0,0.22,0)
    titleContainer.BackgroundTransparency = 1
    titleContainer.ZIndex = 10

    local titleGlow = Instance.new("TextLabel", titleContainer)
    titleGlow.Size = UDim2.new(1,0,1,0)
    titleGlow.Position = UDim2.new(0,2,0,2)
    titleGlow.BackgroundTransparency = 1
    titleGlow.Text = "BLOX PANEL"
    titleGlow.TextColor3 = Color3.fromRGB(0, 150, 255)
    titleGlow.Font = Enum.Font.GothamBlack
    titleGlow.TextSize = 62
    titleGlow.TextTransparency = 0.8
    titleGlow.ZIndex = 9

    local title = Instance.new("TextLabel", titleContainer)
    title.Size = UDim2.new(1,0,1,0)
    title.BackgroundTransparency = 1
    title.Text = "BLOX PANEL"
    title.TextColor3 = Color3.fromRGB(0, 255, 255)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 62
    title.TextStrokeTransparency = 0.5
    title.TextStrokeColor3 = Color3.fromRGB(0, 100, 200)
    title.TextTransparency = 1
    title.ZIndex = 10

    -- Subtitle
    local sub1 = Instance.new("TextLabel", bg)
    sub1.Size = UDim2.new(1,0,0,28)
    sub1.Position = UDim2.new(0,0,0.22,105)
    sub1.BackgroundTransparency = 1
    sub1.Text = "CYBERPUNK MATRIX EDITION"
    sub1.TextColor3 = Color3.fromRGB(0, 200, 255)
    sub1.Font = Enum.Font.GothamBold
    sub1.TextSize = 18
    sub1.TextTransparency = 1
    sub1.ZIndex = 10

    local sub2 = Instance.new("TextLabel", bg)
    sub2.Size = UDim2.new(1,0,0,22)
    sub2.Position = UDim2.new(0,0,0.22,138)
    sub2.BackgroundTransparency = 1
    sub2.Text = ">> INITIALIZING NEURAL NETWORK <<"
    sub2.TextColor3 = Color3.fromRGB(100, 200, 255)
    sub2.Font = Enum.Font.Code
    sub2.TextSize = 13
    sub2.TextTransparency = 1
    sub2.ZIndex = 10

    -- Premium badge
    local premBadge = Instance.new("Frame", bg)
    premBadge.Size = UDim2.new(0,140,0,32)
    premBadge.Position = UDim2.new(0.5,-70,0.22,175)
    premBadge.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
    premBadge.BackgroundTransparency = 1
    premBadge.BorderSizePixel = 0
    premBadge.ZIndex = 10
    
    local premCorner = Instance.new("UICorner", premBadge)
    premCorner.CornerRadius = UDim.new(0, 6)
    
    local premStroke = Instance.new("UIStroke", premBadge)
    premStroke.Color = Color3.fromRGB(0, 255, 255)
    premStroke.Thickness = 1.5
    premStroke.Transparency = 1

    local premText = Instance.new("TextLabel", premBadge)
    premText.Size = UDim2.new(1,0,1,0)
    premText.BackgroundTransparency = 1
    premText.Text = "💎 PREMIUM ACCESS"
    premText.TextColor3 = Color3.fromRGB(255, 255, 255)
    premText.Font = Enum.Font.GothamBold
    premText.TextSize = 12
    premText.TextTransparency = 1
    premText.ZIndex = 11

    -- Matrix Rain System - Enhanced
    local matrixFolder = Instance.new("Folder", bg)
    matrixFolder.Name = "MatrixRain"

    task.spawn(function()
        local chars = {"0","1","█","▓","▒","░","▪","▫","◆","◇","●","○","◐","◑","☰","☷","☯","⚡","⚛","✦","✧","⬡","⬢","◈","◉"}
        local columns = {}
        local screenWidth = 1920
        
        for i = 1, 40 do
            columns[i] = {
                x = math.random() * screenWidth,
                speed = math.random(3, 8) / 10,
                delay = math.random(0, 50) / 10,
                active = false
            }
        end

        while bg.Parent do
            for i, col in pairs(columns) do
                if not col.active and math.random() > 0.95 then
                    col.active = true
                    task.spawn(function()
                        local y = -50
                        while y < 1200 and bg.Parent do
                            local char = chars[math.random(1, #chars)]
                            local m = Instance.new("TextLabel", matrixFolder)
                            m.Text = char
                            m.Position = UDim2.new(0, col.x, 0, y)
                            m.BackgroundTransparency = 1
                            
                            local brightness = math.random(100, 255)
                            m.TextColor3 = Color3.fromRGB(0, brightness, brightness + 50)
                            m.Font = Enum.Font.Code
                            m.TextSize = math.random(14, 28)
                            m.TextTransparency = 0
                            m.ZIndex = 1
                            
                            -- Fade in and out
                            TS2:Create(m, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
                            
                            task.wait(col.speed)
                            
                            TS2:Create(m, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                            game:GetService("Debris"):AddItem(m, 0.3)
                            
                            y = y + math.random(20, 40)
                        end
                        col.active = false
                    end)
                end
            end
            task.wait(0.05)
        end
    end)

    -- Animated border lines
    task.spawn(function()
        while bg.Parent do
            local line = Instance.new("Frame", bg)
            line.Size = UDim2.new(0, math.random(100, 400), 0, 2)
            line.Position = UDim2.new(math.random(), 0, math.random(), 0)
            line.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
            line.BackgroundTransparency = 0.7
            line.BorderSizePixel = 0
            line.ZIndex = 3
            
            TS2:Create(line, TweenInfo.new(math.random(2, 4)), {
                Position = line.Position + UDim2.new(0.2, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            
            game:GetService("Debris"):AddItem(line, 4)
            task.wait(0.15)
        end
    end)

    -- Loading bar
    local loadBarBg = Instance.new("Frame", bg)
    loadBarBg.Size = UDim2.new(0, 300, 0, 4)
    loadBarBg.Position = UDim2.new(0.5, -150, 0.65, 0)
    loadBarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    loadBarBg.BorderSizePixel = 0
    loadBarBg.ZIndex = 10
    
    local loadBar = Instance.new("Frame", loadBarBg)
    loadBar.Size = UDim2.new(0, 0, 1, 0)
    loadBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    loadBar.BorderSizePixel = 0
    loadBar.ZIndex = 11

    local loadText = Instance.new("TextLabel", bg)
    loadText.Size = UDim2.new(1,0,0,20)
    loadText.Position = UDim2.new(0,0,0.65,15)
    loadText.BackgroundTransparency = 1
    loadText.Text = "LOADING SYSTEM..."
    loadText.TextColor3 = Color3.fromRGB(0, 200, 255)
    loadText.Font = Enum.Font.Code
    loadText.TextSize = 12
    loadText.TextTransparency = 1
    loadText.ZIndex = 10

    -- Animation sequence
    task.spawn(function()
        task.wait(0.8)
        
        -- Fade in elements
        TS2:Create(title, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
        TS2:Create(titleGlow, TweenInfo.new(0.8), {TextTransparency = 0.6}):Play()
        
        task.wait(0.4)
        TS2:Create(sub1, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
        
        task.wait(0.3)
        TS2:Create(sub2, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
        
        task.wait(0.3)
        TS2:Create(premBadge, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()
        TS2:Create(premStroke, TweenInfo.new(0.5), {Transparency = 0.3}):Play()
        TS2:Create(premText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
        
        task.wait(0.3)
        TS2:Create(loadText, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
        
        -- Loading bar animation
        for i = 0, 1, 0.02 do
            loadBar.Size = UDim2.new(i, 0, 1, 0)
            loadText.Text = "LOADING SYSTEM... " .. math.floor(i * 100) .. "%"
            task.wait(0.05)
        end
        
        loadText.Text = "SYSTEM READY"
        loadText.TextColor3 = Color3.fromRGB(0, 255, 100)
        
        task.wait(0.8)
        
        -- Fade out
        local fadeOut = TweenInfo.new(0.6, Enum.EasingStyle.Linear)
        TS2:Create(bg, fadeOut, {BackgroundTransparency = 1}):Play()
        TS2:Create(title, fadeOut, {TextTransparency = 1}):Play()
        TS2:Create(titleGlow, fadeOut, {TextTransparency = 1}):Play()
        TS2:Create(sub1, fadeOut, {TextTransparency = 1}):Play()
        TS2:Create(sub2, fadeOut, {TextTransparency = 1}):Play()
        TS2:Create(premBadge, fadeOut, {BackgroundTransparency = 1}):Play()
        TS2:Create(premStroke, fadeOut, {Transparency = 1}):Play()
        TS2:Create(premText, fadeOut, {TextTransparency = 1}):Play()
        TS2:Create(loadBarBg, fadeOut, {BackgroundTransparency = 1}):Play()
        TS2:Create(loadBar, fadeOut, {BackgroundTransparency = 1}):Play()
        TS2:Create(loadText, fadeOut, {TextTransparency = 1}):Play()
        
        task.wait(0.7)
        introGui:Destroy()
    end)
end

RunIntro()
task.wait(5.5)

-- ============================================================
--  [1] SERVICES
-- ============================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local TweenService      = game:GetService("TweenService")
local Workspace         = game:GetService("Workspace")
local Lighting          = game:GetService("Lighting")
local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ============================================================
--  [2] CYBERPUNK COLORS
-- ============================================================
local C = {
    bg        = Color3.fromRGB(5, 8, 15),
    surface   = Color3.fromRGB(12, 18, 30),
    surface2  = Color3.fromRGB(20, 28, 45),
    neon      = Color3.fromRGB(0, 255, 255),
    neonBlue  = Color3.fromRGB(0, 150, 255),
    neonPink  = Color3.fromRGB(255, 0, 200),
    neonGreen = Color3.fromRGB(0, 255, 100),
    neonRed   = Color3.fromRGB(255, 50, 50),
    text      = Color3.fromRGB(220, 240, 255),
    textDim   = Color3.fromRGB(100, 140, 180),
    premium   = Color3.fromRGB(255, 215, 0),
    white     = Color3.new(1,1,1),
    black     = Color3.new(0,0,0),
}

-- ============================================================
--  [3] SIZES
-- ============================================================
local SIZES = {
    {name="Compact", w=420, h=380},
    {name="Standard", w=560, h=480},
    {name="Extended", w=700, h=580},
    {name="Ultra",   w=840, h=680},
}
local currentSizeIdx = 2

-- ============================================================
--  [4] HELPERS
-- ============================================================
local function corner(p,r)
    local c = Instance.new("UICorner",p)
    c.CornerRadius = UDim.new(0,r or 12)
end

local function stroke(p,col,th,tr)
    local s = Instance.new("UIStroke",p)
    s.Color = col or C.neon
    s.Thickness = th or 1
    s.Transparency = tr or 0.4
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end

local function tw(obj,props,t)
    TweenService:Create(obj,TweenInfo.new(t or 0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),props):Play()
end

local function mkLbl(parent,text,sz,col,bold,xAl,x,y,w,h)
    local l = Instance.new("TextLabel",parent)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextSize = sz
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextColor3 = col
    l.TextXAlignment = xAl or Enum.TextXAlignment.Left
    l.Size = UDim2.new(0,w,0,h)
    l.Position = UDim2.new(0,x,0,y)
    return l
end

-- Glow effect
local function addGlow(parent, color)
    local glow = Instance.new("ImageLabel", parent)
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://4996891970"
    glow.ImageColor3 = color or C.neon
    glow.ImageTransparency = 0.85
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(20, 20, 280, 280)
    glow.ZIndex = parent.ZIndex - 1
    return glow
end

-- ============================================================
--  [5] SILENT AIM SYSTEM - TRUE SILENT AIM
-- ============================================================
local SilentAim = {
    Enabled = true,
    Mode = "Both", -- "Players", "NPCs", "Both"
    FOV = 250,
    HitPart = "Head", -- "Head", "Torso", "HumanoidRootPart"
    WallCheck = false,
    TeamCheck = false,
    CircleVisible = true,
    Target = nil,
    TargetPart = nil,
    Circle = nil,
    CircleOutline = nil,
    Connection = nil,
    Prediction = 0.165,
}

-- Create FOV Circle
local function CreateSilentAimCircle()
    if SilentAim.Circle then SilentAim.Circle:Remove() end
    if SilentAim.CircleOutline then SilentAim.CircleOutline:Remove() end
    
    -- Main circle
    SilentAim.Circle = Drawing.new("Circle")
    SilentAim.Circle.Visible = SilentAim.CircleVisible
    SilentAim.Circle.Thickness = 1.5
    SilentAim.Circle.Color = C.neon
    SilentAim.Circle.Transparency = 0.7
    SilentAim.Circle.Filled = false
    SilentAim.Circle.NumSides = 64
    SilentAim.Circle.Radius = SilentAim.FOV
    
    -- Outline circle
    SilentAim.CircleOutline = Drawing.new("Circle")
    SilentAim.CircleOutline.Visible = SilentAim.CircleVisible
    SilentAim.CircleOutline.Thickness = 3
    SilentAim.CircleOutline.Color = C.black
    SilentAim.CircleOutline.Transparency = 0.5
    SilentAim.CircleOutline.Filled = false
    SilentAim.CircleOutline.NumSides = 64
    SilentAim.CircleOutline.Radius = SilentAim.FOV
end

CreateSilentAimCircle()

-- Get closest target to mouse within FOV
local function GetSilentAimTarget()
    local mousePos = UserInputService:GetMouseLocation()
    local myChar = LP.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil, nil end
    
    local closestTarget = nil
    local closestPart = nil
    local closestDist = SilentAim.FOV
    local closestHealth = 0
    
    local function CheckTarget(char)
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local targetPart = char:FindFirstChild(SilentAim.HitPart)
        
        if humanoid and targetPart and humanoid.Health > 0 then
            -- Team check
            if SilentAim.TeamCheck then
                local player = Players:GetPlayerFromCharacter(char)
                if player and player.Team == LP.Team then return end
            end
            
            -- Wall check
            if SilentAim.WallCheck then
                local rayParams = RaycastParams.new()
                rayParams.FilterDescendantsInstances = {myChar, Camera}
                rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                local direction = (targetPart.Position - Camera.CFrame.Position).Unit * 1000
                local result = Workspace:Raycast(Camera.CFrame.Position, direction, rayParams)
                if result and not result.Instance:IsDescendantOf(char) then return end
            end
            
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closestTarget = char
                    closestPart = targetPart
                    closestHealth = humanoid.Health
                end
            end
        end
    end
    
    -- Check players
    if SilentAim.Mode == "Players" or SilentAim.Mode == "Both" then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LP then
                CheckTarget(plr.Character)
            end
        end
    end
    
    -- Check NPCs
    if SilentAim.Mode == "NPCs" or SilentAim.Mode == "Both" then
        local enemies = Workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in pairs(enemies:GetChildren()) do
                CheckTarget(npc)
            end
        end
        -- Check other NPC folders
        local mobs = Workspace:FindFirstChild("Mobs")
        if mobs then
            for _, mob in pairs(mobs:GetChildren()) do
                CheckTarget(mob)
            end
        end
    end
    
    return closestTarget, closestPart
end

-- Update circle position and target
RunService.RenderStepped:Connect(function()
    if SilentAim.Circle and SilentAim.CircleOutline then
        local mousePos = UserInputService:GetMouseLocation()
        SilentAim.Circle.Position = mousePos
        SilentAim.CircleOutline.Position = mousePos
        SilentAim.Circle.Radius = SilentAim.FOV
        SilentAim.CircleOutline.Radius = SilentAim.FOV
        SilentAim.Circle.Visible = SilentAim.Enabled and SilentAim.CircleVisible
        SilentAim.CircleOutline.Visible = SilentAim.Enabled and SilentAim.CircleVisible
        
        -- Change color when target found
        if SilentAim.Enabled then
            local target, part = GetSilentAimTarget()
            SilentAim.Target = target
            SilentAim.TargetPart = part
            
            if target then
                SilentAim.Circle.Color = C.neonGreen
                SilentAim.Circle.Thickness = 2
            else
                SilentAim.Circle.Color = C.neon
                SilentAim.Circle.Thickness = 1.5
            end
        else
            SilentAim.Circle.Color = C.neonRed
        end
    end
end)

-- Hook remote events for true silent aim
local function SetupSilentAimHook()
    -- Hook FireServer for all remotes
    local oldFireServer
    oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
        if SilentAim.Enabled and SilentAim.Target and SilentAim.TargetPart then
            local args = {...}
            local modified = false
            
            -- Check if this is a combat remote
            local remoteName = tostring(self):lower()
            if remoteName:find("hit") or remoteName:find("attack") or 
               remoteName:find("damage") or remoteName:find("combat") or
               remoteName:find("skill") or remoteName:find("ability") or
               remoteName:find("register") then
                
                -- Modify arguments to hit target
                for i, arg in pairs(args) do
                    if typeof(arg) == "Vector3" then
                        -- Replace position with target position + prediction
                        local velocity = SilentAim.TargetPart.Velocity or Vector3.new(0,0,0)
                        args[i] = SilentAim.TargetPart.Position + (velocity * SilentAim.Prediction)
                        modified = true
                    elseif typeof(arg) == "CFrame" then
                        -- Replace CFrame to look at target
                        local velocity = SilentAim.TargetPart.Velocity or Vector3.new(0,0,0)
                        local targetPos = SilentAim.TargetPart.Position + (velocity * SilentAim.Prediction)
                        args[i] = CFrame.new(arg.Position, targetPos)
                        modified = true
                    elseif typeof(arg) == "Instance" and (arg:IsA("BasePart") or arg:IsA("Model")) then
                        -- Replace hit part with target part
                        if arg:IsA("BasePart") then
                            args[i] = SilentAim.TargetPart
                            modified = true
                        end
                    end
                end
                
                -- If no direct position arg, try to find and modify target table
                if not modified then
                    for i, arg in pairs(args) do
                        if typeof(arg) == "table" then
                            for k, v in pairs(arg) do
                                if typeof(v) == "Vector3" then
                                    local velocity = SilentAim.TargetPart.Velocity or Vector3.new(0,0,0)
                                    arg[k] = SilentAim.TargetPart.Position + (velocity * SilentAim.Prediction)
                                elseif typeof(v) == "Instance" and v:IsA("BasePart") then
                                    arg[k] = SilentAim.TargetPart
                                end
                            end
                        end
                    end
                end
            end
            
            return oldFireServer(self, unpack(args))
        end
        return oldFireServer(self, ...)
    end)
    
    -- Hook InvokeServer for remote functions
    local oldInvokeServer
    oldInvokeServer = hookfunction(Instance.new("RemoteFunction").InvokeServer, function(self, ...)
        if SilentAim.Enabled and SilentAim.Target and SilentAim.TargetPart then
            local args = {...}
            local remoteName = tostring(self):lower()
            if remoteName:find("hit") or remoteName:find("attack") or 
               remoteName:find("damage") or remoteName:find("combat") or
               remoteName:find("skill") or remoteName:find("ability") then
                
                for i, arg in pairs(args) do
                    if typeof(arg) == "Vector3" then
                        local velocity = SilentAim.TargetPart.Velocity or Vector3.new(0,0,0)
                        args[i] = SilentAim.TargetPart.Position + (velocity * SilentAim.Prediction)
                    elseif typeof(arg) == "CFrame" then
                        local velocity = SilentAim.TargetPart.Velocity or Vector3.new(0,0,0)
                        local targetPos = SilentAim.TargetPart.Position + (velocity * SilentAim.Prediction)
                        args[i] = CFrame.new(arg.Position, targetPos)
                    elseif typeof(arg) == "Instance" and arg:IsA("BasePart") then
                        args[i] = SilentAim.TargetPart
                    end
                end
            end
            return oldInvokeServer(self, unpack(args))
        end
        return oldInvokeServer(self, ...)
    end)
end

-- Setup hooks
task.spawn(function()
    task.wait(2) -- Wait for game to load
    pcall(SetupSilentAimHook)
end)

-- ============================================================
--  [6] OTHER LOGIC VARIABLES
-- ============================================================
local FastAttackEnabled = false
local FastAttackRange = 12000
local FastAttackConn = nil
local InfJumpEnabled = false
local NoClipEnabled = false
local WalkWater = false
local SpeedEnabled = false
local SpeedValue = 16
local GodModeEnabled = false

-- ============================================================
--  [7] MOVEMENT LOGIC
-- ============================================================
RunService.Heartbeat:Connect(function()
    if SpeedEnabled and LP.Character then
        local hum = LP.Character:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            LP.Character:TranslateBy(hum.MoveDirection * (SpeedValue / 55))
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RunService.Stepped:Connect(function()
    if NoClipEnabled and LP.Character then
        for _,v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- ============================================================
--  [8] ROOT GUI - CYBERPUNK MATRIX STYLE
-- ============================================================
local pgui = LP:WaitForChild("PlayerGui")
if pgui:FindFirstChild("CyberPanel") then pgui.CyberPanel:Destroy() end

local ScreenGui = Instance.new("ScreenGui", pgui)
ScreenGui.Name = "CyberPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local S = SIZES[currentSizeIdx]
local W, H = S.w, S.h
local HDR_H = 65
local CHIP_H = 55
local SB_H = 35
local SIDE_W = 140
local BODY_Y = HDR_H + CHIP_H + 12
local BODY_H = H - BODY_Y - SB_H

-- ============================================================
--  MAIN FRAME
-- ============================================================
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "Main"
Main.Size = UDim2.new(0, W, 0, H)
Main.Position = UDim2.new(0.5, -W/2, 0.25, 0)
Main.BackgroundColor3 = C.bg
Main.BackgroundTransparency = 0.05
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
corner(Main, 16)

-- Neon border
local mainStroke = stroke(Main, C.neon, 2, 0.3)

-- Animated glow border
local glowBorder = Instance.new("Frame", Main)
glowBorder.Size = UDim2.new(1, 0, 1, 0)
glowBorder.BackgroundTransparency = 1
glowBorder.ZIndex = 0

local glowGrad = Instance.new("UIGradient", glowBorder)
glowGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.neon),
    ColorSequenceKeypoint.new(0.25, C.neonBlue),
    ColorSequenceKeypoint.new(0.5, C.neonPink),
    ColorSequenceKeypoint.new(0.75, C.neonBlue),
    ColorSequenceKeypoint.new(1, C.neon),
})
glowGrad.Rotation = 0

task.spawn(function()
    while Main.Parent do
        for i = 0, 360, 2 do
            glowGrad.Rotation = i
            task.wait(0.03)
        end
    end
end)

-- Reopen button
local ReopenBtn = Instance.new("TextButton", ScreenGui)
ReopenBtn.Size = UDim2.new(0, 160, 0, 42)
ReopenBtn.Position = UDim2.new(0.5, -80, 0.25, 0)
ReopenBtn.BackgroundColor3 = C.surface
ReopenBtn.Text = "⚡ BLOX PANEL ⚡"
ReopenBtn.TextColor3 = C.neon
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.TextSize = 12
ReopenBtn.BorderSizePixel = 0
ReopenBtn.Visible = false
corner(ReopenBtn, 12)
stroke(ReopenBtn, C.neon, 2, 0.4)

-- ============================================================
--  HEADER
-- ============================================================
local Hdr = Instance.new("Frame", Main)
Hdr.Size = UDim2.new(1, 0, 0, HDR_H)
Hdr.BackgroundColor3 = C.surface
Hdr.BackgroundTransparency = 0.2
Hdr.BorderSizePixel = 0
corner(Hdr, 16)

-- Animated header line
local HDLine = Instance.new("Frame", Hdr)
HDLine.Size = UDim2.new(1, 0, 0, 2)
HDLine.Position = UDim2.new(0, 0, 1, -2)
HDLine.BackgroundColor3 = C.neon
HDLine.BorderSizePixel = 0

local lineGrad = Instance.new("UIGradient", HDLine)
lineGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.neon),
    ColorSequenceKeypoint.new(0.5, C.neonPink),
    ColorSequenceKeypoint.new(1, C.neon),
})

-- Title
mkLbl(Hdr, "⚡ BLOX PANEL ⚡", 20, C.neon, true, Enum.TextXAlignment.Left, 16, 10, 220, 30)
mkLbl(Hdr, "CYBERPUNK MATRIX EDITION", 10, C.textDim, false, Enum.TextXAlignment.Left, 16, 40, 200, 16)

-- Premium badge
local ProF = Instance.new("Frame", Hdr)
ProF.Size = UDim2.new(0, 50, 0, 24)
ProF.Position = UDim2.new(0, 230, 0, 12)
ProF.BackgroundColor3 = C.premium
ProF.BackgroundTransparency = 0.2
corner(ProF, 6)
stroke(ProF, C.premium, 1, 0.3)
mkLbl(ProF, "PRO", 11, C.black, true, Enum.TextXAlignment.Center, 0, 0, 50, 24)

-- Paid badge
local PaidF = Instance.new("Frame", Hdr)
PaidF.Size = UDim2.new(0, 80, 0, 24)
PaidF.Position = UDim2.new(0, 288, 0, 12)
PaidF.BackgroundColor3 = C.neonPink
PaidF.BackgroundTransparency = 0.3
corner(PaidF, 6)
stroke(PaidF, C.neonPink, 1, 0.3)
mkLbl(PaidF, "💎 PAID", 11, C.white, true, Enum.TextXAlignment.Center, 0, 0, 80, 24)

-- Window buttons
local function winBtn(txt, bg2, xOff)
    local b = Instance.new("TextButton", Hdr)
    b.Size = UDim2.new(0, 28, 0, 28)
    b.Position = UDim2.new(1, xOff, 0, 18)
    b.BackgroundColor3 = bg2
    b.Text = txt
    b.TextColor3 = C.white
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    corner(b, 14)
    return b
end

local CloseBtn = winBtn("✕", C.neonRed, -36)
local MinBtn = winBtn("–", C.surface2, -70)

-- ============================================================
--  CHIPS
-- ============================================================
local CHIP_Y = HDR_H + 6

local function makeChip(icon, top, bot, xPos)
    local f = Instance.new("Frame", Main)
    f.Size = UDim2.new(0, (W - 36) / 2, 0, CHIP_H)
    f.Position = UDim2.new(0, xPos, 0, CHIP_Y)
    f.BackgroundColor3 = C.surface
    f.BackgroundTransparency = 0.3
    f.BorderSizePixel = 0
    corner(f, 12)
    stroke(f, C.neonBlue, 1, 0.5)
    
    local iconBg = Instance.new("Frame", f)
    iconBg.Size = UDim2.new(0, 40, 0, 40)
    iconBg.Position = UDim2.new(0, 10, 0.5, -20)
    iconBg.BackgroundColor3 = C.surface2
    corner(iconBg, 10)
    mkLbl(iconBg, icon, 22, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 40, 40)
    
    mkLbl(f, top, 10, C.textDim, false, Enum.TextXAlignment.Left, 58, 8, 160, 14)
    mkLbl(f, bot, 15, C.neon, true, Enum.TextXAlignment.Left, 58, 26, 160, 22)
end

makeChip("🎮", "GAME", "Blox Fruits", 14)
makeChip("⚡", "ENGINE", "Matrix v4.0", 14 + (W - 36) / 2 + 4)

local GLine = Instance.new("Frame", Main)
GLine.Size = UDim2.new(1, -28, 0, 2)
GLine.Position = UDim2.new(0, 14, 0, CHIP_Y + CHIP_H + 4)
GLine.BackgroundColor3 = C.neon
GLine.BorderSizePixel = 0

local gLineGrad = Instance.new("UIGradient", GLine)
gLineGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.neon),
    ColorSequenceKeypoint.new(0.5, C.neonPink),
    ColorSequenceKeypoint.new(1, C.neon),
})

-- ============================================================
--  SIDEBAR
-- ============================================================
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Size = UDim2.new(0, SIDE_W, 1, -BODY_Y - SB_H)
Sidebar.Position = UDim2.new(0, 0, 0, BODY_Y)
Sidebar.BackgroundColor3 = C.surface
Sidebar.BackgroundTransparency = 0.4
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 3
Sidebar.ScrollBarImageColor3 = C.neon
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y

local SBLine = Instance.new("Frame", Main)
SBLine.Size = UDim2.new(0, 2, 1, -BODY_Y - SB_H)
SBLine.Position = UDim2.new(0, SIDE_W, 0, BODY_Y)
SBLine.BackgroundColor3 = C.neon
SBLine.BorderSizePixel = 0

local ContentBG = Instance.new("Frame", Main)
ContentBG.Size = UDim2.new(1, -SIDE_W - 2, 1, -BODY_Y - SB_H)
ContentBG.Position = UDim2.new(0, SIDE_W + 2, 0, BODY_Y)
ContentBG.BackgroundColor3 = C.bg
ContentBG.BackgroundTransparency = 0.3
ContentBG.BorderSizePixel = 0
ContentBG.ClipsDescendants = true

-- ============================================================
--  PAGE SYSTEM
-- ============================================================
local pages = {}
local currentPage = nil
local sideBtnRefs = {}

local function newPage(id)
    local sf = Instance.new("ScrollingFrame", ContentBG)
    sf.Name = id
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.BackgroundTransparency = 1
    sf.ScrollBarThickness = 4
    sf.ScrollBarImageColor3 = C.neon
    sf.CanvasSize = UDim2.new(0, 0, 0, 0)
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Visible = false
    sf.BorderSizePixel = 0
    
    local ul = Instance.new("UIListLayout", sf)
    ul.Padding = UDim.new(0, 10)
    ul.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ul.SortOrder = Enum.SortOrder.LayoutOrder
    
    local up = Instance.new("UIPadding", sf)
    up.PaddingTop = UDim.new(0, 15)
    up.PaddingBottom = UDim.new(0, 15)
    up.PaddingLeft = UDim.new(0, 12)
    up.PaddingRight = UDim.new(0, 12)
    
    pages[id] = sf
    return sf
end

local function showPage(id)
    for pid, pg in pairs(pages) do
        pg.Visible = (pid == id)
    end
    currentPage = id
    
    for _, r in pairs(sideBtnRefs) do
        local act = (r.page == id)
        r.bar.BackgroundColor3 = act and C.neon or C.surface
        r.bar.Size = act and UDim2.new(0, 4, 0.7, 0) or UDim2.new(0, 3, 0.5, 0)
        r.lbl.TextColor3 = act and C.neon or C.textDim
        r.frame.BackgroundColor3 = act and C.surface2 or C.surface
        r.frame.BackgroundTransparency = act and 0.2 or 0.4
    end
end

-- ============================================================
--  COMPONENT BUILDERS
-- ============================================================
local function secLabel(text, parent, lo)
    local wrap = Instance.new("Frame", parent)
    wrap.Size = UDim2.new(1, 0, 0, 28)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = lo
    
    local l = Instance.new("TextLabel", wrap)
    l.Size = UDim2.new(0, 0, 1, 0)
    l.AutomaticSize = Enum.AutomaticSize.X
    l.BackgroundTransparency = 1
    l.Text = text
    l.Font = Enum.Font.GothamBold
    l.TextSize = 10
    l.TextColor3 = C.neon
    l.TextXAlignment = Enum.TextXAlignment.Left
    
    local line = Instance.new("Frame", wrap)
    line.Size = UDim2.new(1, -100, 0, 2)
    line.Position = UDim2.new(0, 95, 0.5, -1)
    line.BackgroundColor3 = C.neonBlue
    line.BorderSizePixel = 0
    corner(line, 1)
    
    return wrap
end

local function makeToggle(icon, name, desc, parent, lo, callback)
    local row = Instance.new("TextButton", parent)
    row.Size = UDim2.new(1, 0, 0, 64)
    row.BackgroundColor3 = C.surface
    row.BackgroundTransparency = 0.4
    row.Text = ""
    row.AutoButtonColor = false
    row.BorderSizePixel = 0
    row.LayoutOrder = lo
    corner(row, 12)
    stroke(row, C.neonBlue, 1, 0.5)
    
    local iconBg = Instance.new("Frame", row)
    iconBg.Size = UDim2.new(0, 44, 0, 44)
    iconBg.Position = UDim2.new(0, 12, 0.5, -22)
    iconBg.BackgroundColor3 = C.surface2
    corner(iconBg, 10)
    mkLbl(iconBg, icon, 24, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 44, 44)
    
    local nameLbl = mkLbl(row, name, 14, C.text, true, Enum.TextXAlignment.Left, 68, 12, W - SIDE_W - 120, 22)
    mkLbl(row, desc, 11, C.textDim, false, Enum.TextXAlignment.Left, 68, 36, W - SIDE_W - 120, 16)
    
    local swBg = Instance.new("Frame", row)
    swBg.Size = UDim2.new(0, 50, 0, 26)
    swBg.Position = UDim2.new(1, -62, 0.5, -13)
    swBg.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
    swBg.BorderSizePixel = 0
    corner(swBg, 13)
    stroke(swBg, C.neonBlue, 1, 0.4)
    
    local knob = Instance.new("Frame", swBg)
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 3, 0.5, -10)
    knob.BackgroundColor3 = C.textDim
    knob.BorderSizePixel = 0
    corner(knob, 10)
    
    local isOn = false
    local function setState(on)
        isOn = on
        if on then
            tw(knob, {Position = UDim2.new(0, 27, 0.5, -10), BackgroundColor3 = C.neon}, 0.2)
            tw(swBg, {BackgroundColor3 = Color3.fromRGB(0, 60, 100)}, 0.2)
            tw(row, {BackgroundColor3 = Color3.fromRGB(20, 30, 60)}, 0.2)
            nameLbl.TextColor3 = C.neon
            local rs = row:FindFirstChildOfClass("UIStroke")
            if rs then rs.Color = C.neon; rs.Transparency = 0.2 end
            local ss = swBg:FindFirstChildOfClass("UIStroke")
            if ss then ss.Color = C.neon; ss.Transparency = 0.2 end
        else
            tw(knob, {Position = UDim2.new(0, 3, 0.5, -10), BackgroundColor3 = C.textDim}, 0.2)
            tw(swBg, {BackgroundColor3 = Color3.fromRGB(20, 30, 50)}, 0.2)
            tw(row, {BackgroundColor3 = C.surface}, 0.2)
            nameLbl.TextColor3 = C.text
            local rs = row:FindFirstChildOfClass("UIStroke")
            if rs then rs.Color = C.neonBlue; rs.Transparency = 0.5 end
            local ss = swBg:FindFirstChildOfClass("UIStroke")
            if ss then ss.Color = C.neonBlue; ss.Transparency = 0.5 end
        end
        if callback then callback(on) end
    end
    
    row.MouseButton1Click:Connect(function() setState(not isOn) end)
    return row, setState
end

local function makeSlider(name, minV, maxV, startV, parent, lo, callback)
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, 0, 0, 76)
    card.BackgroundColor3 = C.surface
    card.BackgroundTransparency = 0.4
    card.BorderSizePixel = 0
    card.LayoutOrder = lo
    corner(card, 12)
    stroke(card, C.neonBlue, 1, 0.5)
    
    mkLbl(card, name, 13, C.text, true, Enum.TextXAlignment.Left, 16, 10, W - SIDE_W - 100, 20)
    local valLbl = mkLbl(card, tostring(startV), 14, C.neon, true, Enum.TextXAlignment.Right, 0, 10, W - SIDE_W - 20, 20)
    
    local minusBtn = Instance.new("TextButton", card)
    minusBtn.Size = UDim2.new(0, 36, 0, 36)
    minusBtn.Position = UDim2.new(0, 14, 0, 34)
    minusBtn.BackgroundColor3 = C.surface2
    minusBtn.Text = "−"
    minusBtn.TextColor3 = C.neon
    minusBtn.Font = Enum.Font.GothamBold
    minusBtn.TextSize = 20
    minusBtn.BorderSizePixel = 0
    corner(minusBtn, 8)
    
    local plusBtn = Instance.new("TextButton", card)
    plusBtn.Size = UDim2.new(0, 36, 0, 36)
    plusBtn.Position = UDim2.new(1, -50, 0, 34)
    plusBtn.BackgroundColor3 = C.surface2
    plusBtn.Text = "+"
    plusBtn.TextColor3 = C.neon
    plusBtn.Font = Enum.Font.GothamBold
    plusBtn.TextSize = 20
    plusBtn.BorderSizePixel = 0
    corner(plusBtn, 8)
    
    local trackBg = Instance.new("Frame", card)
    trackBg.Size = UDim2.new(1, -108, 0, 6)
    trackBg.Position = UDim2.new(0, 54, 0, 50)
    trackBg.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
    trackBg.BorderSizePixel = 0
    corner(trackBg, 3)
    
    local fill = Instance.new("Frame", trackBg)
    local initPct = (startV - minV) / (maxV - minV)
    fill.Size = UDim2.new(initPct, 0, 1, 0)
    fill.BackgroundColor3 = C.neon
    fill.BorderSizePixel = 0
    corner(fill, 3)
    
    local val = startV
    local step = math.max(1, math.floor((maxV - minV) / 25))
    
    local function updateVal(newVal)
        val = math.clamp(newVal, minV, maxV)
        valLbl.Text = tostring(val)
        local pct = (val - minV) / (maxV - minV)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        if callback then callback(val) end
    end
    
    minusBtn.MouseButton1Click:Connect(function() updateVal(val - step) end)
    plusBtn.MouseButton1Click:Connect(function() updateVal(val + step) end)
    
    local dragging = false
    trackBg.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or
           i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or
           i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(i)
        if not dragging then return end
        if i.UserInputType == Enum.UserInputType.Touch or
           i.UserInputType == Enum.UserInputType.MouseMovement then
            local tAbs = trackBg.AbsolutePosition
            local tSz = trackBg.AbsoluteSize
            local pct = math.clamp((i.Position.X - tAbs.X) / tSz.X, 0, 1)
            updateVal(math.floor(minV + (maxV - minV) * pct))
        end
    end)
    
    return card
end

local function makeDropdown(labelTxt, parent, lo, onSelect)
    local CW = W - SIDE_W - 24
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, 0, 0, 56)
    card.BackgroundColor3 = C.surface
    card.BackgroundTransparency = 0.4
    card.BorderSizePixel = 0
    card.LayoutOrder = lo
    card.ClipsDescendants = false
    corner(card, 12)
    stroke(card, C.neonBlue, 1, 0.5)
    
    mkLbl(card, labelTxt, 12, C.textDim, false, Enum.TextXAlignment.Left, 16, 0, CW - 80, 56)
    local selLbl = mkLbl(card, "None", 13, C.neon, true, Enum.TextXAlignment.Right, 0, 0, CW - 12, 56)
    local arrow = mkLbl(card, "▾", 18, C.textDim, true, Enum.TextXAlignment.Right, 0, 0, CW - 12, 56)
    
    local listFrame = Instance.new("Frame", ContentBG)
    listFrame.BackgroundColor3 = C.surface2
    listFrame.BorderSizePixel = 0
    listFrame.Visible = false
    listFrame.ZIndex = 30
    corner(listFrame, 10)
    stroke(listFrame, C.neon, 1, 0.4)
    
    local lLayout = Instance.new("UIListLayout", listFrame)
    lLayout.Padding = UDim.new(0, 2)
    lLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local expanded = false
    local function buildList()
        for _, c in pairs(listFrame:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        local opts = {"None"}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP then table.insert(opts, p.Name) end
        end
        for i, opt in ipairs(opts) do
            local item = Instance.new("TextButton", listFrame)
            item.Size = UDim2.new(1, 0, 0, 36)
            item.BackgroundColor3 = C.surface
            item.Text = opt
            item.TextColor3 = C.text
            item.Font = Enum.Font.GothamBold
            item.TextSize = 12
            item.BorderSizePixel = 0
            item.ZIndex = 31
            item.LayoutOrder = i
            corner(item, 6)
            
            item.MouseButton1Click:Connect(function()
                selLbl.Text = opt
                expanded = false
                listFrame.Visible = false
                arrow.Text = "▾"
                if onSelect then onSelect(opt ~= "None" and opt or nil) end
            end)
            
            item.MouseEnter:Connect(function() item.BackgroundColor3 = C.surface2 end)
            item.MouseLeave:Connect(function() item.BackgroundColor3 = C.surface end)
        end
        listFrame.Size = UDim2.new(0, CW - 20, 0, math.min(#opts, 6) * 38)
    end
    
    local hBtn = Instance.new("TextButton", card)
    hBtn.Size = UDim2.new(1, 0, 1, 0)
    hBtn.BackgroundTransparency = 1
    hBtn.Text = ""
    hBtn.BorderSizePixel = 0
    hBtn.ZIndex = 20
    
    hBtn.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            buildList()
            local abs = card.AbsolutePosition
            local cbAb = ContentBG.AbsolutePosition
            listFrame.Position = UDim2.new(0, abs.X - cbAb.X + 10, 0, abs.Y - cbAb.Y + 58)
            listFrame.Visible = true
            arrow.Text = "▴"
        else
            listFrame.Visible = false
            arrow.Text = "▾"
        end
    end)
    
    return card, buildList
end

local function makeBtn(icon, name, desc, parent, lo, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 60)
    btn.BackgroundColor3 = C.surface
    btn.BackgroundTransparency = 0.4
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.LayoutOrder = lo
    corner(btn, 12)
    stroke(btn, C.neonBlue, 1, 0.5)
    
    local iconBg = Instance.new("Frame", btn)
    iconBg.Size = UDim2.new(0, 44, 0, 44)
    iconBg.Position = UDim2.new(0, 12, 0.5, -22)
    iconBg.BackgroundColor3 = C.surface2
    corner(iconBg, 10)
    mkLbl(iconBg, icon, 24, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 44, 44)
    
    local nameLbl = mkLbl(btn, name, 14, C.text, true, Enum.TextXAlignment.Left, 68, 10, W - SIDE_W - 100, 24)
    mkLbl(btn, desc, 11, C.textDim, false, Enum.TextXAlignment.Left, 68, 36, W - SIDE_W - 100, 16)
    mkLbl(btn, "▶", 18, C.neon, true, Enum.TextXAlignment.Right, 0, 0, W - SIDE_W - 16, 60)
    
    btn.MouseEnter:Connect(function()
        tw(btn, {BackgroundColor3 = Color3.fromRGB(25, 35, 65)}, 0.15)
        nameLbl.TextColor3 = C.neon
        local s = btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color = C.neon; s.Transparency = 0.2 end
    end)
    
    btn.MouseLeave:Connect(function()
        tw(btn, {BackgroundColor3 = C.surface}, 0.15)
        nameLbl.TextColor3 = C.text
        local s = btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color = C.neonBlue; s.Transparency = 0.5 end
    end)
    
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return btn
end

-- ============================================================
--  PAGES
-- ============================================================

-- HOME PAGE
local pgHome = newPage("home")

local logoCard = Instance.new("Frame", pgHome)
logoCard.Size = UDim2.new(1, 0, 0, 120)
logoCard.BackgroundColor3 = C.surface
logoCard.BackgroundTransparency = 0.3
logoCard.BorderSizePixel = 0
logoCard.LayoutOrder = 1
corner(logoCard, 14)
stroke(logoCard, C.neon, 1.5, 0.4)

-- Animated ring
local ring = Instance.new("Frame", logoCard)
ring.Size = UDim2.new(0, 75, 0, 75)
ring.Position = UDim2.new(0, 18, 0.5, -37.5)
ring.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
ring.BorderSizePixel = 0
corner(ring, 37.5)
stroke(ring, C.neon, 2.5, 0.3)

-- Pulse animation
task.spawn(function()
    while ring.Parent do
        for i = 0.3, 0.8, 0.03 do
            ring.BackgroundTransparency = i
            task.wait(0.03)
        end
        for i = 0.8, 0.3, -0.03 do
            ring.BackgroundTransparency = i
            task.wait(0.03)
        end
    end
end)

mkLbl(ring, "⚡", 36, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 75, 75)
mkLbl(logoCard, "⚡ BLOX PANEL ⚡", 20, C.neon, true, Enum.TextXAlignment.Left, 108, 16, 260, 30)
mkLbl(logoCard, "CYBERPUNK MATRIX EDITION", 11, C.textDim, false, Enum.TextXAlignment.Left, 108, 46, 240, 18)
mkLbl(logoCard, "[U] Fast Attack  |  [B] Fly  |  [V] Silent Aim", 10, C.neonBlue, false, Enum.TextXAlignment.Left, 108, 68, 320, 16)

-- Premium notice
local premNotice = Instance.new("Frame", pgHome)
premNotice.Size = UDim2.new(1, 0, 0, 60)
premNotice.BackgroundColor3 = Color3.fromRGB(30, 20, 10)
premNotice.BackgroundTransparency = 0.3
premNotice.BorderSizePixel = 0
premNotice.LayoutOrder = 2
corner(premNotice, 12)
stroke(premNotice, C.premium, 1.5, 0.5)

mkLbl(premNotice, "💎 PREMIUM SCRIPT 💎", 14, C.premium, true, Enum.TextXAlignment.Center, 0, 8, W - SIDE_W - 20, 22)
mkLbl(premNotice, "Paid Access Only - Do Not Distribute", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 32, W - SIDE_W - 20, 18)

secLabel("INTERFACE SCALE", pgHome, 3)

local sizeWrap = Instance.new("Frame", pgHome)
sizeWrap.Size = UDim2.new(1, 0, 0, 56)
sizeWrap.BackgroundColor3 = C.surface
sizeWrap.BackgroundTransparency = 0.4
sizeWrap.BorderSizePixel = 0
sizeWrap.LayoutOrder = 4
corner(sizeWrap, 12)
stroke(sizeWrap, C.neonBlue, 1, 0.5)

local szLay = Instance.new("UIListLayout", sizeWrap)
szLay.FillDirection = Enum.FillDirection.Horizontal
szLay.Padding = UDim.new(0, 8)
szLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
szLay.VerticalAlignment = Enum.VerticalAlignment.Center
local szPad = Instance.new("UIPadding", sizeWrap)
szPad.PaddingLeft = UDim.new(0, 10)
szPad.PaddingRight = UDim.new(0, 10)

local sizeBtns = {}
local function applySize(idx)
    currentSizeIdx = idx
    local ns = SIZES[idx]
    W = ns.w
    H = ns.h
    tw(Main, {Size = UDim2.new(0, ns.w, 0, ns.h)}, 0.3)
    for i, sb in pairs(sizeBtns) do
        sb.BackgroundColor3 = i == idx and C.neon or C.surface2
        sb.TextColor3 = i == idx and C.black or C.textDim
    end
end

for i, sz in ipairs(SIZES) do
    local sb = Instance.new("TextButton", sizeWrap)
    sb.Size = UDim2.new(0.23, -6, 0, 40)
    sb.BackgroundColor3 = i == currentSizeIdx and C.neon or C.surface2
    sb.TextColor3 = i == currentSizeIdx and C.black or C.textDim
    sb.Text = sz.name
    sb.Font = Enum.Font.GothamBold
    sb.TextSize = 12
    sb.BorderSizePixel = 0
    corner(sb, 8)
    sb.MouseButton1Click:Connect(function() applySize(i) end)
    table.insert(sizeBtns, sb)
end

-- COMBAT PAGE
local pgCombat = newPage("combat")

secLabel("SILENT AIM SYSTEM 🎯", pgCombat, 1)

-- Silent Aim Main Toggle
local silentToggle, setSilent = makeToggle("🎯", "Silent Aim [V]", "Auto-lock skills to target in FOV circle", pgCombat, 2, function(on)
    SilentAim.Enabled = on
end)
setSilent(true) -- Default ON

-- Silent Aim Settings
local aimModeCard = Instance.new("Frame", pgCombat)
aimModeCard.Size = UDim2.new(1, 0, 0, 70)
aimModeCard.BackgroundColor3 = C.surface
aimModeCard.BackgroundTransparency = 0.4
aimModeCard.BorderSizePixel = 0
aimModeCard.LayoutOrder = 3
corner(aimModeCard, 12)
stroke(aimModeCard, C.neonBlue, 1, 0.5)

mkLbl(aimModeCard, "Target Mode:", 12, C.textDim, false, Enum.TextXAlignment.Left, 16, 12, 100, 20)

local modes = {"Players", "NPCs", "Both"}
local modeBtns = {}
for i, mode in ipairs(modes) do
    local btn = Instance.new("TextButton", aimModeCard)
    btn.Size = UDim2.new(0, 80, 0, 34)
    btn.Position = UDim2.new(0, 110 + (i - 1) * 88, 0.5, -17)
    btn.BackgroundColor3 = mode == SilentAim.Mode and C.neon or C.surface2
    btn.Text = mode
    btn.TextColor3 = mode == SilentAim.Mode and C.black or C.textDim
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    corner(btn, 6)
    
    btn.MouseButton1Click:Connect(function()
        SilentAim.Mode = mode
        for _, b in pairs(modeBtns) do
            b.BackgroundColor3 = C.surface2
            b.TextColor3 = C.textDim
        end
        btn.BackgroundColor3 = C.neon
        btn.TextColor3 = C.black
    end)
    
    table.insert(modeBtns, btn)
end

-- Hit Part Selection
local hitPartCard = Instance.new("Frame", pgCombat)
hitPartCard.Size = UDim2.new(1, 0, 0, 70)
hitPartCard.BackgroundColor3 = C.surface
hitPartCard.BackgroundTransparency = 0.4
hitPartCard.BorderSizePixel = 0
hitPartCard.LayoutOrder = 4
corner(hitPartCard, 12)
stroke(hitPartCard, C.neonBlue, 1, 0.5)

mkLbl(hitPartCard, "Hit Part:", 12, C.textDim, false, Enum.TextXAlignment.Left, 16, 12, 80, 20)

local parts = {"Head", "Torso", "HumanoidRootPart"}
local partBtns = {}
for i, part in ipairs(parts) do
    local btn = Instance.new("TextButton", hitPartCard)
    btn.Size = UDim2.new(0, 110, 0, 34)
    btn.Position = UDim2.new(0, 100 + (i - 1) * 118, 0.5, -17)
    btn.BackgroundColor3 = part == SilentAim.HitPart and C.neon or C.surface2
    btn.Text = part
    btn.TextColor3 = part == SilentAim.HitPart and C.black or C.textDim
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.BorderSizePixel = 0
    corner(btn, 6)
    
    btn.MouseButton1Click:Connect(function()
        SilentAim.HitPart = part
        for _, b in pairs(partBtns) do
            b.BackgroundColor3 = C.surface2
            b.TextColor3 = C.textDim
        end
        btn.BackgroundColor3 = C.neon
        btn.TextColor3 = C.black
    end)
    
    table.insert(partBtns, btn)
end

makeSlider("FOV Circle Size", 50, 500, SilentAim.FOV, pgCombat, 5, function(v)
    SilentAim.FOV = v
end)

makeSlider("Prediction", 0, 500, SilentAim.Prediction * 1000, pgCombat, 6, function(v)
    SilentAim.Prediction = v / 1000
end)

makeToggle("👁️", "Show FOV Circle", "Display aim circle on screen", pgCombat, 7, function(on)
    SilentAim.CircleVisible = on
end)

makeToggle("🧱", "Wall Check", "Don't aim through walls", pgCombat, 8, function(on)
    SilentAim.WallCheck = on
end)

secLabel("FAST ATTACK ⚔️", pgCombat, 9)

makeToggle("⚔️", "Fast Attack [U]", "High speed multi-target attack", pgCombat, 10, function(on)
    FastAttackEnabled = on
    if on then
        -- Fast attack logic here
    end
end)

makeSlider("Attack Range", 0, 15000, FastAttackRange, pgCombat, 11, function(v)
    FastAttackRange = v
end)

secLabel("MOVEMENT 🏃", pgCombat, 12)

makeToggle("🦘", "Infinite Jump", "Jump without limits", pgCombat, 13, function(on)
    InfJumpEnabled = on
end)

makeToggle("👻", "No Clip", "Walk through walls", pgCombat, 14, function(on)
    NoClipEnabled = on
end)

makeToggle("🌊", "Walk on Water", "Stand on water surface", pgCombat, 15, function(on)
    WalkWater = on
end)

makeToggle("⚡", "Speed Boost", "Enhanced walk speed", pgCombat, 16, function(on)
    SpeedEnabled = on
end)

makeSlider("Speed Value", 16, 300, SpeedValue, pgCombat, 17, function(v)
    SpeedValue = v
    if SpeedEnabled and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end)

secLabel("GOD MODE 🛡️", pgCombat, 18)

makeToggle("🛡️", "God Mode", "Maximum health constantly", pgCombat, 19, function(on)
    GodModeEnabled = on
    if on then
        task.spawn(function()
            while GodModeEnabled do
                task.wait(0.1)
                pcall(function()
                    local char = LP.Character
                    if char then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then
                            hum.Health = hum.MaxHealth
                        end
                    end
                end)
            end
        end)
    end
end)

-- ESP PAGE
local pgESP = newPage("esp")

secLabel("VISUAL ESP 👁️", pgESP, 1)

local ESPEnabled = false
local ESPBoxes = false
local ESPNames = false
local ESPHealth = false
local ESPTracers = false
local ESPDistance = false

makeToggle("👁️", "Enable ESP", "Show players through walls", pgESP, 2, function(on)
    ESPEnabled = on
end)

makeToggle("📦", "Box ESP", "Draw boxes around targets", pgESP, 3, function(on)
    ESPBoxes = on
end)

makeToggle("📛", "Name ESP", "Display player names", pgESP, 4, function(on)
    ESPNames = on
end)

makeToggle("❤️", "Health ESP", "Show health bars", pgESP, 5, function(on)
    ESPHealth = on
end)

makeToggle("📏", "Distance ESP", "Show distance to target", pgESP, 6, function(on)
    ESPDistance = on
end)

makeToggle("➡️", "Tracer ESP", "Lines to targets", pgESP, 7, function(on)
    ESPTracers = on
end)

-- CREDITS PAGE
local pgCredits = newPage("credits")

local creditCard = Instance.new("Frame", pgCredits)
creditCard.Size = UDim2.new(1, 0, 0, 280)
creditCard.BackgroundColor3 = C.surface
creditCard.BackgroundTransparency = 0.3
creditCard.BorderSizePixel = 0
creditCard.LayoutOrder = 1
corner(creditCard, 14)
stroke(creditCard, C.neon, 1.5, 0.4)

-- Header
mkLbl(creditCard, "⭐ DEVELOPER CREDITS ⭐", 18, C.neon, true, Enum.TextXAlignment.Center, 0, 20, W - SIDE_W - 20, 28)

-- Creator info
local creatorBg = Instance.new("Frame", creditCard)
creatorBg.Size = UDim2.new(1, -40, 0, 80)
creatorBg.Position = UDim2.new(0, 20, 0, 60)
creatorBg.BackgroundColor3 = C.surface2
creatorBg.BackgroundTransparency = 0.5
creatorBg.BorderSizePixel = 0
corner(creatorBg, 10)

mkLbl(creatorBg, "👤 Creator: NanaChan", 14, C.text, true, Enum.TextXAlignment.Left, 16, 12, 250, 22)
mkLbl(creatorBg, "📱 Telegram: @nanaanasyalala", 13, C.neonBlue, false, Enum.TextXAlignment.Left, 16, 38, 280, 20)
mkLbl(creatorBg, "🔗 t.me/nanaanasyalala", 11, C.textDim, false, Enum.TextXAlignment.Left, 16, 58, 250, 16)

-- Security notice
local noticeBg = Instance.new("Frame", creditCard)
noticeBg.Size = UDim2.new(1, -40, 0, 110)
noticeBg.Position = UDim2.new(0, 20, 0, 155)
noticeBg.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
noticeBg.BackgroundTransparency = 0.4
noticeBg.BorderSizePixel = 0
corner(noticeBg, 10)
stroke(noticeBg, C.neonRed, 1, 0.5)

mkLbl(noticeBg, "⚠️ SECURITY NOTICE ⚠️", 13, C.neonRed, true, Enum.TextXAlignment.Center, 0, 12, W - SIDE_W - 60, 22)
mkLbl(noticeBg, "This is a PAID premium script.", 11, C.text, false, Enum.TextXAlignment.Center, 0, 38, W - SIDE_W - 60, 18)
mkLbl(noticeBg, "If you received this for free,", 11, C.textDim, false, Enum.TextXAlignment.Center, 0, 58, W - SIDE_W - 60, 16)
mkLbl(noticeBg, "it is a leaked/illegal version.", 11, C.textDim, false, Enum.TextXAlignment.Center, 0, 76, W - SIDE_W - 60, 16)
mkLbl(noticeBg, "Please support the creator!", 11, C.premium, false, Enum.TextXAlignment.Center, 0, 94, W - SIDE_W - 60, 16)

-- Version info
mkLbl(pgCredits, "Version 4.0 - Cyberpunk Matrix Edition", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 0, W - SIDE_W - 20, 20).LayoutOrder = 2

-- LOCATIONS PAGE
local pgLoc = newPage("locations")

secLabel("TELEPORT LOCATIONS 📍", pgLoc, 1)

local function makeTpBtn(icon, name, coords, parent, lo, cb)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 64)
    btn.BackgroundColor3 = C.surface
    btn.BackgroundTransparency = 0.4
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.LayoutOrder = lo
    corner(btn, 12)
    stroke(btn, C.neonBlue, 1, 0.5)
    
    local iconBg = Instance.new("Frame", btn)
    iconBg.Size = UDim2.new(0, 44, 0, 44)
    iconBg.Position = UDim2.new(0, 12, 0.5, -22)
    iconBg.BackgroundColor3 = C.surface2
    corner(iconBg, 10)
    mkLbl(iconBg, icon, 24, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 44, 44)
    
    local nameLbl = mkLbl(btn, name, 14, C.text, true, Enum.TextXAlignment.Left, 68, 10, W - SIDE_W - 100, 24)
    mkLbl(btn, coords, 11, C.textDim, false, Enum.TextXAlignment.Left, 68, 38, W - SIDE_W - 100, 16)
    mkLbl(btn, "›", 24, C.neon, true, Enum.TextXAlignment.Right, 0, 0, W - SIDE_W - 16, 64)
    
    btn.MouseEnter:Connect(function()
        tw(btn, {BackgroundColor3 = Color3.fromRGB(25, 35, 65)}, 0.15)
        nameLbl.TextColor3 = C.neon
        local s = btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color = C.neon; s.Transparency = 0.2 end
    end)
    
    btn.MouseLeave:Connect(function()
        tw(btn, {BackgroundColor3 = C.surface}, 0.15)
        nameLbl.TextColor3 = C.text
        local s = btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color = C.neonBlue; s.Transparency = 0.5 end
    end)
    
    btn.MouseButton1Click:Connect(function() if cb then cb() end end)
    return btn
end

makeTpBtn("⚓", "Pirate Starter", "Sea 3 - Starter Island", pgLoc, 2, function()
    if LP.Character then
        LP.Character.HumanoidRootPart.CFrame = CFrame.new(-6500, 129, -123)
    end
end)

makeTpBtn("🏴‍☠️", "Dark Arena", "PvP Arena Location", pgLoc, 3, function()
    if LP.Character then
        LP.Character.HumanoidRootPart.CFrame = CFrame.new(-11997, 332, -8837)
    end
end)

makeTpBtn("🏝️", "Floating Turtle", "Turtle Island", pgLoc, 4, function()
    if LP.Character then
        LP.Character.HumanoidRootPart.CFrame = CFrame.new(-12000, 350, -9000)
    end
end)

makeTpBtn("🌋", "Magma Village", "Hot Island", pgLoc, 5, function()
    if LP.Character then
        LP.Character.HumanoidRootPart.CFrame = CFrame.new(-5500, 200, -6000)
    end
end)

secLabel("UTILITIES 🛠️", pgLoc, 6)

makeBtn("🛸", "Fly GUI", "Enable flight mode", pgLoc, 7, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

makeBtn("🚫", "Anti-AFK", "Prevent idle kick", pgLoc, 8, function()
    local vu = game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), Camera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0, 0), Camera.CFrame)
    end)
end)

-- ============================================================
--  SIDEBAR MENU
-- ============================================================
local sideY = 10

local function addSideSection(txt)
    local l = Instance.new("TextLabel", Sidebar)
    l.Size = UDim2.new(1, -16, 0, 22)
    l.Position = UDim2.new(0, 16, 0, sideY)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.GothamBold
    l.TextSize = 9
    l.TextColor3 = C.neonBlue
    l.TextXAlignment = Enum.TextXAlignment.Left
    sideY = sideY + 24
end

local function addSideBtn(icon, txt, pageId)
    local frame = Instance.new("TextButton", Sidebar)
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.Position = UDim2.new(0, 0, 0, sideY)
    frame.BackgroundColor3 = C.surface
    frame.BackgroundTransparency = 0.4
    frame.Text = ""
    frame.AutoButtonColor = false
    frame.BorderSizePixel = 0
    
    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(0, 3, 0.5, 0)
    bar.Position = UDim2.new(0, 0, 0.25, 0)
    bar.BackgroundColor3 = C.surface
    bar.BorderSizePixel = 0
    corner(bar, 2)
    
    mkLbl(frame, icon, 18, C.neon, false, Enum.TextXAlignment.Left, 14, 0, 28, 42)
    local nameLbl = mkLbl(frame, txt, 12, C.textDim, true, Enum.TextXAlignment.Left, 46, 0, SIDE_W - 56, 42)
    
    frame.MouseButton1Click:Connect(function() showPage(pageId) end)
    
    frame.MouseEnter:Connect(function()
        if currentPage ~= pageId then
            tw(frame, {BackgroundColor3 = Color3.fromRGB(25, 35, 60)}, 0.1)
        end
    end)
    
    frame.MouseLeave:Connect(function()
        if currentPage ~= pageId then
            tw(frame, {BackgroundColor3 = C.surface}, 0.1)
        end
    end)
    
    table.insert(sideBtnRefs, {frame = frame, bar = bar, lbl = nameLbl, page = pageId})
    sideY = sideY + 44
end

addSideSection("▸ NAVIGATION")
addSideBtn("🏠", "HOME", "home")
addSideBtn("⚔️", "COMBAT", "combat")
addSideBtn("👁️", "ESP", "esp")
addSideBtn("📍", "TELEPORT", "locations")
addSideSection("▸ SYSTEM")
addSideBtn("💎", "CREDITS", "credits")

-- ============================================================
--  STATUS BAR
-- ============================================================
local SB = Instance.new("Frame", Main)
SB.Size = UDim2.new(1, 0, 0, SB_H)
SB.Position = UDim2.new(0, 0, 1, -SB_H)
SB.BackgroundColor3 = C.surface
SB.BackgroundTransparency = 0.4
SB.BorderSizePixel = 0

local sbTop = Instance.new("Frame", SB)
sbTop.Size = UDim2.new(1, 0, 0, 2)
sbTop.BackgroundColor3 = C.neon
sbTop.BorderSizePixel = 0

local dot = Instance.new("Frame", SB)
dot.Size = UDim2.new(0, 8, 0, 8)
dot.Position = UDim2.new(0, 16, 0.5, -4)
dot.BackgroundColor3 = C.neonGreen
dot.BorderSizePixel = 0
corner(dot, 4)

-- Pulse animation for dot
task.spawn(function()
    while dot.Parent do
        for i = 0.5, 1, 0.05 do
            dot.BackgroundTransparency = i
            task.wait(0.05)
        end
        for i = 1, 0.5, -0.05 do
            dot.BackgroundTransparency = i
            task.wait(0.05)
        end
    end
end)

mkLbl(SB, "SYSTEM ONLINE", 11, C.neon, false, Enum.TextXAlignment.Left, 32, 0, 110, SB_H)
mkLbl(SB, "|", 11, C.neonBlue, false, Enum.TextXAlignment.Left, 145, 0, 10, SB_H)

local sbSilent = mkLbl(SB, "SILENT: ON", 11, C.neonGreen, true, Enum.TextXAlignment.Left, 158, 0, 100, SB_H)
mkLbl(SB, "|", 11, C.neonBlue, false, Enum.TextXAlignment.Left, 260, 0, 10, SB_H)

local sbFov = mkLbl(SB, "FOV: 250", 11, C.textDim, true, Enum.TextXAlignment.Left, 273, 0, 80, SB_H)
mkLbl(SB, "NanaChan", 11, C.textDim, false, Enum.TextXAlignment.Right, 0, 0, W - 16, SB_H)

-- Update status bar
task.spawn(function()
    while true do
        task.wait(0.5)
        sbSilent.Text = SilentAim.Enabled and "SILENT: ON" or "SILENT: OFF"
        sbSilent.TextColor3 = SilentAim.Enabled and C.neonGreen or C.neonRed
        sbFov.Text = "FOV: " .. math.floor(SilentAim.FOV)
    end
end)

-- ============================================================
--  MINIMIZE / REOPEN / CLOSE
-- ============================================================
local minimized = false
local reopenDragging = false
local reopenDragStart, reopenStartPos
local reopenMoved = false

local function doMinimize()
    minimized = true
    tw(Main, {Size = UDim2.new(0, W, 0, 0)}, 0.25)
    task.spawn(function()
        task.wait(0.28)
        Main.Visible = false
        ReopenBtn.Position = UDim2.new(0, Main.AbsolutePosition.X, 0, Main.AbsolutePosition.Y)
        ReopenBtn.Visible = true
    end)
end

local function doReopen()
    minimized = false
    ReopenBtn.Visible = false
    Main.Visible = true
    tw(Main, {Size = UDim2.new(0, W, 0, H)}, 0.25)
end

ReopenBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        reopenDragging = true
        reopenMoved = false
        reopenDragStart = input.Position
        reopenStartPos = ReopenBtn.Position
    end
end)

ReopenBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        if not reopenMoved then doReopen() end
        reopenDragging = false
        reopenMoved = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if reopenDragging and (input.UserInputType == Enum.UserInputType.Touch or
                           input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - reopenDragStart
        if delta.Magnitude > 5 then
            reopenMoved = true
            ReopenBtn.Position = UDim2.new(
                reopenStartPos.X.Scale, reopenStartPos.X.Offset + delta.X,
                reopenStartPos.Y.Scale, reopenStartPos.Y.Offset + delta.Y
            )
        end
    end
end)

MinBtn.MouseButton1Click:Connect(function()
    if not minimized then doMinimize() else doReopen() end
end)

CloseBtn.MouseButton1Click:Connect(function()
    SilentAim.Enabled = false
    if SilentAim.Circle then SilentAim.Circle:Remove() end
    if SilentAim.CircleOutline then SilentAim.CircleOutline:Remove() end
    WalkWater = false
    local wp = workspace:FindFirstChild("RivalsWaterSolid")
    if wp then wp:Destroy() end
    
    tw(Main, {Size = UDim2.new(0, W, 0, 0)}, 0.25)
    task.wait(0.3)
    ScreenGui:Destroy()
end)

-- ============================================================
--  INITIALIZATION
-- ============================================================
showPage("home")

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.V then
        SilentAim.Enabled = not SilentAim.Enabled
    elseif input.KeyCode == Enum.KeyCode.U then
        FastAttackEnabled = not FastAttackEnabled
    elseif input.KeyCode == Enum.KeyCode.B then
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.new(0, 50, 0)
        end
    end
end)
