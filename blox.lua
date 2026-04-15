-- ============================================================
--   BLOX PANEL  ·  by NanaChan
--   Blox Fruits  ·  Compatible with Delta Executor
--   VERSION: 3.0 (Neon Tech Edition + True Silent Aim)
-- ============================================================

-- ============================================================
--  [0] FUTURISTIC INTRO
-- ============================================================
local function RunIntro()
    local TS2 = game:GetService("TweenService")
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "NeonIntro"
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    pcall(function() introGui.Parent = game:GetService("CoreGui") end)
    if not introGui.Parent then
        introGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
    bg.BorderSizePixel = 0

    -- Glitch effect overlay
    local glitch = Instance.new("Frame", bg)
    glitch.Size = UDim2.new(1,0,1,0)
    glitch.BackgroundTransparency = 0.85
    glitch.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    glitch.Visible = false

    local title = Instance.new("TextLabel", bg)
    title.Size = UDim2.new(1,0,0,80)
    title.Position = UDim2.new(0,0,0.25,0)
    title.BackgroundTransparency = 1
    title.Text = "BLOX PANEL"
    title.TextColor3 = Color3.fromRGB(0, 255, 255)
    title.Font = Enum.Font.Code
    title.TextSize = 58
    title.TextScaled = false
    title.TextStrokeTransparency = 0.3
    title.TextStrokeColor3 = Color3.fromRGB(0, 100, 200)
    title.TextTransparency = 1

    -- Glow effect
    local glow = Instance.new("Frame", bg)
    glow.Size = UDim2.new(0, 300, 0, 80)
    glow.Position = UDim2.new(0.5, -150, 0.25, 0)
    glow.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    glow.BackgroundTransparency = 0.9
    glow.BorderSizePixel = 0
    local glowCorner = Instance.new("UICorner", glow)
    glowCorner.CornerRadius = UDim.new(1, 0)

    local sub1 = Instance.new("TextLabel", bg)
    sub1.Size = UDim2.new(1,0,0,26)
    sub1.Position = UDim2.new(0,0,0.25,90)
    sub1.BackgroundTransparency = 1
    sub1.Text = "by NanaChan"
    sub1.TextColor3 = Color3.fromRGB(150, 255, 255)
    sub1.Font = Enum.Font.GothamBold
    sub1.TextSize = 17
    sub1.TextTransparency = 1

    local sub2 = Instance.new("TextLabel", bg)
    sub2.Size = UDim2.new(1,0,0,20)
    sub2.Position = UDim2.new(0,0,0.25,124)
    sub2.BackgroundTransparency = 1
    sub2.Text = ">> INITIALIZING NEON PROTOCOLS <<"
    sub2.TextColor3 = Color3.fromRGB(0, 200, 255)
    sub2.Font = Enum.Font.Gotham
    sub2.TextSize = 12
    sub2.TextTransparency = 1

    -- Scanning line effect
    local scanLine = Instance.new("Frame", bg)
    scanLine.Size = UDim2.new(1,0,0,2)
    scanLine.Position = UDim2.new(0,0,0,0)
    scanLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    scanLine.BorderSizePixel = 0

    -- Futuristic matrix rain
    task.spawn(function()
        for i = 1, 150 do
            task.spawn(function()
                while bg.Parent do
                    local m = Instance.new("TextLabel", bg)
                    local chars = {"0","1","█","▓","▒","░","▲","▼","◀","▶","●","◉","◎","◆","◇","■","□"}
                    m.Text = chars[math.random(1,#chars)]
                    m.Position = UDim2.new(math.random(),0,math.random(),0)
                    m.BackgroundTransparency = 1
                    m.TextColor3 = Color3.fromRGB(
                        math.random(0,100),
                        math.random(150,255),
                        math.random(150,255)
                    )
                    m.Font = Enum.Font.Code
                    m.TextSize = math.random(10,24)
                    m.TextTransparency = 1
                    m.Parent = bg
                    local dur = math.random(3,10)/10
                    TS2:Create(m, TweenInfo.new(dur/2), {TextTransparency=0}):Play()
                    task.wait(dur)
                    TS2:Create(m, TweenInfo.new(dur/2), {TextTransparency=1}):Play()
                    game:GetService("Debris"):AddItem(m, dur)
                    task.wait(math.random(1,5)/10)
                end
            end)
        end
    end)

    task.spawn(function()
        task.wait(0.5)
        -- Scanning line animation
        for i = 0, 1, 0.02 do
            scanLine.Position = UDim2.new(0,0,i,0)
            task.wait(0.01)
        end
        
        TS2:Create(title, TweenInfo.new(0.6,Enum.EasingStyle.Quint), {TextTransparency=0}):Play()
        task.wait(0.3)
        TS2:Create(glow, TweenInfo.new(0.5), {BackgroundTransparency=0.7}):Play()
        task.wait(0.2)
        TS2:Create(sub1, TweenInfo.new(0.4), {TextTransparency=0}):Play()
        task.wait(0.2)
        TS2:Create(sub2, TweenInfo.new(0.4), {TextTransparency=0}):Play()
        
        -- Glitch effect
        for _ = 1, 5 do
            glitch.Visible = true
            task.wait(0.03)
            glitch.Visible = false
            task.wait(0.1)
        end
        
        task.wait(2.5)
        local fi = TweenInfo.new(0.6, Enum.EasingStyle.Linear)
        TS2:Create(bg,    fi, {BackgroundTransparency=1}):Play()
        TS2:Create(title, fi, {TextTransparency=1}):Play()
        TS2:Create(sub1,  fi, {TextTransparency=1}):Play()
        TS2:Create(sub2,  fi, {TextTransparency=1}):Play()
        TS2:Create(glow,  fi, {BackgroundTransparency=1}):Play()
        task.wait(0.7)
        introGui:Destroy()
    end)
end

RunIntro()
task.wait(4)

-- ============================================================
--  [1] SERVICES
-- ============================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local TweenService      = game:GetService("TweenService")
local Lighting          = game:GetService("Lighting")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ============================================================
--  [2] NEON TECH COLORS
-- ============================================================
local C = {
    bg        = Color3.fromRGB(8, 8, 18),
    surface   = Color3.fromRGB(15, 15, 30),
    surface2  = Color3.fromRGB(25, 25, 45),
    neon      = Color3.fromRGB(0, 255, 255),
    neonPink  = Color3.fromRGB(255, 0, 150),
    neonPurple= Color3.fromRGB(150, 0, 255),
    neonGreen = Color3.fromRGB(0, 255, 100),
    text      = Color3.fromRGB(200, 220, 255),
    textDim   = Color3.fromRGB(100, 120, 180),
    red       = Color3.fromRGB(255, 50, 50),
    white     = Color3.new(1,1,1),
}

-- ============================================================
--  [3] SIZES
-- ============================================================
local SIZES = {
    {name="Mini",   w=400, h=360},
    {name="Normal", w=540, h=460},
    {name="Large",  w=660, h=550},
    {name="Extra",  w=780, h=640},
}
local currentSizeIdx = 2

-- ============================================================
--  [4] HELPERS with NEON effects
-- ============================================================
local function corner(p,r)
    local c = Instance.new("UICorner",p); c.CornerRadius = UDim.new(0,r or 8)
end
local function stroke(p,col,th,tr)
    local s = Instance.new("UIStroke",p)
    s.Color=col or C.neon; s.Thickness=th or 1; s.Transparency=tr or 0.5
end
local function tw(obj,props,t)
    TweenService:Create(obj,TweenInfo.new(t or 0.18,Enum.EasingStyle.Quad),props):Play()
end
local function mkLbl(parent,text,sz,col,bold,xAl,x,y,w,h)
    local l = Instance.new("TextLabel",parent)
    l.BackgroundTransparency=1; l.Text=text; l.TextSize=sz
    l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextColor3=col; l.TextXAlignment=xAl or Enum.TextXAlignment.Left
    l.Size=UDim2.new(0,w,0,h); l.Position=UDim2.new(0,x,0,y)
    return l
end
local function neonGrad(f, col1, col2)
    local g = Instance.new("UIGradient",f)
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, col1 or C.neon),
        ColorSequenceKeypoint.new(0.5, col2 or C.neonPink),
        ColorSequenceKeypoint.new(1, col1 or C.neon),
    })
