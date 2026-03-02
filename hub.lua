local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local KEY = "duckHub182"

--------------------------------------------------
-- PLACE SCRIPT LIST
--------------------------------------------------

local PlaceScripts = {
    [11156779721] = "https://raw.githubusercontent.com/KGuestCheatsJ2/Sc/refs/heads/main/TSG",
    [130594398886540] = "https://raw.githubusercontent.com/gumanba/Scripts/main/GardenHorizons",
    [70654235200182] = "https://raw.githubusercontent.com/iwasonceagod/SandManScripts/main/BaddieJumping",
    [95828142573081] = "https://raw.githubusercontent.com/iwasonceagod/SandManScripts/main/BetterAnimeCharacter"
}

--------------------------------------------------
-- GUI CREATE
--------------------------------------------------

local screen = Instance.new("ScreenGui")
screen.Parent = player:WaitForChild("PlayerGui")
screen.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,350,0,270)
frame.Position = UDim2.new(0.5,-175,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(12,12,18)
frame.BorderSizePixel = 0
frame.Parent = screen

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,14)

--------------------------------------------------
-- AVATAR
--------------------------------------------------

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0,80,0,80)
avatar.Position = UDim2.new(0.5,-40,0,15)
avatar.BackgroundTransparency = 1
avatar.Parent = frame

local thumb = Players:GetUserThumbnailAsync(
    player.UserId,
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size100x100
)

avatar.Image = thumb

--------------------------------------------------
-- TEXT ANIMATION
--------------------------------------------------

local helloText = Instance.new("TextLabel")
helloText.Size = UDim2.new(1,0,0,40)
helloText.Position = UDim2.new(0,0,0,100)
helloText.BackgroundTransparency = 1
helloText.Font = Enum.Font.GothamBold
helloText.TextSize = 20
helloText.TextColor3 = Color3.fromRGB(200,200,255)
helloText.Parent = frame

local function TypeText(label,text)
    label.Text = ""
    for i=1,#text do
        label.Text = string.sub(text,1,i)
        task.wait(0.05)
    end
end

task.spawn(function()
    TypeText(helloText,"Hello "..player.Name)
end)

--------------------------------------------------
-- KEY BOX
--------------------------------------------------

local box = Instance.new("TextBox")
box.Size = UDim2.new(0,250,0,40)
box.Position = UDim2.new(0.5,-125,0,140)
box.PlaceholderText = "Enter Key"
box.Font = Enum.Font.Gotham
box.TextSize = 16
box.BackgroundColor3 = Color3.fromRGB(25,25,35)
box.TextColor3 = Color3.new(1,1,1)
box.Parent = frame

Instance.new("UICorner",box).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- AUTH BUTTON
--------------------------------------------------

local button = Instance.new("TextButton")
button.Size = UDim2.new(0,250,0,40)
button.Position = UDim2.new(0.5,-125,0,185)
button.Text = "AUTHENTICATE"
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.BackgroundColor3 = Color3.fromRGB(0,170,255)
button.TextColor3 = Color3.new(1,1,1)
button.Parent = frame

Instance.new("UICorner",button).CornerRadius = UDim.new(0,8)

--------------------------------------------------
-- KEY CHECK + PLACE DETECTOR
--------------------------------------------------

local function ExecuteHub()
    frame.Visible = false

    local placeId = game.PlaceId

    local scriptUrl = PlaceScripts[placeId]

    if scriptUrl then
        pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
    end
end

button.MouseButton1Click:Connect(function()
    if box.Text == KEY then
        TypeText(helloText,"Key Correct!")
        task.wait(1)
        ExecuteHub()
    else
        TypeText(helloText,"Wrong Key!")
        task.wait(1)
        TypeText(helloText,"Hello "..player.Name)
    end
end)
--------------------------------------------------
-- GET KEY BUTTON
--------------------------------------------------

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0,250,0,35)
getKeyButton.Position = UDim2.new(0.5,-125,0,230)
getKeyButton.Text = "GET KEY"
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
getKeyButton.BackgroundColor3 = Color3.fromRGB(0,120,200)
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.Parent = frame

Instance.new("UICorner",getKeyButton).CornerRadius = UDim.new(0,8)

getKeyButton.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard("https://t.me/+nq0e9VgBrgxjOWRi")
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title="Key System",
            Text="Link copied to clipboard!",
            Duration=3
        })
    end)
end)
--------------------------------------------------
-- HUB TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,-6)
title.BackgroundTransparency = 1
title.Text = "Duckoy Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(180,200,255)
title.Parent = frame
--------------------------------------------------
-- BLUR EFFECT
--------------------------------------------------

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- плавное появление блюра
task.spawn(function()
    for i = 0, 20 do
        blur.Size = i
        task.wait(0.03)
    end
end)

--------------------------------------------------
-- PARTICLES AROUND SCREEN
--------------------------------------------------

local gui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

local function createParticles()

    local particleFrame = Instance.new("Frame")
    particleFrame.Size = UDim2.new(1,0,1,0)
    particleFrame.BackgroundTransparency = 1
    particleFrame.Parent = gui

    for i = 1, 25 do
        local p = Instance.new("Frame")
        p.Size = UDim2.new(0,4,0,4)
        p.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
        p.BorderSizePixel = 0
        p.BackgroundTransparency = math.random(60,90)/100

        p.Position = UDim2.new(
            math.random(0,100)/100,
            0,
            math.random(0,100)/100,
            0
        )

        p.Parent = particleFrame

        task.spawn(function()
            while true do
                local tween = game:GetService("TweenService"):Create(
                    p,
                    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {
                        Position = UDim2.new(
                            math.random(0,100)/100,
                            0,
                            math.random(0,100)/100,
                            0
                        )
                    }
                )
                tween:Play()
                tween.Completed:Wait()
            end
        end)
    end
end

createParticles()
