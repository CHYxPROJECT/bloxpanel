-- ============================================================
--   BLOX PANEL · NEON XTREME EDITION
--   Blox Fruits · True Silent Aim + Smooth UI
--   VERSION: 4.0 (Crystal Neon + True Silent Aim)
-- ============================================================

-- ============================================================
--  [0] CRYSTAL NEON INTRO
-- ============================================================
local function RunIntro()
    local TS2 = game:GetService("TweenService")
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "CrystalNeonIntro"
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    pcall(function() introGui.Parent = game:GetService("CoreGui") end)
    if not introGui.Parent then
        introGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.1
    
    -- Crystal particles
    for i = 1, 50 do
        local particle = Instance.new("Frame", bg)
        particle.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6))
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BackgroundColor3 = Color3.fromRGB(
            math.random(0, 100),
            math.random(150, 255),
            math.random(150, 255)
        )
        particle.BackgroundTransparency = 0.3
        particle.BorderSizePixel = 0
        corner(particle, 3)
        
        task.spawn(function()
            while particle.Parent do
                local newY = particle.Position.Y.Scale + 0.002
                if newY > 1 then newY = 0 end
                particle.Position = UDim2.new(particle.Position.X.Scale, 0, newY, 0)
                task.wait(0.05)
            end
        end)
    end

    local title = Instance.new("TextLabel", bg)
    title.Size = UDim2.new(1,0,0,100)
    title.Position = UDim2.new(0,0,0.3,0)
    title.BackgroundTransparency = 1
    title.Text = "BLOX PANEL"
    title.TextColor3 = Color3.fromRGB(0, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 68
    title.TextStrokeTransparency = 0.2
    title.TextStrokeColor3 = Color3.fromRGB(0, 100, 200)
    title.TextTransparency = 1
    
    -- Animated gradient border
    local gradientBorder = Instance.new("Frame", bg)
    gradientBorder.Size = UDim2.new(0, 400, 0, 120)
    gradientBorder.Position = UDim2.new(0.5, -200, 0.3, -10)
    gradientBorder.BackgroundTransparency = 1
    gradientBorder.BorderSizePixel = 0
    
    local grad = Instance.new("UIGradient", gradientBorder)
    grad.Rotation = 45
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    })
    
    local sub = Instance.new("TextLabel", bg)
    sub.Size = UDim2.new(1,0,0,30)
    sub.Position = UDim2.new(0,0,0.3,110)
    sub.BackgroundTransparency = 1
    sub.Text = "» CRYSTAL NEON EDITION «"
    sub.TextColor3 = Color3.fromRGB(0, 200, 255)
    sub.Font = Enum.Font.Gotham
    sub.TextSize = 14
    sub.TextTransparency = 1
    
    -- Pulse animation
    task.spawn(function()
        for i = 0, 1, 0.02 do
            gradientBorder.BackgroundTransparency = 1 - i * 0.7
            task.wait(0.01)
        end
        TS2:Create(title, TweenInfo.new(0.8, Enum.EasingStyle.Elastic), {TextTransparency=0}):Play()
        task.wait(0.3)
        TS2:Create(sub, TweenInfo.new(0.5), {TextTransparency=0}):Play()
        task.wait(2)
        
        local fade = TweenInfo.new(0.6)
        TS2:Create(bg, fade, {BackgroundTransparency=1}):Play()
        TS2:Create(title, fade, {TextTransparency=1}):Play()
        TS2:Create(sub, fade, {TextTransparency=1}):Play()
        task.wait(0.6)
        introGui:Destroy()
    end)
end

local function corner(p, r) 
    local c = Instance.new("UICorner", p)
    c.CornerRadius = UDim.new(0, r or 8)
end

RunIntro()
task.wait(3)

-- ============================================================
--  [1] SERVICES & CONSTANTS
-- ============================================================
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RSvc = game:GetService("RunService")
local TS = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local C = {
    bg = Color3.fromRGB(6, 6, 16),
    surface = Color3.fromRGB(12, 12, 28),
    surface2 = Color3.fromRGB(20, 20, 42),
    neon = Color3.fromRGB(0, 255, 255),
    neonPink = Color3.fromRGB(255, 0, 150),
    neonPurple = Color3.fromRGB(150, 0, 255),
    neonGreen = Color3.fromRGB(0, 255, 100),
    text = Color3.fromRGB(220, 230, 255),
    textDim = Color3.fromRGB(100, 110, 180),
    red = Color3.fromRGB(255, 50, 50),
    gold = Color3.fromRGB(255, 200, 50)
}

-- ============================================================
--  [2] TRUE SILENT AIM (BENAR-BENAR KENA TANPA AIM)
--  Skill/projectile otomatis diarahkan ke target terdekat
--  Tidak peduli ke mana player mengarahkan kamera/aim
-- ============================================================

local SilentAimEnabled = true
local SilentAimRadius = 450
local SilentAimTargetPlayers = true
local SilentAimTargetNPCs = true
local SilentAimIndicator = nil
local SilentAimCurrentTarget = nil
local SilentAimHooks = {}