end

-- Glow effect for buttons
local function addGlow(obj, col)
    local glow = Instance.new("Frame", obj)
    glow.Size = UDim2.new(1, 8, 1, 8)
    glow.Position = UDim2.new(0, -4, 0, -4)
    glow.BackgroundColor3 = col or C.neon
    glow.BackgroundTransparency = 0.8
    glow.BorderSizePixel = 0
    corner(glow, 12)
    return glow
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

-- ============================================================
--  [6] TRUE SILENT AIM (BUKAN AIMBOT)
--  Semua skill/projectile otomatis kena ke musuh terdekat
--  tanpa perlu mengarahkan kamera
-- ============================================================
local SilentAimEnabled = true  -- Default ON
local SilentAimTargetPlayers = true
local SilentAimTargetNPCs = true
local SilentAimRadius = 500
local SilentAimConn = nil
local SilentAimOriginalRemote = nil
local SilentAimHooked = false

-- Mendapatkan target terdekat
local function GetNearestSilentTarget()
    local myChar = LP.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil, nil end
    
    local nearestTarget = nil
    local nearestDist = SilentAimRadius
    local nearestPart = nil
    
    -- Cek Players
    if SilentAimTargetPlayers then
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= LP and pl.Character then
                local targetHRP = pl.Character:FindFirstChild("HumanoidRootPart")
                local targetHead = pl.Character:FindFirstChild("Head")
                if targetHRP then
                    local dist = (myHRP.Position - targetHRP.Position).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearestTarget = pl.Character
                        nearestPart = targetHead or targetHRP
                    end
                end
            end
        end
    end
    
    -- Cek NPCs
    if SilentAimTargetNPCs then
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in pairs(enemies:GetChildren()) do
                local npcHRP = npc:FindFirstChild("HumanoidRootPart")
                if npcHRP then
                    local dist = (myHRP.Position - npcHRP.Position).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearestTarget = npc
                        nearestPart = npc:FindFirstChild("Head") or npcHRP
                    end
                end
            end
        end
    end
    
    return nearestTarget, nearestPart
end

-- Hook untuk mencuri remote dan memodifikasi target
local function SetupSilentAimHook()
    if SilentAimHooked then return end
    
    -- Cari remote yang umum digunakan untuk attack
    local success, remote = pcall(function()
        return ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat")
    end)
    
    if not success then
        -- Coba cari remote lain
        pcall(function()
            remote = ReplicatedStorage:FindFirstChild("RE/RegisterHit")
            if not remote then
                remote = ReplicatedStorage:FindFirstChild("Attack")
            end
        end)
    end
    
    if remote then
        local oldFire = remote.FireServer
        remote.FireServer = function(self, ...)
            if SilentAimEnabled then
                local target, targetPart = GetNearestSilentTarget()
                if target and targetPart then
                    -- Redirect semua attack ke target terdekat
                    local args = {...}
                    -- Modifikasi argumen untuk mengarah ke target yang benar
                    if #args >= 2 and type(args[2]) == "CFrame" then
                        -- Ubah arah serangan ke target
                        local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                        if myHRP then
                            local direction = (targetPart.Position - myHRP.Position).Unit
                            args[2] = CFrame.lookAt(myHRP.Position, myHRP.Position + direction)
                        end
                    end
                    return oldFire(self, unpack(args))
                end
            end
            return oldFire(self, ...)
        end
        SilentAimHooked = true
    end
end

-- Alternatif: hook RegisterHit dan RegisterAttack
local function SetupAlternateSilentAim()
    local Net = ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Net")
    if Net then
        local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
        local RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
        
        if RegisterHit then
            local oldHit = RegisterHit.FireServer
            RegisterHit.FireServer = function(self, hitPart, targets)
                if SilentAimEnabled then
                    local target, targetPart = GetNearestSilentTarget()
                    if target and targetPart then
                        return oldHit(self, targetPart, {{target, targetPart}})
                    end
                end
                return oldHit(self, hitPart, targets)
            end
        end
    end
end

