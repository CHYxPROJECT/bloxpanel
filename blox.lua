-- ============================================================
--   BLOX PANEL  ·  by NanaChan
--   Blox Fruits  ·  Compatible with Delta Executor
--   VERSION: 2.0 (Blue Edition + Silent Aim)
-- ============================================================

-- ============================================================
--  [0] GOLDEN INTRO (Blue Theme)
-- ============================================================
local function RunIntro()
    local TS2 = game:GetService("TweenService")
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "RivalsIntro"
    introGui.IgnoreGuiInset = true
    introGui.DisplayOrder = 999
    pcall(function() introGui.Parent = game:GetService("CoreGui") end)
    if not introGui.Parent then
        introGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    local bg = Instance.new("Frame", introGui)
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(8, 12, 20) -- Dark blue/black
    bg.BorderSizePixel = 0

    local title = Instance.new("TextLabel", bg)
    title.Size = UDim2.new(1,0,0,70)
    title.Position = UDim2.new(0,0,0.28,0)
    title.BackgroundTransparency = 1
    title.Text = "BLOX PANEL"
    title.TextColor3 = Color3.fromRGB(0, 180, 255) -- Bright Blue
    title.Font = Enum.Font.Code
    title.TextSize = 52
    title.TextScaled = false
    title.TextStrokeTransparency = 0.4
    title.TextStrokeColor3 = Color3.fromRGB(0, 60, 120)
    title.TextTransparency = 1
    pcall(function()
        local font = Font.new("rbxasset://fonts/families/Orbitron.json", Enum.FontWeight.ExtraBold)
        title.FontFace = font
    end)
    pcall(function()
        if title.FontFace == nil then
            title.Font = Enum.Font.GothamBlack
        end
    end)

    local sub1 = Instance.new("TextLabel", bg)
    sub1.Size = UDim2.new(1,0,0,26)
    sub1.Position = UDim2.new(0,0,0.28,74)
    sub1.BackgroundTransparency = 1
    sub1.Text = "by NanaChan"
    sub1.TextColor3 = Color3.fromRGB(100, 200, 255)
    sub1.Font = Enum.Font.GothamBold
    sub1.TextSize = 17
    sub1.TextTransparency = 1

    local sub2 = Instance.new("TextLabel", bg)
    sub2.Size = UDim2.new(1,0,0,20)
    sub2.Position = UDim2.new(0,0,0.28,108)
    sub2.BackgroundTransparency = 1
    sub2.Text = "Loading blue protocols..."
    sub2.TextColor3 = Color3.fromRGB(64, 128, 192)
    sub2.Font = Enum.Font.Gotham
    sub2.TextSize = 14
    sub2.TextTransparency = 1

    -- Blue matrix numbers
    task.spawn(function()
        for i = 1, 100 do
            task.spawn(function()
                while bg.Parent do
                    local m = Instance.new("TextLabel", bg)
                    m.Text = tostring(math.random(0,9))
                    m.Position = UDim2.new(math.random(),0,math.random(),0)
                    m.BackgroundTransparency = 1
                    m.TextColor3 = Color3.fromRGB(
                        math.random(50,150),
                        math.random(150,255),
                        math.random(200,255)
                    )
                    m.Font = Enum.Font.Code
                    m.TextSize = math.random(12,22)
                    m.TextTransparency = 1
                    m.Parent = bg
                    local dur = math.random(4,12)/10
                    TS2:Create(m, TweenInfo.new(dur/2), {TextTransparency=0}):Play()
                    task.wait(dur)
                    TS2:Create(m, TweenInfo.new(dur/2), {TextTransparency=1}):Play()
                    game:GetService("Debris"):AddItem(m, dur)
                    task.wait(math.random(1,4)/10)
                end
            end)
        end
    end)

    task.spawn(function()
        task.wait(0.8)
        TS2:Create(title, TweenInfo.new(0.7,Enum.EasingStyle.Quint), {TextTransparency=0}):Play()
        task.wait(0.35)
        TS2:Create(sub1, TweenInfo.new(0.5), {TextTransparency=0}):Play()
        task.wait(0.25)
        TS2:Create(sub2, TweenInfo.new(0.5), {TextTransparency=0}):Play()
        task.wait(3.5)
        local fi = TweenInfo.new(0.8, Enum.EasingStyle.Linear)
        TS2:Create(bg,    fi, {BackgroundTransparency=1}):Play()
        TS2:Create(title, fi, {TextTransparency=1}):Play()
        TS2:Create(sub1,  fi, {TextTransparency=1}):Play()
        TS2:Create(sub2,  fi, {TextTransparency=1}):Play()
        task.wait(0.9)
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
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ============================================================
--  [2] COLORS (Blue Theme)
-- ============================================================
local C = {
    bg        = Color3.fromRGB(12, 18, 28),
    surface   = Color3.fromRGB(20, 28, 40),
    surface2  = Color3.fromRGB(28, 38, 52),
    blue      = Color3.fromRGB(0, 180, 255),
    blueLight = Color3.fromRGB(100, 210, 255),
    blueDark  = Color3.fromRGB(0, 80, 140),
    text      = Color3.fromRGB(180, 220, 255),
    textDim   = Color3.fromRGB(100, 140, 180),
    red       = Color3.fromRGB(200, 60, 60),
    white     = Color3.new(1,1,1),
}

-- ============================================================
--  [3] SIZES
-- ============================================================
local SIZES = {
    {name="Mini",   w=380, h=340},
    {name="Normal", w=500, h=430},
    {name="Large",  w=620, h=520},
    {name="Extra",  w=740, h=610},
}
local currentSizeIdx = 2

-- ============================================================
--  [4] HELPERS
-- ============================================================
local function corner(p,r)
    local c = Instance.new("UICorner",p); c.CornerRadius = UDim.new(0,r or 8)
end
local function stroke(p,col,th,tr)
    local s = Instance.new("UIStroke",p)
    s.Color=col or C.blue; s.Thickness=th or 1; s.Transparency=tr or 0.6
end
local function tw(obj,props,t)
    TweenService:Create(obj,TweenInfo.new(t or 0.22,Enum.EasingStyle.Quint),props):Play()
end
local function mkLbl(parent,text,sz,col,bold,xAl,x,y,w,h)
    local l = Instance.new("TextLabel",parent)
    l.BackgroundTransparency=1; l.Text=text; l.TextSize=sz
    l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextColor3=col; l.TextXAlignment=xAl or Enum.TextXAlignment.Left
    l.Size=UDim2.new(0,w,0,h); l.Position=UDim2.new(0,x,0,y)
    return l
end
local function blueGrad(f)
    local g = Instance.new("UIGradient",f)
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,   Color3.fromRGB(12,18,28)),
        ColorSequenceKeypoint.new(0.2, C.blue),
        ColorSequenceKeypoint.new(0.8, C.blue),
        ColorSequenceKeypoint.new(1,   Color3.fromRGB(12,18,28)),
    })
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