-- Mendapatkan target terdekat dalam radius
local function GetClosestTarget()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end
    
    local closestTarget = nil
    local closestDist = SilentAimRadius
    local closestPart = nil
    
    if SilentAimTargetPlayers then
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= LP and pl.Character then
                local targetHrp = pl.Character:FindFirstChild("HumanoidRootPart")
                local targetHead = pl.Character:FindFirstChild("Head")
                if targetHrp then
                    local dist = (hrp.Position - targetHrp.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestTarget = pl.Character
                        closestPart = targetHead or targetHrp
                    end
                end
            end
        end
    end
    
    if SilentAimTargetNPCs then
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in pairs(enemies:GetChildren()) do
                local npcHrp = npc:FindFirstChild("HumanoidRootPart")
                if npcHrp then
                    local dist = (hrp.Position - npcHrp.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestTarget = npc
                        closestPart = npc:FindFirstChild("Head") or npcHrp
                    end
                end
            end
        end
    end
    
    return closestTarget, closestPart
end

-- Visual indicator target Silent Aim
local function UpdateSilentAimIndicator()
    if SilentAimIndicator then 
        pcall(function() SilentAimIndicator:Destroy() end)
        SilentAimIndicator = nil
    end
    
    if not SilentAimEnabled then return end
    
    local target, targetPart = GetClosestTarget()
    if target and targetPart then
        local indicator = Instance.new("SelectionBox")
        indicator.Adornee = targetPart
        indicator.Color3 = C.neon
        indicator.LineThickness = 0.15
        indicator.Transparency = 0.4
        indicator.Parent = targetPart
        
        -- Add glow effect
        local glow = Instance.new("PointLight", targetPart)
        glow.Color = C.neon
        glow.Range = 8
        glow.Brightness = 1
        glow.Enabled = true
        
        SilentAimIndicator = {box = indicator, light = glow}
    end
end

-- HOOK SEMUA REMOTE ATTACK - Memaksa semua serangan ke target terdekat
local function SetupTrueSilentAim()
    -- Cari semua remote yang mungkin untuk combat
    local remotesToHook = {}
    
    -- Remote umum di Blox Fruits
    local possibleRemotes = {
        "Remotes/Combat",
        "Remotes/Attack",
        "RE/RegisterHit",
        "RE/RegisterAttack",
        "RE/Combat/Fire",
        "RE/UseSkill",
        "RemoteEvent",
        "AttackRemote",
        "CombatRemote"
    }
    
    for _, remotePath in pairs(possibleRemotes) do
        local success, remote = pcall(function()
            local parts = {}
            for part in string.gmatch(remotePath, "([^/]+)") do
                table.insert(parts, part)
            end
            local current = RS
            for _, part in pairs(parts) do
                current = current:FindFirstChild(part)
                if not current then break end
            end
            return current
        end)
        if success and remote and remote:IsA("RemoteEvent") then
            table.insert(remotesToHook, remote)
        end
    end
    
    -- Coba cari semua RemoteEvent di ReplicatedStorage
    for _, child in pairs(RS:GetChildren()) do
        if child:IsA("RemoteEvent") and string.find(child.Name, "[Aa]ttack") or 
           string.find(child.Name, "[Cc]ombat") or string.find(child.Name, "[Hh]it") then
            table.insert(remotesToHook, child)
        end
    end
    
    -- Hook setiap remote
    for _, remote in pairs(remotesToHook) do
        if not SilentAimHooks[remote] then
            local oldFire = remote.FireServer
            remote.FireServer = function(self, ...)
                if SilentAimEnabled then
                    local target, targetPart = GetClosestTarget()
                    if target and targetPart then
                        local args = {...}
                        -- Modifikasi argumen untuk mengarah ke target
                        for i, arg in pairs(args) do
                            if type(arg) == "CFrame" then
                                local myHrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                                if myHrp then
                                    local direction = (targetPart.Position - myHrp.Position).Unit
                                    args[i] = CFrame.lookAt(myHrp.Position, myHrp.Position + direction)
                                end
                            elseif type(arg) == "Instance" and arg:IsA("BasePart") then
                                args[i] = targetPart
                            elseif type(arg) == "table" then
                                -- Coba cari target di dalam table
                                for j, v in pairs(arg) do
                                    if type(v) == "Instance" and v:IsA("BasePart") then
                                        arg[j] = targetPart
                                    end
                                end
                            end
                        end
                        return oldFire(self, unpack(args))
                    end
                end
                return oldFire(self, ...)
            end
            SilentAimHooks[remote] = true
        end
    end
end

-- Hook RegisterHit untuk damage langsung
local function SetupDamageHook()
    local Net = RS:FindFirstChild("Modules")
    if Net then
        local RegisterHit = Net:FindFirstChild("RE/RegisterHit")
        if RegisterHit then
            local oldHit = RegisterHit.FireServer
            RegisterHit.FireServer = function(self, hitPart, targets)
                if SilentAimEnabled then
                    local target, targetPart = GetClosestTarget()
                    if target and targetPart then
                        -- Redirect damage ke target terdekat
                        return oldHit(self, targetPart, {{target, targetPart}})
                    end
                end
                return oldHit(self, hitPart, targets)
            end
        end
    end
end

-- Visual lingkaran Silent Aim di sekitar target
local function CreateSilentAimCircle()
    local circle = Instance.new("Part")
    circle.Name = "SilentAimCircle"
    circle.Shape = Enum.PartType.Ball
    circle.Size = Vector3.new(SilentAimRadius * 2, 1, SilentAimRadius * 2)
    circle.Anchored = true
    circle.CanCollide = false
    circle.Transparency = 0.85
    circle.Color = C.neon
    circle.Material = Enum.Material.Neon
    
    local selection = Instance.new("SelectionBox", circle)
    selection.Color3 = C.neon
    selection.LineThickness = 0.05
    selection.Transparency = 0.6
    
    return circle
end

local SilentAimCircle = nil
local function UpdateSilentAimCircle()
    if SilentAimCircle then SilentAimCircle:Destroy() end
    if not SilentAimEnabled then return end
    
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        SilentAimCircle = CreateSilentAimCircle()
        SilentAimCircle.Parent = hrp
        SilentAimCircle.CFrame = hrp.CFrame
    end
end

-- Auto update circle position
RSvc.RenderStepped:Connect(function()
    if SilentAimCircle and LP.Character then
        local hrp = LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            SilentAimCircle.CFrame = hrp.CFrame
        end
    end
    UpdateSilentAimIndicator()
end)

-- ============================================================
--  [3] FAST ATTACK SYSTEM
-- ============================================================
local FastAttackEnabled = false
local FastAttackRange = 12000
local FastAttackConn = nil
local RegisterHit, RegisterAttack = nil, nil

pcall(function()
    local Net = RS:FindFirstChild("Modules")
    if Net then
        RegisterHit = Net["RE/RegisterHit"]
        RegisterAttack = Net["RE/RegisterAttack"]
    end
end)

local function AttackMultipleTargets(targets)
    pcall(function()
        if not targets or #targets == 0 then return end
        local all = {}
        for _, char in pairs(targets) do
            local head = char:FindFirstChild("Head")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if head then
                table.insert(all, {char, head})
            elseif hrp then
                table.insert(all, {char, hrp})
            end
        end
        if #all == 0 then return end
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
            for _, pl in pairs(Players:GetPlayers()) do
                if pl ~= LP and pl.Character then
                    local hum = pl.Character:FindFirstChild("Humanoid")
                    local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and hum.Health > 0 and
                       (hrp.Position - myHRP.Position).Magnitude <= FastAttackRange then
                        table.insert(targets, pl.Character)
                    end
                end
            end
            
            local enemies = workspace:FindFirstChild("Enemies")
            if enemies then
                for _, npc in pairs(enemies:GetChildren()) do
                    local hum = npc:FindFirstChild("Humanoid")
                    local hrp = npc:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and hum.Health > 0 and
                       (hrp.Position - myHRP.Position).Magnitude <= FastAttackRange then
                        table.insert(targets, npc)
                    end
                end
            end
            
            if #targets > 0 then AttackMultipleTargets(targets) end
        end
    end)
end

-- ============================================================
--  [4] MOVEMENT SYSTEMS
-- ============================================================
local InfJumpEnabled = false
local NoClipEnabled = false
local WalkWater = false
local SpeedEnabled = false
local SpeedValue = 16

RSvc.Heartbeat:Connect(function()
    if SpeedEnabled and LP.Character then
        local hum = LP.Character:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            LP.Character:TranslateBy(hum.MoveDirection * (SpeedValue / 55))
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if InfJumpEnabled and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RSvc.Stepped:Connect(function()
    if NoClipEnabled and LP.Character then
        for _, v in pairs(LP.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

RSvc.RenderStepped:Connect(function()
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if WalkWater and hrp then
        if hrp.Position.Y >= 9.5 and hrp.Velocity.Y <= 0 then
            local wp = workspace:FindFirstChild("RivalsWaterSolid")
            if not wp then
                wp = Instance.new("Part", workspace)
                wp.Name = "RivalsWaterSolid"
                wp.Size = Vector3.new(20, 1, 20)
                wp.Transparency = 1
                wp.Anchored = true
                wp.CanCollide = true
                wp.CanQuery = false
            end
            wp.CFrame = CFrame.new(hrp.Position.X, 9.2, hrp.Position.Z)
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
--  [5] HOTKEYS
-- ============================================================
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.U then
        FastAttackEnabled = not FastAttackEnabled
        if FastAttackEnabled then StartFastAttack()
        elseif FastAttackConn then task.cancel(FastAttackConn) end
    end
    if input.KeyCode == Enum.KeyCode.B then
        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local flag = hrp:FindFirstChild("UpLoop")
            if flag then flag:Destroy()
            else
                flag = Instance.new("BoolValue", hrp)
                flag.Name = "UpLoop"
                task.spawn(function()
                    while flag.Parent do
                        hrp.CFrame = hrp.CFrame * CFrame.new(0, 50, 0)
                        task.wait(0.05)
                    end
                end)
            end
        end
    end
    if input.KeyCode == Enum.KeyCode.V then
        SilentAimEnabled = not SilentAimEnabled
        UpdateSilentAimCircle()
    end
end)

-- ============================================================
--  [6] CRYSTAL NEON UI
-- ============================================================
local pgui = LP:WaitForChild("PlayerGui")
if pgui:FindFirstChild("CrystalNeonPanel") then pgui.CrystalNeonPanel:Destroy() end

local ScreenGui = Instance.new("ScreenGui", pgui)
ScreenGui.Name = "CrystalNeonPanel"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Glass blur effect
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0

-- UI Sizes
local SIZES = {
    {name = "Compact", w = 420, h = 380},
    {name = "Normal", w = 560, h = 480},
    {name = "Wide", w = 700, h = 560},
    {name = "Ultra", w = 840, h = 640}
}
local currentSizeIdx = 2
local W, H = SIZES[currentSizeIdx].w, SIZES[currentSizeIdx].h
local HDR_H = 60
local CHIP_H = 50
local SB_H = 34
local SIDE_W = 140
local BODY_Y = HDR_H + CHIP_H + 10
local BODY_H = H - BODY_Y - SB_H

-- Helper functions
local function tw(obj, props, t)
    TS:Create(obj, TweenInfo.new(t or 0.18, Enum.EasingStyle.Quad), props):Play()
end

local function mkLbl(parent, text, sz, col, bold, xAl, x, y, w, h)
    local l = Instance.new("TextLabel", parent)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextSize = sz
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextColor3 = col
    l.TextXAlignment = xAl or Enum.TextXAlignment.Left
    l.Size = UDim2.new(0, w, 0, h)
    l.Position = UDim2.new(0, x, 0, y)
    return l
end

-- MAIN FRAME
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "Main"
Main.Size = UDim2.new(0, W, 0, H)
Main.Position = UDim2.new(0.5, -W/2, 0.25, 0)
Main.BackgroundColor3 = C.bg
Main.BackgroundTransparency = 0.05
Main.Active = true
Main.Draggable = true
corner(Main, 16)
stroke(Main, C.neon, 1.5, 0.4)

-- Animated gradient border
local borderFrame = Instance.new("Frame", Main)
borderFrame.Size = UDim2.new(1, 0, 1, 0)
borderFrame.BackgroundTransparency = 1
local borderGrad = Instance.new("UIGradient", borderFrame)
borderGrad.Rotation = 0
borderGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.neon),
    ColorSequenceKeypoint.new(0.33, C.neonPink),
    ColorSequenceKeypoint.new(0.66, C.neonPurple),
    ColorSequenceKeypoint.new(1, C.neon)
})

task.spawn(function()
    while Main.Parent do
        for i = 0, 360, 3 do
            borderGrad.Rotation = i
            task.wait(0.016)
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
stroke(ReopenBtn, C.neon, 1.5, 0.4)

-- HEADER
local Hdr = Instance.new("Frame", Main)
Hdr.Size = UDim2.new(1, 0, 0, HDR_H)
Hdr.BackgroundColor3 = C.surface
Hdr.BackgroundTransparency = 0.15
corner(Hdr, 16)

local HdrGlow = Instance.new("Frame", Hdr)
HdrGlow.Size = UDim2.new(1, 0, 2, 0)
HdrGlow.Position = UDim2.new(0, 0, 1, -2)
HdrGlow.BackgroundColor3 = C.neon
local hdrGrad = Instance.new("UIGradient", HdrGlow)
hdrGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C.neon), ColorSequenceKeypoint.new(1, C.neonPink)})

