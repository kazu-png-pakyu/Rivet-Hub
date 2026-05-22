-- ================================================================
--  KAITUN SNIPE — Grow a Garden
--  Edit the CONFIG block below then execute.
--  To stop mid-session: run  _G.kaitun_stop()  in console.
-- ================================================================

-- ================================================================
--  !! CONFIG — CHANGE EVERYTHING HERE !!
-- ================================================================
local CONFIG = {

    -- How often to scan listings (seconds). Lower = faster but more CPU.
    scan_interval    = 4,

    -- How long to wait after a successful buy before scanning again (seconds).
    buy_cooldown     = 9,

    -- Global cooldown between server-hop searches (seconds).
    server_search_cd = 10.7,

    -- If true: only snipe in the current server, never teleport.
    same_server_only = false,

    -- FPS limit applied on start (keeps the game smooth while sniping).
    fps_cap          = 20,

    -- -------------------------------------------------------
    --  PETS TO SNIPE
    --  Each entry:
    --    enabled          true/false  — is this pet active?
    --    price            BUY AT THIS PRICE AND BELOW — e.g. price=15
    --                     means it will ONLY buy if listed at 15 or less.
    --                     Anything listed higher is automatically skipped.
    --    weight_min       minimum base weight (KG)
    --    weight_max       maximum base weight (KG)
    --    min_level        minimum pet level
    --    max_level        maximum pet level
    --    max_keep         stop buying this pet once you own this many
    --    is_visual_weight if true, ignores base weight/level and uses
    --                     the visual KG shown on screen instead
    --    big_weight_max   (only if is_visual_weight=true) minimum
    --                     visual KG to accept
    -- -------------------------------------------------------
    find_settings = {

        -- ===== ACTIVE =====
        ["Mimic Octopus"] = {
            enabled = true,  price = 20,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Flamingo"] = {
            enabled = true,  price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 30000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Sea Turtle"] = {
            enabled = true,  price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 30000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Orangutan"] = {
            enabled = true,  price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Toucan"] = {
            enabled = true,  price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 30000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Seal"] = {
            enabled = true,  price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 30000,
            is_visual_weight = false, big_weight_max = 112,
        },

        -- ===== INACTIVE (flip enabled=true to turn on) =====
        ["Kiwi"] = {
            enabled = false, price = 3,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Peacock"] = {
            enabled = false, price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Cape Buffalo"] = {
            enabled = false, price = 3,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Capybara"] = {
            enabled = false, price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Scarlet Macaw"] = {
            enabled = false, price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 3000000,
            is_visual_weight = false, big_weight_max = 112,
        },
        ["Ostrich"] = {
            enabled = false, price = 15,
            weight_min = 0.86, weight_max = 12.86,
            min_level = 1, max_level = 125,
            max_keep = 300000,
            is_visual_weight = false, big_weight_max = 112,
        },
    },
}
-- ================================================================
--  END OF CONFIG — do not edit below unless you know what you're doing
-- ================================================================




-- ================================================================
--  BOOT GUARDS
-- ================================================================
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.3)

if tostring(game.GameId) ~= "7436755782" then
    warn("[Kaitun] Wrong game. This script only works in Grow a Garden.")
    return
end

if _G.kaitun_snipe_running then
    warn("[Kaitun] Already running. Run _G.kaitun_stop() first.")
    return
end
_G.kaitun_snipe_running = true


-- ================================================================
--  SERVICES
-- ================================================================
local TweenService    = game:GetService("TweenService")
local Players         = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui      = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local GameEvents  = ReplicatedStorage:WaitForChild("GameEvents")


-- ================================================================
--  FPS CAP
-- ================================================================
local function ApplyFpsCap(fps)
    if setfpscap then pcall(setfpscap, fps) end
    pcall(function() settings().Rendering.MaxFramerate = fps end)
    print(string.format("[Kaitun] FPS capped to %d", fps))
end
ApplyFpsCap(CONFIG.fps_cap)


-- ================================================================
--  TOKEN BALANCE — reads live from DataService
-- ================================================================
local function GetMyTokens()
    local ok, tokens = pcall(function()
        local DataService = require(ReplicatedStorage.Modules.DataService)
        local data = DataService:GetBigDataUsingKey("CurrencyData")
        return data and data.Tokens or 0
    end)
    return ok and (tonumber(tokens) or 0) or 0
