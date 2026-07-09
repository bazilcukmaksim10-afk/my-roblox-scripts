-- Kill Hub MM2 с вкладками и новыми функциями
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleHint = Instance.new("TextLabel")

-- Панели интерфейса
local LeftPanel = Instance.new("Frame")  -- Панель для вкладок слева
local MainPanel = Instance.new("Frame")  -- Правая панель для контента

-- Кнопки переключения вкладок
local TabMainBtn = Instance.new("TextButton")
local TabMM2Btn = Instance.new("TextButton")
local TabSettingsBtn = Instance.new("TextButton")

-- Контейнеры для содержимого вкладок
local TabMainContent = Instance.new("Frame")
local TabMM2Content = Instance.new("Frame")
local TabSettingsContent = Instance.new("Frame")

-- Элементы вкладки "Основное"
local FlyBtn = Instance.new("TextButton")
local NoclipBtn = Instance.new("TextButton")
local EspBtn = Instance.new("TextButton")

-- Элементы вкладки "MM2 функции"
local CoinBtn = Instance.new("TextButton")
local TeleportSheriffBtn = Instance.new("TextButton")
local TeleportLobbyBtn = Instance.new("TextButton")
local FlingMurderBtn = Instance.new("TextButton")
local FlingSheriffBtn = Instance.new("TextButton")

-- Элементы вкладки "Настройки"
local SpeedTitle = Instance.new("TextLabel")
local SpeedPlusBtn = Instance.new("TextButton")
local SpeedMinusBtn = Instance.new("TextButton")
local SpeedValueLabel = Instance.new("TextLabel")

-- Кнопка скрыть/показать
local HideBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")

-- Главное окно (на весь экран)
Frame.Name = "KillHubTabs"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Frame.BorderSizePixel = 3
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0.15, 0, 1, 0) -- Для анимации появления снизу
Frame.Size = UDim2.new(0.7, 0, 0.8, 0)
Frame.Active = true
Frame.Draggable = true

-- Заголовок
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Kill Hub | MM2 Edition"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 24
Title.Font = Enum.Font.SourceSansBold
Title.TextTransparency = 1

-- Подсказка
ToggleHint.Parent = Frame
ToggleHint.Size = UDim2.new(1, 0, 0, 20)
ToggleHint.Position = UDim2.new(0, 0, 0, 42)
ToggleHint.BackgroundTransparency = 1
ToggleHint.Text = "[ Нажми 'K' для Скрытия ]"
ToggleHint.TextColor3 = Color3.fromRGB(130, 130, 130)
ToggleHint.TextSize = 14
ToggleHint.Font = Enum.Font.SourceSansItalic
ToggleHint.TextTransparency = 1

-- ЛЕВАЯ ПАНЕЛЬ (ВКЛАДКИ)
LeftPanel.Parent = Frame
LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
LeftPanel.BorderSizePixel = 0
LeftPanel.Position = UDim2.new(0, 0, 0, 70)
LeftPanel.Size = UDim2.new(0.25, 0, 1, -70)

-- ПРАВАЯ ПАНЕЛЬ (КОНТЕНТ)
MainPanel.Parent = Frame
MainPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainPanel.BorderSizePixel = 0
MainPanel.Position = UDim2.new(0.25, 0, 0, 70)
MainPanel.Size = UDim2.new(0.75, 0, 1, -70)

-- Функция для создания кнопок вкладок слева
local function createTabButton(btn, text, order)
    btn.Parent = LeftPanel
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, (order - 1) * 55)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.BackgroundTransparency = 1
    btn.TextTransparency = 1
end

createTabButton(TabMainBtn, "Основное", 1)
createTabButton(TabMM2Btn, "MM2 Функции", 2)
createTabButton(TabSettingsBtn, "Настройки", 3)

-- Функция настройки контейнеров контента
local function setupContentFrame(f)
    f.Parent = MainPanel
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 1
    f.Visible = false
end

setupContentFrame(TabMainContent)
setupContentFrame(TabMM2Content)
setupContentFrame(TabSettingsContent)