mkLbl(Hdr, "⚡ BLOX PANEL ⚡", 20, C.neon, true, Enum.TextXAlignment.Left, 16, 10, 200, 28)
mkLbl(Hdr, "Crystal Neon Edition", 10, C.textDim, false, Enum.TextXAlignment.Left, 16, 40, 180, 16)

local techBadge = Instance.new("Frame", Hdr)
techBadge.Size = UDim2.new(0, 50, 0, 24)
techBadge.Position = UDim2.new(0, 220, 0, 10)
techBadge.BackgroundColor3 = C.neonPurple
techBadge.BackgroundTransparency = 0.2
corner(techBadge, 8)
stroke(techBadge, C.neon, 0.8, 0.4)
mkLbl(techBadge, "XTREME", 10, C.neon, true, Enum.TextXAlignment.Center, 0, 0, 50, 24)

-- Window buttons
local function winBtn(txt, bg2, xOff)
    local b = Instance.new("TextButton", Hdr)
    b.Size = UDim2.new(0, 28, 0, 28)
    b.Position = UDim2.new(1, xOff, 0, 16)
    b.BackgroundColor3 = bg2
    b.Text = txt
    b.TextColor3 = C.white
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    corner(b, 14)
    return b
end

local CloseBtn = winBtn("✕", C.red, -36)
local MinBtn = winBtn("–", C.surface2, -68)

