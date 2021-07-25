
// See Cheat Table for more information about addresses

state("HorizonZeroDawn"){
    uint CurrentGameEngineState : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;
    uint ThisValue : "HorizonZeroDawn.exe", 0x02A1AA20, 0x718, 0xB88;
    // uint ThisOtherValue : "HorizonZeroDawn.exe", 0x02552888, 0x38C; // alternative value
}
startup{
    refreshRate = 30;
    vars.isCurrentlyLoading = false;
    vars.stopwatch = new Stopwatch();
}
update{
    // print("Current: " + current.CurrentGameEngineState + " " + current.ThisValue);
    // Theoretically we don't need to check the game engine state, but we're gonna do it anyways
    if (current.CurrentGameEngineState == 1 && (current.ThisValue == 17 || current.ThisValue == 41)){
        vars.isCurrentlyLoading = true;
    } else {
        vars.isCurrentlyLoading = false;
    }
}
isLoading{
    return vars.isCurrentlyLoading;
} // TODO:
init{ print("Found and attached to HorizonZeroDawn's process"); }
exit{ timer.IsGameTimePaused = true; }
split{}
reset{}
start{}