-- Функция настройки обычных кнопок хаба
local function setupGridButton(btn, text, posX, posY, parent)
    btn.Parent = parent
    btn.Size = UDim2.new(0.43, 0, 0, 50)
    btn.Position = UDim2.new(posX, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.SourceSansBold
    btn.BackgroundTransparency = 1
    btn.TextTransparency = 1
end

-- Наполнение вкладки "Основное" (Сетка в 2 колонки: posX может быть 0.05 или 0.52)
setupGridButton(FlyBtn, "Fly: OFF", 0.05, 20, TabMainContent)
setupGridButton(NoclipBtn, "Noclip: OFF", 0.52, 20, TabMainContent)
setupGridButton(EspBtn, "MM2 ESP: OFF", 0.05, 85, TabMainContent)

-- Наполнение вкладки "MM2 функции"
setupGridButton(CoinBtn, "Coins Farm: OFF", 0.05, 20, TabMM2Content)
setupGridButton(TeleportSheriffBtn, "TP to Gun/Sheriff", 0.52, 20, TabMM2Content)
setupGridButton(TeleportLobbyBtn, "TP to Lobby", 0.05, 85, TabMM2Content)
setupGridButton(FlingMurderBtn, "Fling Murderer", 0.05, 160, TabMM2Content)
setupGridButton(FlingSheriffBtn, "Fling Sheriff", 0.52, 160, TabMM2Content)
FlingMurderBtn.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
FlingSheriffBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 100)

-- Наполнение вкладки "Настройки" (Управление скоростью бега)
SpeedTitle.Parent = TabSettingsContent
SpeedTitle.Size = UDim2.new(0.9, 0, 0, 30)
SpeedTitle.Position = UDim2.new(0.05, 0, 0, 20)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "Настройка WalkSpeed (Скорость бега)"
SpeedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTitle.TextSize = 18
SpeedTitle.Font = Enum.Font.SourceSansBold
SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left

SpeedMinusBtn.Parent = TabSettingsContent
SpeedMinusBtn.Size = UDim2.new(0, 50, 0, 50)
SpeedMinusBtn.Position = UDim2.new(0.05, 0, 0, 60)
SpeedMinusBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SpeedMinusBtn.Text = "-"
SpeedMinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedMinusBtn.TextSize = 24
SpeedMinusBtn.Font = Enum.Font.SourceSansBold

SpeedValueLabel.Parent = TabSettingsContent
SpeedValueLabel.Size = UDim2.new(0, 100, 0, 50)
SpeedValueLabel.Position = UDim2.new(0.2, 0, 0, 60)
SpeedValueLabel.BackgroundTransparency = 1
SpeedValueLabel.Text = "16"
SpeedValueLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
SpeedValueLabel.TextSize = 22
SpeedValueLabel.Font = Enum.Font.SourceSansBold

SpeedPlusBtn.Parent = TabSettingsContent
SpeedPlusBtn.Size = UDim2.new(0, 50, 0, 50)
SpeedPlusBtn.Position = UDim2.new(0.45, 0, 0, 60)
SpeedPlusBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SpeedPlusBtn.Text = "+"
SpeedPlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedPlusBtn.TextSize = 24
SpeedPlusBtn.Font = Enum.Font.SourceSansBold

-- Кнопка Скрыть/Показать на экране
HideBtn.Parent = ScreenGui
HideBtn.Position = UDim2.new(0.85, 0, -0.1, 0)
HideBtn.Size = UDim2.new(0, 100, 0, 40)
HideBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
HideBtn.Text = "Show/Hide"
HideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HideBtn.TextSize = 16
HideBtn.Font = Enum.Font.SourceSansBold
HideBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)

-- ==================== ЛОГИКА ВКЛАДОК ====================
local function switchTab(activeFrame, activeBtn)
    TabMainContent.Visible = false
    TabMM2Content.Visible = false
    TabSettingsContent.Visible = false
    
    TabMainBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TabMM2Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TabSettingsBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    
    activeFrame.Visible = true
    activeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Активная вкладка подсвечена красным
end

TabMainBtn.MouseButton1Click:Connect(function() switchTab(TabMainContent, TabMainBtn) end)
TabMM2Btn.MouseButton1Click:Connect(function() switchTab(TabMM2Content, TabMM2Btn) end)
TabSettingsBtn.MouseButton1Click:Connect(function() switchTab(TabSettingsContent, TabSettingsBtn) end)

switchTab(TabMainContent, TabMainBtn) -- Открыть первую вкладку по умолчанию

-- ==================== АНИМАЦИЯ ПОЯВЛЕНИЯ ====================
local TweenService = game:GetService("TweenService")
local animInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