-- Silent Aim visual indicator (lingkaran di sekitar target)
local SilentAimIndicator = nil
local function UpdateSilentAimIndicator()
    if SilentAimIndicator then SilentAimIndicator:Remove() end
    if not SilentAimEnabled then return end
    
    local target, targetPart = GetNearestSilentTarget()
    if target and targetPart then
        local indicator = Instance.new("SelectionBox")
        indicator.Adornee = targetPart
        indicator.Color3 = C.neon
        indicator.LineThickness = 0.1
        indicator.Transparency = 0.5
        indicator.Parent = targetPart
        SilentAimIndicator = indicator
    end
end

-- ============================================================
--  [7] LOGIC: FAST ATTACK
-- ============================================================
local RegisterHit = nil
local RegisterAttack = nil

pcall(function()
    local Net = ReplicatedStorage:FindFirstChild("Modules") and ReplicatedStorage.Modules:FindFirstChild("Net")
    if Net then
        RegisterHit = Net["RE/RegisterHit"]
        RegisterAttack = Net["RE/RegisterAttack"]
    end
end)

local function AttackMultipleTargets(targets)
    pcall(function()
        if not targets or #targets==0 then return end
        local all = {}
        for _,char in pairs(targets) do
            local head = char:FindFirstChild("Head")
            local hrp  = char:FindFirstChild("HumanoidRootPart")
            if hrp and getgenv().HitboxExpander then
                hrp.Size = Vector3.new(30,30,30)
                hrp.Transparency = 0.7
                hrp.CanCollide = false
            end
            if head then table.insert(all,{char,head}) end
        end
        if #all==0 then return end
        if RegisterAttack then RegisterAttack:FireServer(0) end
        if RegisterHit then RegisterHit:FireServer(all[1][2], all) end
    end)
end

local function StartFastAttack()
    if FastAttackConn then task.cancel(FastAttackConn) end
    FastAttackConn = task.spawn(function()
        while FastAttackEnabled do
            task.wait(0.005)
            local myChar = LP.Character
            local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
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
--  [8] LOGIC: MOVEMENT
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
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if WalkWater and hrp then
        if hrp.Position.Y>=9.5 and hrp.Velocity.Y<=0 then
            local wp = workspace:FindFirstChild("RivalsWaterSolid")
            if not wp then
                wp = Instance.new("Part",workspace)
                wp.Name="RivalsWaterSolid"
                wp.Size=Vector3.new(20,1,20)
                wp.Transparency=1
                wp.Anchored=true
                wp.CanCollide=true
                wp.CanQuery=false
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
    
    -- Update Silent Aim indicator
    if SilentAimEnabled then
        UpdateSilentAimIndicator()
    elseif SilentAimIndicator then
        SilentAimIndicator:Destroy()
        SilentAimIndicator = nil
    end
end)

-- ============================================================
--  [9] KEYS: U = Fast Attack | B = Fly Up | V = Silent Aim Toggle
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
    if input.KeyCode == Enum.KeyCode.V then
        SilentAimEnabled = not SilentAimEnabled
        if not SilentAimEnabled and SilentAimIndicator then
            SilentAimIndicator:Destroy()
            SilentAimIndicator = nil
        end
    end
end)

-- ============================================================
--  [10] ROOT GUI - NEON TECH STYLE
-- ============================================================
local pgui = LP:WaitForChild("PlayerGui")
if pgui:FindFirstChild("NeonPanel") then pgui.NeonPanel:Destroy() end
local ScreenGui = Instance.new("ScreenGui",pgui)
ScreenGui.Name="NeonPanel"
ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

-- Background blur effect
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0

local S = SIZES[currentSizeIdx]
local W, H = S.w, S.h
local HDR_H = 58
local CHIP_H = 48
local SB_H = 32
local SIDE_W = 130
local BODY_Y = HDR_H + CHIP_H + 10
local BODY_H = H - BODY_Y - SB_H

-- ============================================================
--  MAIN FRAME with neon border animation
-- ============================================================
local Main = Instance.new("Frame",ScreenGui)
Main.Name="Main"
Main.Size=UDim2.new(0,W,0,H)
Main.Position=UDim2.new(0.5,-W/2,0.3,0)
Main.BackgroundColor3=C.bg
Main.BackgroundTransparency=0.05
Main.Active=true
Main.Draggable=true
Main.ClipsDescendants=true
corner(Main,12)
stroke(Main,C.neon,1.5,0.3)

-- Animated neon border
local borderAnim = Instance.new("Frame", Main)
borderAnim.Size = UDim2.new(1,0,1,0)
borderAnim.BackgroundTransparency = 1
borderAnim.BorderSizePixel = 0
local borderGrad = Instance.new("UIGradient", borderAnim)
borderGrad.Rotation = 0
borderGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.neon),
    ColorSequenceKeypoint.new(0.3, C.neonPink),
    ColorSequenceKeypoint.new(0.6, C.neonPurple),
    ColorSequenceKeypoint.new(1, C.neon),
})

task.spawn(function()
    while Main.Parent do
        for i = 0, 360, 5 do
            borderGrad.Rotation = i
            task.wait(0.02)
        end
    end
end)

-- Reopen button
local ReopenBtn = Instance.new("TextButton",ScreenGui)
ReopenBtn.Size=UDim2.new(0,150,0,38)
ReopenBtn.Position=UDim2.new(0.5,-75,0.3,0)
ReopenBtn.BackgroundColor3=C.surface
ReopenBtn.Text="⚡ BLOX PANEL ⚡"
ReopenBtn.TextColor3=C.neon
ReopenBtn.Font=Enum.Font.GothamBold
ReopenBtn.TextSize=11
ReopenBtn.BorderSizePixel=0
ReopenBtn.Visible=false
corner(ReopenBtn,10)
stroke(ReopenBtn,C.neon,1.5,0.3)

-- ============================================================
--  HEADER with neon effects
-- ============================================================
local Hdr = Instance.new("Frame",Main)
Hdr.Size=UDim2.new(1,0,0,HDR_H)
Hdr.BackgroundColor3=C.surface
Hdr.BackgroundTransparency=0.2
Hdr.BorderSizePixel=0
corner(Hdr,12)

local HDLine = Instance.new("Frame",Hdr)
HDLine.Size=UDim2.new(1,0,1.5,0)
HDLine.Position=UDim2.new(0,0,1,-1.5)
HDLine.BackgroundColor3=C.neon
HDLine.BorderSizePixel=0
neonGrad(HDLine, C.neon, C.neonPink)