-- Silent Aim
local SilentAimEnabled = false
local SilentAimTargetPlayers = true
local SilentAimTargetNPCs = true
local SilentAimConn = nil
local SilentAimFOV = 200
local SilentAimShowFOV = false
local FOVCircle = nil

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
local ESPObjects = {}

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
                hrp.BrickColor  = BrickColor.new("White")
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
local function GetClosestTargetInFOV()
    local player = LP
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local camera = workspace.CurrentCamera
    local viewportPoint = camera.ViewportSize
    local center = Vector2.new(viewportPoint.X / 2, viewportPoint.Y / 2)
    local closestDist = SilentAimFOV
    local closestTarget = nil
    
    -- Function to check a target
    local function checkTarget(targetRoot, targetModel)
        if not targetRoot or not targetModel then return end
        local screenPos, onScreen = camera:WorldToViewportPoint(targetRoot.Position)
        if onScreen then
            local distToCenter = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
            if distToCenter < closestDist then
                closestDist = distToCenter
                closestTarget = targetModel
            end
        end
    end
    
    -- Check Players
    if SilentAimTargetPlayers then
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= player and pl.Character then
                local targetHrp = pl.Character:FindFirstChild("HumanoidRootPart")
                local targetHead = pl.Character:FindFirstChild("Head")
                local targetPart = targetHead or targetHrp
                if targetPart then
                    checkTarget(targetPart, pl.Character)
                end
            end
        end
    end
    
    -- Check NPCs
    if SilentAimTargetNPCs then
        local enemies = workspace:FindFirstChild("Enemies")
        if enemies then
            for _, npc in pairs(enemies:GetChildren()) do
                local npcHrp = npc:FindFirstChild("HumanoidRootPart")
                local npcHead = npc:FindFirstChild("Head")
                local targetPart = npcHead or npcHrp
                if targetPart then
                    checkTarget(targetPart, npc)
                end
            end
        end
    end
    
    return closestTarget
end

local function CreateFOVCircle()
    if FOVCircle then FOVCircle:Remove() end
    if not SilentAimShowFOV then return end
    
    local drawing = Drawing.new("Circle")
    drawing.Visible = true
    drawing.Radius = SilentAimFOV
    drawing.Thickness = 2
    drawing.Color = Color3.fromRGB(0, 180, 255)
    drawing.Transparency = 0.5
    drawing.Filled = false
    drawing.NumSides = 64
    drawing.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle = drawing
end

local function UpdateFOVCircle()
    if FOVCircle and SilentAimShowFOV then
        FOVCircle.Radius = SilentAimFOV
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    end
end

local function StartSilentAim()
    if SilentAimConn then SilentAimConn:Disconnect() end
    SilentAimConn = RunService.RenderStepped:Connect(function()
        if not SilentAimEnabled then return end
        
        local target = GetClosestTargetInFOV()
        if target then
            -- Override camera look direction to target
            local targetPart = target:FindFirstChild("Head") or target:FindFirstChild("HumanoidRootPart")
            if targetPart then
                local direction = (targetPart.Position - Camera.CFrame.Position).Unit
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, Camera.CFrame.Position + direction)
            end
        end
        
        -- Update FOV circle position on screen resize
        if FOVCircle then
            FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        end
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
local function UpdateESP()
    ClearESP()
    if not ESPEnabled then return end
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local char = p.Character
            local head = char:FindFirstChild("Head")
            local hrp  = char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end
            if ESPNames and head then
                local bb = Instance.new("BillboardGui")
                bb.Name="RivalsESP_N"; bb.Adornee=head
                bb.Size=UDim2.new(0,120,0,30); bb.StudsOffset=Vector3.new(0,3,0)
                bb.AlwaysOnTop=true; bb.Parent=head
                local nl = Instance.new("TextLabel",bb)
                nl.BackgroundTransparency=1; nl.Size=UDim2.new(1,0,1,0)
                nl.Text=p.Name; nl.Font=Enum.Font.GothamBold; nl.TextSize=14
                nl.TextColor3=Color3.new(0, 0.8, 1); nl.TextStrokeTransparency=0
                table.insert(ESPObjects,bb)
            end
            if ESPBoxes then
                local bb2 = Instance.new("BillboardGui")
                bb2.Name="RivalsESP_B"; bb2.Adornee=hrp
                bb2.Size=UDim2.new(0,50,0,70)
                bb2.AlwaysOnTop=true; bb2.Parent=hrp
                local box = Instance.new("Frame",bb2)
                box.Size=UDim2.new(1,0,1,0); box.BackgroundTransparency=1
                stroke(box, Color3.new(0, 1, 1), 2, 0)
                table.insert(ESPObjects,bb2)
            end
        end
    end
end
task.spawn(function()
    while true do task.wait(5) if ESPEnabled then UpdateESP() end end
end)

-- ============================================================
--  PINK ESP (Drawing API - Azucar Hub) - Made Blue
-- ============================================================
local ESPRosaEnabled = false
local function CreateESPRosa(plr)
    local tag = Drawing.new("Text")
    tag.Visible=false; tag.Center=true; tag.Outline=true
    tag.Font=2; tag.Size=14
    tag.Color=Color3.fromRGB(0, 180, 255) -- Blue
    local conn
    conn = RunService.RenderStepped:Connect(function()
        if ESPRosaEnabled and plr and plr.Parent and plr.Character
        and plr.Character:FindFirstChild("HumanoidRootPart") and plr~=LP then
            local hrp=plr.Character.HumanoidRootPart
            local myHRP=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not myHRP then tag.Visible=false; return end
            local pos,onScreen=workspace.CurrentCamera:WorldToViewportPoint(hrp.Position+Vector3.new(0,3,0))
            if onScreen then
                local dist=(myHRP.Position-hrp.Position).Magnitude
                tag.Position=Vector2.new(pos.X,pos.Y)
                tag.Text=plr.Name.." ["..math.floor(dist).."m]"
                tag.Visible=true
            else tag.Visible=false end
        else
            tag.Visible=false
            if not plr or not plr.Parent then tag:Remove(); conn:Disconnect() end
        end
    end)
end
for _,v in pairs(Players:GetPlayers()) do CreateESPRosa(v) end
Players.PlayerAdded:Connect(CreateESPRosa)

-- ============================================================
--  BACKGROUND LOOP (Azucar Hub - trackers, orbit, kill flash)
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
--  [12] KEYS  U = Fast Attack  |  B = Fly Up  |  V = Silent Aim
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
        if SilentAimEnabled then StartSilentAim()
        else if SilentAimConn then SilentAimConn:Disconnect() end end
    end
end)

-- ============================================================
--  [13] ROOT GUI
-- ============================================================
local pgui = LP:WaitForChild("PlayerGui")
if pgui:FindFirstChild("RivalsPanel") then pgui.RivalsPanel:Destroy() end
local ScreenGui = Instance.new("ScreenGui",pgui)
ScreenGui.Name="RivalsPanel"; ScreenGui.ResetOnSpawn=false
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

