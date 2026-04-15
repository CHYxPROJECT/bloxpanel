-- ============================================================
--   BLOX PANEL OBSIDIAN EDITION  ·  by NanaChan
--   Blox Fruits  ·  Compatible with Delta Executorr
--   PREMIUM EDITION - PAID SCRIPT
-- ============================================================

-- ============================================================
--  [0] OBSIDIAN INTRO - BLUE CYBERPUNK
-- ============================================================
local function RunIntro()
    local TS2 = game:GetService("TweenService")
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "ObsidianIntro"
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    pcall(function() introGui.Parent = game:GetService("CoreGui") end)
    if not introGui.Parent then
        introGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(5,8,15)
    bg.BorderSizePixel = 0

    -- Animated gradient background
    local grad = Instance.new("UIGradient", bg)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(5,8,15)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8,20,40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5,8,15)),
    })
    grad.Rotation = 45

    -- Animate gradient
    task.spawn(function()
        while bg.Parent do
            grad.Rotation = grad.Rotation + 0.5
            task.wait(0.05)
        end
    end)

    local title = Instance.new("TextLabel", bg)
    title.Size = UDim2.new(1,0,0,90)
    title.Position = UDim2.new(0,0,0.22,0)
    title.BackgroundTransparency = 1
    title.Text = "BLOX PANEL"
    title.TextColor3 = Color3.fromRGB(0,180,255)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 72
    title.TextScaled = false
    title.TextStrokeTransparency = 0.4
    title.TextStrokeColor3 = Color3.fromRGB(0,80,160)
    title.TextTransparency = 1

    local glow = Instance.new("TextLabel", bg)
    glow.Size = title.Size
    glow.Position = title.Position + UDim2.new(0,3,0,3)
    glow.BackgroundTransparency = 1
    glow.Text = title.Text
    glow.TextColor3 = Color3.fromRGB(0,120,200)
    glow.Font = title.Font
    glow.TextSize = title.TextSize
    glow.TextTransparency = 1
    glow.ZIndex = title.ZIndex - 1

    local sub1 = Instance.new("TextLabel", bg)
    sub1.Size = UDim2.new(1,0,0,32)
    sub1.Position = UDim2.new(0,0,0.22,92)
    sub1.BackgroundTransparency = 1
    sub1.Text = "OBSIDIAN EDITION"
    sub1.TextColor3 = Color3.fromRGB(80,160,220)
    sub1.Font = Enum.Font.GothamBold
    sub1.TextSize = 24
    sub1.TextTransparency = 1

    local sub2 = Instance.new("TextLabel", bg)
    sub2.Size = UDim2.new(1,0,0,26)
    sub2.Position = UDim2.new(0,0,0.22,130)
    sub2.BackgroundTransparency = 1
    sub2.Text = "Initializing obsidian protocols..."
    sub2.TextColor3 = Color3.fromRGB(60,120,180)
    sub2.Font = Enum.Font.Code
    sub2.TextSize = 16
    sub2.TextTransparency = 1

    local paidText = Instance.new("TextLabel", bg)
    paidText.Size = UDim2.new(1,0,0,36)
    paidText.Position = UDim2.new(0,0,0.68,0)
    paidText.BackgroundTransparency = 1
    paidText.Text = "🔒 PREMIUM SCRIPT - PAID ACCESS ONLY"
    paidText.TextColor3 = Color3.fromRGB(255,180,50)
    paidText.Font = Enum.Font.GothamBold
    paidText.TextSize = 18
    paidText.TextTransparency = 1

    local telegramText = Instance.new("TextLabel", bg)
    telegramText.Size = UDim2.new(1,0,0,24)
    telegramText.Position = UDim2.new(0,0,0.75,0)
    telegramText.BackgroundTransparency = 1
    telegramText.Text = "t.me/nanaanasyalala"
    telegramText.TextColor3 = Color3.fromRGB(0,200,255)
    telegramText.Font = Enum.Font.GothamBold
    telegramText.TextSize = 14
    telegramText.TextTransparency = 1

    -- Enhanced blue matrix rain
    task.spawn(function()
        for i = 1, 200 do
            task.spawn(function()
                while bg.Parent do
                    local m = Instance.new("TextLabel", bg)
                    local chars = {"0","1","█","▓","▒","░","◆","◇","●","○","◐","◑","▪","▫","■","□"}
                    m.Text = chars[math.random(1,#chars)]
                    m.Position = UDim2.new(math.random(),0,math.random(),0)
                    m.BackgroundTransparency = 1
                    
                    local blueVar = math.random(80,255)
                    m.TextColor3 = Color3.fromRGB(
                        math.random(0,30),
                        math.random(80,blueVar),
                        blueVar
                    )
                    m.Font = Enum.Font.Code
                    m.TextSize = math.random(8,20)
                    m.TextTransparency = 1
                    m.ZIndex = 1
                    m.Parent = bg
                    
                    local dur = math.random(3,15)/10
                    TS2:Create(m, TweenInfo.new(dur/3), {TextTransparency=math.random(0,0.5)}):Play()
                    task.wait(dur)
                    TS2:Create(m, TweenInfo.new(dur/3), {TextTransparency=1}):Play()
                    game:GetService("Debris"):AddItem(m, dur*1.5)
                    task.wait(math.random(1,8)/10)
                end
            end)
            task.wait(0.015)
        end
    end)

    -- Animated scan lines
    task.spawn(function()
        while bg.Parent do
            local line = Instance.new("Frame", bg)
            line.Size = UDim2.new(1, 0, 0, 2)
            line.Position = UDim2.new(0, 0, math.random(), 0)
            line.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
            line.BackgroundTransparency = 0.7
            line.BorderSizePixel = 0
            line.ZIndex = 2
            
            TS2:Create(line, TweenInfo.new(1.5), {Position = line.Position + UDim2.new(0,0,0.1,0), BackgroundTransparency = 1}):Play()
            game:GetService("Debris"):AddItem(line, 1.5)
            task.wait(0.15)
        end
    end)

    task.spawn(function()
        task.wait(0.5)
        TS2:Create(title, TweenInfo.new(0.8,Enum.EasingStyle.Quint), {TextTransparency=0}):Play()
        TS2:Create(glow, TweenInfo.new(0.8,Enum.EasingStyle.Quint), {TextTransparency=0.8}):Play()
        task.wait(0.4)
        TS2:Create(sub1, TweenInfo.new(0.6), {TextTransparency=0}):Play()
        task.wait(0.3)
        TS2:Create(sub2, TweenInfo.new(0.6), {TextTransparency=0}):Play()
        task.wait(0.5)
        TS2:Create(paidText, TweenInfo.new(0.8), {TextTransparency=0}):Play()
        task.wait(0.3)
        TS2:Create(telegramText, TweenInfo.new(0.8), {TextTransparency=0}):Play()
        task.wait(4.5)
        local fi = TweenInfo.new(1, Enum.EasingStyle.Linear)
        TS2:Create(bg, fi, {BackgroundTransparency=1}):Play()
        TS2:Create(title, fi, {TextTransparency=1}):Play()
        TS2:Create(glow, fi, {TextTransparency=1}):Play()
        TS2:Create(sub1, fi, {TextTransparency=1}):Play()
        TS2:Create(sub2, fi, {TextTransparency=1}):Play()
        TS2:Create(paidText, fi, {TextTransparency=1}):Play()
        TS2:Create(telegramText, fi, {TextTransparency=1}):Play()
        task.wait(1.2)
        introGui:Destroy()
    end)
end

RunIntro()
task.wait(7)

-- ============================================================
--  [1] SERVICES
-- ============================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local TweenService      = game:GetService("TweenService")
local Workspace         = game:GetService("Workspace")
local LP = Players.LocalPlayer

-- ============================================================
--  [2] OBSIDIAN BLUE COLORS
-- ============================================================
local C = {
    bg          = Color3.fromRGB(10,14,24),
    bgDark      = Color3.fromRGB(5,8,15),
    surface     = Color3.fromRGB(18,26,42),
    surface2    = Color3.fromRGB(28,40,65),
    surface3    = Color3.fromRGB(38,55,85),
    accent      = Color3.fromRGB(0,170,255),
    accentLight = Color3.fromRGB(100,210,255),
    accentDark  = Color3.fromRGB(0,100,180),
    text        = Color3.fromRGB(230,245,255),
    textDim     = Color3.fromRGB(120,160,200),
    textDark    = Color3.fromRGB(80,120,160),
    premium     = Color3.fromRGB(255,180,50),
    danger      = Color3.fromRGB(255,80,80),
    success     = Color3.fromRGB(80,255,120),
    white       = Color3.new(1,1,1),
    black       = Color3.new(0,0,0),
}

-- ============================================================
--  [3] SIZES
-- ============================================================
local SIZES = {
    {name="Compact", w=420, h=380},
    {name="Standard", w=580, h=500},
    {name="Extended", w=720, h=620},
    {name="Ultra",    w=860, h=740},
}
local currentSizeIdx = 2

-- ============================================================
--  [4] HELPERS
-- ============================================================
local function corner(p,r)
    local c = Instance.new("UICorner",p); c.CornerRadius = UDim.new(0,r or 12)
end
local function stroke(p,col,th,tr)
    local s = Instance.new("UIStroke",p)
    s.Color=col or C.accent; s.Thickness=th or 1; s.Transparency=tr or 0.4
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
end
local function tw(obj,props,t)
    TweenService:Create(obj,TweenInfo.new(t or 0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),props):Play()
end
local function mkLbl(parent,text,sz,col,bold,xAl,x,y,w,h)
    local l = Instance.new("TextLabel",parent)
    l.BackgroundTransparency=1; l.Text=text; l.TextSize=sz
    l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextColor3=col; l.TextXAlignment=xAl or Enum.TextXAlignment.Left
    l.Size=UDim2.new(0,w,0,h); l.Position=UDim2.new(0,x,0,y)
    return l
end

-- ============================================================
--  [5] LOGIC VARIABLES
-- ============================================================
local FastAttackEnabled  = false
local FastAttackRange    = 12000
local FastAttackConn     = nil
local FruitAttack        = false
local FruitAttackConn    = nil
local InfJumpEnabled     = false
local NoClipEnabled      = false
local WalkWater          = false
local SpeedEnabled       = false
local SpeedValue         = 16

-- Player / TP
local SelectedPlayer   = nil
local TeleportEnabled  = false
local InstaTpEnabled   = false
local SpectateEnabled  = false
local TeleportConn     = nil
local InstaTpConn      = nil
local SpectateConn     = nil
local ActiveTween      = nil
local YOffset          = 0
local PredictionStr    = 0
local TweenSpeed       = {X=350}

-- ESP
local ESPEnabled = false
local ESPBoxes   = false
local ESPNames   = false
local ESPHealth  = false
local ESPObjects = {}

-- Silent Aim
local SilentAimEnabled = false
local SilentAimMode = "Enemy"
local SilentAimFOV = 200
local SilentAimHitPart = "Head"

-- Azucar Hub vars
local SelectedPlayers   = {}
local KillFlashActive   = false
local TrackingActive    = false
local AntiPerrasActive  = false
local TweenTracking     = false
local FullBright        = false
local TrackerHeight     = 300
local OrbitDistance     = 5
local OrbitRot          = 0
local AzucarStayTime    = 0.3

-- Net
local Net            = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterHit    = Net["RE/RegisterHit"]
local RegisterAttack = Net["RE/RegisterAttack"]

-- ============================================================
--  [6] LOGIC: FAST ATTACK
-- ============================================================
local function AttackMultipleTargets(targets)
    pcall(function()
        if not targets or #targets==0 then return end
        local all = {}
        for _,char in pairs(targets) do
            local head = char:FindFirstChild("Head")
            local hrp  = char:FindFirstChild("HumanoidRootPart")
            if hrp and getgenv().HitboxExpander then
                hrp.Size        = Vector3.new(30,30,30)
                hrp.Transparency= 0.7
                hrp.BrickColor  = BrickColor.new("Cyan")
                hrp.Material    = Enum.Material.ForceField
                hrp.CanCollide  = false
            end
            if head then table.insert(all,{char,head}) end
        end
        if #all==0 then return end
        RegisterAttack:FireServer(0)
        RegisterHit:FireServer(all[1][2], all)
    end)
end

local function StartFastAttack()
    if FastAttackConn then task.cancel(FastAttackConn) end
    FastAttackConn = task.spawn(function()
        while FastAttackEnabled do
            task.wait(0.005)
            local myChar = LP.Character
            local myHRP  = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myHRP then continue end
            local targets = {}
            for _,pl in pairs(Players:GetPlayers()) do
                if pl~=LP and pl.Character then
                    local hum = pl.Character:FindFirstChild("Humanoid")
                    local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and hum.Health>0 and
                       (hrp.Position-myHRP.Position).Magnitude<=FastAttackRange then
                        table.insert(targets, pl.Character)
                    end
                end
            end
            local en = workspace:FindFirstChild("Enemies")
            if en then
                for _,npc in pairs(en:GetChildren()) do
                    local hum = npc:FindFirstChild("Humanoid")
                    local hrp = npc:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and hum.Health>0 and
                       (hrp.Position-myHRP.Position).Magnitude<=FastAttackRange then
                        table.insert(targets, npc)
                    end
                end
            end
            if #targets>0 then AttackMultipleTargets(targets) end
        end
    end)
end

-- ============================================================
--  [7] LOGIC: SILENT AIM
-- ============================================================
local function GetClosestToMouse(mode)
    local closest = nil
    local shortestDist = SilentAimFOV
    local mousePos = UserInputService:GetMouseLocation()
    local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local function checkCharacter(char)
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local targetPart = char:FindFirstChild(SilentAimHitPart)
        
        if humanoid and targetPart and humanoid.Health > 0 then
            local screenPos, onScreen = Workspace.CurrentCamera:WorldToViewportPoint(targetPart.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < shortestDist then
                    shortestDist = dist
                    closest = targetPart
                end
            end
        end
    end

    if mode == "Enemy" or mode == "Both" then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LP then
                checkCharacter(plr.Character)
            end
        end
    end

    if mode == "NPC" or mode == "Both" then
        local enemies = Workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in pairs(enemies:GetChildren()) do
                checkCharacter(npc)
            end
        end
    end

    return closest
end

local function StartSilentAim()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if SilentAimEnabled and (method == "FireServer" or method == "InvokeServer") then
            local remoteName = tostring(self)
            if remoteName:lower():find("hit") or remoteName:lower():find("attack") or 
               remoteName:lower():find("skill") or remoteName:lower():find("ability") then
                local target = GetClosestToMouse(SilentAimMode)
                if target then
                    for i, arg in pairs(args) do
                        if typeof(arg) == "CFrame" then
                            args[i] = CFrame.new(target.Position)
                        elseif typeof(arg) == "Vector3" then
                            args[i] = target.Position
                        end
                    end
                end
            end
        end
        
        return oldNamecall(self, unpack(args))
    end)
end

-- ============================================================
--  [8] LOGIC: NEAREST PLAYER + FRUIT ATTACK
-- ============================================================
local function GetNearestPlayer()
    local nearest, dist = nil, math.huge
    local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _,v in pairs(Players:GetPlayers()) do
        if v~=LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local d = (myHRP.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then dist=d; nearest=v end
        end
    end
    return nearest
end

local function StartFruitAttack(toolName, extraArg)
    if FruitAttackConn then task.cancel(FruitAttackConn) end
    FruitAttackConn = task.spawn(function()
        while FruitAttack do
            task.wait(0.001)
            local target = GetNearestPlayer()
            if target and target.Character then
                local tool = LP.Character:FindFirstChild(toolName)
                if tool then
                    local dir = (target.Character.HumanoidRootPart.Position -
                                 LP.Character.HumanoidRootPart.Position).Unit
                    pcall(function()
                        if extraArg then
                            tool:WaitForChild("LeftClickRemote"):FireServer(dir,1,true)
                        else
                            tool:WaitForChild("LeftClickRemote"):FireServer(dir,1)
                        end
                    end)
                end
            end
        end
    end)
end

-- ============================================================
--  [9] LOGIC: MOVEMENT
-- ============================================================
RunService.Heartbeat:Connect(function()
    if SpeedEnabled and LP.Character then
        local hum = LP.Character:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude>0 then
            LP.Character:TranslateBy(hum.MoveDirection*(SpeedValue/55))
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
            if v:IsA("BasePart") then v.CanCollide=false end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local char = LP.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if WalkWater and hrp then
        if hrp.Position.Y>=9.5 and hrp.Velocity.Y<=0 then
            local wp = workspace:FindFirstChild("RivalsWaterSolid")
            if not wp then
                wp = Instance.new("Part",workspace)
                wp.Name="RivalsWaterSolid"; wp.Size=Vector3.new(20,1,20)
                wp.Transparency=1; wp.Anchored=true
                wp.CanCollide=true; wp.CanQuery=false
            end
            wp.CFrame = CFrame.new(hrp.Position.X,9.2,hrp.Position.Z)
        else
            local wp = workspace:FindFirstChild("RivalsWaterSolid")
            if wp then wp:Destroy() end
        end
    else
        local wp = workspace:FindFirstChild("RivalsWaterSolid")
        if wp then wp:Destroy() end
    end
end)

-- ============================================================
--  [10] LOGIC: PLAYER LOCK
-- ============================================================
local function SetNoCollide()
    pcall(function()
        if not LP.Character then return end
        for _,v in ipairs(LP.Character:GetChildren()) do
            if v:IsA("BasePart") then v.CanCollide=false end
        end
    end)
end
local function SetCollide()
    pcall(function()
        if not LP.Character then return end
        for _,v in ipairs(LP.Character:GetChildren()) do
            if v:IsA("BasePart") then v.CanCollide=true end
        end
    end)
end
local function TweenToPlayer(targetHRP)
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local HRP  = LP.Character.HumanoidRootPart
    local pred = targetHRP.Position + (targetHRP.Velocity * PredictionStr)
    local tCF  = CFrame.new(pred) * CFrame.Angles(0,math.rad(targetHRP.Orientation.Y),0) * CFrame.new(0,YOffset,0)
    local dist = (tCF.Position - HRP.Position).Magnitude
    if ActiveTween then ActiveTween:Cancel() end
    ActiveTween = TweenService:Create(HRP, TweenInfo.new(dist/TweenSpeed.X,Enum.EasingStyle.Linear), {CFrame=tCF})
    ActiveTween:Play()
end

-- ============================================================
--  [11] LOGIC: ESP
-- ============================================================
local function ClearESP()
    for _,o in pairs(ESPObjects) do if o and o.Parent then o:Destroy() end end
    ESPObjects = {}
end

local function CreateESPObject(char, player)
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not head then return end

    local espFolder = Instance.new("Folder", char)
    espFolder.Name = "ObsidianESP"
    table.insert(ESPObjects, espFolder)

    if ESPNames then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "NameESP"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        
        local nameLabel = Instance.new("TextLabel", billboard)
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player and player.Name or char.Name
        nameLabel.TextColor3 = C.accentLight
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 14
        nameLabel.TextStrokeTransparency = 0
        
        if ESPHealth and humanoid then
            local healthLabel = Instance.new("TextLabel", billboard)
            healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
            healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
            healthLabel.BackgroundTransparency = 1
            healthLabel.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
            healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            healthLabel.Font = Enum.Font.Gotham
            healthLabel.TextSize = 12
            
            task.spawn(function()
                while billboard.Parent do
                    if humanoid then
                        healthLabel.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                        local healthPercent = humanoid.Health / humanoid.MaxHealth
                        healthLabel.TextColor3 = Color3.fromRGB(255 * (1-healthPercent), 255 * healthPercent, 50)
                    end
                    task.wait(0.1)
                end
            end)
        end
        
        billboard.Parent = espFolder
    end

    if ESPBoxes then
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "BoxESP"
        box.Adornee = hrp
        box.Size = Vector3.new(4, 6, 4)
        box.Color3 = C.accent
        box.Transparency = 0.7
        box.ZIndex = 10
        box.AlwaysOnTop = true
        box.Parent = espFolder
    end
end

local function UpdateESP()
    ClearESP()
    if not ESPEnabled then return end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            CreateESPObject(p.Character, p)
        end
    end
    
    local enemies = workspace:FindFirstChild("Enemies")
    if enemies then
        for _, npc in pairs(enemies:GetChildren()) do
            CreateESPObject(npc, nil)
        end
    end
end

task.spawn(function()
    while true do 
        task.wait(3) 
        if ESPEnabled then 
            UpdateESP() 
        end 
    end
end)

-- ============================================================
--  [12] KEYS
-- ============================================================
UserInputService.InputBegan:Connect(function(input,gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.U then
        FastAttackEnabled = not FastAttackEnabled
        if FastAttackEnabled then StartFastAttack()
        else if FastAttackConn then task.cancel(FastAttackConn) end end
    end
    if input.KeyCode == Enum.KeyCode.B then
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local flag = hrp:FindFirstChild("UpLoop")
            if flag then flag:Destroy() else
                flag = Instance.new("BoolValue",hrp); flag.Name="UpLoop"
                task.spawn(function()
                    while flag.Parent do
                        hrp.CFrame = hrp.CFrame * CFrame.new(0,273861,0)
                        task.wait(0.05)
                    end
                end)
            end
        end
    end
end)

-- ============================================================
--  [13] ROOT GUI - OBSIDIAN EDITION
-- ============================================================
local pgui = LP:WaitForChild("PlayerGui")
if pgui:FindFirstChild("ObsidianPanel") then pgui.ObsidianPanel:Destroy() end
local ScreenGui = Instance.new("ScreenGui",pgui)
ScreenGui.Name="ObsidianPanel"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

local S = SIZES[currentSizeIdx]
local W, H = S.w, S.h
local HDR_H  = 70
local CHIP_H = 56
local SB_H   = 36
local SIDE_W = 140
local BODY_Y = HDR_H + CHIP_H + 14
local BODY_H = H - BODY_Y - SB_H

-- ============================================================
--  MAIN FRAME - OBSIDIAN GLASS
-- ============================================================
local Main = Instance.new("Frame",ScreenGui)
Main.Name="Main"; Main.Size=UDim2.new(0,W,0,H)
Main.Position=UDim2.new(0.5,-W/2,0.25,0)
Main.BackgroundColor3=C.bg; Main.Active=true; Main.Draggable=true
Main.ClipsDescendants=true; corner(Main,20)

-- Multi-layer border effect
local border1 = Instance.new("UIStroke",Main)
border1.Color = C.accentDark
border1.Thickness = 2
border1.Transparency = 0.5

local border2 = Instance.new("UIStroke",Main)
border2.Color = C.accent
border2.Thickness = 1
border2.Transparency = 0.7

-- Inner glow
local innerGlow = Instance.new("ImageLabel", Main)
innerGlow.Name = "InnerGlow"
innerGlow.Size = UDim2.new(1, -4, 1, -4)
innerGlow.Position = UDim2.new(0, 2, 0, 2)
innerGlow.BackgroundTransparency = 1
innerGlow.Image = "rbxassetid://8992239138"
innerGlow.ImageColor3 = C.accent
innerGlow.ImageTransparency = 0.95
innerGlow.ScaleType = Enum.ScaleType.Stretch
innerGlow.ZIndex = 0

-- Reopen button
local ReopenBtn = Instance.new("TextButton",ScreenGui)
ReopenBtn.Size=UDim2.new(0,180,0,48); ReopenBtn.Position=UDim2.new(0.5,-90,0.25,0)
ReopenBtn.BackgroundColor3=C.surface; ReopenBtn.Text="▲  BLOX PANEL"
ReopenBtn.TextColor3=C.accentLight; ReopenBtn.Font=Enum.Font.GothamBold
ReopenBtn.TextSize=14; ReopenBtn.BorderSizePixel=0; ReopenBtn.Visible=false
corner(ReopenBtn,12); stroke(ReopenBtn,C.accent,2,0.4)

-- Premium badge
local premBadge = Instance.new("Frame", ReopenBtn)
premBadge.Size = UDim2.new(0, 60, 0, 22)
premBadge.Position = UDim2.new(1, -70, 0, -11)
premBadge.BackgroundColor3 = C.premium
premBadge.BorderSizePixel = 0
corner(premBadge, 6)
local premText = Instance.new("TextLabel", premBadge)
premText.Size = UDim2.new(1, 0, 1, 0)
premText.BackgroundTransparency = 1
premText.Text = "PRO"
premText.TextColor3 = C.black
premText.Font = Enum.Font.GothamBold
premText.TextSize = 12

-- ============================================================
--  HEADER - OBSIDIAN STYLE
-- ============================================================
local Hdr = Instance.new("Frame",Main)
Hdr.Size=UDim2.new(1,0,0,HDR_H); Hdr.BackgroundColor3=C.surface
Hdr.BorderSizePixel=0; corner(Hdr,20)
local HFill = Instance.new("Frame",Hdr)
HFill.Size=UDim2.new(1,0,0,20); HFill.Position=UDim2.new(0,0,1,-20)
HFill.BackgroundColor3=C.surface; HFill.BorderSizePixel=0

-- Animated header line
local HDLine = Instance.new("Frame",Hdr)
HDLine.Size=UDim2.new(1,0,0,3); HDLine.Position=UDim2.new(0,0,1,-3)
HDLine.BackgroundColor3=C.accent; HDLine.BorderSizePixel=0

-- Gradient animation
task.spawn(function()
    while HDr.Parent do
        for i = 0, 1, 0.01 do
            if not HDr.Parent then break end
            HDLine.BackgroundColor3 = Color3.fromRGB(0, 170*i, 255)
            task.wait(0.03)
        end
    end
end)

local titleLbl = mkLbl(Hdr,"BLOX PANEL",24,C.accentLight,true,Enum.TextXAlignment.Left,20,12,220,32)
local subLbl = mkLbl(Hdr,"OBSIDIAN EDITION",11,C.textDim,false,Enum.TextXAlignment.Left,20,44,180,18)

-- Premium badge in header
local ProF = Instance.new("Frame",Hdr)
ProF.Size=UDim2.new(0,50,0,26); ProF.Position=UDim2.new(0,240,0,14)
ProF.BackgroundColor3=C.premium; corner(ProF,8)
mkLbl(ProF,"PRO",12,C.black,true,Enum.TextXAlignment.Center,0,0,50,26)

-- Paid indicator
local PaidF = Instance.new("Frame",Hdr)
PaidF.Size=UDim2.new(0,90,0,24); PaidF.Position=UDim2.new(0,300,0,15)
PaidF.BackgroundColor3=Color3.fromRGB(180,50,50); corner(PaidF,8)
mkLbl(PaidF,"💎 PAID",11,C.white,true,Enum.TextXAlignment.Center,0,0,90,24)

local function winBtn(txt,bg2,xOff)
    local b = Instance.new("TextButton",Hdr)
    b.Size=UDim2.new(0,32,0,32); b.Position=UDim2.new(1,xOff,0,19)
    b.BackgroundColor3=bg2; b.Text=txt; b.TextColor3=C.white
    b.Font=Enum.Font.GothamBold; b.TextSize=16; b.BorderSizePixel=0; corner(b,16)
    return b
end
local CloseBtn = winBtn("✕",C.danger,-40)
local MinBtn   = winBtn("–",C.surface2,-76)

-- ============================================================
--  CHIPS - OBSIDIAN DESIGN
-- ============================================================
local CHIP_Y = HDR_H+8
local function makeChip(icon,top,bot,xPos)
    local f = Instance.new("Frame",Main)
    f.Size=UDim2.new(0,(W-36)/2,0,CHIP_H); f.Position=UDim2.new(0,xPos,0,CHIP_Y)
    f.BackgroundColor3=C.surface; f.BorderSizePixel=0; corner(f,14)
    stroke(f,C.accentDark,1,0.5)
    
    local iconBg = Instance.new("Frame",f)
    iconBg.Size=UDim2.new(0,42,0,42); iconBg.Position=UDim2.new(0,10,0.5,-21)
    iconBg.BackgroundColor3=C.surface2; corner(iconBg,12)
    mkLbl(iconBg,icon,22,C.accent,false,Enum.TextXAlignment.Center,0,0,42,42)
    
    mkLbl(f,top,10,C.textDim,false,Enum.TextXAlignment.Left,62,8,160,16)
    mkLbl(f,bot,16,C.accentLight,true,Enum.TextXAlignment.Left,62,26,160,22)
end
makeChip("🎮","GAME","Blox Fruits",16)
makeChip("⚡","EXECUTOR","Delta",16+(W-36)/2+4)

local GLine = Instance.new("Frame",Main)
GLine.Size=UDim2.new(1,-28,0,2); GLine.Position=UDim2.new(0,14,0,CHIP_Y+CHIP_H+6)
GLine.BackgroundColor3=C.accentDark; GLine.BorderSizePixel=0

-- ============================================================
--  SIDEBAR + CONTENT
-- ============================================================
local Sidebar = Instance.new("ScrollingFrame",Main)
Sidebar.Size=UDim2.new(0,SIDE_W,1,-BODY_Y-SB_H); Sidebar.Position=UDim2.new(0,0,0,BODY_Y)
Sidebar.BackgroundColor3=C.surface; Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=4; Sidebar.ScrollBarImageColor3=C.accent
Sidebar.CanvasSize=UDim2.new(0,0,0,0); Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y

local SBLine = Instance.new("Frame",Main)
SBLine.Size=UDim2.new(0,2,1,-BODY_Y-SB_H); SBLine.Position=UDim2.new(0,SIDE_W,0,BODY_Y)
SBLine.BackgroundColor3=C.accentDark; SBLine.BorderSizePixel=0

local ContentBG = Instance.new("Frame",Main)
ContentBG.Size=UDim2.new(1,-SIDE_W-2,1,-BODY_Y-SB_H)
ContentBG.Position=UDim2.new(0,SIDE_W+2,0,BODY_Y)
ContentBG.BackgroundColor3=C.bg; ContentBG.BorderSizePixel=0
ContentBG.ClipsDescendants=true

-- ============================================================
--  PAGE SYSTEM
-- ============================================================
local pages      = {}
local currentPage = nil
local sideBtnRefs = {}

local function newPage(id)
    local sf = Instance.new("ScrollingFrame",ContentBG)
    sf.Name=id; sf.Size=UDim2.new(1,0,1,0); sf.BackgroundTransparency=1
    sf.ScrollBarThickness=6; sf.ScrollBarImageColor3=C.accent
    sf.CanvasSize=UDim2.new(0,0,0,0); sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
    sf.Visible=false; sf.BorderSizePixel=0
    local ul = Instance.new("UIListLayout",sf)
    ul.Padding=UDim.new(0,10); ul.HorizontalAlignment=Enum.HorizontalAlignment.Center
    ul.SortOrder=Enum.SortOrder.LayoutOrder
    local up = Instance.new("UIPadding",sf)
    up.PaddingTop=UDim.new(0,14); up.PaddingBottom=UDim.new(0,14)
    up.PaddingLeft=UDim.new(0,12); up.PaddingRight=UDim.new(0,12)
    pages[id]=sf; return sf
end

local function showPage(id)
    for pid,pg in pairs(pages) do pg.Visible=(pid==id) end
    currentPage=id
    for _,r in pairs(sideBtnRefs) do
        local act=(r.page==id)
        r.bar.BackgroundColor3 = act and C.accent or C.surface
        r.lbl.TextColor3       = act and C.accentLight or C.textDim
        r.frame.BackgroundColor3 = act and C.surface2 or C.surface
        if act then
            tw(r.bar, {Size=UDim2.new(0,4,0.75,0)}, 0.25)
        else
            tw(r.bar, {Size=UDim2.new(0,3,0.6,0)}, 0.25)
        end
    end
end

-- ============================================================
--  COMPONENT BUILDERS - OBSIDIAN STYLE
-- ============================================================
local function secLabel(text,parent,lo)
    local wrap = Instance.new("Frame",parent)
    wrap.Size=UDim2.new(1,0,0,30); wrap.BackgroundTransparency=1; wrap.LayoutOrder=lo
    local l = Instance.new("TextLabel",wrap)
    l.Size=UDim2.new(0,0,1,0); l.AutomaticSize=Enum.AutomaticSize.X
    l.BackgroundTransparency=1; l.Text=text; l.Font=Enum.Font.GothamBold
    l.TextSize=11; l.TextColor3=C.accent; l.TextXAlignment=Enum.TextXAlignment.Left
    
    local line = Instance.new("Frame",wrap)
    line.Size=UDim2.new(1,-110,0,2); line.Position=UDim2.new(0,105,0.5,0)
    line.BackgroundColor3=C.accentDark; line.BorderSizePixel=0
    corner(line,1)
end

local function makeToggle(icon,name,desc,parent,lo,callback)
    local row = Instance.new("TextButton",parent)
    row.Size=UDim2.new(1,0,0,72); row.BackgroundColor3=C.surface
    row.Text=""; row.AutoButtonColor=false; row.BorderSizePixel=0; row.LayoutOrder=lo
    corner(row,16); stroke(row,C.accentDark,1,0.5)
    
    local iconBg = Instance.new("Frame",row)
    iconBg.Size=UDim2.new(0,46,0,46); iconBg.Position=UDim2.new(0,14,0.5,-23)
    iconBg.BackgroundColor3=C.surface2; corner(iconBg,14)
    mkLbl(iconBg,icon,24,C.accent,false,Enum.TextXAlignment.Center,0,0,46,46)
    
    local nameLbl=mkLbl(row,name,15,C.text,true,Enum.TextXAlignment.Left,72,12,W-SIDE_W-140,26)
    mkLbl(row,desc,12,C.textDim,false,Enum.TextXAlignment.Left,72,40,W-SIDE_W-140,20)
    
    local swBg = Instance.new("Frame",row)
    swBg.Size=UDim2.new(0,52,0,28); swBg.Position=UDim2.new(1,-66,0.5,-14)
    swBg.BackgroundColor3=C.bgDark; swBg.BorderSizePixel=0
    corner(swBg,14); stroke(swBg,C.accentDark,1,0.5)
    
    local knob = Instance.new("Frame",swBg)
    knob.Size=UDim2.new(0,22,0,22); knob.Position=UDim2.new(0,3,0.5,-11)
    knob.BackgroundColor3=C.textDim; knob.BorderSizePixel=0; corner(knob,11)
    
    local isOn = false
    local function setState(on)
        isOn=on
        if on then
            tw(knob,{Position=UDim2.new(0,27,0.5,-11),BackgroundColor3=C.accent},0.25)
            tw(swBg,{BackgroundColor3=Color3.fromRGB(0,50,90)},0.25)
            tw(row, {BackgroundColor3=C.surface2},0.25)
            nameLbl.TextColor3=C.accentLight
            local rs=row:FindFirstChildOfClass("UIStroke"); if rs then rs.Color=C.accent; rs.Transparency=0.3 end
            local ss=swBg:FindFirstChildOfClass("UIStroke"); if ss then ss.Color=C.accent; ss.Transparency=0.3 end
        else
            tw(knob,{Position=UDim2.new(0,3,0.5,-11),BackgroundColor3=C.textDim},0.25)
            tw(swBg,{BackgroundColor3=C.bgDark},0.25)
            tw(row, {BackgroundColor3=C.surface},0.25)
            nameLbl.TextColor3=C.text
            local rs=row:FindFirstChildOfClass("UIStroke"); if rs then rs.Color=C.accentDark; rs.Transparency=0.5 end
            local ss=swBg:FindFirstChildOfClass("UIStroke"); if ss then ss.Color=C.accentDark; ss.Transparency=0.5 end
        end
        if callback then callback(on) end
    end
    row.MouseButton1Click:Connect(function() setState(not isOn) end)
    return row, setState
end

local function makeBtn(icon,name,desc,parent,lo,callback)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,64); btn.BackgroundColor3=C.surface
    btn.Text=""; btn.AutoButtonColor=false; btn.BorderSizePixel=0; btn.LayoutOrder=lo
    corner(btn,16); stroke(btn,C.accentDark,1,0.5)
    
    local iconBg = Instance.new("Frame",btn)
    iconBg.Size=UDim2.new(0,46,0,46); iconBg.Position=UDim2.new(0,14,0.5,-23)
    iconBg.BackgroundColor3=C.surface2; corner(iconBg,14)
    mkLbl(iconBg,icon,24,C.accent,false,Enum.TextXAlignment.Center,0,0,46,46)
    
    local nameLbl=mkLbl(btn,name,15,C.text,true,Enum.TextXAlignment.Left,72,10,W-SIDE_W-120,28)
    mkLbl(btn,desc,12,C.textDim,false,Enum.TextXAlignment.Left,72,36,W-SIDE_W-120,20)
    mkLbl(btn,"▶",18,C.accent,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-16,64)
    
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=C.surface2},0.2); nameLbl.TextColor3=C.accentLight
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.accent; s.Transparency=0.3 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.2); nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.accentDark; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return btn
end

