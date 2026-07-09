-- Индикатор работы скрипта (Мини-панель)
local IndicatorGui = Instance.new("ScreenGui")
local IndicatorFrame = Instance.new("Frame")
local IndicatorDot = Instance.new("Frame")
local IndicatorText = Instance.new("TextLabel")

IndicatorGui.Parent = game:GetService("CoreGui")
IndicatorGui.Name = "ScriptIndicator"

IndicatorFrame.Parent = IndicatorGui
IndicatorFrame.BackgroundColor3 = Color3.fromRGB(30, 25, 35)
IndicatorFrame.BorderSizePixel = 1
IndicatorFrame.BorderColor3 = Color3.fromRGB(180, 50, 255)
IndicatorFrame.Position = UDim2.new(0, 10, 0, 10)
IndicatorFrame.Size = UDim2.new(0, 130, 0, 30)

IndicatorDot.Parent = IndicatorFrame
IndicatorDot.BackgroundColor3 = Color3.fromRGB(0, 255, 100) -- Зеленый цвет = работает
IndicatorDot.BorderSizePixel = 0
IndicatorDot.Position = UDim2.new(0, 8, 0, 9)
IndicatorDot.Size = UDim2.new(0, 12, 0, 12)

-- Скругление для точки
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = IndicatorDot

IndicatorText.Parent = IndicatorFrame
IndicatorText.BackgroundTransparency = 1
IndicatorText.Position = UDim2.new(0, 26, 0, 0)
IndicatorText.Size = UDim2.new(1, -26, 1, 0)
IndicatorText.Text = "Hub Active"
IndicatorText.TextColor3 = Color3.fromRGB(255, 255, 255)
IndicatorText.TextSize = 14
IndicatorText.Font = Enum.Font.SourceSansBold
IndicatorText.TextXAlignment = Enum.TextXAlignment.Left

-- Логика переворота и отслеживания предметов
local players = game:GetService("Players")
local player = players.LocalPlayer

-- Функция создания красивого уведомления на экране
local function showNotification(brainrotName)
    local NotificationGui = Instance.new("ScreenGui")
    local NotificationLabel = Instance.new("TextLabel")
    
    NotificationGui.Parent = game:GetService("CoreGui")
    
    NotificationLabel.Parent = NotificationGui
    NotificationLabel.Size = UDim2.new(0, 300, 0, 50)
    NotificationLabel.Position = UDim2.new(0.5, -150, 0.3, 0)
    NotificationLabel.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
    NotificationLabel.BorderSizePixel = 2
    NotificationLabel.BorderColor3 = Color3.fromRGB(180, 50, 255)
    NotificationLabel.Text = "В руках: " .. tostring(brainrotName)
    NotificationLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    NotificationLabel.TextSize = 18
    NotificationLabel.Font = Enum.Font.SourceSansBold
    
    -- Плавное исчезновение через 3 секунды
    task.wait(3)
    game:GetService("TweenService"):Create(NotificationLabel, TweenInfo.new(0.5), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
    task.wait(0.5)
    NotificationGui:Destroy()
end

-- Функция переворота персонажа верх ногами
local function flipCharacter()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(180))
    end
end

-- Отслеживание экипировки предмета в руки
player.CharacterAppearanceLoaded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        -- Если это инструмент (предмет берется в руки)
        if child:IsA("Tool") then
            flipCharacter()
            task.spawn(function()
                showNotification(child.Name)
            end)
        end
    end)
end)

-- Проверка на случай если персонаж уже загружен
if player.Character then
    player.Character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            flipCharacter()
            task.spawn(function()
                showNotification(child.Name)
            end)
        end
    end)
end