end


-- ================================================================
--  STATE
-- ================================================================

-- Persistent session timer: survives rejoins by saving start time to file.
-- Each executor session keeps the same timestamp until you manually delete
-- kaitun_session.txt or the executor resets.
local SESSION_FILE = "kaitun_session.txt"
local persistedStart = os.time()
pcall(function()
    if isfile and isfile(SESSION_FILE) then
        local saved = tonumber(readfile(SESSION_FILE))
        -- accept saved time if it's in the past and within 24 hours
        if saved and saved <= os.time() and (os.time() - saved) < 86400 then
            persistedStart = saved
        else
            writefile(SESSION_FILE, tostring(os.time()))
        end
    else
        if writefile then writefile(SESSION_FILE, tostring(persistedStart)) end
    end
end)

local State = {
    enabled          = true,
    global_search_cd = 0,
    already_tried    = {},
    pet_count        = {},
    first_scan       = true,
    snipe_count      = 0,
    snipe_log        = {},
    status           = "Starting...",
    is_fullscreen    = false,
    session_start    = persistedStart,
    tokens_spent     = 0,
    tokens_left      = 0,
}


-- ================================================================
--  HELPERS
-- ================================================================
local function Log(msg)
    print(string.format("[Kaitun | %s] %s", os.date("%H:%M:%S"), msg))
end

local function Warn(msg)
    warn(string.format("[Kaitun | %s] %s", os.date("%H:%M:%S"), msg))
end

local function SetStatus(msg)
    State.status = msg
    Log(msg)
end


-- ================================================================
--  GUI — Always full-screen rounded HUD (fixed, no drag)
-- ================================================================
local GUI = {}

local function Lbl(parent, text, size, pos, color, fontSize, bold, align)
    local l = Instance.new("TextLabel")
    l.Size = size; l.Position = pos
    l.BackgroundTransparency = 1
    l.Text = text; l.TextColor3 = color
    l.TextSize = fontSize or 12
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextXAlignment = align or Enum.TextXAlignment.Left
    l.TextWrapped = true; l.Parent = parent
    return l
end

local function Divider(parent, posY)
    local d = Instance.new("Frame")
    d.Size = UDim2.new(1, -24, 0, 1)
    d.Position = UDim2.new(0, 12, 0, posY)
    d.BackgroundColor3 = Color3.fromRGB(45, 55, 45)
    d.BorderSizePixel = 0; d.Parent = parent
    return d
end

local function Row(parent, posY, rowH)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, rowH or 30)
    f.Position = UDim2.new(0, 0, 0, posY)
    f.BackgroundTransparency = 1
    f.BorderSizePixel = 0
    f.Parent = parent
    return f
end