mkLbl(Hdr,"⚡ BLOX PANEL ⚡",18,C.neon,true,Enum.TextXAlignment.Left,14,8,200,28)
mkLbl(Hdr,"by NanaChan",10,C.textDim,false,Enum.TextXAlignment.Left,14,38,160,16)

local ProF = Instance.new("Frame",Hdr)
ProF.Size=UDim2.new(0,40,0,22)
ProF.Position=UDim2.new(0,210,0,10)
ProF.BackgroundColor3=C.neonPurple
ProF.BackgroundTransparency=0.3
corner(ProF,6)
stroke(ProF,C.neon,0.5,0.3)
mkLbl(ProF,"TECH",11,C.neon,true,Enum.TextXAlignment.Center,0,0,40,22)

local function winBtn(txt,bg2,xOff)
    local b = Instance.new("TextButton",Hdr)
    b.Size=UDim2.new(0,26,0,26)
    b.Position=UDim2.new(1,xOff,0,16)
    b.BackgroundColor3=bg2
    b.Text=txt
    b.TextColor3=C.white
    b.Font=Enum.Font.GothamBold
    b.TextSize=12
    b.BorderSizePixel=0
    corner(b,13)
    return b
end
local CloseBtn = winBtn("✕",C.red,-32)
local MinBtn = winBtn("–",C.surface2,-62)

-- ============================================================
--  CHIPS with neon style
-- ============================================================
local CHIP_Y = HDR_H+4
local function makeChip(icon,top,bot,xPos)
    local f = Instance.new("Frame",Main)
    f.Size=UDim2.new(0,(W-28)/2,0,CHIP_H)
    f.Position=UDim2.new(0,xPos,0,CHIP_Y)
    f.BackgroundColor3=C.surface
    f.BackgroundTransparency=0.3
    f.BorderSizePixel=0
    corner(f,10)
    stroke(f,C.neon,0.8,0.5)
    mkLbl(f,icon,22,C.neon,false,Enum.TextXAlignment.Left,8,0,36,CHIP_H)
    mkLbl(f,top,9,C.textDim,false,Enum.TextXAlignment.Left,44,8,160,14)
    mkLbl(f,bot,14,C.neon,true,Enum.TextXAlignment.Left,44,24,160,20)
end
makeChip("🎮","GAME","Blox Fruits",12)
makeChip("⚡","ENGINE","Neon Tech",12+(W-28)/2+4)

local GLine = Instance.new("Frame",Main)
GLine.Size=UDim2.new(1,-24,0,1.5)
GLine.Position=UDim2.new(0,12,0,CHIP_Y+CHIP_H+2)
GLine.BackgroundColor3=C.neon
GLine.BorderSizePixel=0
neonGrad(GLine, C.neon, C.neonPink)

-- ============================================================
--  SIDEBAR with glass morphism
-- ============================================================
local Sidebar = Instance.new("ScrollingFrame",Main)
Sidebar.Size=UDim2.new(0,SIDE_W,1,-BODY_Y-SB_H)
Sidebar.Position=UDim2.new(0,0,0,BODY_Y)
Sidebar.BackgroundColor3=C.surface
Sidebar.BackgroundTransparency=0.4
Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2
Sidebar.ScrollBarImageColor3=C.neonPurple
Sidebar.CanvasSize=UDim2.new(0,0,0,0)
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y

local SBLine = Instance.new("Frame",Main)
SBLine.Size=UDim2.new(0,1.5,1,-BODY_Y-SB_H)
SBLine.Position=UDim2.new(0,SIDE_W,0,BODY_Y)
SBLine.BackgroundColor3=C.neon
SBLine.BorderSizePixel=0

local ContentBG = Instance.new("Frame",Main)
ContentBG.Size=UDim2.new(1,-SIDE_W-2,1,-BODY_Y-SB_H)
ContentBG.Position=UDim2.new(0,SIDE_W+2,0,BODY_Y)
ContentBG.BackgroundColor3=C.bg
ContentBG.BackgroundTransparency=0.3
ContentBG.BorderSizePixel=0
ContentBG.ClipsDescendants=true

-- ============================================================
--  PAGE SYSTEM
-- ============================================================
local pages = {}
local currentPage = nil
local sideBtnRefs = {}

local function newPage(id)
    local sf = Instance.new("ScrollingFrame",ContentBG)
    sf.Name=id
    sf.Size=UDim2.new(1,0,1,0)
    sf.BackgroundTransparency=1
    sf.ScrollBarThickness=3
    sf.ScrollBarImageColor3=C.neon
    sf.CanvasSize=UDim2.new(0,0,0,0)
    sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
    sf.Visible=false
    sf.BorderSizePixel=0
    local ul = Instance.new("UIListLayout",sf)
    ul.Padding=UDim.new(0,8)
    ul.HorizontalAlignment=Enum.HorizontalAlignment.Center
    ul.SortOrder=Enum.SortOrder.LayoutOrder
    local up = Instance.new("UIPadding",sf)
    up.PaddingTop=UDim.new(0,12)
    up.PaddingBottom=UDim.new(0,12)
    up.PaddingLeft=UDim.new(0,10)
    up.PaddingRight=UDim.new(0,10)
    pages[id]=sf
    return sf
end

local function showPage(id)
    for pid,pg in pairs(pages) do pg.Visible=(pid==id) end
    currentPage=id
    for _,r in pairs(sideBtnRefs) do
        local act=(r.page==id)
        r.bar.BackgroundColor3 = act and C.neon or C.surface
        r.lbl.TextColor3 = act and C.neon or C.textDim
        r.frame.BackgroundColor3 = act and C.surface2 or C.surface
        r.frame.BackgroundTransparency = act and 0.2 or 0.4
    end
end

-- ============================================================
--  COMPONENT BUILDERS with NEON style
-- ============================================================
local function secLabel(text,parent,lo)
    local wrap = Instance.new("Frame",parent)
    wrap.Size=UDim2.new(1,0,0,24)
    wrap.BackgroundTransparency=1
    wrap.LayoutOrder=lo
    local l = Instance.new("TextLabel",wrap)
    l.Size=UDim2.new(0,0,1,0)
    l.AutomaticSize=Enum.AutomaticSize.X
    l.BackgroundTransparency=1
    l.Text=text
    l.Font=Enum.Font.GothamBold
    l.TextSize=9
    l.TextColor3=C.neon
    l.TextXAlignment=Enum.TextXAlignment.Left
    local line = Instance.new("Frame",wrap)
    line.Size=UDim2.new(1,-90,0,1)
    line.Position=UDim2.new(0,85,0.5,0)
    line.BackgroundColor3=C.neonPurple
    line.BorderSizePixel=0