local function makeTpBtn(icon,name,coords,parent,lo,cb)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,64); btn.BackgroundColor3=C.surface
    btn.Text=""; btn.AutoButtonColor=false; btn.BorderSizePixel=0; btn.LayoutOrder=lo
    corner(btn,16); stroke(btn,C.accentDark,1,0.5)
    
    local iconBg = Instance.new("Frame",btn)
    iconBg.Size=UDim2.new(0,46,0,46); iconBg.Position=UDim2.new(0,14,0.5,-23)
    iconBg.BackgroundColor3=C.surface2; corner(iconBg,14)
    mkLbl(iconBg,icon,24,C.accent,false,Enum.TextXAlignment.Center,0,0,46,46)
    
    local nameLbl=mkLbl(btn,name,15,C.text,true,Enum.TextXAlignment.Left,72,10,W-SIDE_W-120,28)
    mkLbl(btn,coords,12,C.textDim,false,Enum.TextXAlignment.Left,72,36,W-SIDE_W-120,20)
    mkLbl(btn,"›",24,C.accent,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-16,64)
    
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=C.surface2},0.2); nameLbl.TextColor3=C.accentLight
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.accent; s.Transparency=0.3 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.2); nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.accentDark; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if cb then cb() end end)
    return btn
end

local function makeSlider(name,minV,maxV,startV,parent,lo,callback)
    local card = Instance.new("Frame",parent)
    card.Size=UDim2.new(1,0,0,80); card.BackgroundColor3=C.surface
    card.BorderSizePixel=0; card.LayoutOrder=lo; corner(card,16); stroke(card,C.accentDark,1,0.5)
    
    mkLbl(card,name,14,C.text,true,Enum.TextXAlignment.Left,16,10,W-SIDE_W-120,22)
    local valLbl=mkLbl(card,tostring(startV),14,C.accent,true,Enum.TextXAlignment.Right,0,10,W-SIDE_W-20,22)

    local minusBtn=Instance.new("TextButton",card)
    minusBtn.Size=UDim2.new(0,36,0,36); minusBtn.Position=UDim2.new(0,14,0,36)
    minusBtn.BackgroundColor3=C.surface2; minusBtn.Text="−"
    minusBtn.TextColor3=C.accentLight; minusBtn.Font=Enum.Font.GothamBold
    minusBtn.TextSize=20; minusBtn.BorderSizePixel=0; corner(minusBtn,10)

    local plusBtn=Instance.new("TextButton",card)
    plusBtn.Size=UDim2.new(0,36,0,36); plusBtn.Position=UDim2.new(1,-50,0,36)
    plusBtn.BackgroundColor3=C.surface2; plusBtn.Text="+"
    plusBtn.TextColor3=C.accentLight; plusBtn.Font=Enum.Font.GothamBold
    plusBtn.TextSize=20; minusBtn.BorderSizePixel=0; corner(plusBtn,10)

    local trackBg=Instance.new("Frame",card)
    trackBg.Size=UDim2.new(1,-116,0,8); trackBg.Position=UDim2.new(0,58,0,50)
    trackBg.BackgroundColor3=C.bgDark; trackBg.BorderSizePixel=0; corner(trackBg,4)

    local fill=Instance.new("Frame",trackBg)
    local initPct = (startV-minV)/(maxV-minV)
    fill.Size=UDim2.new(initPct,0,1,0)
    fill.BackgroundColor3=C.accent; fill.BorderSizePixel=0; corner(fill,4)

    local val=startV
    local step=math.max(1,math.floor((maxV-minV)/20))

    local function updateVal(newVal)
        val=math.clamp(newVal,minV,maxV)
        valLbl.Text=tostring(val)
        local pct=(val-minV)/(maxV-minV)
        fill.Size=UDim2.new(pct,0,1,0)
        if callback then callback(val) end
    end

    minusBtn.MouseButton1Click:Connect(function() updateVal(val-step) end)
    plusBtn.MouseButton1Click:Connect(function()  updateVal(val+step) end)

    local dragging=false
    trackBg.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or
           i.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or
           i.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=false
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if not dragging then return end
        if i.UserInputType==Enum.UserInputType.Touch or
           i.UserInputType==Enum.UserInputType.MouseMovement then
            local tAbs=trackBg.AbsolutePosition; local tSz=trackBg.AbsoluteSize
            local pct=math.clamp((i.Position.X-tAbs.X)/tSz.X,0,1)
            updateVal(math.floor(minV+(maxV-minV)*pct))
        end
    end)
    return card
