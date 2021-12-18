
state("HorizonZeroDawn", "v1.11.1")
{
    // Value I found last stream
    // "the magic variable, we have no idea why it works" -x34
    // ... it doesn't work.. elkjaerRIP
    uint garbage : "HorizonZeroDawn.exe", 0x07163548, 0xD68, 0xB88, 0xA88, 0xF78, 0xF80, 0x948, 0x8D0;


    // Map/Inventory (all tabs) open
    // 1 = true
    // 0 = false
    uint MapInventory : "HorizonZeroDawn.exe", 0x0283D6A0, 0x599;


    // Maybe the same as GameEnginePaused from v1.10
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x071346C8, 0x4E8, 0xE38, 0xA88, 0xF78, 0xF80, 0x8E8, 0xE1C;


    // Map open (same one as in v1.10)
    //uint MapOpen : "HorizonZeroDawn.exe", "HorizonZeroDawn.exe", 0x0231A020, 0xE8;
}

state("HorizonZeroDawn", "v1.10")
{
    // Game Engine paused value. Equal to "1" if game engine is paused, "0" if otherwise.
    // Currently used as a safty mechanism to prevent a detection if the other value does random things.
    // This one seems to be stable and reliable, EXCEPT when in the main menu,
    // although it sometimes returns 3271576080 (wtf?)
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;

    // -> Is map open?
    // never tested elkjaerRIP
    // uint MapOpen : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7E;

    // Not used value. Declared Useless
    //byte ThisValue1 : "HorizonZeroDawn.exe", 0x02F7EC30, 0x140, 0xE0, 0x0, 0xC0, 0x18, 0x130, 0xA44;

    // Not used value. Declared Useless
    //byte ThisValue2 : "HorizonZeroDawn.exe", 0x2FB61AC;

    // Not used value. Declared Useless
    // Called "ThisValue" in Cheat Table
    //byte ThisValue3 : "HorizonZeroDawn.exe", 0x02A1AA20, 0x718, 0xB88;

    // Not used value. Declared Useless
    // Called "ThisOtherValue" in Cheat Table.
    //byte ThisValue4 : "HorizonZeroDawn.exe", 0x02552888, 0x38C;
    
    // Loading if restarted from save.
    // Testing showed that this value is equal to "0" if restarted from save, "1" if otherwise.
    // Not reliable
    byte RestartFromSaveValue : "HorizonZeroDawn.exe", 0x0281A0E8, 0x658;
    
    // Loading if fast traveling.
    // WTF?! Why do I need two different values. I just wanna know if the fucking game is loading.
    // Testing showed that this value is equal to "2" if a fast travel was performed, "0" if otherwise.
    // Not reliable
    byte FastTravelValue : "HorizonZeroDawn.exe", 0x02816728, 0x905;
}

startup
{
    // A refresh rate of 20 or 30 should be all we need. Doing more than that takes a lot of overhead.
    vars.isCurrentlyLoading = false;
    vars.stopwatch = new Stopwatch();

    // settings.Add(id, default_value = true, description = null, parent = null)
    settings.Add("moreRefreshRate", false, "Use a refresh rate of 20, instead of 4 by default", null);
    settings.Add("print", true, "Print debug output", null);
    settings.Add("printfirstmodule", false, "Print the size of the first module", null);
}

update
{
    if (version == "")
        return false;

    if (settings["print"])
    {
        print("LR DEBUG: "
            + current.NewValue
        );
    };
    
    if (settings["printfirstmodule"])
        { print(modules.First().ModuleMemorySize.ToString()); };
   
    if (settings["moreRefreshRate"])
        { refreshRate = 20; } else { refreshRate = 4; };

    // Loading check
    if (current.GameEnginePaused)
    {
        if (!current.MapInventory)
        {
            vars.isCurrentlyLoading = true;
        }
        else vars.isCurrentlyLoading = false;
    }
    else vars.isCurrentlyLoading = false;


}

init
{
    // Debug prints.
    // I use dbgview from the Sysinternals suite to read those
    print("[LR DEBUG] Found HZD process!");
    refreshRate = 4;
    if (modules.First().ModuleMemorySize == 150884352)
        { version = "v1.11.1"; }
    else version = "v1.10";
}

isLoading
{
    return vars.isCurrentlyLoading;
}

reset
{
    if (current.garbage == 1) return true;
}

split{}

start{}

exit{ timer.IsGameTimePaused = true; }