local S = SIZES[currentSizeIdx]
local W, H = S.w, S.h
local HDR_H  = 54
local CHIP_H = 46
local SB_H   = 30
local SIDE_W = 120
local BODY_Y = HDR_H + CHIP_H + 10
local BODY_H = H - BODY_Y - SB_H

-- ============================================================
--  MAIN FRAME
-- ============================================================
local Main = Instance.new("Frame",ScreenGui)
Main.Name="Main"; Main.Size=UDim2.new(0,W,0,H)
Main.Position=UDim2.new(0.5,-W/2,0.3,0)
Main.BackgroundColor3=C.bg; Main.Active=true; Main.Draggable=true
Main.ClipsDescendants=true; corner(Main,10); stroke(Main,C.blue,1,0.5)

-- Reopen button (shown when minimized)
local ReopenBtn = Instance.new("TextButton",ScreenGui)
ReopenBtn.Size=UDim2.new(0,140,0,34); ReopenBtn.Position=UDim2.new(0.5,-70,0.3,0)
ReopenBtn.BackgroundColor3=C.surface; ReopenBtn.Text="▲  BLOX PANEL"
ReopenBtn.TextColor3=C.blueLight; ReopenBtn.Font=Enum.Font.GothamBold
ReopenBtn.TextSize=11; ReopenBtn.BorderSizePixel=0; ReopenBtn.Visible=false
corner(ReopenBtn,8); stroke(ReopenBtn,C.blue,1,0.3)

-- ============================================================
--  HEADER
-- ============================================================
local Hdr = Instance.new("Frame",Main)
Hdr.Size=UDim2.new(1,0,0,HDR_H); Hdr.BackgroundColor3=C.surface
Hdr.BorderSizePixel=0; corner(Hdr,10)
local HFill = Instance.new("Frame",Hdr)
HFill.Size=UDim2.new(1,0,0,12); HFill.Position=UDim2.new(0,0,1,-12)
HFill.BackgroundColor3=C.surface; HFill.BorderSizePixel=0
local HDLine = Instance.new("Frame",Hdr)
HDLine.Size=UDim2.new(1,0,0,1); HDLine.Position=UDim2.new(0,0,1,-1)
HDLine.BackgroundColor3=C.blue; HDLine.BorderSizePixel=0; blueGrad(HDLine)

mkLbl(Hdr,"BLOX PANEL",17,C.blueLight,true,Enum.TextXAlignment.Left,14,7,200,26)
mkLbl(Hdr,"by NanaChan",10,C.textDim,false,Enum.TextXAlignment.Left,14,35,160,16)

local ProF = Instance.new("Frame",Hdr)
ProF.Size=UDim2.new(0,36,0,20); ProF.Position=UDim2.new(0,193,0,10)
ProF.BackgroundColor3=C.blueDark; corner(ProF,5)
mkLbl(ProF,"PRO",10,C.blueLight,true,Enum.TextXAlignment.Center,0,0,36,20)

local function winBtn(txt,bg2,xOff)
    local b = Instance.new("TextButton",Hdr)
    b.Size=UDim2.new(0,24,0,24); b.Position=UDim2.new(1,xOff,0,15)
    b.BackgroundColor3=bg2; b.Text=txt; b.TextColor3=C.white
    b.Font=Enum.Font.GothamBold; b.TextSize=12; b.BorderSizePixel=0; corner(b,12)
    return b
end
local CloseBtn = winBtn("✕",C.red,-30)
local MinBtn   = winBtn("–",C.surface2,-58)

-- ============================================================
--  CHIPS
-- ============================================================
local CHIP_Y = HDR_H+4
local function makeChip(icon,top,bot,xPos)
    local f = Instance.new("Frame",Main)
    f.Size=UDim2.new(0,(W-28)/2,0,CHIP_H); f.Position=UDim2.new(0,xPos,0,CHIP_Y)
    f.BackgroundColor3=C.surface; f.BorderSizePixel=0; corner(f,8); stroke(f,C.blue,1,0.62)
    mkLbl(f,icon,20,C.blue,false,Enum.TextXAlignment.Left,8,0,34,CHIP_H)
    mkLbl(f,top,9,C.textDim,false,Enum.TextXAlignment.Left,44,6,160,14)
    mkLbl(f,bot,14,C.blueLight,true,Enum.TextXAlignment.Left,44,21,160,20)
end
makeChip("🎮","GAME","Blox Fruits",12)
makeChip("⚡","EXECUTOR","Delta",12+(W-28)/2+4)

local GLine = Instance.new("Frame",Main)
GLine.Size=UDim2.new(1,-20,0,1); GLine.Position=UDim2.new(0,10,0,CHIP_Y+CHIP_H+2)
GLine.BackgroundColor3=C.blue; GLine.BorderSizePixel=0; blueGrad(GLine)

-- ============================================================
--  SIDEBAR + CONTENT
-- ============================================================
local Sidebar = Instance.new("ScrollingFrame",Main)
Sidebar.Size=UDim2.new(0,SIDE_W,1,-BODY_Y-SB_H); Sidebar.Position=UDim2.new(0,0,0,BODY_Y)
Sidebar.BackgroundColor3=C.surface; Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2; Sidebar.ScrollBarImageColor3=C.blueDark
Sidebar.CanvasSize=UDim2.new(0,0,0,0); Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y

local SBLine = Instance.new("Frame",Main)
SBLine.Size=UDim2.new(0,1,1,-BODY_Y-SB_H); SBLine.Position=UDim2.new(0,SIDE_W,0,BODY_Y)
SBLine.BackgroundColor3=C.blueDark; SBLine.BorderSizePixel=0

local ContentBG = Instance.new("Frame",Main)
ContentBG.Size=UDim2.new(1,-SIDE_W-1,1,-BODY_Y-SB_H)
ContentBG.Position=UDim2.new(0,SIDE_W+1,0,BODY_Y)
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
    sf.ScrollBarThickness=3; sf.ScrollBarImageColor3=C.blue
    sf.CanvasSize=UDim2.new(0,0,0,0); sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
    sf.Visible=false; sf.BorderSizePixel=0
    local ul = Instance.new("UIListLayout",sf)
    ul.Padding=UDim.new(0,6); ul.HorizontalAlignment=Enum.HorizontalAlignment.Center
    ul.SortOrder=Enum.SortOrder.LayoutOrder
    local up = Instance.new("UIPadding",sf)
    up.PaddingTop=UDim.new(0,10); up.PaddingBottom=UDim.new(0,10)
    up.PaddingLeft=UDim.new(0,8); up.PaddingRight=UDim.new(0,8)
    pages[id]=sf; return sf
end

local function showPage(id)
    for pid,pg in pairs(pages) do pg.Visible=(pid==id) end
    currentPage=id
    for _,r in pairs(sideBtnRefs) do
        local act=(r.page==id)
        r.bar.BackgroundColor3 = act and C.blue or C.surface
        r.lbl.TextColor3       = act and C.blueLight or C.textDim
        r.frame.BackgroundColor3 = act and C.surface2 or C.surface
    end
end