TweenService:Create(Frame, animInfo, {Position = UDim2.new(0.15, 0, 0.1, 0), BackgroundTransparency = 0}):Play()
TweenService:Create(HideBtn, animInfo, {Position = UDim2.new(0.85, 0, 0.02, 0)}):Play()

task.spawn(function()
    task.wait(0.2)
    TweenService:Create(Title, animInfo, {TextTransparency = 0}):Play()
    TweenService:Create(ToggleHint, animInfo, {TextTransparency = 0}):Play()
    
    local leftElements = {TabMainBtn, TabMM2Btn, TabSettingsBtn}
    for _, elem in pairs(leftElements) do
        TweenService:Create(elem, animInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    end
    
    local gridElements = {FlyBtn, NoclipBtn, EspBtn, CoinBtn, TeleportSheriffBtn, TeleportLobbyBtn, FlingMurderBtn, FlingSheriffBtn}
    for _, elem in pairs(gridElements) do
        TweenService:Create(elem, animInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    end
end)

-- ==================== СИСТЕМА СКРЫТИЯ МЕНЮ ====================
local menuVisible = true
local function toggleMenu()
    menuVisible = not menuVisible
    if menuVisible then
        Frame.Visible = true
        TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.15, 0, 0.1, 0)}):Play()
    else
        local hideTween = TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.15, 0, 1.1, 0)})
        hideTween:Play()
        hideTween.Completed:Connect(function()
            if not menuVisible then Frame.Visible = false end
        end)
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then toggleMenu() end
end)
HideBtn.MouseButton1Click:Connect(toggleMenu)

-- ==================== ЛОГИКА ФУНКЦИЙ ====================
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- Функция НАСТРОЙКИ СКОРОСТИ
local currentSpeed = 16
local function updateSpeed(value)
    currentSpeed = math.clamp(currentSpeed + value, 16, 250)
    SpeedValueLabel.Text = tostring(currentSpeed)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = currentSpeed
    end
end
SpeedPlusBtn.MouseButton1Click:Connect(function() updateSpeed(10) end)
SpeedMinusBtn.MouseButton1Click:Connect(function() updateSpeed(-10) end)

player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = currentSpeed
end)

-- 1. Полет (Fly)
local flying = false
local speed = 50
local keys = {w = false, s = false, a = false, d = false, space = false, lshift = false}
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        FlyBtn.Text = "Fly: ON"
        task.spawn(function()
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local bg = Instance.new("BodyGyro", hrp)
            bg.maxTorque = Vector3.new(4e4, 4e4, 4e4)
            bg.cframe = hrp.CFrame
            local bv = Instance.new("BodyVelocity", hrp)
            bv.maxForce = Vector3.new(4e4, 4e4, 4e4)
            local uis = game:GetService("UserInputService")
            
            local c1 = uis.InputBegan:Connect(function(i, g)
                if g then return end
                if i.KeyCode == Enum.KeyCode.W then keys.w = true
                elseif i.KeyCode == Enum.KeyCode.S then keys.s = true
                elseif i.KeyCode == Enum.KeyCode.A then keys.a = true
                elseif i.KeyCode == Enum.KeyCode.D then keys.d = true
                elseif i.KeyCode == Enum.KeyCode.Space then keys.space = true
                elseif i.KeyCode == Enum.KeyCode.LeftShift then keys.lshift = true end
            end)
            local c2 = uis.InputEnded:Connect(function(i)
                if i.KeyCode == Enum.KeyCode.W then keys.w = false
                elseif i.KeyCode == Enum.KeyCode.S then keys.s = false
                elseif i.KeyCode == Enum.KeyCode.A then keys.a = false
                elseif i.KeyCode == Enum.KeyCode.D then keys.d = false
                elseif i.KeyCode == Enum.KeyCode.Space then keys.space = false
                elseif i.KeyCode == Enum.KeyCode.LeftShift then keys.lshift = false end
            end)
            
            while flying and player.Character and player.Character:FindFirstChild("HumanoidRootPart") do
                local camera = workspace.CurrentCamera
                local moveDir = Vector3.new(0,0,0)
                if keys.w then moveDir = moveDir + camera.CFrame.LookVector end
                if keys.s then moveDir = moveDir - camera.CFrame.LookVector end
                if keys.a then moveDir = moveDir - camera.CFrame.RightVector end
                if keys.d then moveDir = moveDir + camera.CFrame.RightVector end
                if keys.space then moveDir = moveDir + Vector3.new(0, 1, 0) end
                if keys.lshift then moveDir = moveDir - Vector3.new(0, 1, 0) end
                bv.velocity = moveDir.Unit * speed
                if moveDir == Vector3.new(0,0,0) then bv.velocity = Vector3.new(0,0,0) end
                bg.cframe = camera.CFrame
                task.wait()
            end
            bg:Destroy() bv:Destroy() c1:Disconnect() c2:Disconnect()
        end)
    else
        FlyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        FlyBtn.Text = "Fly: OFF"
    end
