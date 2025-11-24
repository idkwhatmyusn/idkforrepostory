-- DEOBFUSCATED CODE
-- Total chunks: 1


------------------------------------------------------------
-- CHUNK 1
------------------------------------------------------------

-- 🔗 Daftar link raw berisi username (satu username per baris)
local rawLinks = {
    "https://pastebin.com/raw/rF5yKB6B"",
    "https://raw.githubusercontent.com/ardho206/user-premium-list/refs/heads/main/list-username.txt",
    "https://raw.githubusercontent.com/ardho206/user-premium-pt2/refs/heads/main/list-username.txt",
     "https://raw.githubusercontent.com/ardho206/lit-username-pt3/refs/heads/main/list-username.txt"
}

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local myName = string.lower(localPlayer.Name)

-- 🔁 Fungsi untuk ambil semua username dari rawlinks
local function fetchAllowedUsers()
    local allowed = {}

    for _, link in ipairs(rawLinks) do
        local success, result = pcall(function()
            return game:HttpGet(link)
        end)

        if success and result then
            for line in string.gmatch(result, "[^\r\n]+") do
                allowed[string.lower(line)] = true
            end
        end
    end

    return allowed
end

-- 🚨 Cek pertama kali (langsung kick kalau ga ada)
local allowedUsers = fetchAllowedUsers()
if not allowedUsers[myName] then
    localPlayer:Kick("⚠️ Your account username is not allowed!")
    return
end

-- 🔄 Loop real-time: cek ulang tiap 5 detik
task.spawn(function()
    while task.wait(5) do
        local updatedList = fetchAllowedUsers()

        if not updatedList[myName] then
            localPlayer:Kick("⚠️ Your username is no longer listed in the whitelist.")
            break
        end
    end
end)

---------------------------------------------------------
-- Kron Hub Stylish Notif v2 by Zirga ✨
---------------------------------------------------------

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

-- Hapus GUI lama
if CoreGui:FindFirstChild("SansMobaHub_NotifEX") then
    CoreGui:FindFirstChild("SansMobaHub_NotifEX"):Destroy()
end

-- Tambah efek blur ke layar
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {
    Size = 5
}):Play()

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "SansMobaHub_NotifEX"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = CoreGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 360, 0, 150)
main.Position = UDim2.new(1, 400, 1, -200)
main.BackgroundTransparency = 1
main.Parent = gui

-- Glow effect
local glow = Instance.new("ImageLabel", main)
glow.Image = "rbxassetid://4996891970"
glow.ImageColor3 = Color3.fromRGB(0,180,255)
glow.ImageTransparency = 0.3
glow.ScaleType = Enum.ScaleType.Slice
glow.SliceCenter = Rect.new(24,24,276,276)
glow.Size = UDim2.new(1,20,1,20)
glow.Position = UDim2.new(0,-10,0,-10)
glow.BackgroundTransparency = 1

-- Background
local bg = Instance.new("Frame", main)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(20,20,25)
bg.BackgroundTransparency = 0.35

Instance.new("UICorner", bg).CornerRadius = UDim.new(0,16)

local stroke = Instance.new("UIStroke", bg)
stroke.Color = Color3.fromRGB(0,180,255)
stroke.Thickness = 2
stroke.Transparency = 0.2

-- Title
local title = Instance.new("TextLabel", bg)
title.Text = "🚀 SansMobaHub Premium"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,20,0,15)
title.Size = UDim2.new(1,-40,0,28)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Status Text
local msg = Instance.new("TextLabel", bg)
msg.Text = "Loading script... 🌀"
msg.Font = Enum.Font.Gotham
msg.TextSize = 17
msg.TextColor3 = Color3.fromRGB(180,255,255)
msg.BackgroundTransparency = 1
msg.Position = UDim2.new(0,20,0,55)
msg.Size = UDim2.new(1,-40,0,24)
msg.TextXAlignment = Enum.TextXAlignment.Left

-- 🔥 Progress Bar Container
local barBG = Instance.new("Frame", bg)
barBG.Position = UDim2.new(0,20,1,-45)
barBG.Size = UDim2.new(1,-40,0,18)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,50)
barBG.BackgroundTransparency = 0.2
Instance.new("UICorner", barBG).CornerRadius = UDim.new(0,12)

-- 🔥 Progress Fill
local barFill = Instance.new("Frame", barBG)
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,180,255)
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0,12)

-- Glow on progress
local uiStroke = Instance.new("UIStroke", barFill)
uiStroke.Color = Color3.fromRGB(0,220,255)
uiStroke.Thickness = 1.8

-- Animasi masuk GUI
TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(1,-380,1,-200)
}):Play()

-- ⭐ PROGRESS BAR ANIMATED FILL
local fillTween = TweenService:Create(
    barFill,
    TweenInfo.new(5, Enum.EasingStyle.Linear),
    { Size = UDim2.new(1,0,1,0) }
)
fillTween:Play()

-- Setelah selesai
fillTween.Completed:Connect(function()

    -- Update text
    msg.Text = "Selesai! Menjalankan script... ✔️"

    task.wait(0.3)

    -- Animasi keluar GUI
    TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
        Position = UDim2.new(1,400,1,-200)
    }):Play()

    TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {
        Size = 0
    }):Play()

    task.wait(0.7)
    gui:Destroy()
    blur:Destroy()

    -- Fungsi aman
    local function safeLoad(url)
        task.spawn(function()
            pcall(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end

    -- 🔥 Load script
    safeLoad("https://paste.monster/KAThKHPYzcmE/raw/")
    safeLoad("https://paste.monster/Bc43d7EeHiyt/raw/")
    task.wait(3)
    safeLoad("https://pastebin.com/raw/3nxCf55f")
end)

