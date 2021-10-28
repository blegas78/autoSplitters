
// See Cheat Table for more information about addresses

state("HorizonZeroDawn"){
    uint EnginePaused : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;
    uint Value1 : "HorizonZeroDawn.exe", 0x02F7EC30, 0x140, 0xE0, 0x0, 0xC0, 0x18, 0x130, 0xA44;
}
startup{
    refreshRate = 30;
    vars.isCurrentlyLoading = false;
    vars.stopwatch = new Stopwatch();
}
update{
    print(EnginePaused + ", " + Value1 + ", " + vars.isCurrentlyLoading)
    if (EnginePaused == 1 && Value1 == 2){
        vars.isCurrentlyLoading = true;
    } else {
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