-- ตัวแปร Key ที่จะใช้ตรวจสอบจาก _G.Key
local Key = _G.Key  -- รับค่าคีย์จากภายนอก

-- คีย์ที่ถูกต้องสำหรับการตรวจสอบ
local correctKey = "KeyHere"  -- กำหนดคีย์ที่ต้องการให้ตรง

-- ฟังก์ชันตรวจสอบคีย์
local function CheckKey()
    if Key == correctKey then
        print("คีย์ถูกต้อง! เริ่มทำงาน")
        -- เรียกใช้งานฟังก์ชันหรือสคริปต์ที่ต้องการทำงานที่นี่
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Script.lua"))()
    else
        -- ถ้าคีย์ผิด, เตะผู้เล่นออกจากเกม
        game.Players.LocalPlayer:Kick("คีย์ไม่ถูกต้อง! คุณถูกเตะออกจากเกม")  -- เตะผู้เล่นที่ใส่คีย์ผิด
        print("คีย์ไม่ถูกต้อง! ผู้เล่นถูกเตะออกจากเกม")
    end
end

-- เรียกใช้ฟังก์ชันตรวจสอบคีย์
CheckKey()