-- CHIPS
local function makeChip(icon, top, bot, xPos)
    local f = Instance.new("Frame", Main)
    f.Size = UDim2.new(0, (W-28)/2, 0, CHIP_H)
    f.Position = UDim2.new(0, xPos, 0, HDR_H+4)
    f.BackgroundColor3 = C.surface
    f.BackgroundTransparency = 0.25
    corner(f, 12)
    stroke(f, C.neon, 0.8, 0.5)
    mkLbl(f, icon, 24, C.neon, false, Enum.TextXAlignment.Left, 10, 0, 40, CHIP_H)
    mkLbl(f, top, 10, C.textDim, false, Enum.TextXAlignment.Left, 50, 8, 160, 14)
    mkLbl(f, bot, 14, C.neon, true, Enum.TextXAlignment.Left, 50, 26, 160, 18)
end

makeChip("🎮", "GAME", "Blox Fruits", 12)
makeChip("⚡", "ENGINE", "True Silent Aim", 12 + (W-28)/2 + 4)

local divider = Instance.new("Frame", Main)
divider.Size = UDim2.new(1, -24, 0, 2)
divider.Position = UDim2.new(0, 12, 0, HDR_H + CHIP_H + 6)
divider.BackgroundColor3 = C.neon
local divGrad = Instance.new("UIGradient", divider)
divGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C.neon), ColorSequenceKeypoint.new(0.5, C.neonPink), ColorSequenceKeypoint.new(1, C.neon)})

-- SIDEBAR
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Size = UDim2.new(0, SIDE_W, 1, -BODY_Y - SB_H)
Sidebar.Position = UDim2.new(0, 0, 0, BODY_Y)
Sidebar.BackgroundColor3 = C.surface
Sidebar.BackgroundTransparency = 0.3
Sidebar.ScrollBarThickness = 2
Sidebar.ScrollBarImageColor3 = C.neonPurple
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y

local sidebarLine = Instance.new("Frame", Main)
sidebarLine.Size = UDim2.new(0, 2, 1, -BODY_Y - SB_H)
sidebarLine.Position = UDim2.new(0, SIDE_W, 0, BODY_Y)
sidebarLine.BackgroundColor3 = C.neon

-- CONTENT AREA
local ContentBG = Instance.new("Frame", Main)
ContentBG.Size = UDim2.new(1, -SIDE_W - 2, 1, -BODY_Y - SB_H)
ContentBG.Position = UDim2.new(0, SIDE_W + 2, 0, BODY_Y)
ContentBG.BackgroundColor3 = C.bg
ContentBG.BackgroundTransparency = 0.2
ContentBG.ClipsDescendants = true
corner(ContentBG, 8)

-- PAGES
local pages = {}
local currentPage = nil
local sideButtons = {}

local function newPage(id)
    local sf = Instance.new("ScrollingFrame", ContentBG)
    sf.Name = id
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.BackgroundTransparency = 1
    sf.ScrollBarThickness = 3
    sf.ScrollBarImageColor3 = C.neon
    sf.CanvasSize = UDim2.new(0, 0, 0, 0)
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Visible = false
    
    local layout = Instance.new("UIListLayout", sf)
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local padding = Instance.new("UIPadding", sf)
    padding.PaddingTop = UDim.new(0, 12)
    padding.PaddingBottom = UDim.new(0, 12)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    
    pages[id] = sf
    return sf
end

local function showPage(id)
    for pid, pg in pairs(pages) do
        pg.Visible = (pid == id)
    end
    currentPage = id
    for _, btn in pairs(sideButtons) do
        local active = (btn.page == id)
        btn.frame.BackgroundColor3 = active and C.surface2 or C.surface
        btn.frame.BackgroundTransparency = active and 0.1 or 0.4
        btn.bar.BackgroundColor3 = active and C.neon or C.surface
        btn.lbl.TextColor3 = active and C.neon or C.textDim
    end
end

