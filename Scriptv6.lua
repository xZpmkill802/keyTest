
local correctKeys = {"Dev", "Fopf934xhvwbtdsgdrg","Owigsjfnbsmscsfed","rcgkbkdgcndurgbnidxrgrdf"}
local correctMaps = {"Bluelock"}

-- ฟังก์ชันที่ใช้เพิ่มคีย์ใหม่
function AddNewKey(newKey)
    table.insert(correctKeys, newKey)  -- เพิ่มคีย์ใหม่ใน list
    print("คีย์ใหม่ถูกเพิ่ม: " .. newKey)
end

-- ฟังก์ชันที่ใช้เพิ่มค่า Map ใหม่
function AddNewMap(newMap)
    table.insert(correctMaps, newMap)  -- เพิ่ม Map ใหม่ใน list
    print("Map ใหม่ถูกเพิ่ม: " .. newMap)
end

-- ฟังก์ชันตรวจสอบค่า Key และ Map
local function CheckKeyAndMap()
    -- รับค่าของ _G.Key และ _G.Map ที่ภายนอกตั้งค่า
    local Key = _G.Key
    local Map = _G.Map

    -- ตรวจสอบว่า Key ที่ได้รับตรงกับค่าที่ถูกต้องใน correctKeys
    local isKeyValid = false
    for _, validKey in ipairs(correctKeys) do
        if Key == validKey then
            isKeyValid = true
            break
        end
    end

    -- ตรวจสอบว่า Map ที่ได้รับตรงกับค่าที่ถูกต้องใน correctMaps
    local isMapValid = false
    for _, validMap in ipairs(correctMaps) do
        if Map == validMap then
            isMapValid = true
            break
        end
    end

    -- ตรวจสอบว่าทั้ง Key และ Map ถูกต้องหรือไม่
    if not isKeyValid then
        -- ถ้าคีย์ผิด, เตะผู้เล่นออกจากเกมด้วยข้อความว่า Key ผิด
        game.Players.LocalPlayer:Kick("Key ผิด! คุณถูกเตะออกจากเกม")
        print("Key ผิด! ผู้เล่นถูกเตะออกจากเกม")
    elseif not isMapValid then
        
        game.Players.LocalPlayer:Kick("Map ผิด! คุณถูกเตะออกจากเกม")
        print("Map ผิด! ผู้เล่นถูกเตะออกจากเกม")
    else
        print("Key และ Map ถูกต้อง! เริ่มทำงาน")
        
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Test.lua"))()
    end
end


CheckKeyAndMap()


AddNewKey("NewKeyHere")


AddNewMap("NewMapHere")