local function BuildGui()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local old = PlayerGui:FindFirstChild("KaitunGui")
    if old then old:Destroy() end

    -- Always fullscreen: hide Roblox CoreGui immediately
    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) end)

    local screen = Instance.new("ScreenGui")
    screen.Name = "KaitunGui"; screen.ResetOnSpawn = false
    screen.IgnoreGuiInset = true; screen.DisplayOrder = 999
    screen.Parent = PlayerGui

    -- ── Full-screen solid dark backdrop ───────────────────────
    local backdrop = Instance.new("Frame")
    backdrop.Size = UDim2.new(1,0,1,0)
    backdrop.BackgroundColor3 = Color3.fromRGB(0,0,0)
    backdrop.BackgroundTransparency = 0
    backdrop.BorderSizePixel = 0
    backdrop.Parent = screen

    -- ── Compute panel height from content ─────────────────────
    local ROW_H = 28   -- each list row height
    local sortedPets = {}
    for name, cfg in pairs(CONFIG.find_settings) do
        table.insert(sortedPets, {name=name, cfg=cfg})
    end
    table.sort(sortedPets, function(a,b)
        if a.cfg.enabled ~= b.cfg.enabled then return a.cfg.enabled end
        return a.name < b.name
    end)
    local petCount = #sortedPets
    -- sections: topbar(44) + statsbar(36) + divider(1) + secLabel(22) + pets
    --           + divider(1) + secLabel(22) + 3 log rows + secLabel(22) + 1 status row + padding(10)
    local PANEL_H = 44 + 36 + 1 + 22 + petCount*ROW_H + 1 + 22 + 3*ROW_H + 22 + ROW_H + 10

    -- ── Bottom-anchored full-width panel ──────────────────────
    local panel = Instance.new("Frame")
    panel.Name = "Panel"
    panel.Size = UDim2.new(1, 0, 0, PANEL_H)
    panel.Position = UDim2.new(0, 0, 1, -PANEL_H)
    panel.BackgroundColor3 = Color3.fromRGB(10, 11, 10)
    panel.BackgroundTransparency = 0
    panel.BorderSizePixel = 0
    panel.Parent = screen
    -- only round the top two corners
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 20)
    local sqFill = Instance.new("Frame", panel)
    sqFill.Size = UDim2.new(1,0,0.5,0); sqFill.Position = UDim2.new(0,0,0.5,0)
    sqFill.BackgroundColor3 = Color3.fromRGB(10,11,10); sqFill.BorderSizePixel = 0

    -- top green accent line
    local accentLine = Instance.new("Frame", panel)
    accentLine.Size = UDim2.new(0.25, 0, 0, 3)
    accentLine.Position = UDim2.new(0.375, 0, 0, 0)
    accentLine.BackgroundColor3 = Color3.fromRGB(0, 215, 90)
    accentLine.BorderSizePixel = 0
    Instance.new("UICorner", accentLine).CornerRadius = UDim.new(0, 2)

    -- ── TOP BAR: title left | timer right ─────────────────────
    local y = 6
    Lbl(panel, "🎯  Kaitun Snipe",
        UDim2.new(0.5, 0, 0, 22), UDim2.new(0, 14, 0, y),
        Color3.fromRGB(255,255,255), 14, true, Enum.TextXAlignment.Left)
    Lbl(panel, "Grow a Garden  •  ⚡"..CONFIG.fps_cap.."fps",
        UDim2.new(0.5, 0, 0, 15), UDim2.new(0, 14, 0, y+22),
        Color3.fromRGB(100, 100, 100), 10, false, Enum.TextXAlignment.Left)
    local timerLbl = Lbl(panel, "00:00:00",
        UDim2.new(0.38, 0, 0, 38), UDim2.new(0.6, -10, 0, y),
        Color3.fromRGB(255, 220, 80), 22, true, Enum.TextXAlignment.Right)
    GUI.timer = timerLbl
    Lbl(panel, "SESSION",
        UDim2.new(0.38, 0, 0, 14), UDim2.new(0.6, -10, 0, y+26),
        Color3.fromRGB(80, 80, 80), 9, false, Enum.TextXAlignment.Right)

    -- ── STATS BAR: 3 columns ──────────────────────────────────
    y = 44
    local statsBar = Instance.new("Frame", panel)
    statsBar.Size = UDim2.new(1, 0, 0, 36)
    statsBar.Position = UDim2.new(0, 0, 0, y)
    statsBar.BackgroundColor3 = Color3.fromRGB(16, 18, 16)
    statsBar.BorderSizePixel = 0

    local function StatCol(xScale, label, valColor)
        Lbl(statsBar, label,
            UDim2.new(0.33, 0, 0, 13), UDim2.new(xScale, 0, 0, 3),
            Color3.fromRGB(80,80,80), 9, false, Enum.TextXAlignment.Center)
        local v = Lbl(statsBar, "0",
            UDim2.new(0.33, 0, 0, 18), UDim2.new(xScale, 0, 0, 16),
            valColor, 14, true, Enum.TextXAlignment.Center)
        return v
    end
    GUI.counter    = StatCol(0,    "SNIPED",       Color3.fromRGB(255, 220, 50))
    GUI.tokensLeft = StatCol(0.33, "TOKENS LEFT",  Color3.fromRGB(80,  200, 255))
    GUI.tokens     = StatCol(0.66, "TOKENS SPENT", Color3.fromRGB(200, 160, 255))

    -- column separators
    for _, xp in ipairs({0.33, 0.66}) do
        local sep = Instance.new("Frame", statsBar)
        sep.Size = UDim2.new(0, 1, 0.7, 0); sep.Position = UDim2.new(xp, 0, 0.15, 0)
        sep.BackgroundColor3 = Color3.fromRGB(35,35,35); sep.BorderSizePixel = 0
    end

    y = y + 36

    -- ── SECTION HELPER ────────────────────────────────────────
    local function SectionLabel(text, posY)
        local bar = Instance.new("Frame", panel)
        bar.Size = UDim2.new(1, 0, 0, 22)
        bar.Position = UDim2.new(0, 0, 0, posY)
        bar.BackgroundColor3 = Color3.fromRGB(14, 16, 14)
        bar.BorderSizePixel = 0
        Lbl(bar, text, UDim2.new(1,-16,1,0), UDim2.new(0,14,0,0),
            Color3.fromRGB(0, 200, 80), 10, true, Enum.TextXAlignment.Left)
        return bar
    end

    local function ListRow(posY, dotColor, nameText, rightText, nameColor, rightColor)
        local r = Row(panel, posY, ROW_H)
        -- dot
        local dot = Instance.new("Frame", r)
        dot.Size = UDim2.new(0, 6, 0, 6)
        dot.Position = UDim2.new(0, 14, 0.5, -3)
        dot.BackgroundColor3 = dotColor
        dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        -- name
        Lbl(r, nameText, UDim2.new(0.62, 0, 1, 0), UDim2.new(0, 26, 0, 0),
            nameColor or Color3.fromRGB(210,210,210), 12, false, Enum.TextXAlignment.Left)
        -- right value
        local rv = Lbl(r, rightText or "", UDim2.new(0.3, 0, 1, 0), UDim2.new(0.68, 0, 0, 0),
            rightColor or Color3.fromRGB(140,140,140), 11, false, Enum.TextXAlignment.Right)
        -- subtle separator at bottom
        local sep = Instance.new("Frame", r)
        sep.Size = UDim2.new(1, -14, 0, 1); sep.Position = UDim2.new(0, 14, 1, -1)
        sep.BackgroundColor3 = Color3.fromRGB(20,22,20); sep.BorderSizePixel = 0
        return rv
    end

    -- ── WATCHING section (pet list) ───────────────────────────
    SectionLabel("WATCHING", y); y = y + 22

    for _, entry in ipairs(sortedPets) do
        local isOn = entry.cfg.enabled
        ListRow(y,
            isOn and Color3.fromRGB(0,215,85) or Color3.fromRGB(50,50,50),
            entry.name,
            "≤"..entry.cfg.price.." tkn",
            isOn and Color3.fromRGB(220,220,220) or Color3.fromRGB(70,70,70),
            isOn and Color3.fromRGB(255,210,50) or Color3.fromRGB(60,60,60))
        y = y + ROW_H
    end

    -- ── RECENT SNIPES section ─────────────────────────────────
    SectionLabel("RECENT SNIPES", y); y = y + 22

    GUI.logLabels = {}
    for i = 1, 3 do
        GUI.logLabels[i] = ListRow(y,
            Color3.fromRGB(0,150,60), "—", "",
            Color3.fromRGB(180,180,180), Color3.fromRGB(120,120,120))
        y = y + ROW_H
    end

    -- ── STATUS section ────────────────────────────────────────
    SectionLabel("STATUS", y); y = y + 22

    local statusLbl = Lbl(panel, "⏳ Starting...",
        UDim2.new(1,-20,0,ROW_H), UDim2.new(0,14,0,y),
        Color3.fromRGB(200,200,200), 11, false, Enum.TextXAlignment.Left)
    GUI.status = statusLbl

    -- ── Notification container (top-center, floats above panel)
    local notifContainer = Instance.new("Frame")
    notifContainer.Name = "NotifContainer"
    notifContainer.Size = UDim2.new(0, 320, 1, 0)
    notifContainer.Position = UDim2.new(0.5, -160, 0, 8)
    notifContainer.BackgroundTransparency = 1
    notifContainer.BorderSizePixel = 0
    notifContainer.Parent = screen
    local nl = Instance.new("UIListLayout", notifContainer)
    nl.SortOrder = Enum.SortOrder.LayoutOrder
    nl.Padding = UDim.new(0, 6)
    nl.HorizontalAlignment = Enum.HorizontalAlignment.Center
    GUI.notifContainer = notifContainer
    GUI.notifIndex = 0

    -- ── Live update loop ──────────────────────────────────────
    local tokenTick = 0
    task.spawn(function()
        while State.enabled do
            task.wait(0.4)

            if GUI.counter    then GUI.counter.Text    = tostring(State.snipe_count)  end
            if GUI.tokens     then GUI.tokens.Text     = tostring(State.tokens_spent) end
            if GUI.status     then GUI.status.Text     = State.status                 end

            -- session timer
            if GUI.timer then
                local e = os.time() - State.session_start
                GUI.timer.Text = string.format("%02d:%02d:%02d",
                    math.floor(e/3600), math.floor((e%3600)/60), e%60)
            end

            -- tokens left (live, every 3 s)
            tokenTick = tokenTick + 0.4
            if tokenTick >= 3 then
                tokenTick = 0
                task.spawn(function() State.tokens_left = GetMyTokens() end)
            end
            if GUI.tokensLeft then
                GUI.tokensLeft.Text = tostring(State.tokens_left)
                GUI.tokensLeft.TextColor3 = (State.tokens_left < 20)
                    and Color3.fromRGB(255,70,70) or Color3.fromRGB(80,200,255)
            end

            -- recent snipes log (3 rows)
            if GUI.logLabels then
                for i = 1, 3 do
                    local e = State.snipe_log[i]
                    GUI.logLabels[i].Text = e or "—"
                    GUI.logLabels[i].TextColor3 = (i==1 and e)
                        and Color3.fromRGB(255,220,50) or Color3.fromRGB(160,160,160)
                    GUI.logLabels[i].Font = (i==1 and e)
                        and Enum.Font.GothamBold or Enum.Font.Gotham
                end
            end
        end
    end)