-- COMPONENT BUILDERS
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
    l.TextSize = 11
    l.TextColor3 = C.neon
    l.TextXAlignment = Enum.TextXAlignment.Left
    
    local line = Instance.new("Frame", wrap)
    line.Size = UDim2.new(1, -100, 0, 1.5)
    line.Position = UDim2.new(0, 95, 0.5, 0)
    line.BackgroundColor3 = C.neonPurple
    local lineGrad = Instance.new("UIGradient", line)
    lineGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C.neon), ColorSequenceKeypoint.new(1, C.neonPink)})
end

local function makeToggle(icon, name, desc, parent, lo, callback)
    local row = Instance.new("TextButton", parent)
    row.Size = UDim2.new(1, 0, 0, 60)
    row.BackgroundColor3 = C.surface
    row.BackgroundTransparency = 0.35
    row.Text = ""
    row.AutoButtonColor = false
    row.LayoutOrder = lo
    corner(row, 12)
    stroke(row, C.neonPurple, 0.8, 0.5)
    
    mkLbl(row, icon, 24, C.neon, false, Enum.TextXAlignment.Left, 14, 0, 38, 60)
    local nameLbl = mkLbl(row, name, 14, C.text, true, Enum.TextXAlignment.Left, 56, 12, 220, 20)
    mkLbl(row, desc, 10, C.textDim, false, Enum.TextXAlignment.Left, 56, 36, 220, 16)
    
    local swBg = Instance.new("Frame", row)
    swBg.Size = UDim2.new(0, 48, 0, 26)
    swBg.Position = UDim2.new(1, -56, 0.5, -13)
    swBg.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    swBg.BorderSizePixel = 0
    corner(swBg, 13)
    stroke(swBg, C.neonPurple, 0.5, 0.4)
    
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
            tw(knob, {Position = UDim2.new(0, 25, 0.5, -10), BackgroundColor3 = C.neon}, 0.15)
            tw(swBg, {BackgroundColor3 = Color3.fromRGB(35, 35, 65)}, 0.15)
            tw(row, {BackgroundColor3 = Color3.fromRGB(25, 25, 50)}, 0.15)
            nameLbl.TextColor3 = C.neon
            local strokeUI = row:FindFirstChildOfClass("UIStroke")
            if strokeUI then strokeUI.Color = C.neon; strokeUI.Transparency = 0.2 end
        else
            tw(knob, {Position = UDim2.new(0, 3, 0.5, -10), BackgroundColor3 = C.textDim}, 0.15)
            tw(swBg, {BackgroundColor3 = Color3.fromRGB(25, 25, 45)}, 0.15)
            tw(row, {BackgroundColor3 = C.surface}, 0.15)
            nameLbl.TextColor3 = C.text
            local strokeUI = row:FindFirstChildOfClass("UIStroke")
            if strokeUI then strokeUI.Color = C.neonPurple; strokeUI.Transparency = 0.5 end
        end
        if callback then callback(on) end
    end
    
    row.MouseButton1Click:Connect(function() setState(not isOn) end)
    return row, setState
end

local function makeSlider(name, minV, maxV, startV, parent, lo, callback)
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, 0, 0, 80)
    card.BackgroundColor3 = C.surface
    card.BackgroundTransparency = 0.35
    card.LayoutOrder = lo
    corner(card, 12)
    stroke(card, C.neonPurple, 0.8, 0.5)
    
    mkLbl(card, name, 13, C.text, true, Enum.TextXAlignment.Left, 16, 10, 200, 18)
    local valLbl = mkLbl(card, tostring(startV), 15, C.neon, true, Enum.TextXAlignment.Right, 0, 10, -20, 18)
    valLbl.Size = UDim2.new(0, 0, 0, 18)
    valLbl.AutomaticSize = Enum.AutomaticSize.X
    valLbl.Position = UDim2.new(1, -20 - valLbl.TextBounds.X, 0, 10)
    
    local minusBtn = Instance.new("TextButton", card)
    minusBtn.Size = UDim2.new(0, 36, 0, 36)
    minusBtn.Position = UDim2.new(0, 16, 0, 40)
    minusBtn.BackgroundColor3 = C.surface2
    minusBtn.Text = "−"
    minusBtn.TextColor3 = C.neon
    minusBtn.Font = Enum.Font.GothamBold
    minusBtn.TextSize = 20
    minusBtn.BorderSizePixel = 0
    corner(minusBtn, 10)
    
    local plusBtn = Instance.new("TextButton", card)
    plusBtn.Size = UDim2.new(0, 36, 0, 36)
    plusBtn.Position = UDim2.new(1, -52, 0, 40)
    plusBtn.BackgroundColor3 = C.surface2
    plusBtn.Text = "+"
    plusBtn.TextColor3 = C.neon
    plusBtn.Font = Enum.Font.GothamBold
    plusBtn.TextSize = 20
    plusBtn.BorderSizePixel = 0
    corner(plusBtn, 10)
    
    local trackBg = Instance.new("Frame", card)
    trackBg.Size = UDim2.new(1, -108, 0, 5)
    trackBg.Position = UDim2.new(0, 52, 0, 56)
    trackBg.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
    trackBg.BorderSizePixel = 0
    corner(trackBg, 2.5)
    
    local fill = Instance.new("Frame", trackBg)
    local initPct = (startV - minV) / (maxV - minV)
    fill.Size = UDim2.new(initPct, 0, 1, 0)
    fill.BackgroundColor3 = C.neon
    fill.BorderSizePixel = 0
    corner(fill, 2.5)
    
    local val = startV
    local step = math.max(1, math.floor((maxV - minV) / 20))
    
    local function updateVal(newVal)
        val = math.clamp(newVal, minV, maxV)
        valLbl.Text = tostring(val)
        valLbl.Position = UDim2.new(1, -20 - valLbl.TextBounds.X, 0, 10)
        local pct = (val - minV) / (maxV - minV)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        if callback then callback(val) end
    end
    
    minusBtn.MouseButton1Click:Connect(function() updateVal(val - step) end)
    plusBtn.MouseButton1Click:Connect(function() updateVal(val + step) end)
    
    local dragging = false
    trackBg.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if not dragging then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local tAbs = trackBg.AbsolutePosition
            local tSz = trackBg.AbsoluteSize
            local pct = math.clamp((i.Position.X - tAbs.X) / tSz.X, 0, 1)
            updateVal(math.floor(minV + (maxV - minV) * pct))
        end
    end)
    
    return card
