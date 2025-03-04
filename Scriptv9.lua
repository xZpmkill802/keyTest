local correctKeys = {"Dev", "Fopf934xhvwbtdsgdrg","Owigsjfnbsmscsfed","rcgkbkdgcndurgbnidxrgrdf"}
local correctMaps = {"18668065416", "34671275","2534191426"}

local usedKeys = {} 
local usedMaps = {} 

function AddNewKey(newKey)
    table.insert(correctKeys, newKey)
end

-- ฟังก์ชันเพิ่ม Map ใหม่
function AddNewMap(newMap)
    table.insert(correctMaps, newMap)
end


local function CheckKeyAndMap()
    local player = game.Players.LocalPlayer
    local Key = _G.Key
    local Map = _G.Map

    -- ตรวจสอบว่า Key อยู่ในรายการที่ถูกต้อง
    local isKeyValid = false
    for _, validKey in ipairs(correctKeys) do
        if Key == validKey then
            isKeyValid = true
            break
        end
    end

   
    local isMapValid = false
    for _, validMap in ipairs(correctMaps) do
        if Map == validMap then
            isMapValid = true
            break
        end
    end

   
    if usedKeys[Key] then
        player:Kick("❌ This key has already been used!")
        return
    end


    if usedMaps[Map] then
        player:Kick("❌ Map of all past times!")
        return
    end

    
    if not isKeyValid then
        player:Kick("❌ Wrong key! You are kicked out of the game.")
        return
    elseif not isMapValid then
        player:Kick("❌ Wrong Map! You are kicked out of the game.")
        return
    end

   
    usedKeys[Key] = true
    usedMaps[Map] = true

    
    print("✅ Key และ Map ถูกต้อง! เริ่มต้นทำงาน...")

    loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Test.lua"))()
end


CheckKeyAndMap()
