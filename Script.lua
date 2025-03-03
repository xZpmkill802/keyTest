-- ภายในสคริปต์กำหนดคีย์
_G.Key = "KeyHere"

-- ถ้าต้องการเพิ่มคีย์ใหม่
function AddNewKey(newKey)
    _G.Key = newKey  -- เปลี่ยนคีย์ใหม่
    print("คีย์ใหม่ถูกเพิ่ม: " .. newKey)
end

-- ฟังก์ชันตรวจสอบคีย์
local function CheckKey()
    -- รับค่า _G.Key ที่ตั้งไว้ภายนอก
    local Key = _G.Key
    local correctKey = "KeyHere"  -- คีย์ที่ถูกต้องในภายใน

    if Key == correctKey then
        print("คีย์ถูกต้อง! เริ่มทำงาน")
        -- เรียกใช้ฟังก์ชันหรือสคริปต์ที่ต้องการทำงาน
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Test.lua"))()  -- เปลี่ยน URL ตามที่ต้องการ
    else
        -- ถ้าคีย์ผิด, เตะผู้เล่นออกจากเกม
        game.Players.LocalPlayer:Kick("คีย์ไม่ถูกต้อง! คุณถูกเตะออกจากเกม")  -- เตะผู้เล่นที่คีย์ผิด
        print("คีย์ไม่ถูกต้อง! ผู้เล่นถูกเตะออกจากเกม")
    end
end

-- เรียกใช้ฟังก์ชันตรวจสอบคีย์
CheckKey()
