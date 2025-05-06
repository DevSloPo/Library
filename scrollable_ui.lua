
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(0, 400, 0, 300) -- 可视区域大小
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 800) -- 内容总高度
ScrollingFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("YourUIName") -- 替换为你的UI路径

-- 示例：添加一个按钮到滚动区域中
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 380, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "按钮1"
button.Parent = ScrollingFrame
