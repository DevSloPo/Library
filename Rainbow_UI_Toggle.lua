
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- 创建主界面
local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0

-- 彩虹背景
local function rainbowEffect(object)
    local hue = 0
    RunService.RenderStepped:Connect(function()
        hue = (hue + 1) % 360
        object.BackgroundColor3 = Color3.fromHSV(hue / 360, 1, 1)
    end)
end
rainbowEffect(MainFrame)

-- Toggle 按钮
local Toggle = Instance.new("TextButton", MainFrame)
Toggle.Size = UDim2.new(0, 100, 0, 30)
Toggle.Position = UDim2.new(0.5, -50, 0, 10)
Toggle.Text = "Toggle"
Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Toggle.TextColor3 = Color3.new(1, 1, 1)

-- 滑块
local Slider = Instance.new("Frame", MainFrame)
Slider.Size = UDim2.new(0, 200, 0, 10)
Slider.Position = UDim2.new(0.5, -100, 0, 60)
Slider.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- 绿色

-- Toggle 控制效果
local toggled = false
local rainbowConnection

Toggle.MouseButton1Click:Connect(function()
    toggled = not toggled
    if toggled then
        -- 启用彩虹颜色并缩小 UI
        if rainbowConnection then rainbowConnection:Disconnect() end
        rainbowConnection = RunService.RenderStepped:Connect(function()
            local hue = tick() % 5 / 5
            MainFrame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            Toggle.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        end)
        -- 缩小 UI
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 200, 0, 130)}):Play()
    else
        -- 恢复原状
        if rainbowConnection then rainbowConnection:Disconnect() end
        MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 300, 0, 200)}):Play()
    end
end)