end

BuildGui()


-- ================================================================
--  NOTIFICATION SYSTEM
--  Notify(msg, colorName, duration)
--  colorName: "green" | "red" | "blue" | "yellow"
-- ================================================================
local NOTIF_COLORS = {
    green  = { bg=Color3.fromRGB(15,60,30),  border=Color3.fromRGB(0,220,100),  text=Color3.fromRGB(180,255,200) },
    red    = { bg=Color3.fromRGB(60,15,15),  border=Color3.fromRGB(220,60,60),  text=Color3.fromRGB(255,180,180) },
    blue   = { bg=Color3.fromRGB(15,30,60),  border=Color3.fromRGB(60,150,255), text=Color3.fromRGB(180,210,255) },
    yellow = { bg=Color3.fromRGB(50,45,10),  border=Color3.fromRGB(255,210,30), text=Color3.fromRGB(255,240,140) },
}

local function Notify(msg, colorName, duration)
    if not GUI.notifContainer then return end
    local scheme = NOTIF_COLORS[colorName or "green"] or NOTIF_COLORS.green
    duration = duration or 4
    GUI.notifIndex = GUI.notifIndex + 1

    local card = Instance.new("Frame")
    card.Size                   = UDim2.new(1,0,0,44)
    card.BackgroundColor3       = scheme.bg
    card.BackgroundTransparency = 0.1
    card.BorderSizePixel        = 0
    card.LayoutOrder            = GUI.notifIndex
    card.ClipsDescendants       = true
    card.Parent                 = GUI.notifContainer
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,8)
    local cs = Instance.new("UIStroke", card); cs.Color = scheme.border; cs.Thickness = 1.5

    local accent = Instance.new("Frame", card)
    accent.Size = UDim2.new(0,4,1,0); accent.BackgroundColor3 = scheme.border; accent.BorderSizePixel = 0
    Instance.new("UICorner", accent).CornerRadius = UDim.new(0,4)

    local lbl = Instance.new("TextLabel", card)
    lbl.Size = UDim2.new(1,-18,1,-8); lbl.Position = UDim2.new(0,12,0,4)
    lbl.BackgroundTransparency = 1; lbl.Text = msg
    lbl.TextColor3 = scheme.text; lbl.TextSize = 12; lbl.Font = Enum.Font.GothamSemibold
    lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextWrapped = true

    task.spawn(function()
        card.Position = UDim2.new(0,0,0,-50)
        TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Position = UDim2.new(0,0,0,0) }):Play()
        task.wait(duration)
        TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { BackgroundTransparency=1, Size=UDim2.new(1,0,0,0) }):Play()
        TweenService:Create(lbl,  TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            { TextTransparency=1 }):Play()
        task.wait(0.35)
        card:Destroy()
    end)
