ModInfo = {
    ModName = "NewsFeed",   --Mod Name. Be original - If ModName repeat another mod name, we will got error
    Version = 1,           --Mod Version. Used in Mod.Update() func
    Author = "ImpDi",      --Not used anywhere, but hey - leave your mark :^>
    Desc = "Brings back news to the main menu"   --Description of the mod. What does it actually do?
}

Mod = {
    -- install = function ()           --What we will do, when first time install mod (Mod NOT in savefile)
    --     print("[Lua] install hello!")
    -- end;
    -- update = function ()            --What we will do, when update mod (Mod Version in lua, higher then in savefile)
    --     print("[Lua] update hello!")
    -- end;
    init = function ()              --What we will do, when init mod (One time executed, BEFORE game in launched)
        print("[Lua] init hello!")
    end;
    launch = function ()            --What we will do, when Skullgirls already launched (One time executed, AFTER game in launched)
        print("[Lua] launch hello!")
        local ptr = 0
        local Game_Base_Adress = CCLib.getGameBaseAddress()
        local WriteStr = "SkullGirls_CC_Is_Good!"
        while ptr == 0 do
        ptr = CCLib.readAddressNumber(Game_Base_Adress + 0x00436E54)
        end
        CCLib.writeAddressString(ptr,#WriteStr, WriteStr )
        print("[Lua]We've fixed the NewsFeed! (By breaking it...)") 
    end;
    loop = function ()              -- What CC will do, when Skullgirls is already launched, and executes function in loop (Executing a loop, AFTER the game is launched)
        print("[Lua] loop hello!")
    end;
    deinit = function ()            -- What we will do, when Skullgirls want to exit, (One time executed)
        print("[Lua] deinit hello!")
    end;
}