end

local function makeToggle(icon,name,desc,parent,lo,callback)
    local row = Instance.new("TextButton",parent)
    row.Size=UDim2.new(1,0,0,58)
    row.BackgroundColor3=C.surface
    row.BackgroundTransparency=0.4
    row.Text=""
    row.AutoButtonColor=false
    row.BorderSizePixel=0
    row.LayoutOrder=lo
    corner(row,10)
    stroke(row,C.neonPurple,0.8,0.5)
    
    mkLbl(row,icon,22,C.neon,false,Enum.TextXAlignment.Left,12,0,34,58)
    local nameLbl=mkLbl(row,name,13,C.text,true,Enum.TextXAlignment.Left,50,10,W-SIDE_W-100,20)
    mkLbl(row,desc,10,C.textDim,false,Enum.TextXAlignment.Left,50,34,W-SIDE_W-100,16)
    
    local swBg = Instance.new("Frame",row)
    swBg.Size=UDim2.new(0,44,0,24)
    swBg.Position=UDim2.new(1,-54,0.5,-12)
    swBg.BackgroundColor3=Color3.fromRGB(20,20,40)
    swBg.BorderSizePixel=0
    corner(swBg,12)
    stroke(swBg,C.neonPurple,0.5,0.4)
    
    local knob = Instance.new("Frame",swBg)
    knob.Size=UDim2.new(0,18,0,18)
    knob.Position=UDim2.new(0,3,0.5,-9)
    knob.BackgroundColor3=C.textDim
    knob.BorderSizePixel=0
    corner(knob,9)
    
    local isOn = false
    local function setState(on)
        isOn=on
        if on then
            tw(knob,{Position=UDim2.new(0,23,0.5,-9),BackgroundColor3=C.neon},0.15)
            tw(swBg,{BackgroundColor3=Color3.fromRGB(30,30,60)},0.15)
            tw(row,{BackgroundColor3=Color3.fromRGB(20,20,45)},0.15)
            nameLbl.TextColor3=C.neon
            local rs=row:FindFirstChildOfClass("UIStroke")
            if rs then rs.Color=C.neon; rs.Transparency=0.2 end
        else
            tw(knob,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=C.textDim},0.15)
            tw(swBg,{BackgroundColor3=Color3.fromRGB(20,20,40)},0.15)
            tw(row,{BackgroundColor3=C.surface},0.15)
            nameLbl.TextColor3=C.text
            local rs=row:FindFirstChildOfClass("UIStroke")
            if rs then rs.Color=C.neonPurple; rs.Transparency=0.5 end
        end
        if callback then callback(on) end
    end
    row.MouseButton1Click:Connect(function() setState(not isOn) end)
    return row, setState
end

local function makeBtn(icon,name,desc,parent,lo,callback)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,54)
    btn.BackgroundColor3=C.surface
    btn.BackgroundTransparency=0.4
    btn.Text=""
    btn.AutoButtonColor=false
    btn.BorderSizePixel=0
    btn.LayoutOrder=lo
    corner(btn,10)
    stroke(btn,C.neonPurple,0.8,0.5)
    
    mkLbl(btn,icon,22,C.neon,false,Enum.TextXAlignment.Left,12,0,34,54)
    local nameLbl=mkLbl(btn,name,13,C.text,true,Enum.TextXAlignment.Left,50,9,W-SIDE_W-80,20)
    mkLbl(btn,desc,10,C.textDim,false,Enum.TextXAlignment.Left,50,31,W-SIDE_W-80,16)
    mkLbl(btn,"▶",16,C.neon,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-14,54)
    
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=Color3.fromRGB(25,25,55)},0.1)
        nameLbl.TextColor3=C.neon
        local s=btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.neon; s.Transparency=0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.1)
        nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.neonPurple; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return btn
end

local function makeSlider(name,minV,maxV,startV,parent,lo,callback)
    local card = Instance.new("Frame",parent)
    card.Size=UDim2.new(1,0,0,70)
    card.BackgroundColor3=C.surface
    card.BackgroundTransparency=0.4
    card.BorderSizePixel=0
    card.LayoutOrder=lo
    corner(card,10)
    stroke(card,C.neonPurple,0.8,0.5)
    
    mkLbl(card,name,12,C.text,true,Enum.TextXAlignment.Left,14,8,W-SIDE_W-90,18)
    local valLbl=mkLbl(card,tostring(startV),14,C.neon,true,Enum.TextXAlignment.Right,0,8,W-SIDE_W-18,18)
    
    local minusBtn=Instance.new("TextButton",card)
    minusBtn.Size=UDim2.new(0,32,0,32)
    minusBtn.Position=UDim2.new(0,12,0,36)
    minusBtn.BackgroundColor3=C.surface2
    minusBtn.Text="−"
    minusBtn.TextColor3=C.neon
    minusBtn.Font=Enum.Font.GothamBold
    minusBtn.TextSize=18
    minusBtn.BorderSizePixel=0
    corner(minusBtn,8)
    
    local plusBtn=Instance.new("TextButton",card)
    plusBtn.Size=UDim2.new(0,32,0,32)
    plusBtn.Position=UDim2.new(1,-44,0,36)
    plusBtn.BackgroundColor3=C.surface2
    plusBtn.Text="+"
    plusBtn.TextColor3=C.neon
    plusBtn.Font=Enum.Font.GothamBold
    plusBtn.TextSize=18
    plusBtn.BorderSizePixel=0
    corner(plusBtn,8)
    
    local trackBg=Instance.new("Frame",card)
    trackBg.Size=UDim2.new(1,-98,0,4)
    trackBg.Position=UDim2.new(0,48,0,52)
    trackBg.BackgroundColor3=Color3.fromRGB(30,30,50)
    trackBg.BorderSizePixel=0
    corner(trackBg,2)
    
    local fill=Instance.new("Frame",trackBg)
    local initPct = (startV-minV)/(maxV-minV)
    fill.Size=UDim2.new(initPct,0,1,0)
    fill.BackgroundColor3=C.neon
    fill.BorderSizePixel=0
    corner(fill,2)
    
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
    plusBtn.MouseButton1Click:Connect(function() updateVal(val+step) end)
    
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
            local tAbs=trackBg.AbsolutePosition
            local tSz=trackBg.AbsoluteSize
            local pct=math.clamp((i.Position.X-tAbs.X)/tSz.X,0,1)
            updateVal(math.floor(minV+(maxV-minV)*pct))
        end
    end)
    return card