end


-- ================================================================
--  FINDER MODULE
-- ================================================================
local Finder = {}

-- Returns all booth listings as a table
function Finder.GetBoothListings()
    local remote = GameEvents:FindFirstChild("TradeEvents")
        and GameEvents.TradeEvents:FindFirstChild("Booths")
        and GameEvents.TradeEvents.Booths:FindFirstChild("GetListings")
    if not remote then Warn("GetListings remote not found.") return {} end
    local ok, result = pcall(function() return remote:InvokeServer() end)
    return (ok and type(result) == "table") and result or {}
end

-- Attempts to buy a listing — checks token balance BEFORE calling remote
function Finder.BuyListing(owner, listingId, listingPrice)
    -- Hard price guard: verify listing price against per-pet config
    -- (PassesFilter already does this, but double-check here)
    if not listingPrice then
        Warn("BuyListing: missing price, skipping.")
        return false
    end

    -- Live token balance check — abort if we can't afford it
    local myTokens = GetMyTokens()
    if myTokens < listingPrice then
        Warn(string.format("Not enough tokens! Have %d, listing costs %d. Skipping.", myTokens, listingPrice))
        Notify(string.format("❌ Not enough tokens!\nHave %d  •  Need %d", myTokens, listingPrice), "red", 5)
        return false
    end

    local remote = GameEvents:FindFirstChild("TradeEvents")
        and GameEvents.TradeEvents:FindFirstChild("Booths")
        and GameEvents.TradeEvents.Booths:FindFirstChild("BuyListing")
    if not remote then Warn("BuyListing remote not found.") return false end

    local ok, result = pcall(function() return remote:InvokeServer(owner, listingId) end)
    return ok and result