-- ============================================================
--  COMPONENT BUILDERS
-- ============================================================
local function secLabel(text,parent,lo)
    local wrap = Instance.new("Frame",parent)
    wrap.Size=UDim2.new(1,0,0,22); wrap.BackgroundTransparency=1; wrap.LayoutOrder=lo
    local l = Instance.new("TextLabel",wrap)
    l.Size=UDim2.new(0,0,1,0); l.AutomaticSize=Enum.AutomaticSize.X
    l.BackgroundTransparency=1; l.Text=text; l.Font=Enum.Font.GothamBold
    l.TextSize=9; l.TextColor3=C.textDim; l.TextXAlignment=Enum.TextXAlignment.Left
    local line = Instance.new("Frame",wrap)
    line.Size=UDim2.new(1,-85,0,1); line.Position=UDim2.new(0,81,0.5,0)
    line.BackgroundColor3=C.blueDark; line.BorderSizePixel=0
end

local function makeToggle(icon,name,desc,parent,lo,callback)
    local row = Instance.new("TextButton",parent)
    row.Size=UDim2.new(1,0,0,56); row.BackgroundColor3=C.surface
    row.Text=""; row.AutoButtonColor=false; row.BorderSizePixel=0; row.LayoutOrder=lo
    corner(row,8); stroke(row,C.blueDark,1,0.5)
    mkLbl(row,icon,20,C.blue,false,Enum.TextXAlignment.Left,10,0,32,56)
    local nameLbl=mkLbl(row,name,13,C.text,true,Enum.TextXAlignment.Left,46,9,W-SIDE_W-100,20)
    mkLbl(row,desc,10,C.textDim,false,Enum.TextXAlignment.Left,46,30,W-SIDE_W-100,16)
    local swBg = Instance.new("Frame",row)
    swBg.Size=UDim2.new(0,40,0,22); swBg.Position=UDim2.new(1,-50,0.5,-11)
    swBg.BackgroundColor3=Color3.fromRGB(25, 35, 50); swBg.BorderSizePixel=0
    corner(swBg,11); stroke(swBg,C.blueDark,1,0.4)
    local knob = Instance.new("Frame",swBg)
    knob.Size=UDim2.new(0,16,0,16); knob.Position=UDim2.new(0,2,0.5,-8)
    knob.BackgroundColor3=C.textDim; knob.BorderSizePixel=0; corner(knob,8)
    local isOn = false
    local function setState(on)
        isOn=on
        if on then
            tw(knob,{Position=UDim2.new(0,22,0.5,-8),BackgroundColor3=C.blue},0.2)
            tw(swBg,{BackgroundColor3=Color3.fromRGB(30, 50, 80)},0.2)
            tw(row, {BackgroundColor3=Color3.fromRGB(25, 35, 55)},0.2)
            nameLbl.TextColor3=C.blueLight
            local rs=row:FindFirstChildOfClass("UIStroke"); if rs then rs.Color=C.blue; rs.Transparency=0.2 end
            local ss=swBg:FindFirstChildOfClass("UIStroke"); if ss then ss.Color=C.blue; ss.Transparency=0.2 end
        else
            tw(knob,{Position=UDim2.new(0,2,0.5,-8),BackgroundColor3=C.textDim},0.2)
            tw(swBg,{BackgroundColor3=Color3.fromRGB(25, 35, 50)},0.2)
            tw(row, {BackgroundColor3=C.surface},0.2)
            nameLbl.TextColor3=C.text
            local rs=row:FindFirstChildOfClass("UIStroke"); if rs then rs.Color=C.blueDark; rs.Transparency=0.5 end
            local ss=swBg:FindFirstChildOfClass("UIStroke"); if ss then ss.Color=C.blueDark; ss.Transparency=0.4 end
        end
        if callback then callback(on) end
    end
    row.MouseButton1Click:Connect(function() setState(not isOn) end)
    return row, setState
end

local function makeBtn(icon,name,desc,parent,lo,callback)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,52); btn.BackgroundColor3=C.surface
    btn.Text=""; btn.AutoButtonColor=false; btn.BorderSizePixel=0; btn.LayoutOrder=lo
    corner(btn,8); stroke(btn,C.blueDark,1,0.5)
    mkLbl(btn,icon,20,C.blue,false,Enum.TextXAlignment.Left,10,0,32,52)
    local nameLbl=mkLbl(btn,name,13,C.text,true,Enum.TextXAlignment.Left,46,8,W-SIDE_W-80,20)
    mkLbl(btn,desc,10,C.textDim,false,Enum.TextXAlignment.Left,46,28,W-SIDE_W-80,16)
    mkLbl(btn,"▶",14,C.textDim,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-12,52)
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=Color3.fromRGB(25,35,55)},0.15); nameLbl.TextColor3=C.blueLight
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blue; s.Transparency=0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.15); nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blueDark; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return btn
end

local function makeTpBtn(icon,name,coords,parent,lo,cb)
    local btn = Instance.new("TextButton",parent)
    btn.Size=UDim2.new(1,0,0,52); btn.BackgroundColor3=C.surface
    btn.Text=""; btn.AutoButtonColor=false; btn.BorderSizePixel=0; btn.LayoutOrder=lo
    corner(btn,8); stroke(btn,C.blueDark,1,0.5)
    mkLbl(btn,icon,20,C.blue,false,Enum.TextXAlignment.Left,10,0,32,52)
    local nameLbl=mkLbl(btn,name,13,C.text,true,Enum.TextXAlignment.Left,46,8,W-SIDE_W-80,20)
    mkLbl(btn,coords,10,C.textDim,false,Enum.TextXAlignment.Left,46,29,W-SIDE_W-80,16)
    mkLbl(btn,"›",20,C.textDim,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-12,52)
    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=Color3.fromRGB(25,35,55)},0.15); nameLbl.TextColor3=C.blueLight
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blue; s.Transparency=0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.15); nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blueDark; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function() if cb then cb() end end)
    return btn
end