end

-- ============================================================
--  PAGES
-- ============================================================

-- HOME PAGE
local pgHome = newPage("home")

local logoCard = Instance.new("Frame",pgHome)
logoCard.Size=UDim2.new(1,0,0,100)
logoCard.BackgroundColor3=C.surface
logoCard.BackgroundTransparency=0.3
logoCard.BorderSizePixel=0
logoCard.LayoutOrder=1
corner(logoCard,12)
stroke(logoCard,C.neon,1,0.4)

local ring = Instance.new("Frame",logoCard)
ring.Size=UDim2.new(0,65,0,65)
ring.Position=UDim2.new(0,16,0.5,-32.5)
ring.BackgroundColor3=Color3.fromRGB(15,15,35)
ring.BorderSizePixel=0
corner(ring,32.5)
stroke(ring,C.neon,2,0.3)

-- Animated ring glow
task.spawn(function()
    while ring.Parent do
        for t = 0.3, 0.8, 0.02 do
            ring.BackgroundTransparency = t
            task.wait(0.02)
        end
        for t = 0.8, 0.3, -0.02 do
            ring.BackgroundTransparency = t
            task.wait(0.02)
        end
    end
end)

mkLbl(ring,"⚡",30,C.neon,false,Enum.TextXAlignment.Center,0,0,65,65)
mkLbl(logoCard,"⚡ BLOX PANEL ⚡",18,C.neon,true,Enum.TextXAlignment.Left,96,12,220,26)
mkLbl(logoCard,"by NanaChan",11,C.textDim,false,Enum.TextXAlignment.Left,96,38,180,16)
mkLbl(logoCard,"[U] Fast Attack  |  [B] Fly Up  |  [V] Silent Aim",10,C.neon,false,Enum.TextXAlignment.Left,96,58,300,16)

secLabel("INTERFACE",pgHome,2)
local sizeWrap = Instance.new("Frame",pgHome)
sizeWrap.Size=UDim2.new(1,0,0,50)
sizeWrap.BackgroundColor3=C.surface
sizeWrap.BackgroundTransparency=0.4
sizeWrap.BorderSizePixel=0
sizeWrap.LayoutOrder=3
corner(sizeWrap,10)
stroke(sizeWrap,C.neonPurple,0.8,0.5)

local szLay = Instance.new("UIListLayout",sizeWrap)
szLay.FillDirection=Enum.FillDirection.Horizontal
szLay.Padding=UDim.new(0,6)
szLay.HorizontalAlignment=Enum.HorizontalAlignment.Center
szLay.VerticalAlignment=Enum.VerticalAlignment.Center
local szPad = Instance.new("UIPadding",sizeWrap)
szPad.PaddingLeft=UDim.new(0,8)
szPad.PaddingRight=UDim.new(0,8)

local sizeBtns = {}
local function applySize(idx)
    currentSizeIdx=idx
    local ns=SIZES[idx]
    W=ns.w; H=ns.h
    tw(Main,{Size=UDim2.new(0,ns.w,0,ns.h)},0.25)
    for i,sb in pairs(sizeBtns) do
        sb.BackgroundColor3 = i==idx and C.neonPurple or C.surface2
        sb.TextColor3 = i==idx and C.white or C.textDim
    end
end

for i,sz in ipairs(SIZES) do
    local sb = Instance.new("TextButton",sizeWrap)
    sb.Size=UDim2.new(0.22,-5,0,36)
    sb.BackgroundColor3=i==currentSizeIdx and C.neonPurple or C.surface2
    sb.TextColor3=i==currentSizeIdx and C.white or C.textDim
    sb.Text=sz.name
    sb.Font=Enum.Font.GothamBold
    sb.TextSize=11
    sb.BorderSizePixel=0
    corner(sb,8)
    sb.MouseButton1Click:Connect(function() applySize(i) end)
    table.insert(sizeBtns,sb)
end

-- COMBAT PAGE
local pgC = newPage("combat")

secLabel("FAST ATTACK",pgC,1)
makeToggle("⚡","Fast Attack [U]","Range "..FastAttackRange.." studs",pgC,2,function(on)
    FastAttackEnabled=on
    if on then StartFastAttack() else if FastAttackConn then task.cancel(FastAttackConn) end end
end)
makeSlider("Attack Range",0,12000,12000,pgC,3,function(v) FastAttackRange=v end)

secLabel("🔮 TRUE SILENT AIM 🔮",pgC,4)
makeToggle("🎯","Silent Aim [V]","Skill otomatis kena ke musuh terdekat",pgC,5,function(on)
    SilentAimEnabled=on
    if not on and SilentAimIndicator then
        SilentAimIndicator:Destroy()
        SilentAimIndicator = nil
    end
    if on then
        SetupSilentAimHook()
        SetupAlternateSilentAim()
    end
end)
makeToggle("👥","Target Players", "",pgC,6,function(on) SilentAimTargetPlayers=on end)
makeToggle("👾","Target NPCs", "",pgC,7,function(on) SilentAimTargetNPCs=on end)
makeSlider("Detection Radius",50,1000,500,pgC,8,function(v) SilentAimRadius=v end)

secLabel("MOVEMENT",pgC,9)
makeToggle("🦘","Infinite Jump","",pgC,10,function(on) InfJumpEnabled=on end)
makeToggle("👻","No Clip","",pgC,11,function(on) NoClipEnabled=on end)
makeToggle("🌊","Walk on Water","",pgC,12,function(on) WalkWater=on end)
makeToggle("🔧","Custom Speed","Apply walk speed",pgC,13,function(on) SpeedEnabled=on end)
makeSlider("Walk Speed",16,250,16,pgC,14,function(v)
    SpeedValue=v
    if LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum and SpeedEnabled then hum.WalkSpeed = v end
    end
end)