end

-- Finds a seller in another server for a given pet
function Finder.FindSellerUsingPetName(petName)
    local remote = GameEvents:FindFirstChild("TradeEvents")
        and GameEvents.TradeEvents:FindFirstChild("Booths")
        and GameEvents.TradeEvents.Booths:FindFirstChild("FindSellerUsingPetName")
    if not remote then Warn("FindSellerUsingPetName remote not found.") return false, nil end
    local ok, found, jobData = pcall(function() return remote:InvokeServer(petName) end)
    return ok and found, ok and jobData or nil
end

-- Teleports to a server by JobId
function Finder.TeleportToSeller(jobId)
    if not jobId or jobId == "" or jobId == game.JobId then return false end
    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, LocalPlayer)
    end)
    if not ok then Warn("Teleport error: " .. tostring(err)) return false end
    return true
end


-- ================================================================
--  FILTER CHECK
--  Returns true only if the listing passes ALL of:
--    - pet is enabled in CONFIG
--    - listing price <= configured max price
--    - weight (or visual weight) is in range
--    - level is in range
--    - we haven't hit max_keep for this pet
-- ================================================================
local function PassesFilter(settings, listing)
    if not settings or not settings.enabled then return false end

    local listingPrice = tonumber(listing.price) or 0
    local weight       = tonumber(listing.weight) or 0
    local visWeight    = tonumber(listing.visualweight) or 0
    local level        = tonumber(listing.level) or 1
    local petName      = listing.petname

    -- max_keep guard
    if (State.pet_count[petName] or 0) >= (settings.max_keep or 300) then
        return false
    end

    -- PRICE CAP — never buy above the configured price for this pet
    local maxPrice = tonumber(settings.price) or 0
    if maxPrice == 0 then return false end          -- price=0 means unconfigured
    if listingPrice > maxPrice then return false end -- listing too expensive

    -- Visual weight mode
    if settings.is_visual_weight then
        local minVisual = tonumber(settings.big_weight_max) or 112
        return visWeight >= minVisual
    end

    -- Standard: weight + level range
    local wMin = tonumber(settings.weight_min) or 0
    local wMax = tonumber(settings.weight_max) or 0
    local lMin = tonumber(settings.min_level)  or 1
    local lMax = tonumber(settings.max_level)  or 125
    if wMax == 0 then return false end
    if level  < lMin or level  > lMax then return false end
    if weight < wMin or weight > wMax then return false end

    return true
