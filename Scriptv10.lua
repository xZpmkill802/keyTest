local correctKeys = {
    ["Dev"] = os.time(), 
    ["Fopf934xhvwbtdsgdrg"] = os.time(),
    ["Owigsjfnbsmscsfed"] = os.time(),
    ["rcgkbkdgcndurgbnidxrgrdf"] = os.time()
}

local correctMaps = {
    ["18668065416"] = os.time(), 
    ["34671275"] = os.time(), 
    ["2534191426"] = os.time()
}

local usedKeys = {}
local usedMaps = {}

-- เวลาหมดอายุ (24 ชั่วโมง = 86400 วินาที)
local expiryTime = 86400 

-- ฟังก์ชันเพิ่ม Key ใหม่
function AddNewKey(newKey)
    correctKeys[newKey] = os.time()
end

-- ฟังก์ชันเพิ่ม Map ใหม่
function AddNewMap(newMap)
    correctMaps[newMap] = os.time()
end

-- ฟังก์ชันตรวจสอบและลบ Key / Map ที่หมดอายุ
local function RemoveExpiredKeysAndMaps()
    local currentTime = os.time()

    -- ลบ Key ที่หมดอายุ
    for key, timestamp in pairs(correctKeys) do
        if currentTime - timestamp > expiryTime then
            correctKeys[key] = nil
        end
    end

    -- ลบ Map ที่หมดอายุ
    for map, timestamp in pairs(correctMaps) do
        if currentTime - timestamp > expiryTime then
            correctMaps[map] = nil
        end
    end
end

local function CheckKeyAndMap()
    RemoveExpiredKeysAndMaps()

    local player = game.Players.LocalPlayer
    local Key = _G.Key
    local Map = _G.Map
    local currentTime = os.time()

    -- ตรวจสอบว่า Key ยังใช้งานได้อยู่หรือไม่
    if not correctKeys[Key] then
        player:Kick("❌ Wrong or Expired Key! You are kicked out of the game.")
        return
    end

    -- ตรวจสอบว่า Map ยังใช้งานได้อยู่หรือไม่
    if not correctMaps[Map] then
        player:Kick("❌ Wrong or Expired Map! You are kicked out of the game.")
        return
    end

    -- ป้องกันการใช้ Key ซ้ำ
    if usedKeys[Key] then
        player:Kick("❌ This key has already been used!")
        return
    end

    -- ป้องกันการใช้ Map ซ้ำ
    if usedMaps[Map] then
        player:Kick("❌ Map of all past times!")
        return
    end

    -- บันทึกว่า Key และ Map นี้ถูกใช้แล้ว
    usedKeys[Key] = true
    usedMaps[Map] = true

    print("✅ Key และ Map ถูกต้อง! เริ่มต้นทำงาน...")

    loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Test.lua"))()
end

CheckKeyAndMap()