secLabel("GOD MODE",pgC,15)
local GodModeEnabled = false
local GodModeConns = {}
makeToggle("🛡️","God Mode","Health always max",pgC,16,function(on)
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
            end)
        end))
        table.insert(GodModeConns, LP.CharacterAdded:Connect(function(newChar)
            if not GodModeEnabled then return end
            task.wait(0.1)
            local hum = newChar:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = hum.MaxHealth end
        end))
    end
end)

-- ESP PAGE
local pgESP = newPage("esp")

secLabel("VISION",pgESP,1)
local ESPEnabled = false
local ESPBoxes = false
local ESPNames = false
local ESPObjects = {}

local function ClearESP()
    for _,o in pairs(ESPObjects) do if o and o.Parent then o:Destroy() end end
    ESPObjects = {}
end

local function UpdateESP()
    ClearESP()
    if not ESPEnabled then return end
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local char = p.Character
            local head = char:FindFirstChild("Head")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            if ESPNames and head then
                local bb = Instance.new("BillboardGui")
                bb.Name="NeonESP_N"
                bb.Adornee=head
                bb.Size=UDim2.new(0,140,0,32)
                bb.StudsOffset=Vector3.new(0,3,0)
                bb.AlwaysOnTop=true
                bb.Parent=head
                local nl = Instance.new("TextLabel",bb)
                nl.BackgroundTransparency=1
                nl.Size=UDim2.new(1,0,1,0)
                nl.Text=p.Name
                nl.Font=Enum.Font.GothamBold
                nl.TextSize=14
                nl.TextColor3=C.neon
                nl.TextStrokeTransparency=0
                table.insert(ESPObjects,bb)
            end
            if ESPBoxes then
                local bb2 = Instance.new("BillboardGui")
                bb2.Name="NeonESP_B"
                bb2.Adornee=hrp
                bb2.Size=UDim2.new(0,55,0,75)
                bb2.AlwaysOnTop=true
                bb2.Parent=hrp
                local box = Instance.new("Frame",bb2)
                box.Size=UDim2.new(1,0,1,0)
                box.BackgroundTransparency=1
                stroke(box, C.neon, 2, 0.2)
                table.insert(ESPObjects,bb2)
            end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(5)
        if ESPEnabled then UpdateESP() end
    end
end)

makeToggle("👁️","Enable ESP","",pgESP,2,function(on)
    ESPEnabled=on
    UpdateESP()
end)
makeToggle("📛","Names ESP","",pgESP,3,function(on)
    ESPNames=on
    if ESPEnabled then UpdateESP() end
end)
makeToggle("📦","Boxes ESP","",pgESP,4,function(on)
    ESPBoxes=on
    if ESPEnabled then UpdateESP() end
end)

-- CREDITS PAGE
local pgCredits = newPage("credits")

local creditCard = Instance.new("Frame", pgCredits)
creditCard.Size = UDim2.new(1,0,0,220)
creditCard.BackgroundColor3 = C.surface
creditCard.BackgroundTransparency = 0.3
creditCard.BorderSizePixel = 0
creditCard.LayoutOrder = 1
corner(creditCard, 12)
stroke(creditCard, C.neon, 1, 0.4)

mkLbl(creditCard, "⭐ SYSTEM CREDITS ⭐", 18, C.neon, true, Enum.TextXAlignment.Center, 0, 18, W-SIDE_W-20, 28)
mkLbl(creditCard, "Script by NanaChan", 13, C.text, false, Enum.TextXAlignment.Center, 0, 55, W-SIDE_W-20, 22)
mkLbl(creditCard, "Telegram: @nanaanasyalala", 13, C.neon, false, Enum.TextXAlignment.Center, 0, 85, W-SIDE_W-20, 22)

local noteFrame = Instance.new("Frame", pgCredits)
noteFrame.Size = UDim2.new(1,0,0,90)
noteFrame.BackgroundColor3 = Color3.fromRGB(25, 10, 30)
noteFrame.BackgroundTransparency = 0.4
noteFrame.BorderSizePixel = 0
noteFrame.LayoutOrder = 2
corner(noteFrame, 10)
stroke(noteFrame, C.neonPink, 0.8, 0.4)

mkLbl(noteFrame, "⚠️ SECURITY NOTICE ⚠️", 12, C.neonPink, true, Enum.TextXAlignment.Center, 0, 12, W-SIDE_W-20, 20)
mkLbl(noteFrame, "Script ini berbayar. Jika Anda mendapatkannya secara gratis,", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 38, W-SIDE_W-20, 16)
mkLbl(noteFrame, "maka itu adalah versi bocor / ilegal. Support creator!", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 58, W-SIDE_W-20, 16)

-- LOCATIONS PAGE
local pgLoc = newPage("locations")

local function makeTpBtn(icon,name,coords,parent,lo,cb)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,54)
    btn.BackgroundColor3=C.surface
    btn.BackgroundTransparency=0.4
    btn.Text=""
    btn.AutoButtonColor=false
    btn.BorderSizePixel=0
    btn.LayoutOrder=lo
    corner(btn,10)
    stroke(btn,C.neonPurple,0.8,0.5)
    mkLbl(btn,icon,22,C.neon,false,Enum.TextXAlignment.Left,12,0,34,54)
    local nameLbl=mkLbl(btn,name,13,C.text,true,Enum.TextXAlignment.Left,50,9,W-SIDE_W-80,20)
    mkLbl(btn,coords,10,C.textDim,false,Enum.TextXAlignment.Left,50,31,W-SIDE_W-80,16)
    mkLbl(btn,"›",20,C.neon,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-14,54)
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=Color3.fromRGB(25,25,55)},0.1)
        nameLbl.TextColor3=C.neon
        local s=btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.neon; s.Transparency=0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.1)
        nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.neonPurple; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if cb then cb() end end)
    return btn
end

secLabel("SEA 3",pgLoc,1)
makeTpBtn("⚓","Tp Ship","-6500, 129, -123",pgLoc,2,function()
    if LP.Character then LP.Character.HumanoidRootPart.CFrame=CFrame.new(-6500,129,-123) end
end)
makeTpBtn("🌀","Tp Empty Rivals","-11997, 332, -8837",pgLoc,3,function()
    if LP.Character then LP.Character.HumanoidRootPart.CFrame=CFrame.new(-11997,332,-8837) end
end)