end

local function makeBtn(icon, name, desc, parent, lo, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 56)
    btn.BackgroundColor3 = C.surface
    btn.BackgroundTransparency = 0.35
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.LayoutOrder = lo
    corner(btn, 12)
    stroke(btn, C.neonPurple, 0.8, 0.5)
    
    mkLbl(btn, icon, 24, C.neon, false, Enum.TextXAlignment.Left, 14, 0, 38, 56)
    local nameLbl = mkLbl(btn, name, 14, C.text, true, Enum.TextXAlignment.Left, 56, 10, 200, 20)
    mkLbl(btn, desc, 10, C.textDim, false, Enum.TextXAlignment.Left, 56, 34, 200, 16)
    mkLbl(btn, "▶", 18, C.neon, true, Enum.TextXAlignment.Right, 0, 0, -20, 56)
    
    btn.MouseEnter:Connect(function()
        tw(btn, {BackgroundColor3 = Color3.fromRGB(28, 28, 58)}, 0.1)
        nameLbl.TextColor3 = C.neon
        local strokeUI = btn:FindFirstChildOfClass("UIStroke")
        if strokeUI then strokeUI.Color = C.neon; strokeUI.Transparency = 0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn, {BackgroundColor3 = C.surface}, 0.1)
        nameLbl.TextColor3 = C.text
        local strokeUI = btn:FindFirstChildOfClass("UIStroke")
        if strokeUI then strokeUI.Color = C.neonPurple; strokeUI.Transparency = 0.5 end
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- CREATE PAGES

-- HOME
local pgHome = newPage("home")

local heroCard = Instance.new("Frame", pgHome)
heroCard.Size = UDim2.new(1, 0, 0, 110)
heroCard.BackgroundColor3 = C.surface
heroCard.BackgroundTransparency = 0.2
heroCard.LayoutOrder = 1
corner(heroCard, 16)
stroke(heroCard, C.neon, 1, 0.3)

local iconRing = Instance.new("Frame", heroCard)
iconRing.Size = UDim2.new(0, 70, 0, 70)
iconRing.Position = UDim2.new(0, 20, 0.5, -35)
iconRing.BackgroundColor3 = C.surface2
corner(iconRing, 35)
stroke(iconRing, C.neon, 2, 0.3)
mkLbl(iconRing, "⚡", 32, C.neon, false, Enum.TextXAlignment.Center, 0, 0, 70, 70)

mkLbl(heroCard, "BLOX PANEL", 22, C.neon, true, Enum.TextXAlignment.Left, 110, 18, 200, 28)
mkLbl(heroCard, "Crystal Neon Edition", 12, C.textDim, false, Enum.TextXAlignment.Left, 110, 48, 200, 18)
mkLbl(heroCard, "[U] Fast Attack  |  [B] Fly Up  |  [V] Silent Aim", 10, C.neon, false, Enum.TextXAlignment.Left, 110, 72, 350, 16)

secLabel("INTERFACE", pgHome, 2)

local sizeWrap = Instance.new("Frame", pgHome)
sizeWrap.Size = UDim2.new(1, 0, 0, 56)
sizeWrap.BackgroundColor3 = C.surface
sizeWrap.BackgroundTransparency = 0.35
sizeWrap.LayoutOrder = 3
corner(sizeWrap, 12)
stroke(sizeWrap, C.neonPurple, 0.8, 0.5)

local szLayout = Instance.new("UIListLayout", sizeWrap)
szLayout.FillDirection = Enum.FillDirection.Horizontal
szLayout.Padding = UDim.new(0, 8)
szLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
szLayout.VerticalAlignment = Enum.VerticalAlignment.Center

local sizeBtns = {}
local function applySize(idx)
    currentSizeIdx = idx
    local ns = SIZES[idx]
    W, H = ns.w, ns.h
    tw(Main, {Size = UDim2.new(0, ns.w, 0, ns.h)}, 0.25)
    for i, btn in pairs(sizeBtns) do
        btn.BackgroundColor3 = i == idx and C.neonPurple or C.surface2
        btn.TextColor3 = i == idx and C.white or C.textDim
    end
end

for i, sz in ipairs(SIZES) do
    local btn = Instance.new("TextButton", sizeWrap)
    btn.Size = UDim2.new(0.22, -5, 0, 38)
    btn.BackgroundColor3 = i == currentSizeIdx and C.neonPurple or C.surface2
    btn.TextColor3 = i == currentSizeIdx and C.white or C.textDim
    btn.Text = sz.name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    corner(btn, 10)
    btn.MouseButton1Click:Connect(function() applySize(i) end)
    table.insert(sizeBtns, btn)
end

-- COMBAT PAGE
local pgCombat = newPage("combat")

secLabel("⚔️ FAST ATTACK", pgCombat, 1)
makeToggle("⚡", "Fast Attack [U]", "Range " .. FastAttackRange, pgCombat, 2, function(on)
    FastAttackEnabled = on
    if on then StartFastAttack() elseif FastAttackConn then task.cancel(FastAttackConn) end
end)
makeSlider("Attack Range", 0, 12000, FastAttackRange, pgCombat, 3, function(v)
    FastAttackRange = v
end)

secLabel("🎯 TRUE SILENT AIM", pgCombat, 4)
makeToggle("🎯", "Silent Aim [V]", "Skill otomatis kena ke musuh terdekat", pgCombat, 5, function(on)
    SilentAimEnabled = on
    UpdateSilentAimCircle()
end)
makeToggle("👥", "Target Players", "", pgCombat, 6, function(on) SilentAimTargetPlayers = on end)
makeToggle("👾", "Target NPCs", "", pgCombat, 7, function(on) SilentAimTargetNPCs = on end)
makeSlider("Detection Radius", 50, 800, SilentAimRadius, pgCombat, 8, function(v)
    SilentAimRadius = v
    UpdateSilentAimCircle()
end)

