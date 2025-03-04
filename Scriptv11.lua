local correctKeys = {
    ["Dev"] = {hwid = nil, expires = nil}, -- Key "Dev" ใช้ได้ตลอด ไม่มีหมดอายุ
    ["Fopf934xhvwbtdsgdrg"] = {hwid = nil, expires = os.time() + 86400},
    ["Owigsjfnbsmscsfed"] = {hwid = nil, expires = os.time() + 86400},
    ["rcgkbkdgcndurgbnidxrgrdf"] = {hwid = nil, expires = os.time() + 86400}
}

local correctMaps = {
    ["18668065416"] = {hwid = nil, expires = os.time() + 86400},
    ["34671275"] = {hwid = nil, expires = os.time() + 86400},
    ["2534191426"] = {hwid = nil, expires = os.time() + 86400}
}

-- ฟังก์ชันดึง Hardware ID ของผู้เล่น
local function GetHardwareID()
    local player = game.Players.LocalPlayer
    return game:GetService("RbxAnalyticsService"):GetClientId() -- ใช้ Client ID เป็น HWID
end

-- ฟังก์ชันเพิ่ม Key ใหม่ (ยกเว้น "Dev")
function AddNewKey(newKey)
    if newKey ~= "Dev" then
        correctKeys[newKey] = {hwid = nil, expires = os.time() + 86400}
    end
end

-- ฟังก์ชันเพิ่ม Map ใหม่
function AddNewMap(newMap)
    correctMaps[newMap] = {hwid = nil, expires = os.time() + 86400}
end

-- ฟังก์ชันตรวจสอบและลบ Key / Map ที่หมดอายุ
local function RemoveExpiredKeysAndMaps()
    local currentTime = os.time()

    for key, data in pairs(correctKeys) do
        if key ~= "Dev" and data.expires and currentTime > data.expires then
            correctKeys[key] = nil
        end
    end

    for map, data in pairs(correctMaps) do
        if data.expires and currentTime > data.expires then
            correctMaps[map] = nil
        end
    end
end

local function CheckKeyAndMap()
    RemoveExpiredKeysAndMaps()

    local player = game.Players.LocalPlayer
    local Key = _G.Key
    local Map = _G.Map
    local hwid = GetHardwareID()

    -- ตรวจสอบว่า Key อยู่ในรายการที่ถูกต้อง
    if not correctKeys[Key] then
        player:Kick("❌ Wrong or Expired Key! You are kicked out of the game.")
        return
    end

    -- ตรวจสอบว่า Map อยู่ในรายการที่ถูกต้อง
    if not correctMaps[Map] then
        player:Kick("❌ Wrong or Expired Map! You are kicked out of the game.")
        return
    end

    -- ตรวจสอบว่า Key ถูกใช้ไปแล้วในเครื่องอื่น
    if correctKeys[Key].hwid and correctKeys[Key].hwid ~= hwid then
        player:Kick("❌ This Key is already used on another device!")
        return
    end

    -- ตรวจสอบว่า Map ถูกใช้ไปแล้วในเครื่องอื่น
    if correctMaps[Map].hwid and correctMaps[Map].hwid ~= hwid then
        player:Kick("❌ This Map is already used on another device!")
        return
    end

    -- บันทึก HWID ลงใน Key และ Map
    correctKeys[Key].hwid = hwid
    correctMaps[Map].hwid = hwid

    print("✅ Key และ Map ถูกต้อง! เริ่มต้นทำงาน...")

    loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Test.lua"))()
end

CheckKeyAndMap()