secLabel("UTILITIES",pgLoc,4)
makeBtn("🛸","PB Fly","Flight system",pgLoc,5,function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)
makeBtn("🚫","Anti-AFK","Prevent kick",pgLoc,6,function()
    local vu=game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- ============================================================
--  SIDEBAR MENU
-- ============================================================
local sideY = 8
local function addSideSection(txt)
    local l = Instance.new("TextLabel",Sidebar)
    l.Size=UDim2.new(1,-12,0,20)
    l.Position=UDim2.new(0,12,0,sideY)
    l.BackgroundTransparency=1
    l.Text=txt
    l.Font=Enum.Font.GothamBold
    l.TextSize=8
    l.TextColor3=C.neon
    l.TextXAlignment=Enum.TextXAlignment.Left
    sideY=sideY+22
end

local function addSideBtn(icon,txt,pageId)
    local frame = Instance.new("TextButton",Sidebar)
    frame.Size=UDim2.new(1,0,0,38)
    frame.Position=UDim2.new(0,0,0,sideY)
    frame.BackgroundColor3=C.surface
    frame.BackgroundTransparency=0.4
    frame.Text=""
    frame.AutoButtonColor=false
    frame.BorderSizePixel=0
    
    local bar = Instance.new("Frame",frame)
    bar.Size=UDim2.new(0,3,0.6,0)
    bar.Position=UDim2.new(0,0,0.2,0)
    bar.BackgroundColor3=C.surface
    bar.BorderSizePixel=0
    corner(bar,2)
    
    mkLbl(frame,icon,16,C.neon,false,Enum.TextXAlignment.Left,12,0,28,38)
    local nameLbl=mkLbl(frame,txt,11,C.textDim,true,Enum.TextXAlignment.Left,42,0,SIDE_W-50,38)
    
    frame.MouseButton1Click:Connect(function() showPage(pageId) end)
    frame.MouseEnter:Connect(function()
        if currentPage~=pageId then
            tw(frame,{BackgroundColor3=Color3.fromRGB(25,25,50)},0.1)
        end
    end)
    frame.MouseLeave:Connect(function()
        if currentPage~=pageId then
            tw(frame,{BackgroundColor3=C.surface},0.1)
        end
    end)
    
    table.insert(sideBtnRefs,{frame=frame,bar=bar,lbl=nameLbl,page=pageId})
    sideY=sideY+40
end

addSideSection("> NAVIGATION <")
addSideBtn("🏠","HOME","home")
addSideBtn("⚔️","COMBAT","combat")
addSideBtn("👁️","ESP","esp")
addSideBtn("📍","LOCATIONS","locations")
addSideSection("> SYSTEM <")
addSideBtn("💎","CREDITS","credits")

-- ============================================================
--  STATUS BAR
-- ============================================================
local SB = Instance.new("Frame",Main)
SB.Size=UDim2.new(1,0,0,SB_H)
SB.Position=UDim2.new(0,0,1,-SB_H)
SB.BackgroundColor3=C.surface
SB.BackgroundTransparency=0.4
SB.BorderSizePixel=0

local sbTop = Instance.new("Frame",SB)
sbTop.Size=UDim2.new(1,0,1,0)
sbTop.BackgroundColor3=C.neonPurple
sbTop.BorderSizePixel=0

local dot = Instance.new("Frame",SB)
dot.Size=UDim2.new(0,7,0,7)
dot.Position=UDim2.new(0,14,0.5,-3.5)
dot.BackgroundColor3=C.neon
dot.BorderSizePixel=0
corner(dot,3.5)

mkLbl(SB,"SYSTEM ONLINE",10,C.neon,false,Enum.TextXAlignment.Left,28,0,100,SB_H)
mkLbl(SB,"|",10,C.neonPurple,false,Enum.TextXAlignment.Left,130,0,10,SB_H)
local sbSilent = mkLbl(SB,"SILENT: ON",10,C.neon,true,Enum.TextXAlignment.Left,142,0,90,SB_H)
mkLbl(SB,"NanaChan",10,C.textDim,false,Enum.TextXAlignment.Right,0,0,W-12,SB_H)

-- Update status bar
task.spawn(function()
    while true do
        task.wait(0.5)
        sbSilent.Text = SilentAimEnabled and "SILENT: ON" or "SILENT: OFF"
        sbSilent.TextColor3 = SilentAimEnabled and C.neon or C.textDim
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
    tw(Main, {Size=UDim2.new(0,W,0,0)}, 0.25)
    task.spawn(function()
        task.wait(0.28)
        Main.Visible = false
        ReopenBtn.Position = UDim2.new(0, Main.AbsolutePosition.X, 0, Main.AbsolutePosition.Y)
        ReopenBtn.Visible = true
        blur.Size = 12
    end)
end

local function doReopen()
    minimized = false
    ReopenBtn.Visible = false
    Main.Visible = true
    tw(Main, {Size=UDim2.new(0,W,0,H)}, 0.25)
    blur.Size = 0
end

ReopenBtn.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or
       input.UserInputType==Enum.UserInputType.MouseButton1 then
        reopenDragging=true
        reopenMoved=false
        reopenDragStart=input.Position
        reopenStartPos=ReopenBtn.Position
    end
end)

ReopenBtn.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or
       input.UserInputType==Enum.UserInputType.MouseButton1 then
        if not reopenMoved then doReopen() end
        reopenDragging=false
        reopenMoved=false
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
    ESPEnabled=false
    ClearESP()
    WalkWater=false
    local wp=workspace:FindFirstChild("RivalsWaterSolid")
    if wp then wp:Destroy() end
    if SilentAimIndicator then SilentAimIndicator:Destroy() end
    blur.Size = 0
    tw(Main,{Size=UDim2.new(0,W,0,0)},0.25)
    task.wait(0.3)
    ScreenGui:Destroy()
end)

-- ============================================================
--  INITIALIZATION
-- ============================================================
-- Setup Silent Aim hooks
SetupSilentAimHook()
SetupAlternateSilentAim()

showPage("home")