end

local function makeDropdown(labelTxt,parent,lo,onSelect)
    local CW = W-SIDE_W-24
    local card = Instance.new("Frame",parent)
    card.Size=UDim2.new(1,0,0,56); card.BackgroundColor3=C.surface
    card.BorderSizePixel=0; card.LayoutOrder=lo; card.ClipsDescendants=false
    corner(card,16); stroke(card,C.accentDark,1,0.5)
    
    mkLbl(card,labelTxt,13,C.textDim,false,Enum.TextXAlignment.Left,16,0,CW-80,56)
    local selLbl=mkLbl(card,"None",13,C.accent,true,Enum.TextXAlignment.Right,0,0,CW-12,56)
    local arrow =mkLbl(card,"▾",18,C.textDim,true,Enum.TextXAlignment.Right,0,0,CW-12,56)
    
    local listFrame = Instance.new("Frame",ContentBG)
    listFrame.BackgroundColor3=C.surface2; listFrame.BorderSizePixel=0
    listFrame.Visible=false; listFrame.ZIndex=30; corner(listFrame,14); stroke(listFrame,C.accent,1,0.4)
    
    local lLayout = Instance.new("UIListLayout",listFrame)
    lLayout.Padding=UDim.new(0,3); lLayout.SortOrder=Enum.SortOrder.LayoutOrder
    
    local expanded=false
    local function buildList()
        for _,c in pairs(listFrame:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        local opts={"None"}
        for _,p in pairs(Players:GetPlayers()) do
            if p~=LP then table.insert(opts,p.Name) end
        end
        for i,opt in ipairs(opts) do
            local item = Instance.new("TextButton",listFrame)
            item.Size=UDim2.new(1,0,0,38); item.BackgroundColor3=C.surface
            item.Text=opt; item.TextColor3=C.text; item.Font=Enum.Font.GothamBold
            item.TextSize=13; item.BorderSizePixel=0; item.ZIndex=31; item.LayoutOrder=i
            corner(item,8)
            item.MouseButton1Click:Connect(function()
                selLbl.Text=opt; expanded=false; listFrame.Visible=false; arrow.Text="▾"
                if onSelect then onSelect(opt~="None" and opt or nil) end
            end)
            item.MouseEnter:Connect(function() item.BackgroundColor3=C.surface3 end)
            item.MouseLeave:Connect(function() item.BackgroundColor3=C.surface end)
        end
        listFrame.Size=UDim2.new(0,CW-24,0,math.min(#opts,6)*41)
    end
    
    local hBtn = Instance.new("TextButton",card)
    hBtn.Size=UDim2.new(1,0,1,0); hBtn.BackgroundTransparency=1
    hBtn.Text=""; hBtn.BorderSizePixel=0; hBtn.ZIndex=20
    hBtn.MouseButton1Click:Connect(function()
        expanded=not expanded
        if expanded then
            buildList()
            local abs  = card.AbsolutePosition
            local cbAb = ContentBG.AbsolutePosition
            listFrame.Position=UDim2.new(0,abs.X-cbAb.X+12,0,abs.Y-cbAb.Y+58)
            listFrame.Visible=true; arrow.Text="▴"
        else
            listFrame.Visible=false; arrow.Text="▾"
        end
    end)
    return card, buildList
end

-- ============================================================
--  PAGES
-- ============================================================

-- ── HOME ────────────────────────────────────────────────────
local pgHome = newPage("home")

local logoCard = Instance.new("Frame",pgHome)
logoCard.Size=UDim2.new(1,0,0,130); logoCard.BackgroundColor3=C.surface
logoCard.BorderSizePixel=0; logoCard.LayoutOrder=1; corner(logoCard,18); stroke(logoCard,C.accent,1,0.6)

local ring = Instance.new("Frame",logoCard)
ring.Size=UDim2.new(0,80,0,80); ring.Position=UDim2.new(0,18,0.5,-40)
ring.BackgroundColor3=C.bgDark; ring.BorderSizePixel=0; corner(ring,40)
stroke(ring,C.accent,3,0.3)

mkLbl(ring,"⚔️",40,C.accent,false,Enum.TextXAlignment.Center,0,0,80,80)
mkLbl(logoCard,"BLOX PANEL",26,C.accentLight,true,Enum.TextXAlignment.Left,112,16,280,34)
mkLbl(logoCard,"OBSIDIAN EDITION",13,C.textDim,false,Enum.TextXAlignment.Left,112,50,220,20)

local hotkeyBg = Instance.new("Frame",logoCard)
hotkeyBg.Size=UDim2.new(0,240,0,32); hotkeyBg.Position=UDim2.new(0,112,0,78)
hotkeyBg.BackgroundColor3=C.surface2; corner(hotkeyBg,8)
mkLbl(hotkeyBg,"[U] Fast Attack  ·  [B] Fly Up",11,C.accent,false,Enum.TextXAlignment.Center,0,0,240,32)

-- Premium notice
local premNotice = Instance.new("Frame",pgHome)
premNotice.Size=UDim2.new(1,0,0,60); premNotice.BackgroundColor3=Color3.fromRGB(35,25,8)
premNotice.BorderSizePixel=0; premNotice.LayoutOrder=2; corner(premNotice,16)
stroke(premNotice,C.premium,2,0.4)

mkLbl(premNotice,"💎",30,C.premium,false,Enum.TextXAlignment.Left,16,0,50,60)
mkLbl(premNotice,"PREMIUM SCRIPT",15,C.premium,true,Enum.TextXAlignment.Left,56,8,200,26)
mkLbl(premNotice,"Paid Access Only - Do Not Share",11,C.textDim,false,Enum.TextXAlignment.Left,56,32,280,22)

secLabel("UI SIZE",pgHome,3)
local sizeWrap = Instance.new("Frame",pgHome)
sizeWrap.Size=UDim2.new(1,0,0,56); sizeWrap.BackgroundColor3=C.surface
sizeWrap.BorderSizePixel=0; sizeWrap.LayoutOrder=4; corner(sizeWrap,16); stroke(sizeWrap,C.accentDark,1,0.5)

local szLay = Instance.new("UIListLayout",sizeWrap)
szLay.FillDirection=Enum.FillDirection.Horizontal; szLay.Padding=UDim.new(0,8)
szLay.HorizontalAlignment=Enum.HorizontalAlignment.Center; szLay.VerticalAlignment=Enum.VerticalAlignment.Center
local szPad = Instance.new("UIPadding",sizeWrap)
szPad.PaddingLeft=UDim.new(0,10); szPad.PaddingRight=UDim.new(0,10)

local sizeBtns = {}
local function applySize(idx)
    currentSizeIdx=idx
    local ns=SIZES[idx]
    W=ns.w; H=ns.h
    tw(Main,{Size=UDim2.new(0,ns.w,0,ns.h)},0.4)
    for i,sb in pairs(sizeBtns) do
        sb.BackgroundColor3 = i==idx and C.accent or C.surface2
        sb.TextColor3       = i==idx and C.black or C.textDim
    end
end

for i,sz in ipairs(SIZES) do
    local sb = Instance.new("TextButton",sizeWrap)
    sb.Size=UDim2.new(0.23,-6,0,40)
    sb.BackgroundColor3=i==currentSizeIdx and C.accent or C.surface2
    sb.TextColor3=i==currentSizeIdx and C.black or C.textDim
    sb.Text=sz.name; sb.Font=Enum.Font.GothamBold; sb.TextSize=13
    sb.BorderSizePixel=0; corner(sb,10)
    sb.MouseButton1Click:Connect(function() applySize(i) end)
    table.insert(sizeBtns,sb)
end

-- ── COMBAT ─────────────────────────────────────────────────
local pgC = newPage("combat")

secLabel("FAST ATTACK",pgC,1)
makeToggle("⚡","Fast Attack [U]","Range "..FastAttackRange.." studs · Key U",pgC,2,function(on)
    FastAttackEnabled=on
    if on then StartFastAttack() else if FastAttackConn then task.cancel(FastAttackConn) end end
end)
makeSlider("Fast Attack Range",0,12000,12000,pgC,3,function(v) FastAttackRange=v end)

secLabel("SILENT AIM 🎯",pgC,4)
makeToggle("🎯","Enable Silent Aim","Auto-aim skills to nearest target",pgC,5,function(on)
    SilentAimEnabled=on
    if on then StartSilentAim() end
end)

local modeCard = Instance.new("Frame",pgC)
modeCard.Size=UDim2.new(1,0,0,56); modeCard.BackgroundColor3=C.surface
modeCard.BorderSizePixel=0; modeCard.LayoutOrder=6; corner(modeCard,16); stroke(modeCard,C.accentDark,1,0.5)

mkLbl(modeCard,"Target Mode:",13,C.textDim,false,Enum.TextXAlignment.Left,16,0,110,56)

local modes = {"Enemy", "NPC", "Both"}
local modeBtns = {}
for i,mode in ipairs(modes) do
    local btn = Instance.new("TextButton",modeCard)
    btn.Size=UDim2.new(0,80,0,36); btn.Position=UDim2.new(0,130+(i-1)*88,0.5,-18)
    btn.BackgroundColor3=mode==SilentAimMode and C.accent or C.surface2
    btn.Text=mode; btn.TextColor3=mode==SilentAimMode and C.black or C.textDim
    btn.Font=Enum.Font.GothamBold; btn.TextSize=12; corner(btn,8)
    btn.MouseButton1Click:Connect(function()
        SilentAimMode=mode
        for _,b in pairs(modeBtns) do
            b.BackgroundColor3=C.surface2; b.TextColor3=C.textDim
        end
        btn.BackgroundColor3=C.accent; btn.TextColor3=C.black
    end)
    table.insert(modeBtns,btn)
end

makeSlider("Silent Aim FOV",50,800,SilentAimFOV,pgC,7,function(v) SilentAimFOV=v end)

secLabel("HITBOX",pgC,8)
makeToggle("📦","Hitbox Visible","Expands hitboxes to 30×30×30",pgC,9,function(on)
    getgenv().HitboxExpander=on
end)

secLabel("EXPLOITS",pgC,10)
makeToggle("🦘","Infinite Jump","Jump without limit in the air",pgC,11,function(on)
    InfJumpEnabled=on
end)
makeToggle("👻","No Clip","Walk through walls",pgC,12,function(on)
    NoClipEnabled=on
end)
makeToggle("🌊","Walk on Water","Walk on water surface",pgC,13,function(on)
    WalkWater=on
end)

secLabel("GOD MODE 🛡️",pgC,14)
local GodModeEnabled = false
local GodModeConns = {}
makeToggle("🛡️","God Mode","Keeps your health at maximum constantly",pgC,15,function(on)
    GodModeEnabled = on
    for _,c in pairs(GodModeConns) do pcall(function() c:Disconnect() end) end
    GodModeConns = {}
    if on then
        table.insert(GodModeConns, RunService.Stepped:Connect(function()
            pcall(function()
                local char = LP.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum then return end
                hum.Health = hum.MaxHealth
                if hum:GetState() == Enum.HumanoidStateType.Dead then
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
                char:SetAttribute("UnbreakableAll", true)
            end)
        end))
        table.insert(GodModeConns, RunService.RenderStepped:Connect(function()
            pcall(function()
                local char = LP.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
            end)
        end))
        table.insert(GodModeConns, LP.CharacterAdded:Connect(function(newChar)
            if not GodModeEnabled then return end
            task.wait(0.1)
            local hum = newChar:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = hum.MaxHealth end
            newChar:SetAttribute("UnbreakableAll", true)
        end))
    end
end)

-- ── TP & PLAYERS ────────────────────────────────────────────
local pgTP = newPage("tp")

secLabel("TARGET PLAYER",pgTP,1)
local _,ddRefresh = makeDropdown("Select Player",pgTP,2,function(name)
    SelectedPlayer=name
end)
makeBtn("🔄","Refresh List","Update available players",pgTP,3,function()
    ddRefresh()
end)

secLabel("MOVEMENT",pgTP,5)
makeToggle("🌀","Tween to Player","Smoothly moves to target",pgTP,6,function(on)
    TeleportEnabled=on
    if on then
        TeleportConn=RunService.Heartbeat:Connect(function()
            if SelectedPlayer then
                local t=Players:FindFirstChild(SelectedPlayer)
                if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
                    TweenToPlayer(t.Character.HumanoidRootPart); SetNoCollide()
                end
            end
        end)
    else
        if TeleportConn then TeleportConn:Disconnect() end
        if ActiveTween then ActiveTween:Cancel() end
        SetCollide()
    end
end)
makeToggle("⚡","Insta TP","Instantly teleport to target",pgTP,7,function(on)
    InstaTpEnabled=on
    if on then
        InstaTpConn=RunService.Stepped:Connect(function()
            if SelectedPlayer then pcall(function()
                local t=Players:FindFirstChild(SelectedPlayer)
                if t and t.Character then
                    LP.Character.HumanoidRootPart.CFrame=t.Character.HumanoidRootPart.CFrame*CFrame.new(0,YOffset,0)
                    LP.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0)
                end
            end) end
        end)
    else
        if InstaTpConn then InstaTpConn:Disconnect() end
    end
end)
makeToggle("👁️","Spectate Player","Change camera to target",pgTP,8,function(on)
    SpectateEnabled=on
    if on then
        SpectateConn=RunService.RenderStepped:Connect(function()
            if SelectedPlayer then
                local t=Players:FindFirstChild(SelectedPlayer)
                if t and t.Character then
                    workspace.CurrentCamera.CameraSubject=t.Character.Humanoid
                end
            end
        end)
    else
        if SpectateConn then SpectateConn:Disconnect() end
        if LP.Character then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end
    end
end)

secLabel("TRACKERS & KILL",pgTP,9)
makeToggle("🛰️","Air Tracker","Positions above target player",pgTP,10,function(on)
    TrackingActive=on
    if on and SelectedPlayer then
        local p=Players:FindFirstChild(SelectedPlayer)
        SelectedPlayers = p and {p} or {}
    end
end)
makeSlider("Tracker Height",2,1000,300,pgTP,11,function(v) TrackerHeight=v end)

secLabel("FRUIT ATTACK",pgTP,13)
makeToggle("🦊","Fruit Attack — Kitsune","Auto-attack nearest player",pgTP,14,function(on)
    FruitAttack=on
    if on then StartFruitAttack("Kitsune-Kitsune",true)
    else if FruitAttackConn then task.cancel(FruitAttackConn) end end
end)
makeToggle("🦖","Fruit Attack — T-Rex","Auto-attack nearest player",pgTP,15,function(on)
    FruitAttack=on
    if on then StartFruitAttack("T-Rex-T-Rex",false)
    else if FruitAttackConn then task.cancel(FruitAttackConn) end end
end)

secLabel("AUTOMATION",pgTP,16)
local autoV4On = false
makeToggle("🔮","Auto V4 Awakening","Automatically activate V4 awakening",pgTP,17,function(on)
    autoV4On = on
    if on then
        task.spawn(function()
            while autoV4On do
                task.wait(0.5)
                pcall(function()
                    local tool = LP.Backpack:FindFirstChild("Awakening") or LP.Character:FindFirstChild("Awakening")
                    if tool and tool:FindFirstChild("RemoteFunction") then
                        tool.RemoteFunction:InvokeServer(true)
                    end
                end)
            end
        end)
    end
end)

-- ── LOCATIONS ─────────────────────────────────────────────
local pgLoc = newPage("locations")

secLabel("SEA 3",pgLoc,1)
makeTpBtn("⚓","Tp Ship","CFrame: -6500, 129, -123",pgLoc,2,function()
    if LP.Character then LP.Character.HumanoidRootPart.CFrame=CFrame.new(-6500,129,-123) end
end)
makeTpBtn("🌀","Tp Empty Rivals","CFrame: -11997, 332, -8837",pgLoc,3,function()
    if LP.Character then LP.Character.HumanoidRootPart.CFrame=CFrame.new(-11997,332,-8837) end
end)

secLabel("OTHER FUNCTIONS",pgLoc,4)
makeBtn("🛸","Rivals Fly","Activate flight system",pgLoc,5,function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

-- ── OTHER FUNCTIONS ──────────────────────────────────────────
local pgAz = newPage("azucar")

secLabel("MISC 🌀",pgAz,1)
makeToggle("☀️","Full Bright","Maximum lighting on map",pgAz,2,function(on)
    FullBright=on
    if not on then
        game.Lighting.Ambient=Color3.fromRGB(0,0,0)
        game.Lighting.ClockTime=14
        game.Lighting.FogEnd=100000
    end
end)
makeToggle("👻","Invisible Mode","Makes your character invisible",pgAz,3,function(on)
    if LP.Character then
        for _,part in pairs(LP.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = on and 1 or 0
            end
        end
        local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Transparency = 1 end
    end
end)
makeBtn("🚫","Anti-AFK","Prevents being kicked for inactivity",pgAz,4,function()
    local vu=game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- ── ESP ──────────────────────────────────────────────────────
local pgESP = newPage("esp")

secLabel("VISION",pgESP,1)
makeToggle("👁️","Enable ESP","Activate ESP system",pgESP,2,function(on)
    ESPEnabled=on; UpdateESP()
end)
makeToggle("📛","Names ESP","Names above players",pgESP,3,function(on)
    ESPNames=on; if ESPEnabled then UpdateESP() end
end)
makeToggle("📦","Boxes ESP","Boxes around players",pgESP,4,function(on)
    ESPBoxes=on; if ESPEnabled then UpdateESP() end
end)
makeToggle("❤️","Health ESP","Show health bars",pgESP,5,function(on)
    ESPHealth=on; if ESPEnabled then UpdateESP() end
end)

-- ── CREDITS ───────────────────────────────────────────────────
local pgCredit = newPage("credit")

local creditCard = Instance.new("Frame",pgCredit)
creditCard.Size=UDim2.new(1,0,0,200); creditCard.BackgroundColor3=C.surface
creditCard.BorderSizePixel=0; creditCard.LayoutOrder=1; corner(creditCard,20)
stroke(creditCard,C.accent,2,0.5)

local devIcon = Instance.new("Frame",creditCard)
devIcon.Size=UDim2.new(0,100,0,100); devIcon.Position=UDim2.new(0.5,-50,0,20)
devIcon.BackgroundColor3=C.bgDark; corner(devIcon,50)
stroke(devIcon,C.accent,3,0.4)

mkLbl(devIcon,"👑",50,C.accent,false,Enum.TextXAlignment.Center,0,0,100,100)

mkLbl(creditCard,"DEVELOPER",14,C.textDim,true,Enum.TextXAlignment.Center,0,130,W-SIDE_W-24,20)
mkLbl(creditCard,"NanaChan",22,C.accentLight,true,Enum.TextXAlignment.Center,0,152,W-SIDE_W-24,28)

local tgCard = Instance.new("TextButton",pgCredit)
tgCard.Size=UDim2.new(1,0,0,80); tgCard.BackgroundColor3=C.surface
tgCard.BorderSizePixel=0; tgCard.LayoutOrder=2; corner(tgCard,16)
stroke(tgCard,C.accentDark,1,0.5)
tgCard.Text=""

local tgIcon = Instance.new("Frame",tgCard)
tgIcon.Size=UDim2.new(0,50,0,50); tgIcon.Position=UDim2.new(0,20,0.5,-25)
tgIcon.BackgroundColor3=Color3.fromRGB(0,136,204); corner(tgIcon,12)
mkLbl(tgIcon,"✈️",28,C.white,false,Enum.TextXAlignment.Center,0,0,50,50)

mkLbl(tgCard,"TELEGRAM",12,C.textDim,true,Enum.TextXAlignment.Left,86,16,W-SIDE_W-120,18)
mkLbl(tgCard,"t.me/nanaanasyalala",16,C.accentLight,true,Enum.TextXAlignment.Left,86,38,W-SIDE_W-120,24)
mkLbl(tgCard,"Click to copy",11,C.textDim,false,Enum.TextXAlignment.Left,86,60,W-SIDE_W-120,16)

tgCard.MouseEnter:Connect(function()
    tw(tgCard,{BackgroundColor3=C.surface2},0.2)
end)
tgCard.MouseLeave:Connect(function()
    tw(tgCard,{BackgroundColor3=C.surface},0.2)
end)
tgCard.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("t.me/nanaanasyalala")
    end
    -- Visual feedback
    local notif = Instance.new("Frame",ScreenGui)
    notif.Size=UDim2.new(0,200,0,50); notif.Position=UDim2.new(0.5,-100,0,100)
    notif.BackgroundColor3=C.surface; corner(notif,12)
    stroke(notif,C.success,2,0.3)
    mkLbl(notif,"✓ Copied to clipboard!",14,C.success,true,Enum.TextXAlignment.Center,0,0,200,50)
    tw(notif,{Position=UDim2.new(0.5,-100,0,80)},0.3)
    task.wait(2)
    tw(notif,{Position=UDim2.new(0.5,-100,0,50),BackgroundTransparency=1},0.3)
    task.wait(0.3)
    notif:Destroy()
end)

-- Premium notice card
local premCard = Instance.new("Frame",pgCredit)
premCard.Size=UDim2.new(1,0,0,120); premCard.BackgroundColor3=Color3.fromRGB(35,25,8)
premCard.BorderSizePixel=0; premCard.LayoutOrder=3; corner(premCard,16)
stroke(premCard,C.premium,2,0.4)

mkLbl(premCard,"💎",40,C.premium,false,Enum.TextXAlignment.Left,20,0,60,120)
mkLbl(premCard,"PREMIUM ACCESS",16,C.premium,true,Enum.TextXAlignment.Left,80,20,W-SIDE_W-120,24)
mkLbl(premCard,"This is a paid script. Unauthorized",12,C.textDim,false,Enum.TextXAlignment.Left,80,48,W-SIDE_W-120,20)
mkLbl(premCard,"distribution is prohibited.",12,C.textDim,false,Enum.TextXAlignment.Left,80,68,W-SIDE_W-120,20)

-- Version info
local verCard = Instance.new("Frame",pgCredit)
verCard.Size=UDim2.new(1,0,0,70); verCard.BackgroundColor3=C.surface
verCard.BorderSizePixel=0; verCard.LayoutOrder=4; corner(verCard,16)
stroke(verCard,C.accentDark,1,0.5)

mkLbl(verCard,"VERSION",11,C.textDim,true,Enum.TextXAlignment.Left,20,12,100,16)
mkLbl(verCard,"v2.0 OBSIDIAN",15,C.accentLight,true,Enum.TextXAlignment.Left,20,32,150,22)
mkLbl(verCard,"COMPATIBLE",11,C.textDim,true,Enum.TextXAlignment.Right,0,12,W-SIDE_W-44,16)
mkLbl(verCard,"Delta Executor",15,C.accentLight,true,Enum.TextXAlignment.Right,0,32,W-SIDE_W-44,22)

-- ============================================================
--  SIDEBAR
-- ============================================================
local sideY = 10
local function addSideSection(txt)
    local l = Instance.new("TextLabel",Sidebar)
    l.Size=UDim2.new(1,-16,0,22); l.Position=UDim2.new(0,12,0,sideY)
    l.BackgroundTransparency=1; l.Text=txt; l.Font=Enum.Font.GothamBold
    l.TextSize=9; l.TextColor3=C.textDark; l.TextXAlignment=Enum.TextXAlignment.Left
    sideY=sideY+24
end
local function addSideBtn(icon,txt,pageId)
    local frame = Instance.new("TextButton",Sidebar)
    frame.Size=UDim2.new(1,0,0,40); frame.Position=UDim2.new(0,0,0,sideY)
    frame.BackgroundColor3=C.surface; frame.Text=""
    frame.AutoButtonColor=false; frame.BorderSizePixel=0
    local bar = Instance.new("Frame",frame)
    bar.Size=UDim2.new(0,4,0.6,0); bar.Position=UDim2.new(0,0,0.2,0)
    bar.BackgroundColor3=C.surface; bar.BorderSizePixel=0; corner(bar,2)
    mkLbl(frame,icon,18,C.accent,false,Enum.TextXAlignment.Left,14,0,28,40)
    local nameLbl=mkLbl(frame,txt,12,C.textDim,true,Enum.TextXAlignment.Left,46,0,SIDE_W-52,40)
    frame.MouseButton1Click:Connect(function() showPage(pageId) end)
    frame.MouseEnter:Connect(function()
        if currentPage~=pageId then tw(frame,{BackgroundColor3=C.surface2},0.2) end
    end)
    frame.MouseLeave:Connect(function()
        if currentPage~=pageId then tw(frame,{BackgroundColor3=C.surface},0.2) end
    end)
    table.insert(sideBtnRefs,{frame=frame,bar=bar,lbl=nameLbl,page=pageId})
    sideY=sideY+40
end

addSideSection("MAIN")
addSideBtn("🏠","Home","home")
addSideSection("COMBAT")
addSideBtn("⚔️","Combat","combat")
addSideSection("TELEPORT")
addSideBtn("🎯","TP Players","tp")
addSideSection("WORLD")
addSideBtn("📍","Locations","locations")
addSideSection("UTILITIES")
addSideBtn("🍭","Other Func.","azucar")
addSideSection("VISION")
addSideBtn("👁️","ESP","esp")
addSideSection("INFO")
addSideBtn("📢","Credits","credit")

-- ============================================================
--  STATUS BAR
-- ============================================================
local SB = Instance.new("Frame",Main)
SB.Size=UDim2.new(1,0,0,SB_H); SB.Position=UDim2.new(0,0,1,-SB_H)
SB.BackgroundColor3=C.surface; SB.BorderSizePixel=0
local sbTop = Instance.new("Frame",SB)
sbTop.Size=UDim2.new(1,0,0,2); sbTop.BackgroundColor3=C.accentDark; sbTop.BorderSizePixel=0

local dot = Instance.new("Frame",SB)
dot.Size=UDim2.new(0,8,0,8); dot.Position=UDim2.new(0,16,0.5,-4)
dot.BackgroundColor3=C.success; dot.BorderSizePixel=0; corner(dot,4)

-- Pulsing animation for dot
task.spawn(function()
    while SB.Parent do
        tw(dot,{BackgroundColor3=C.accent},0.5)
        task.wait(0.5)
        tw(dot,{BackgroundColor3=C.success},0.5)
        task.wait(0.5)
    end
end)

mkLbl(SB,"System Active",11,C.textDim,false,Enum.TextXAlignment.Left,32,0,90,SB_H)
mkLbl(SB,"|",11,C.accentDark,false,Enum.TextXAlignment.Left,120,0,10,SB_H)
local sbSpeed=mkLbl(SB,"Speed: 16",11,C.textDim,true,Enum.TextXAlignment.Left,138,0,100,SB_H)
mkLbl(SB,"OBSIDIAN",11,C.accent,true,Enum.TextXAlignment.Right,0,0,W-16,SB_H)

RunService.Heartbeat:Connect(function()
    sbSpeed.Text="Speed: "..tostring(SpeedValue)
end)

-- ============================================================
--  MINIMIZE / REOPEN / CLOSE
-- ============================================================
local minimized = false

local function doMinimize()
    minimized = true
    tw(Main, {Size=UDim2.new(0,W,0,0)}, 0.3)
    task.spawn(function()
        task.wait(0.35)
        Main.Visible = false
        ReopenBtn.Position = UDim2.new(0, Main.AbsolutePosition.X, 0, Main.AbsolutePosition.Y)
        ReopenBtn.Visible = true
    end)
end

local function doReopen()
    minimized = false
    ReopenBtn.Visible = false
    Main.Visible = true
    tw(Main, {Size=UDim2.new(0,W,0,H)}, 0.35)
end

-- Drag reopen button
local reopenDragging = false
local reopenDragStart, reopenStartPos
local reopenMoved = false

ReopenBtn.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or
       input.UserInputType==Enum.UserInputType.MouseButton1 then
        reopenDragging=true; reopenMoved=false
        reopenDragStart=input.Position
        reopenStartPos=ReopenBtn.Position
    end
end)
ReopenBtn.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or
       input.UserInputType==Enum.UserInputType.MouseButton1 then
        if not reopenMoved then doReopen() end
        reopenDragging=false; reopenMoved=false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if reopenDragging and (input.UserInputType==Enum.UserInputType.Touch or
                           input.UserInputType==Enum.UserInputType.MouseMovement) then
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
    ESPEnabled=false; ClearESP(); WalkWater=false
    local wp=workspace:FindFirstChild("RivalsWaterSolid"); if wp then wp:Destroy() end
    tw(Main,{Size=UDim2.new(0,W,0,0)},0.3)
    task.wait(0.35); ScreenGui:Destroy()
end)

-- ============================================================
--  BACKGROUND LOOP (Azucar Hub)
-- ============================================================
task.spawn(function()
    while true do
        task.wait(0.01)
        pcall(function()
            local char = LP.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local target = SelectedPlayers[1]

            if TweenTracking and target and target.Character
            and target.Character:FindFirstChild("HumanoidRootPart") then
                local tPos = target.Character.HumanoidRootPart.Position + Vector3.new(0,TrackerHeight,0)
                local dist = (root.Position-tPos).Magnitude
                TweenService:Create(root, TweenInfo.new(dist/TweenSpeed.X,Enum.EasingStyle.Linear), {CFrame=CFrame.new(tPos)}):Play()

            elseif AntiPerrasActive and target and target.Character
            and target.Character:FindFirstChild("HumanoidRootPart") then
                OrbitRot = OrbitRot + 0.15
                root.CFrame = target.Character.HumanoidRootPart.CFrame
                    * CFrame.Angles(0,OrbitRot,0)
                    * CFrame.new(OrbitDistance,2,0)

            elseif KillFlashActive and #SelectedPlayers>0 then
                for _,t in pairs(SelectedPlayers) do
                    if t.Character and t.Character:FindFirstChild("Humanoid")
                    and t.Character.Humanoid.Health>0 then
                        root.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,TrackerHeight,0)
                        task.wait(0.15)
                        root.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                        task.wait(AzucarStayTime)
                    end
                end

            elseif TrackingActive and target and target.Character
            and target.Character:FindFirstChild("HumanoidRootPart") then
                root.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0,TrackerHeight,0)
            end

            if FullBright then
                game.Lighting.Ambient = Color3.fromRGB(255,255,255)
                game.Lighting.ClockTime = 14
                game.Lighting.FogEnd = 9e9
            end
        end)
    end
end)

-- ============================================================
--  INIT
-- ============================================================
showPage("home")
