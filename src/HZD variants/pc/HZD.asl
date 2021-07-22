
// See Cheat Table for more information about addresses

state("HorizonZeroDawn"){
    // uint CurrentGameEngineState : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;
    // byte GameLoading2 : "HorizonZeroDawn.exe", 0x0711D7F8, 0x50, 0x110, 0xE8, 0x110, 0x68, 0x208, 0x114;
    byte GameLoading : "HorizonZeroDawn.exe", 0x02A1A050, 0x58, 0xE8, 0x0, 0x38, 0x218, 0xA47;
}
startup{
    refreshRate = 30;
    vars.isCurrentlyLoading = false;
    vars.stopwatch = new Stopwatch();
}
update{
    // print("Current: " + current.GameLoading);
    if (current.GameLoading == 255){
        vars.isCurrentlyLoading = true;
    } else {
        vars.isCurrentlyLoading = false;
    }
}
isLoading{
    return vars.isCurrentlyLoading;
} // TODO:
init{ print("attached to game process"); }
exit{ timer.IsGameTimePaused = true; }
split{}
reset{}
start{}