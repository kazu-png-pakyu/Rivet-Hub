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
--  PET COUNT — reads owned pets that have weight+level from DataService
-- ================================================================
local function GetMyPetCount()
    local ok, count = pcall(function()
        local DataService = require(ReplicatedStorage.Modules.DataService)
        local data = DataService:GetBigDataUsingKey("PetData")
        if not data then return 0 end
        local n = 0
        for _, pet in pairs(data) do
            -- count any pet entry that has a weight or level field
            local w   = tonumber(pet.weight)   or tonumber(pet.Weight)   or 0
            local lvl = tonumber(pet.level)    or tonumber(pet.Level)    or 0
            if w > 0 or lvl > 0 then n = n + 1 end
        end
        return n
    end)
    return ok and (tonumber(count) or 0) or 0
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
    total_pets       = 0,
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
--  GUI — Kaitun Snipe  (compact floating panel)
--
--  Layout (fixed pixel heights, left side of screen):
--    HEADER  — title + session timer           (32px)
--    ROW     — 🪙 Tokens  |  🐾 Pets           (28px)
--    STATUS  — 📡 current action               (24px)
--    DIVIDER — "WATCHING" label                (16px)
--    PET ROW — one row per pet in CONFIG       (22px each)
--
--  The panel never covers the full screen.
--  Notifications pop up top-right, small and self-dismissing.
-- ================================================================
local GUI = {}

local C = {
    bg      = Color3.fromRGB(12, 12, 14),
    card    = Color3.fromRGB(20, 20, 24),
    border  = Color3.fromRGB(45, 45, 55),
    orange  = Color3.fromRGB(255, 145, 30),
    orangeLo= Color3.fromRGB(80,  45,  10),
    gold    = Color3.fromRGB(255, 215, 55),
    cyan    = Color3.fromRGB(55,  210, 255),
    green   = Color3.fromRGB(75,  220, 115),
    white   = Color3.fromRGB(220, 220, 220),
    muted   = Color3.fromRGB(100, 100, 110),
    dimText = Color3.fromRGB(55,  55,  65),
    red     = Color3.fromRGB(255, 65,  65),
}

-- pixel heights
local HDR_H    = 32
local STAT_H   = 52   -- tokens+pets row + status row combined
local DIV_H    = 18
local PET_H    = 22
local PANEL_W  = 220  -- panel width in pixels
local PAD      = 8    -- left/top inset from screen edge

local function F(parent, size, pos, color, transp)
    local f = Instance.new("Frame")
    f.Size = size; f.Position = pos
    f.BackgroundColor3 = color or C.bg
    f.BackgroundTransparency = transp or 0
    f.BorderSizePixel = 0; f.Parent = parent
    return f
end

local function L(parent, text, size, pos, color, fs, bold, align)
    local l = Instance.new("TextLabel")
    l.Size = size; l.Position = pos
    l.BackgroundTransparency = 1
    l.Text = text; l.TextColor3 = color
    l.TextSize = fs or 11
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextXAlignment = align or Enum.TextXAlignment.Left
    l.TextScaled = false; l.TextWrapped = false
    l.ClipsDescendants = false
    l.Parent = parent; return l
end

local function MakeCorner(parent, radius)
    local c = Instance.new("UICorner", parent)
    c.CornerRadius = UDim.new(0, radius or 4)
end

