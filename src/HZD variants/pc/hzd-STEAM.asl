
state("HorizonZeroDawn")
{
    // Game Engine paused value. Equal to "1" if game engine is paused, "0" if otherwise.
    // Currently used as a safty mechanism to prevent a detection if the other value does random things.
    // This one seems to be stable and reliable EXCEPT when in the main menu,
    // although it sometimes returns 3271576080 (wtf?)
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;

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
    byte RestartFromSaveValue : "HorizonZeroDawn.exe", 0x0281A0E8, 0x658;
    
    // Loading if fast traveling.
    // WTF?! Why do I need two different values. I just wanna know if the fucking game is loading.
    // Testing showed that this value is equal to "2" if a fast travel was performed, "0" if otherwise.
    byte FastTravelValue : "HorizonZeroDawn.exe", 0x02816728, 0x905;
}

startup
{
    // A refresh rate of 20 or 30 should be all we need. Doing 60 refreshes takes a lot of system overhead away.
    refreshRate = 20;

    vars.isCurrentlyLoading = false;
    // vars.testloading = current.testloading == 
    vars.stopwatch = new Stopwatch();
}

update
{
    // Debug print
    print("[LR DEBUG] "
        + current.GameEnginePaused
        + " | "
        + current.FastTravelValue
        + " | "
        + current.RestartFromSaveValue
        + " == "
        + vars.isCurrentlyLoading
    );

    // Loading Check
    if (current.GameEnginePaused == 1)
    {
        if (current.FastTravelValue == 2 || current.RestartFromSaveValue == 0)
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
    // Btw, to read these print I use dbgview from the Sysinternals Suite.
    print("[LR DEBUG] Found HZD process!");
    print("[LR DEBUG] Using a refresh rate of " + refreshRate);
}

isLoading
{
    return vars.isCurrentlyLoading;
}

reset{}

split{}

start{}

exit{ timer.IsGameTimePaused = true; }