end


-- ================================================================
--  SERVER HOP
-- ================================================================
local function FindNewServer()
    local now = os.clock()
    if now < State.global_search_cd then
        local w = State.global_search_cd - now
        SetStatus(string.format("⏳ Search cooldown %.1fs...", w))
        task.wait(w)
    end
    State.global_search_cd = os.clock() + CONFIG.server_search_cd

    for petName, settings in pairs(CONFIG.find_settings) do
        if not settings.enabled then continue end
        SetStatus("🔍 Searching servers for: " .. petName)

        local found, jobData = Finder.FindSellerUsingPetName(petName)
        if found and jobData then
            local jobId = type(jobData) == "table"
                and (jobData.info and jobData.info.JobId)
                or  jobData

            if jobId and jobId ~= "-" and jobId ~= game.JobId
                and not State.already_tried[jobId] then

                -- check price from remote data if available
                if type(jobData) == "table" and jobData.info then
                    local remotePrice = tonumber(jobData.info.Price) or 10000000
                    local maxPrice    = tonumber(settings.price) or 0
                    if remotePrice > maxPrice then
                        SetStatus(string.format("💸 Too expensive elsewhere: %d (max %d)", remotePrice, maxPrice))
                        continue
                    end
                end

                Notify("🚀 Rejoining server...\n"..petName.." found elsewhere!", "blue", 5)
                SetStatus("🚀 Teleporting for: " .. petName)
                task.wait(4)
                Finder.TeleportToSeller(jobId)
                task.wait(3)

                if _G.kaitun_tp_failed then
                    Notify("❌ Teleport failed — server full!\nTrying next server...", "red", 4)
                    State.already_tried[jobId] = true
                    _G.kaitun_tp_failed = false
                else
                    return true
                end
            end
        end
        task.wait(1)
    end
    return false
end


-- ================================================================
--  MAIN SCAN LOOP
-- ================================================================
SetStatus("⏳ Starting in 15s...")
Log(string.format("Kaitun ready | FPS=%d | Active pets=%d | Stop: _G.kaitun_stop()",
    CONFIG.fps_cap,
    (function()
        local n = 0
        for _, v in pairs(CONFIG.find_settings) do if v.enabled then n = n + 1 end end
        return n
    end)()
))

