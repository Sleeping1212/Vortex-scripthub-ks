local keyRequired = "vortex_premium_gui911"  -- This is your predefined key
local enteredKey = ""
local keySystemVisible = true

-- Create the UI elements for entering the key
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local textBox = Instance.new("TextBox")
textBox.Parent = screenGui
textBox.Position = UDim2.new(0.5, -100, 0.5, -50)
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.PlaceholderText = "Enter your key here"

local submitButton = Instance.new("TextButton")
submitButton.Parent = screenGui
submitButton.Position = UDim2.new(0.5, -50, 0.5, 20)
submitButton.Size = UDim2.new(0, 100, 0, 40)
submitButton.Text = "Submit"

-- Create the Help Key button with rainbow gradient
local helpButton = Instance.new("TextButton")
helpButton.Parent = screenGui
helpButton.Position = UDim2.new(0.5, -50, 0.5, 80)
helpButton.Size = UDim2.new(0, 100, 0, 40)
helpButton.Text = "Help Key"
helpButton.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text

-- Function to create a rainbow effect on the Help Key button
local function applyRainbowEffect(button)
    local tweenService = game:GetService("TweenService")
    local colors = { 
        Color3.fromRGB(255, 0, 0),    -- Red
        Color3.fromRGB(255, 127, 0),  -- Orange
        Color3.fromRGB(255, 255, 0),  -- Yellow
        Color3.fromRGB(0, 255, 0),    -- Green
        Color3.fromRGB(0, 0, 255),    -- Blue
        Color3.fromRGB(75, 0, 130),   -- Indigo
        Color3.fromRGB(148, 0, 211)   -- Violet
    }
    
    local currentIndex = 1
    
    while true do
        local colorGoal = {BackgroundColor3 = colors[currentIndex]}
        local tween = tweenService:Create(button, TweenInfo.new(0.5), colorGoal)
        tween:Play()
        
        tween.Completed:Wait()  -- Wait for tween completion before switching colors
        currentIndex = currentIndex % #colors + 1
    end
end

-- Start applying the rainbow effect to the Help Key button
spawn(function() applyRainbowEffect(helpButton) end)

-- Function to handle the key validation and script loading
submitButton.MouseButton1Click:Connect(function()
    enteredKey = textBox.Text
    if enteredKey == keyRequired then
        -- If key is valid, hide the key system and load the script
        screenGui:Destroy()
        loadstring(game:HttpGet('https://pastefy.app/3dRYEpTa/raw'))()
    else
        -- If the key is incorrect, display a message
        local errorMessage = Instance.new("TextLabel")
        errorMessage.Parent = screenGui
        errorMessage.Position = UDim2.new(0.5, -100, 0.5, 70)
        errorMessage.Size = UDim2.new(0, 200, 0, 40)
        errorMessage.Text = "Invalid key! Please try again."
        errorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
        errorMessage.BackgroundTransparency = 1
    end
end)

-- Help button to display information on how to get the key
helpButton.MouseButton1Click:Connect(function()
    local helpMessage = Instance.new("TextLabel")
    helpMessage.Parent = screenGui
    helpMessage.Position = UDim2.new(0.5, -150, 0.5, 130)
    helpMessage.Size = UDim2.new(0, 300, 0, 40)
    helpMessage.Text = "Please DM Fortnite_proxd on Discord to get the key 🗝 🙂"
    helpMessage.TextColor3 = Color3.fromRGB(0, 170, 0)
    helpMessage.BackgroundTransparency = 1
end)