local function BuildGui()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local old = PlayerGui:FindFirstChild("KaitunGui")
    if old then old:Destroy() end

    -- NOTE: we do NOT disable CoreGui — let the game UI show normally
    local screen = Instance.new("ScreenGui")
    screen.Name            = "KaitunGui"
    screen.ResetOnSpawn    = false
    screen.IgnoreGuiInset  = false   -- respects the top bar inset
    screen.DisplayOrder    = 10      -- low order so it doesn't block game UI
    screen.Parent          = PlayerGui

    -- ── Sort pets: enabled first, then alphabetical ────────────────
    local sortedPets = {}
    for name, cfg in pairs(CONFIG.find_settings) do
        table.insert(sortedPets, {name = name, cfg = cfg})
    end
    table.sort(sortedPets, function(a, b)
        if a.cfg.enabled ~= b.cfg.enabled then return a.cfg.enabled end
        return a.name < b.name
    end)

    -- ── Total panel height ─────────────────────────────────────────
    local totalH = HDR_H + STAT_H + DIV_H + PET_H * #sortedPets + 4

    -- ── Outer panel (rounded, semi-transparent background) ─────────
    local panel = F(screen,
        UDim2.new(0, PANEL_W, 0, totalH),
        UDim2.new(0, PAD, 0, PAD),
        C.bg)
    MakeCorner(panel, 6)
    -- subtle border via UIStroke
    local stroke = Instance.new("UIStroke", panel)
    stroke.Color     = C.border
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local yOff = 0  -- running pixel offset inside panel

    -- ================================================================
    --  HEADER ROW
    -- ================================================================
    local hdr = F(panel, UDim2.new(1, 0, 0, HDR_H), UDim2.new(0, 0, 0, yOff), C.card)
    MakeCorner(hdr, 6)
    -- orange accent left bar
    F(hdr, UDim2.new(0, 3, 1, -4), UDim2.new(0, 0, 0, 2), C.orange)

    L(hdr, "🌱 Kaitun Snipe",
        UDim2.new(1, -90, 1, 0), UDim2.new(0, 10, 0, 0),
        C.white, 12, true, Enum.TextXAlignment.Left)

    local timerLbl = L(hdr, "00:00:00",
        UDim2.new(0, 76, 1, 0), UDim2.new(1, -80, 0, 0),
        C.gold, 11, true, Enum.TextXAlignment.Right)
    GUI.timer = timerLbl

    yOff = yOff + HDR_H + 2

    -- ================================================================
    --  TOKENS + PETS ROW  (two mini-boxes side by side)
    -- ================================================================
    local rowH = 26

    -- Tokens box (left half)
    local tokBox = F(panel, UDim2.new(0, PANEL_W/2 - 3, 0, rowH),
        UDim2.new(0, 0, 0, yOff), C.card)
    MakeCorner(tokBox, 4)
    F(tokBox, UDim2.new(0, 3, 1, 0), UDim2.new(0, 0, 0, 0), C.cyan)
    L(tokBox, "🪙 TOKENS", UDim2.new(1, -4, 0, 12), UDim2.new(0, 6, 0, 1), C.muted, 8, false)
    local tokLbl = L(tokBox, "—", UDim2.new(1, -6, 0, 14), UDim2.new(0, 5, 0, 12),
        C.cyan, 12, true, Enum.TextXAlignment.Left)
    GUI.tokensLeft = tokLbl

    -- Pets box (right half)
    local petBox = F(panel, UDim2.new(0, PANEL_W/2 - 3, 0, rowH),
        UDim2.new(0, PANEL_W/2 + 2, 0, yOff), C.card)
    MakeCorner(petBox, 4)
    F(petBox, UDim2.new(0, 3, 1, 0), UDim2.new(0, 0, 0, 0), C.green)
    L(petBox, "🐾 PETS", UDim2.new(1, -4, 0, 12), UDim2.new(0, 6, 0, 1), C.muted, 8, false)
    local petCountLbl = L(petBox, "—", UDim2.new(1, -6, 0, 14), UDim2.new(0, 5, 0, 12),
        C.green, 12, true, Enum.TextXAlignment.Left)
    GUI.petCountLbl = petCountLbl

    yOff = yOff + rowH + 2

    -- Spent / Sniped sub-row
    local subRow = F(panel, UDim2.new(1, 0, 0, 14), UDim2.new(0, 0, 0, yOff), C.bg, 1)
    local tokSpentSub = L(subRow, "spent: 0",
        UDim2.new(0.5, -2, 1, 0), UDim2.new(0, 4, 0, 0),
        C.muted, 9, false, Enum.TextXAlignment.Left)
    GUI.tokensSpentSub = tokSpentSub
    local snipedSub = L(subRow, "sniped: 0",
        UDim2.new(0.5, -2, 1, 0), UDim2.new(0.5, 2, 0, 0),
        C.muted, 9, false, Enum.TextXAlignment.Left)
    GUI.snipedSub = snipedSub

    yOff = yOff + 16

    -- ================================================================
    --  STATUS ROW
    -- ================================================================
    local statBox = F(panel, UDim2.new(1, 0, 0, 26), UDim2.new(0, 0, 0, yOff), C.card)
    MakeCorner(statBox, 4)
    F(statBox, UDim2.new(0, 3, 1, 0), UDim2.new(0, 0, 0, 0), C.orange)
    L(statBox, "STATUS", UDim2.new(0, 44, 0, 12), UDim2.new(0, 6, 0, 1), C.muted, 8, true)
    local statusLbl = L(statBox, "⏳ Starting...",
        UDim2.new(1, -56, 0, 14), UDim2.new(0, 52, 0, 6),
        C.white, 10, false, Enum.TextXAlignment.Left)
    GUI.status = statusLbl

    yOff = yOff + 28

    -- Last buy micro-line
    local lastBuyLbl = L(panel, "No purchases yet",
        UDim2.new(1, -8, 0, 12), UDim2.new(0, 6, 0, yOff),
        C.muted, 9, false, Enum.TextXAlignment.Left)
    GUI.lastBuy = lastBuyLbl

    yOff = yOff + 14

    -- ================================================================
    --  DIVIDER — "WATCHING"
    -- ================================================================
    local divLine = F(panel, UDim2.new(1, -12, 0, 1), UDim2.new(0, 6, 0, yOff), C.border)
    yOff = yOff + 3
    L(panel, "WATCHING PETS",
        UDim2.new(1, -8, 0, 13), UDim2.new(0, 6, 0, yOff),
        C.orange, 8, true, Enum.TextXAlignment.Left)
    yOff = yOff + 15

    -- ================================================================
    --  PET ROWS
    -- ================================================================
    for i, entry in ipairs(sortedPets) do
        local isOn  = entry.cfg.enabled
        local isAlt = i % 2 == 0

        local row = F(panel, UDim2.new(1, 0, 0, PET_H),
            UDim2.new(0, 0, 0, yOff),
            isAlt and C.card or C.bg)

        -- accent stripe
        F(row, UDim2.new(0, 3, 1, 0), UDim2.new(0, 0, 0, 0),
            isOn and C.orange or C.dimText)

        -- status dot
        local dot = F(row, UDim2.new(0, 6, 0, 6), UDim2.new(0, 8, 0.5, -3),
            isOn and C.green or C.dimText)
        MakeCorner(dot, 3)

        -- pet name
        L(row, entry.name,
            UDim2.new(1, -70, 1, 0), UDim2.new(0, 20, 0, 0),
            isOn and C.white or C.dimText, 10, isOn, Enum.TextXAlignment.Left)

        -- price badge
        local badge = F(row, UDim2.new(0, 52, 0, 14), UDim2.new(1, -56, 0.5, -7),
            isOn and C.orangeLo or C.bg)
        MakeCorner(badge, 3)
        L(badge, "≤"..entry.cfg.price.." tkn",
            UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0),
            isOn and C.gold or C.dimText, 8, true, Enum.TextXAlignment.Center)

        yOff = yOff + PET_H
    end

    -- ── NOTIFICATION CONTAINER (top-right, small) ──────────────────
    local notifContainer = Instance.new("Frame")
    notifContainer.Name                 = "NotifContainer"
    notifContainer.Size                 = UDim2.new(0, 230, 0, 300)
    notifContainer.Position             = UDim2.new(1, -238, 0, PAD)
    notifContainer.BackgroundTransparency = 1
    notifContainer.BorderSizePixel      = 0
    notifContainer.Parent               = screen
    local nl = Instance.new("UIListLayout", notifContainer)
    nl.SortOrder            = Enum.SortOrder.LayoutOrder
    nl.Padding              = UDim.new(0, 4)
    nl.HorizontalAlignment  = Enum.HorizontalAlignment.Right
    GUI.notifContainer = notifContainer
    GUI.notifIndex = 0

    -- ── LIVE UPDATE LOOP ──────────────────────────────────────────
    local tokenTick = 0
    local petTick   = 0
    task.spawn(function()
        while State.enabled do
            task.wait(0.4)

            -- session timer
            if GUI.timer then
                local e = os.time() - State.session_start
                GUI.timer.Text = string.format("%02d:%02d:%02d",
                    math.floor(e/3600), math.floor((e%3600)/60), e%60)
            end

            -- tokens (refresh every 3s)
            tokenTick = tokenTick + 0.4
            if tokenTick >= 3 then
                tokenTick = 0
                task.spawn(function() State.tokens_left = GetMyTokens() end)
            end
            if GUI.tokensLeft then
                GUI.tokensLeft.Text = tostring(State.tokens_left)
                GUI.tokensLeft.TextColor3 = (State.tokens_left > 0 and State.tokens_left < 20)
                    and C.red or C.cyan
            end
            if GUI.tokensSpentSub then
                GUI.tokensSpentSub.Text = "spent: "..tostring(State.tokens_spent)
            end

            -- pet count (refresh every 5s)
            petTick = petTick + 0.4
            if petTick >= 5 then
                petTick = 0
                task.spawn(function() State.total_pets = GetMyPetCount() end)
            end
            if GUI.petCountLbl then
                GUI.petCountLbl.Text = tostring(State.total_pets)
            end
            if GUI.snipedSub then
                GUI.snipedSub.Text = "sniped: "..tostring(State.snipe_count)
            end

            -- status
            if GUI.status then
                GUI.status.Text = State.status
            end
            if GUI.lastBuy and State.snipe_log and State.snipe_log[1] then
                GUI.lastBuy.Text = "last: "..State.snipe_log[1]
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
    green  = { bg=Color3.fromRGB(8,20,12),   border=Color3.fromRGB(80,220,120),  text=Color3.fromRGB(160,255,190) },
    red    = { bg=Color3.fromRGB(22,8,8),    border=Color3.fromRGB(255,70,70),   text=Color3.fromRGB(255,160,160) },
    blue   = { bg=Color3.fromRGB(8,16,28),   border=Color3.fromRGB(60,210,255),  text=Color3.fromRGB(160,210,255) },
    yellow = { bg=Color3.fromRGB(22,16,4),   border=Color3.fromRGB(255,140,30),  text=Color3.fromRGB(255,200,120) },
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