secLabel("🦿 MOVEMENT", pgCombat, 9)
makeToggle("🦘", "Infinite Jump", "", pgCombat, 10, function(on) InfJumpEnabled = on end)
makeToggle("👻", "No Clip", "", pgCombat, 11, function(on) NoClipEnabled = on end)
makeToggle("🌊", "Walk on Water", "", pgCombat, 12, function(on) WalkWater = on end)
makeToggle("⚡", "Custom Speed", "Apply walk speed", pgCombat, 13, function(on) SpeedEnabled = on end)
makeSlider("Walk Speed", 16, 250, SpeedValue, pgCombat, 14, function(v)
    SpeedValue = v
    if LP.Character and SpeedEnabled then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end)

secLabel("🛡️ GOD MODE", pgCombat, 15)
local GodModeEnabled = false
local GodModeConns = {}
makeToggle("🛡️", "God Mode", "Health always max", pgCombat, 16, function(on)
    GodModeEnabled = on
    for _, c in pairs(GodModeConns) do pcall(function() c:Disconnect() end) end
    GodModeConns = {}
    if on then
        table.insert(GodModeConns, RSvc.Stepped:Connect(function()
            pcall(function()
                local char = LP.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Health = hum.MaxHealth
                    if hum:GetState() == Enum.HumanoidStateType.Dead then
                        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end
            end)
        end))
        table.insert(GodModeConns, LP.CharacterAdded:Connect(function(newChar)
            task.wait(0.1)
            local hum = newChar:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = hum.MaxHealth end
        end))
    end
end)

-- ESP PAGE
local pgESP = newPage("esp")

secLabel("👁️ VISION", pgESP, 1)
local ESPEnabled = false
local ESPNames = false
local ESPBoxes = false
local ESPObjects = {}

local function ClearESP()
    for _, obj in pairs(ESPObjects) do
        pcall(function() obj:Destroy() end)
    end
    ESPObjects = {}
end

local function UpdateESP()
    ClearESP()
    if not ESPEnabled then return end
    
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LP and pl.Character then
            local char = pl.Character
            local head = char:FindFirstChild("Head")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            
            if ESPNames and head then
                local bb = Instance.new("BillboardGui")
                bb.Adornee = head
                bb.Size = UDim2.new(0, 150, 0, 34)
                bb.StudsOffset = Vector3.new(0, 2.5, 0)
                bb.AlwaysOnTop = true
                bb.Parent = head
                
                local label = Instance.new("TextLabel", bb)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = pl.Name
                label.Font = Enum.Font.GothamBold
                label.TextSize = 13
                label.TextColor3 = C.neon
                label.TextStrokeTransparency = 0.2
                table.insert(ESPObjects, bb)
            end
            
            if ESPBoxes and hrp then
                local bb2 = Instance.new("BillboardGui")
                bb2.Adornee = hrp
                bb2.Size = UDim2.new(0, 60, 0, 80)
                bb2.AlwaysOnTop = true
                bb2.Parent = hrp
                
                local box = Instance.new("Frame", bb2)
                box.Size = UDim2.new(1, 0, 1, 0)
                box.BackgroundTransparency = 1
                stroke(box, C.neon, 2, 0.3)
                table.insert(ESPObjects, bb2)
            end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(3)
        if ESPEnabled then UpdateESP() end
    end
end)

makeToggle("👁️", "Enable ESP", "", pgESP, 2, function(on)
    ESPEnabled = on
    UpdateESP()
end)
makeToggle("📛", "Names ESP", "", pgESP, 3, function(on)
    ESPNames = on
    if ESPEnabled then UpdateESP() end
end)
makeToggle("📦", "Boxes ESP", "", pgESP, 4, function(on)
    ESPBoxes = on
    if ESPEnabled then UpdateESP() end
end)

-- LOCATIONS PAGE
local pgLoc = newPage("locations")

secLabel("📍 SEA 3", pgLoc, 1)

local function tpTo(coords)
    local char = LP.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(coords)
    end
end

makeBtn("⚓", "TP to Ship", "-6500, 129, -123", pgLoc, 2, function()
    tpTo(Vector3.new(-6500, 129, -123))
end)
makeBtn("🌀", "TP to Empty Rivals", "-11997, 332, -8837", pgLoc, 3, function()
    tpTo(Vector3.new(-11997, 332, -8837))
end)