end)

-- 2. Прохождение сквозь стены (Noclip)
local noclip = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    NoclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 45)
    NoclipBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF"
end)
runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- 3. MM2 ESP
local espEnabled = false
local espHighlights = {}
local function updateESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if espEnabled then
                local hl = espHighlights[p] or Instance.new("Highlight", p.Character)
                espHighlights[p] = hl
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                
                if p.Backpack:FindFirstChild("Knife") or (p.Character and p.Character:FindFirstChild("Knife")) then
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                elseif p.Backpack:FindFirstChild("Gun") or (p.Character and p.Character:FindFirstChild("Gun")) then
                    hl.FillColor = Color3.fromRGB(0, 0, 255)
                else
                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                end
            else
                if espHighlights[p] then espHighlights[p]:Destroy() espHighlights[p] = nil end
            end
        end
    end
end

EspBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 45)
    EspBtn.Text = espEnabled and "MM2 ESP: ON" or "MM2 ESP: OFF"
    if not espEnabled then
        for _, h in pairs(espHighlights) do if h then h:Destroy() end end
        espHighlights = {}
    end
end)
task.spawn(function()
    while true do
        if espEnabled then updateESP() end
        task.wait(1)
    end
end)

-- 4. Автосбор монет
local autoCoin = false
CoinBtn.MouseButton1Click:Connect(function()
    autoCoin = not autoCoin
    CoinBtn.BackgroundColor3 = autoCoin and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 45)
    CoinBtn.Text = autoCoin and "Coins Farm: ON" or "Coins Farm: OFF"
end)
task.spawn(function()
    while true do
        if autoCoin and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local container = workspace:FindFirstChild("Normal") or workspace:FindFirstChild("CoinContainer")
            if container then
                for _, obj in pairs(container:GetDescendants()) do
                    if obj.Name == "Coin_Cent" or obj.Name == "Coin" or obj:IsA("TouchTransmitter") then
                        local coinPart = obj:IsA("TouchTransmitter") and obj.Parent or obj
                        if coinPart:IsA("BasePart") then
                            player.Character.HumanoidRootPart.CFrame = coinPart.CFrame
                            task.wait(0.2)
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- 5. Телепорт к пистолету / Шерифу
TeleportSheriffBtn.MouseButton1Click:Connect(function()
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local droppedGun = workspace:FindFirstChild("GunDrop")
    if droppedGun and droppedGun:IsA("BasePart") then
        hrp.CFrame = droppedGun.CFrame + Vector3.new(0, 2, 0)
        return
    end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Backpack:FindFirstChild("Gun") or (p.Character and p.Character:FindFirstChild("Gun")) then
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                hrp.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                break
            end
        end
    end
end)

-- 6. Телепорт в лобби
TeleportLobbyBtn.MouseButton1Click:Connect(function()
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local lobbyWorkspace = workspace:FindFirstChild("Lobby")
    if hrp and lobbyWorkspace then
        local spawnPart = lobbyWorkspace:FindFirstChildWhichIsA("BasePart", true)
        if spawnPart then
            hrp.CFrame = spawnPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
end)

-- ВЫКИДЫВАНИЕ (ФЛИНГ) ЗА КАРТУ
local function flingTarget(targetRole)
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local isMurder = p.Backpack:FindFirstChild("Knife") or p.Character:FindFirstChild("Knife")
            local isSheriff = p.Backpack:FindFirstChild("Gun") or p.Character:FindFirstChild("Gun")
            
            if (targetRole == "Murderer" and isMurder) or (targetRole == "Sheriff" and isSheriff) then
                -- Безопасный и мощный импульс: телепортируем цель под карту в бездну
                p.Character.HumanoidRootPart.CFrame = CFrame.new(0, -500, 0)
            end
        end
    end
end

FlingMurderBtn.MouseButton1Click:Connect(function() flingTarget("Murderer") end)
FlingSheriffBtn.MouseButton1Click:Connect(function() flingTarget("Sheriff") end)