local function makeSlider(name,minV,maxV,startV,parent,lo,callback)
    local card = Instance.new("Frame",parent)
    card.Size=UDim2.new(1,0,0,62); card.BackgroundColor3=C.surface
    card.BorderSizePixel=0; card.LayoutOrder=lo; corner(card,8); stroke(card,C.blueDark,1,0.5)
    mkLbl(card,name,12,C.text,true,Enum.TextXAlignment.Left,12,6,W-SIDE_W-90,16)
    local valLbl=mkLbl(card,tostring(startV),12,C.blue,true,Enum.TextXAlignment.Right,0,6,W-SIDE_W-16,16)

    -- minus button
    local minusBtn=Instance.new("TextButton",card)
    minusBtn.Size=UDim2.new(0,28,0,28); minusBtn.Position=UDim2.new(0,10,0,28)
    minusBtn.BackgroundColor3=C.surface2; minusBtn.Text="−"
    minusBtn.TextColor3=C.blueLight; minusBtn.Font=Enum.Font.GothamBold
    minusBtn.TextSize=16; minusBtn.BorderSizePixel=0; corner(minusBtn,6)

    -- plus button
    local plusBtn=Instance.new("TextButton",card)
    plusBtn.Size=UDim2.new(0,28,0,28); plusBtn.Position=UDim2.new(1,-38,0,28)
    plusBtn.BackgroundColor3=C.surface2; plusBtn.Text="+"
    plusBtn.TextColor3=C.blueLight; plusBtn.Font=Enum.Font.GothamBold
    plusBtn.TextSize=16; plusBtn.BorderSizePixel=0; corner(plusBtn,6)

    -- track
    local trackBg=Instance.new("Frame",card)
    trackBg.Size=UDim2.new(1,-86,0,4); trackBg.Position=UDim2.new(0,44,0,42)
    trackBg.BackgroundColor3=Color3.fromRGB(30,40,60); trackBg.BorderSizePixel=0; corner(trackBg,2)

    local fill=Instance.new("Frame",trackBg)
    local initPct = (startV-minV)/(maxV-minV)
    fill.Size=UDim2.new(initPct,0,1,0)
    fill.BackgroundColor3=C.blue; fill.BorderSizePixel=0; corner(fill,2)

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

    -- touch drag on track
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
    local CW = W-SIDE_W-16
    local card = Instance.new("Frame",parent)
    card.Size=UDim2.new(1,0,0,44); card.BackgroundColor3=C.surface
    card.BorderSizePixel=0; card.LayoutOrder=lo; card.ClipsDescendants=false
    corner(card,8); stroke(card,C.blueDark,1,0.5)
    mkLbl(card,labelTxt,11,C.textDim,false,Enum.TextXAlignment.Left,12,0,CW-60,44)
    local selLbl=mkLbl(card,"None",12,C.blue,true,Enum.TextXAlignment.Right,0,0,CW-8,44)
    local arrow =mkLbl(card,"▾",14,C.textDim,true,Enum.TextXAlignment.Right,0,0,CW-8,44)
    local listFrame = Instance.new("Frame",ContentBG)
    listFrame.BackgroundColor3=C.surface2; listFrame.BorderSizePixel=0
    listFrame.Visible=false; listFrame.ZIndex=20; corner(listFrame,6); stroke(listFrame,C.blue,1,0.4)
    local lLayout = Instance.new("UIListLayout",listFrame)
    lLayout.Padding=UDim.new(0,1); lLayout.SortOrder=Enum.SortOrder.LayoutOrder
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
            item.Size=UDim2.new(1,0,0,30); item.BackgroundColor3=C.surface
            item.Text=opt; item.TextColor3=C.text; item.Font=Enum.Font.GothamBold
            item.TextSize=11; item.BorderSizePixel=0; item.ZIndex=21; item.LayoutOrder=i
            item.MouseButton1Click:Connect(function()
                selLbl.Text=opt; expanded=false; listFrame.Visible=false; arrow.Text="▾"
                if onSelect then onSelect(opt~="None" and opt or nil) end
            end)
            item.MouseEnter:Connect(function() item.BackgroundColor3=C.surface2 end)
            item.MouseLeave:Connect(function() item.BackgroundColor3=C.surface end)
        end
        listFrame.Size=UDim2.new(0,CW-16,0,math.min(#opts,6)*31)
    end
    local hBtn = Instance.new("TextButton",card)
    hBtn.Size=UDim2.new(1,0,1,0); hBtn.BackgroundTransparency=1
    hBtn.Text=""; hBtn.BorderSizePixel=0; hBtn.ZIndex=10
    hBtn.MouseButton1Click:Connect(function()
        expanded=not expanded
        if expanded then
            buildList()
            local abs  = card.AbsolutePosition
            local cbAb = ContentBG.AbsolutePosition
            listFrame.Position=UDim2.new(0,abs.X-cbAb.X+8,0,abs.Y-cbAb.Y+44)
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
logoCard.Size=UDim2.new(1,0,0,90); logoCard.BackgroundColor3=C.surface
logoCard.BorderSizePixel=0; logoCard.LayoutOrder=1; corner(logoCard,8); stroke(logoCard,C.blue,1,0.55)
local ring = Instance.new("Frame",logoCard)
ring.Size=UDim2.new(0,60,0,60); ring.Position=UDim2.new(0,14,0.5,-30)
ring.BackgroundColor3=Color3.fromRGB(20, 30, 50); ring.BorderSizePixel=0; corner(ring,30); stroke(ring,C.blue,2,0.2)
mkLbl(ring,"⚔️",26,C.blue,false,Enum.TextXAlignment.Center,0,0,60,60)
mkLbl(logoCard,"BLOX PANEL",17,C.blueLight,true,Enum.TextXAlignment.Left,88,10,220,24)
mkLbl(logoCard,"by NanaChan",10,C.textDim,false,Enum.TextXAlignment.Left,88,34,180,16)
mkLbl(logoCard,"[U] Fast Attack  ·  [B] Fly Up  ·  [V] Silent Aim",10,C.blue,false,Enum.TextXAlignment.Left,88,52,260,16)

secLabel("UI SIZE",pgHome,2)
local sizeWrap = Instance.new("Frame",pgHome)
sizeWrap.Size=UDim2.new(1,0,0,44); sizeWrap.BackgroundColor3=C.surface
sizeWrap.BorderSizePixel=0; sizeWrap.LayoutOrder=3; corner(sizeWrap,8); stroke(sizeWrap,C.blueDark,1,0.5)
local szLay = Instance.new("UIListLayout",sizeWrap)
szLay.FillDirection=Enum.FillDirection.Horizontal; szLay.Padding=UDim.new(0,4)
szLay.HorizontalAlignment=Enum.HorizontalAlignment.Center; szLay.VerticalAlignment=Enum.VerticalAlignment.Center
local szPad = Instance.new("UIPadding",sizeWrap)
szPad.PaddingLeft=UDim.new(0,6); szPad.PaddingRight=UDim.new(0,6)
local sizeBtns = {}

local function applySize(idx)
    currentSizeIdx=idx
    local ns=SIZES[idx]
    W=ns.w; H=ns.h
    tw(Main,{Size=UDim2.new(0,ns.w,0,ns.h)},0.3)
    for i,sb in pairs(sizeBtns) do
        sb.BackgroundColor3 = i==idx and C.blueDark or C.surface2
        sb.TextColor3       = i==idx and C.blueLight or C.textDim
    end
end

for i,sz in ipairs(SIZES) do
    local sb = Instance.new("TextButton",sizeWrap)
    sb.Size=UDim2.new(0.24,-5,0,32)
    sb.BackgroundColor3=i==currentSizeIdx and C.blueDark or C.surface2
    sb.TextColor3=i==currentSizeIdx and C.blueLight or C.textDim
    sb.Text=sz.name; sb.Font=Enum.Font.GothamBold; sb.TextSize=11
    sb.BorderSizePixel=0; corner(sb,6)
    sb.MouseButton1Click:Connect(function() applySize(i) end)
    table.insert(sizeBtns,sb)
end

-- ── COMBAT ─────────────────────────────────────────────────
local pgC = newPage("combat")

secLabel("FAST ATTACK",pgC,1)
makeToggle("⚡","Fast Attack  [U]","Range "..FastAttackRange.." studs · Key U",pgC,2,function(on)
    FastAttackEnabled=on
    if on then StartFastAttack() else if FastAttackConn then task.cancel(FastAttackConn) end end
end)
makeSlider("Fast Attack Range",0,12000,12000,pgC,3,function(v) FastAttackRange=v end)

secLabel("SILENT AIM 🎯",pgC,4)
makeToggle("🎯","Silent Aim [V]","Press V to toggle",pgC,5,function(on)
    SilentAimEnabled=on
    if on then StartSilentAim()
    else if SilentAimConn then SilentAimConn:Disconnect() end end
end)
makeToggle("👥","Aim at Players","Target other players",pgC,6,function(on) SilentAimTargetPlayers=on end)
makeToggle("👾","Aim at NPCs","Target enemies",pgC,7,function(on) SilentAimTargetNPCs=on end)
makeSlider("FOV Range",30,500,200,pgC,8,function(v)
    SilentAimFOV=v
    if FOVCircle then FOVCircle.Radius = v end
end)
makeToggle("🔵","Show FOV Circle","Display aim assist field of view",pgC,9,function(on)
    SilentAimShowFOV=on
    if on then CreateFOVCircle() else if FOVCircle then FOVCircle:Remove() end end
end)

secLabel("HITBOX",pgC,10)
makeToggle("📦","Hitbox Visible","Expands hitboxes to 30×30×30",pgC,11,function(on)
    getgenv().HitboxExpander=on
end)

secLabel("EXPLOITS",pgC,12)
makeToggle("🦘","Infinite Jump","Jump without limit in the air",pgC,13,function(on)
    InfJumpEnabled=on
end)
makeToggle("👻","No Clip","Walk through walls",pgC,14,function(on)
    NoClipEnabled=on
end)
makeToggle("🌊","Walk on Water","Walk on water surface",pgC,15,function(on)
    WalkWater=on
end)

secLabel("GOD MODE 🛡️",pgC,16)
local GodModeEnabled = false
local GodModeConns = {}
makeToggle("🛡️","God Mode","Keeps your health at maximum constantly",pgC,17,function(on)
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

secLabel("SHOTHO",pgC,18)
local shothoEnabled = false
local shothoLoopRunning = false

-- Floating button
local shothoGui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
shothoGui.Name = "ShothoFloat"
shothoGui.ResetOnSpawn = false
shothoGui.DisplayOrder = 10
shothoGui.Enabled = false

local shothoBtn = Instance.new("TextButton", shothoGui)
shothoBtn.Size = UDim2.new(0,130,0,44)
shothoBtn.Position = UDim2.new(0.05,0,0.7,0)
shothoBtn.BackgroundColor3 = C.surface
shothoBtn.Text = "💀 SHOTHO OFF"
shothoBtn.TextColor3 = C.textDim
shothoBtn.Font = Enum.Font.GothamBold
shothoBtn.TextSize = 12
shothoBtn.BorderSizePixel = 0
shothoBtn.Active = true
corner(shothoBtn, 8)
stroke(shothoBtn, C.blue, 1, 0.4)

-- Drag
local sthoDragging = false
local sthoDragStart, sthoStartPos
shothoBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        sthoDragging = true
        sthoDragStart = input.Position
        sthoStartPos = shothoBtn.Position
    end
end)
shothoBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or
       input.UserInputType == Enum.UserInputType.MouseButton1 then
        sthoDragging = false
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if sthoDragging and (input.UserInputType == Enum.UserInputType.Touch or
                         input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - sthoDragStart
        shothoBtn.Position = UDim2.new(
            sthoStartPos.X.Scale, sthoStartPos.X.Offset + delta.X,
            sthoStartPos.Y.Scale, sthoStartPos.Y.Offset + delta.Y
        )
    end
end)

local function updateShothoBtn()
    if shothoEnabled then
        shothoBtn.Text = "💀 SHOTHO ON"
        shothoBtn.TextColor3 = C.blueLight
        tw(shothoBtn, {BackgroundColor3 = Color3.fromRGB(25,35,55)}, 0.2)
        local s = shothoBtn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.blue; s.Transparency=0 end
    else
        shothoBtn.Text = "💀 SHOTHO OFF"
        shothoBtn.TextColor3 = C.textDim
        tw(shothoBtn, {BackgroundColor3 = C.surface}, 0.2)
        local s = shothoBtn:FindFirstChildOfClass("UIStroke")
        if s then s.Color=C.blue; s.Transparency=0.4 end
    end
end

local function runShothoLoop()
    if shothoLoopRunning then return end
    shothoLoopRunning = true
    task.spawn(function()
        while shothoEnabled do
            local char = LP.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                hrp.CFrame = CFrame.new(pos.X, pos.Y - 795679695796326795679695796326, pos.Z)
            end
            task.wait(0.01)
        end
        shothoLoopRunning = false
    end)
end

shothoBtn.MouseButton1Click:Connect(function()
    shothoEnabled = not shothoEnabled
    updateShothoBtn()
    if shothoEnabled then runShothoLoop() end
end)

makeToggle("💀","Shotho","Show floating button to toggle on/off",pgC,19,function(on)
    shothoGui.Enabled = on
    if not on then
        shothoEnabled = false
        updateShothoBtn()
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
makeBtn("🛸","PB Fly","Activate flight system",pgLoc,5,function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt "))()
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
makeToggle("🌸","Blue ESP","Show names with distance in blue",pgESP,5,function(on)
    ESPRosaEnabled=on
end)

-- ── CREDITS ────────────────────────────────────────────────────
local pgCredits = newPage("credits")

local creditCard = Instance.new("Frame", pgCredits)
creditCard.Size = UDim2.new(1,0,0,200)
creditCard.BackgroundColor3 = C.surface
creditCard.BorderSizePixel = 0
creditCard.LayoutOrder = 1
corner(creditCard, 12)
stroke(creditCard, C.blue, 1, 0.5)

mkLbl(creditCard, "⭐ CREDITS ⭐", 18, C.blueLight, true, Enum.TextXAlignment.Center, 0, 15, W-SIDE_W-16, 25)
mkLbl(creditCard, "Script by NanaChan", 12, C.text, false, Enum.TextXAlignment.Center, 0, 50, W-SIDE_W-16, 20)
mkLbl(creditCard, "Telegram: t.me/nanaanasyalala", 12, C.text, false, Enum.TextXAlignment.Center, 0, 80, W-SIDE_W-16, 20)

local noteFrame = Instance.new("Frame", pgCredits)
noteFrame.Size = UDim2.new(1,0,0,80)
noteFrame.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
noteFrame.BorderSizePixel = 0
noteFrame.LayoutOrder = 2
corner(noteFrame, 8)
stroke(noteFrame, C.blue, 1, 0.4)

mkLbl(noteFrame, "⚠️ NOTICE ⚠️", 12, C.blueLight, true, Enum.TextXAlignment.Center, 0, 10, W-SIDE_W-16, 20)
mkLbl(noteFrame, "Script ini berbayar. Jika Anda mendapatkannya secara gratis,", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 35, W-SIDE_W-16, 16)
mkLbl(noteFrame, "maka itu adalah versi bocor / ilegal. Support creator!", 10, C.textDim, false, Enum.TextXAlignment.Center, 0, 55, W-SIDE_W-16, 16)

-- ── SETTINGS ────────────────────────────────────────────────────
local pgConfi = newPage("confi")

secLabel("UI COLOR 🎨",pgConfi,1)

local colorOptions = {
    {name="Blue",    blue=Color3.fromRGB(0,180,255),  blueLight=Color3.fromRGB(100,210,255), blueDark=Color3.fromRGB(0,80,140)},
    {name="Gold",    blue=Color3.fromRGB(201,168,76),  blueLight=Color3.fromRGB(240,208,128), blueDark=Color3.fromRGB(80,58,18)},
    {name="Red",     blue=Color3.fromRGB(220,70,70),   blueLight=Color3.fromRGB(255,140,140), blueDark=Color3.fromRGB(100,20,20)},
    {name="Green",   blue=Color3.fromRGB(80,200,100),  blueLight=Color3.fromRGB(150,240,160), blueDark=Color3.fromRGB(20,80,30)},
    {name="Purple",  blue=Color3.fromRGB(160,80,220),  blueLight=Color3.fromRGB(210,150,255), blueDark=Color3.fromRGB(60,20,100)},
}

local previewCard = Instance.new("Frame",pgConfi)
previewCard.Size=UDim2.new(1,0,0,50); previewCard.BackgroundColor3=C.surface
previewCard.BorderSizePixel=0; previewCard.LayoutOrder=2; corner(previewCard,8); stroke(previewCard,C.blue,1,0.4)
local previewLbl = mkLbl(previewCard,"Current color: Blue",13,C.blueLight,true,Enum.TextXAlignment.Center,0,0,W-SIDE_W-16,50)

local colorBtns={}
local function applyColor(idx)
    local col=colorOptions[idx]
    C.blue=col.blue; C.blueLight=col.blueLight; C.blueDark=col.blueDark
    previewLbl.Text="Current color: "..col.name
    previewLbl.TextColor3=col.blueLight
    previewCard:FindFirstChildOfClass("UIStroke").Color=col.blue
    for _,v in pairs(Main:GetDescendants()) do
        if v:IsA("UIStroke") then v.Color=col.blue end
        if v:IsA("Frame") and v.Name=="ActiveBar" then v.BackgroundColor3=col.blue end
    end
    local ms=Main:FindFirstChildOfClass("UIStroke"); if ms then ms.Color=col.blue end
    showPage(currentPage)
    for i,cb in pairs(colorBtns) do
        cb.BackgroundColor3 = i==idx and col.blue or C.surface2
        cb.TextColor3 = i==idx and Color3.new(0,0,0) or C.textDim
    end
end

local colorRow = Instance.new("Frame",pgConfi)
colorRow.Size=UDim2.new(1,0,0,44); colorRow.BackgroundColor3=C.surface
colorRow.BorderSizePixel=0; colorRow.LayoutOrder=3; corner(colorRow,8); stroke(colorRow,C.blueDark,1,0.5)
local crLay=Instance.new("UIListLayout",colorRow)
crLay.FillDirection=Enum.FillDirection.Horizontal; crLay.Padding=UDim.new(0,3)
crLay.HorizontalAlignment=Enum.HorizontalAlignment.Center; crLay.VerticalAlignment=Enum.VerticalAlignment.Center
local crPad=Instance.new("UIPadding",colorRow); crPad.PaddingLeft=UDim.new(0,5); crPad.PaddingRight=UDim.new(0,5)

for i,col in ipairs(colorOptions) do
    local cb=Instance.new("TextButton",colorRow)
    cb.Size=UDim2.new(0,(W-SIDE_W-46)/#colorOptions,0,32)
    cb.BackgroundColor3=i==1 and col.blue or C.surface2
    cb.TextColor3=i==1 and Color3.new(0,0,0) or C.textDim
    cb.Text=col.name; cb.Font=Enum.Font.GothamBold; cb.TextSize=9
    cb.BorderSizePixel=0; corner(cb,6)
    cb.MouseButton1Click:Connect(function() applyColor(i) end)
    table.insert(colorBtns,cb)
end

secLabel("SPEED",pgConfi,4)
makeSlider("Walk Speed",16,250,16,pgConfi,5,function(v)
    SpeedValue=v
    if LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end)
makeToggle("🔧","Enable Custom Speed","Apply custom walk speed",pgConfi,6,function(on)
    SpeedEnabled=on
    if not on and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
end)

-- ── PROFILES ─────────────────────────────────────────────────
local pgPerfiles = newPage("perfiles")

local profileSlot = 1

secLabel("PROFILE SLOT",pgPerfiles,1)

local slotCard = Instance.new("Frame",pgPerfiles)
slotCard.Size=UDim2.new(1,0,0,52); slotCard.BackgroundColor3=C.surface
slotCard.BorderSizePixel=0; slotCard.LayoutOrder=2; corner(slotCard,8); stroke(slotCard,C.blueDark,1,0.5)

mkLbl(slotCard,"Active slot:",12,C.textDim,false,Enum.TextXAlignment.Left,12,0,120,52)
local slotValLbl = mkLbl(slotCard,"1",18,C.blue,true,Enum.TextXAlignment.Center,0,0,W-SIDE_W-16,52)

local slotBtnRow = Instance.new("Frame",slotCard)
slotBtnRow.Size=UDim2.new(0,170,0,36); slotBtnRow.Position=UDim2.new(1,-178,0.5,-18)
slotBtnRow.BackgroundTransparency=1; slotBtnRow.BorderSizePixel=0

local slotLayout=Instance.new("UIListLayout",slotBtnRow)
slotLayout.FillDirection=Enum.FillDirection.Horizontal
slotLayout.Padding=UDim.new(0,4)
slotLayout.HorizontalAlignment=Enum.HorizontalAlignment.Right
slotLayout.VerticalAlignment=Enum.VerticalAlignment.Center

for s=1,6 do
    local sb=Instance.new("TextButton",slotBtnRow)
    sb.Size=UDim2.new(0,24,0,24)
    sb.BackgroundColor3=s==1 and C.blue or C.surface2
    sb.TextColor3=s==1 and Color3.new(0,0,0) or C.textDim
    sb.Text=tostring(s); sb.Font=Enum.Font.GothamBold; sb.TextSize=11
    sb.BorderSizePixel=0; corner(sb,5)
    sb.MouseButton1Click:Connect(function()
        profileSlot=s
        slotValLbl.Text=tostring(s)
        for _,child in pairs(slotBtnRow:GetChildren()) do
            if child:IsA("TextButton") then
                local isActive = (tonumber(child.Text)==s)
                child.BackgroundColor3 = isActive and C.blue or C.surface2
                child.TextColor3 = isActive and Color3.new(0,0,0) or C.textDim
            end
        end
    end)
end

secLabel("TITLES",pgPerfiles,3)

local titles = {
    {name="Pirate King",         code=786, icon="👑"},
    {name="Pink Portal",         code=458, icon="🌸"},
    {name="YouTuber",            code=680, icon="🎬"},
    {name="Krazy Editor",        code=693, icon="✂️"},
    {name="Cotton Candy Pain",   code=478, icon="🍬"},
    {name="Red Legion",          code=695, icon="🔴"},
    {name="Equal to the Heaven", code=737, icon="⭐"},
}

for i,title in ipairs(titles) do
    local btn=Instance.new("TextButton",pgPerfiles)
    btn.Size=UDim2.new(1,0,0,52); btn.BackgroundColor3=C.surface
    btn.Text=""; btn.AutoButtonColor=false; btn.BorderSizePixel=0
    btn.LayoutOrder=i+3; corner(btn,8); stroke(btn,C.blueDark,1,0.5)

    mkLbl(btn,title.icon,22,C.blue,false,Enum.TextXAlignment.Left,10,0,36,52)
    local nameLbl=mkLbl(btn,title.name,13,C.text,true,Enum.TextXAlignment.Left,46,8,W-SIDE_W-100,20)
    mkLbl(btn,"Code: "..title.code,10,C.textDim,false,Enum.TextXAlignment.Left,46,29,W-SIDE_W-100,16)
    mkLbl(btn,"▶",14,C.textDim,true,Enum.TextXAlignment.Right,0,0,W-SIDE_W-12,52)

    btn.MouseEnter:Connect(function()
        tw(btn,{BackgroundColor3=Color3.fromRGB(25,35,55)},0.15)
        nameLbl.TextColor3=C.blueLight
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blue; s.Transparency=0.2 end
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,{BackgroundColor3=C.surface},0.15)
        nameLbl.TextColor3=C.text
        local s=btn:FindFirstChildOfClass("UIStroke"); if s then s.Color=C.blueDark; s.Transparency=0.5 end
    end)
    btn.MouseButton1Click:Connect(function()
        pcall(function()
            game:GetService("ReplicatedStorage")
                :WaitForChild("Remotes")
                :WaitForChild("UpdatePlayerProfileValue")
                :InvokeServer("Showcase", profileSlot, title.code)
        end)
    end)
end

-- ============================================================
--  SIDEBAR
-- ============================================================
local sideY = 6
local function addSideSection(txt)
    local l = Instance.new("TextLabel",Sidebar)
    l.Size=UDim2.new(1,-10,0,18); l.Position=UDim2.new(0,10,0,sideY)
    l.BackgroundTransparency=1; l.Text=txt; l.Font=Enum.Font.GothamBold
    l.TextSize=8; l.TextColor3=C.textDim; l.TextXAlignment=Enum.TextXAlignment.Left
    sideY=sideY+20
end
local function addSideBtn(icon,txt,pageId)
    local frame = Instance.new("TextButton",Sidebar)
    frame.Size=UDim2.new(1,0,0,34); frame.Position=UDim2.new(0,0,0,sideY)
    frame.BackgroundColor3=C.surface; frame.Text=""
    frame.AutoButtonColor=false; frame.BorderSizePixel=0
    local bar = Instance.new("Frame",frame)
    bar.Size=UDim2.new(0,3,0.6,0); bar.Position=UDim2.new(0,0,0.2,0)
    bar.BackgroundColor3=C.surface; bar.BorderSizePixel=0; corner(bar,2)
    mkLbl(frame,icon,14,C.blue,false,Enum.TextXAlignment.Left,10,0,24,34)
    local nameLbl=mkLbl(frame,txt,11,C.textDim,true,Enum.TextXAlignment.Left,36,0,SIDE_W-42,34)
    frame.MouseButton1Click:Connect(function() showPage(pageId) end)
    frame.MouseEnter:Connect(function()
        if currentPage~=pageId then tw(frame,{BackgroundColor3=C.surface2},0.15) end
    end)
    frame.MouseLeave:Connect(function()
        if currentPage~=pageId then tw(frame,{BackgroundColor3=C.surface},0.15) end
    end)
    table.insert(sideBtnRefs,{frame=frame,bar=bar,lbl=nameLbl,page=pageId})
    sideY=sideY+34
end

addSideSection("HOME")
addSideBtn("🏠","Home","home")
addSideSection("COMBAT")
addSideBtn("⚔️","Combat","combat")
addSideSection("TP & PLAYERS")
addSideBtn("🎯","TP Players","tp")
addSideSection("PLACES")
addSideBtn("📍","Locations","locations")
addSideSection("OTHER FUNC.")
addSideBtn("🍭","Other Func.","azucar")
addSideSection("VISION")
addSideBtn("👁️","ESP","esp")
addSideSection("CREDITS")
addSideBtn("💎","Credits","credits")
addSideSection("PROFILES")
addSideBtn("👑","Profiles","perfiles")
addSideSection("SETTINGS")
addSideBtn("⚙️","Settings","confi")

-- ============================================================
--  STATUS BAR
-- ============================================================
local SB = Instance.new("Frame",Main)
SB.Size=UDim2.new(1,0,0,SB_H); SB.Position=UDim2.new(0,0,1,-SB_H)
SB.BackgroundColor3=C.surface; SB.BorderSizePixel=0
local sbTop = Instance.new("Frame",SB)
sbTop.Size=UDim2.new(1,0,0,1); sbTop.BackgroundColor3=C.blueDark; sbTop.BorderSizePixel=0
local dot = Instance.new("Frame",SB)
dot.Size=UDim2.new(0,6,0,6); dot.Position=UDim2.new(0,12,0.5,-3)
dot.BackgroundColor3=C.blue; dot.BorderSizePixel=0; corner(dot,3)
mkLbl(SB,"Ready",10,C.textDim,false,Enum.TextXAlignment.Left,24,0,50,SB_H)
mkLbl(SB,"|",10,C.blueDark,false,Enum.TextXAlignment.Left,72,0,10,SB_H)
local sbSpeed=mkLbl(SB,"Speed: 16",10,C.textDim,true,Enum.TextXAlignment.Left,86,0,90,SB_H)
mkLbl(SB,"NanaChan",10,C.textDim,false,Enum.TextXAlignment.Right,0,0,W-10,SB_H)

RunService.Heartbeat:Connect(function()
    sbSpeed.Text="Speed: "..tostring(SpeedValue)
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
    end)
end

local function doReopen()
    minimized = false
    ReopenBtn.Visible = false
    Main.Visible = true
    tw(Main, {Size=UDim2.new(0,W,0,H)}, 0.3)
end

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
    if FOVCircle then FOVCircle:Remove() end
    local wp=workspace:FindFirstChild("RivalsWaterSolid"); if wp then wp:Destroy() end
    tw(Main,{Size=UDim2.new(0,W,0,0)},0.25)
    task.wait(0.3); ScreenGui:Destroy()
end)

-- ============================================================
--  INIT
-- ============================================================
showPage("home")
