
state("HorizonZeroDawn")
{
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;
    // byte ThisValue1 : "HorizonZeroDawn.exe", 0x02F7EC30, 0x140, 0xE0, 0x0, 0xC0, 0x18, 0x130, 0xA44;
    // byte ThisValue2 : "HorizonZeroDawn.exe", 0x2FB61AC;
    byte ThisValue3 : "HorizonZeroDawn.exe", 0x0281A0E8, 0x658;
}

startup
{
    refreshRate = 30;
    vars.isCurrentlyLoading = false;
    vars.stopwatch = new Stopwatch();
}

update
{

    // print(current.GameEnginePaused + ", " + current.ThisValue3 + ", " + vars.isCurrentlyLoading);

    if (current.GameEnginePaused == 1 && current.ThisValue3 == 0)
    {
        print("[LR DEBUG] Loading...");
        vars.isCurrentlyLoading = true;
    }
    else
    {
        vars.isCurrentlyLoading = false;
    }

}

isLoading{
    return vars.isCurrentlyLoading;
}

init{ print("Found process"); }

exit{ timer.IsGameTimePaused = true; }

// TODO:
split{}
reset{}
start{}