task.spawn(function()
    while State.enabled do
        task.wait(State.first_scan and 15 or CONFIG.scan_interval)
        State.first_scan = false

        SetStatus("🔎 Scanning booth listings...")

        local listings = Finder.GetBoothListings()
        if not listings or next(listings) == nil then
            SetStatus("⚠️ No listings fetched. Retrying...")
            task.wait(2)
            continue
        end

        local bought = {}

        for listId, listing in pairs(listings) do
            task.wait() -- yield every iteration — prevents game freeze

            local petName = listing.petname
            if not petName or listing.fav == true then continue end

            local settings = CONFIG.find_settings[petName]
            if not settings then continue end

            if PassesFilter(settings, listing) then
                local listingPrice = tonumber(listing.price) or 0
                SetStatus(string.format("💰 MATCH: %s | %d tokens | %.2fkg",
                    petName, listingPrice, tonumber(listing.weight) or 0))

                -- BuyListing does a live token check inside before calling remote
                local success = Finder.BuyListing(listing.owner, listId, listingPrice)

                -- Auto-retry once on failure (covers brief network blips)
                if not success then
                    SetStatus("⚠️ Buy failed — retrying in 1.5s...")
                    Notify("⚠️ Buy failed: "..petName.."\nRetrying once...", "yellow", 3)
                    task.wait(1.5)
                    success = Finder.BuyListing(listing.owner, listId, listingPrice)
                end

                if success then
                    State.snipe_count  = State.snipe_count + 1
                    State.tokens_spent = State.tokens_spent + listingPrice
                    State.pet_count[petName] = (State.pet_count[petName] or 0) + 1
                    table.insert(bought, { name = petName, price = listingPrice })
                    table.insert(State.snipe_log, 1, string.format("#%d %s (%d tkn)", State.snipe_count, petName, listingPrice))
                    if #State.snipe_log > 5 then table.remove(State.snipe_log) end

                    SetStatus(string.format("✅ Bought #%d: %s for %d tokens!", State.snipe_count, petName, listingPrice))
                    Notify(string.format(
                        "✅ Sniped #%d: %s\n💰 %d tokens  •  %.2f kg",
                        State.snipe_count, petName, listingPrice, tonumber(listing.weight) or 0
                    ), "green", 6)
                else
                    SetStatus("❌ Retry also failed: " .. petName)
                    Notify("❌ Both attempts failed: "..petName.."\nListing may be gone", "red", 5)
                end

                task.wait(CONFIG.buy_cooldown)
            end
        end

        if #bought > 0 then
            SetStatus(string.format("✅ Cycle done. Total: %d sniped / %d tokens spent",
                State.snipe_count, State.tokens_spent))
        else
            if not CONFIG.same_server_only then
                SetStatus("😴 Nothing found — searching other servers...")
                FindNewServer()
            else
                SetStatus("😴 Nothing found — rescanning same server...")
            end
        end
    end

    SetStatus("🛑 Snipe stopped.")
end)


-- ================================================================
--  STOP COMMAND
-- ================================================================
_G.kaitun_stop = function()
    State.enabled = false
    _G.kaitun_snipe_running = false
    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) end)
    print(string.format("[Kaitun] Stopped. Sniped: %d pets | Tokens spent: %d | Session: %ds",
        State.snipe_count, State.tokens_spent, os.time() - State.session_start))
end


-- ================================================================
--  RAW CONFIG REFERENCE
--  Copy-paste this block to quickly change settings.
--  Paste it at the TOP of the script (replacing the CONFIG there).
-- ================================================================
--[[

local CONFIG = {
    scan_interval    = 4,       -- seconds between scans
    buy_cooldown     = 9,       -- seconds after a buy
    server_search_cd = 10.7,    -- seconds between server searches
    same_server_only = false,   -- true = never teleport
    fps_cap          = 20,      -- FPS limit

    find_settings = {
        ["Mimic Octopus"] = { enabled=true,  price=20, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300000, is_visual_weight=false, big_weight_max=112 },
        ["Flamingo"]      = { enabled=true,  price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=30000,  is_visual_weight=false, big_weight_max=112 },
        ["Sea Turtle"]    = { enabled=true,  price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=30000,  is_visual_weight=false, big_weight_max=112 },
        ["Orangutan"]     = { enabled=true,  price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300000, is_visual_weight=false, big_weight_max=112 },
        ["Toucan"]        = { enabled=true,  price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=30000,  is_visual_weight=false, big_weight_max=112 },
        ["Seal"]          = { enabled=true,  price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=30000,  is_visual_weight=false, big_weight_max=112 },
        ["Kiwi"]          = { enabled=false, price=3,  weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300,    is_visual_weight=false, big_weight_max=112 },
        ["Peacock"]       = { enabled=false, price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300000, is_visual_weight=false, big_weight_max=112 },
        ["Cape Buffalo"]  = { enabled=false, price=3,  weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300,    is_visual_weight=false, big_weight_max=112 },
        ["Capybara"]      = { enabled=false, price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300000, is_visual_weight=false, big_weight_max=112 },
        ["Scarlet Macaw"] = { enabled=false, price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=3000000,is_visual_weight=false, big_weight_max=112 },
        ["Ostrich"]       = { enabled=false, price=15, weight_min=0.86, weight_max=12.86, min_level=1, max_level=125, max_keep=300000, is_visual_weight=false, big_weight_max=112 },
    },
}

]]
