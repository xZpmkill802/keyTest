local correctKeys = {"Dev", "Fopf934xhvwbtdsgdrg","Owigsjfnbsmscsfed","rcgkbkdgcndurgbnidxrgrdf"} 


function AddNewKey(newKey)
    table.insert(correctKeys, newKey)
    print("คีย์ใหม่ถูกเพิ่ม: " .. newKey)
end

local function CheckKey()
    
    local Key = _G.Key

    
    local isValid = false
    for _, validKey in ipairs(correctKeys) do
        if Key == validKey then
            isValid = true
            break
        end
    end

    if isValid then
        print("คีย์ถูกต้อง! เริ่มทำงาน : Correct key! Start working")
    
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xZpmkill802/keyTest/refs/heads/main/Script.lua"))()
    else
        game.Players.LocalPlayer:Kick("คีย์ไม่ถูกต้อง! ไปเอา Key ไป : Invalid key! Go get the key.")
        print("คีย์ไม่ถูกต้อง! ผู้เล่นถูกเตะออกจากเกม : Invalid key! Player kicked out of game")
    end
end


CheckKey()


AddNewKey("NewKeyHere")