secLabel("🛠️ UTILITIES", pgLoc, 4)
makeBtn("🛸", "PB Fly", "Flight system", pgLoc, 5, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)
makeBtn("🚫", "Anti-AFK", "Prevent kick", pgLoc, 6, function()
    local vu = game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- CREDITS PAGE
local pgCredits = newPage("credits")

local creditCard = Instance.new("Frame", pgCredits)
creditCard.Size = UDim2.new(1, 0, 0, 200)
creditCard.BackgroundColor3 = C.surface
creditCard.BackgroundTransparency = 0.2
creditCard.LayoutOrder = 1
corner(creditCard, 16)
stroke(creditCard, C.neon, 1, 0.4)

mkLbl(creditCard, "⭐ CRYSTAL NEON SYSTEM ⭐", 18, C.neon, true, Enum.TextXAlignment.Center, 0, 20, -20, 28)
mkLbl(creditCard, "Script by NanaChan", 13, C.text, false, Enum.TextXAlignment.Center, 0, 58, -20, 22)
mkLbl(creditCard, "True Silent Aim • Crystal UI • Fast Attack", 11, C.neon, false, Enum.TextXAlignment.Center, 0, 88, -20, 18)

local noteFrame = Instance.new("Frame", pgCredits)
noteFrame.Size = UDim2.new(1, 0, 0, 100)
noteFrame.BackgroundColor3 = Color3.fromRGB(25, 10, 35)
noteFrame.BackgroundTransparency = 0.3
noteFrame.LayoutOrder = 2
corner(noteFrame, 12)
stroke(noteFrame, C.neonPink, 0.8, 0.4)

mkLbl(noteFrame, "⚠️ SECURITY NOTICE ⚠️", 12, C.neonPink, true, Enum.TextXAlignment.Center, 0, 12, -20, 20)
mkLbl(noteFrame, "Script ini berbayar. Jika Anda mendapatkannya secara gratis,", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 38, -20, 16)
mkLbl(noteFrame, "maka itu adalah versi bocor / ilegal. Support creator!", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 60, -20, 16)

-- SIDEBAR MENU
local sideY = 10
local function addSideBtn(icon, txt, pageId)
    local frame = Instance.new("TextButton", Sidebar)
    frame.Size = UDim2.new(1, 0, 0, 42)
    frame.Position = UDim2.new(0, 0, 0, sideY)
    frame.BackgroundColor3 = C.surface
    frame.BackgroundTransparency = 0.4
    frame.Text = ""
    frame.AutoButtonColor = false
    
    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(0, 3, 0.7, 0)
    bar.Position = UDim2.new(0, 0, 0.15, 0)
    bar.BackgroundColor3 = C.surface
    corner(bar, 2)
    
    mkLbl(frame, icon, 18, C.neon, false, Enum.TextXAlignment.Left, 12, 0, 32, 42)
    local nameLbl = mkLbl(frame, txt, 12, C.textDim, true, Enum.TextXAlignment.Left, 46, 0, SIDE_W - 50, 42)
    
    frame.MouseButton1Click:Connect(function() showPage(pageId) end)
    frame.MouseEnter:Connect(function()
        if currentPage ~= pageId then
            tw(frame, {BackgroundColor3 = Color3.fromRGB(28, 28, 55)}, 0.1)
        end
    end)
    frame.MouseLeave:Connect(function()
        if currentPage ~= pageId then
            tw(frame, {BackgroundColor3 = C.surface}, 0.1)
        end
    end)
    
    table.insert(sideButtons, {frame = frame, bar = bar, lbl = nameLbl, page = pageId})
    sideY = sideY + 46
end

-- Add sidebar sections
local section = Instance.new("TextLabel", Sidebar)
section.Size = UDim2.new(1, -16, 0, 24)
section.Position = UDim2.new(0, 12, 0, sideY)
section.BackgroundTransparency = 1
section.Text = "> NAVIGATION <"
section.Font = Enum.Font.GothamBold
section.TextSize = 9
section.TextColor3 = C.neon
section.TextXAlignment = Enum.TextXAlignment.Left
sideY = sideY + 28

addSideBtn("🏠", "HOME", "home")
addSideBtn("⚔️", "COMBAT", "combat")
addSideBtn("👁️", "ESP", "esp")
addSideBtn("📍", "LOCATIONS", "locations")

section = Instance.new("TextLabel", Sidebar)
section.Size = UDim2.new(1, -16, 0, 24)
section.Position = UDim2.new(0, 12, 0, sideY)
section.BackgroundTransparency = 1
section.Text = "> SYSTEM <"
section.Font = Enum.Font.GothamBold
section.TextSize = 9
section.TextColor3 = C.neon
section.TextXAlignment = Enum.TextXAlignment.Left
sideY = sideY + 28

addSideBtn("💎", "CREDITS", "credits")

-- STATUS BAR
local SB = Instance.new("Frame", Main)
SB.Size = UDim2.new(1, 0, 0, SB_H)
SB.Position = UDim2.new(0, 0, 1, -SB_H)
SB.BackgroundColor3 = C.surface
SB.BackgroundTransparency = 0.35

local sbTopLine = Instance.new("Frame", SB)
sbTopLine.Size = UDim2.new(1, 0, 1.5, 0)
sbTopLine.BackgroundColor3 = C.neonPurple

local statusDot = Instance.new("Frame", SB)
statusDot.Size = UDim2.new(0, 8, 0, 8)
statusDot.Position = UDim2.new(0, 14, 0.5, -4)
statusDot.BackgroundColor3 = C.neon
corner(statusDot, 4)

mkLbl(SB, "SYSTEM ONLINE", 10, C.neon, false, Enum.TextXAlignment.Left, 30, 0, 100, SB_H)
mkLbl(SB, "|", 10, C.neonPurple, false, Enum.TextXAlignment.Left, 132, 0, 10, SB_H)
local sbSilent = mkLbl(SB, "SILENT: ON", 10, C.neon, true, Enum.TextXAlignment.Left, 144, 0, 90, SB_H)
mkLbl(SB, "NanaChan • Crystal", 10, C.textDim, false, Enum.TextXAlignment.Right, 0, 0, -12, SB_H)

task.spawn(function()
    while true do
        task.wait(0.3)
        sbSilent.Text = SilentAimEnabled and "SILENT: ON" or "SILENT: OFF"
        sbSilent.TextColor3 = SilentAimEnabled and C.neon or C.textDim
        statusDot.BackgroundColor3 = SilentAimEnabled and C.neon or C.textDim
    end
end)

-- MINIMIZE / REOPEN
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
        blur.Size = 12
    end)
end

local function doReopen()
    minimized = false
    ReopenBtn.Visible = false
    Main.Visible = true
    tw(Main, {Size = UDim2.new(0, W, 0, H)}, 0.25)
    blur.Size = 0
end

ReopenBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        reopenDragging = true
        reopenMoved = false
        reopenDragStart = input.Position
        reopenStartPos = ReopenBtn.Position
    end
end)

ReopenBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if not reopenMoved then doReopen() end
        reopenDragging = false
        reopenMoved = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if reopenDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
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
    ESPEnabled = false
    ClearESP()
    WalkWater = false
    pcall(function() workspace:FindFirstChild("RivalsWaterSolid"):Destroy() end)
    if SilentAimIndicator then
        pcall(function() SilentAimIndicator.box:Destroy() end)
        pcall(function() SilentAimIndicator.light:Destroy() end)
    end
    if SilentAimCircle then SilentAimCircle:Destroy() end
    blur.Size = 0
    tw(Main, {Size = UDim2.new(0, W, 0, 0)}, 0.25)
    task.wait(0.3)
    ScreenGui:Destroy()
end)

-- ============================================================
--  [7] INITIALIZATION
-- ============================================================
SetupTrueSilentAim()
SetupDamageHook()
UpdateSilentAimCircle()
showPage("home")
