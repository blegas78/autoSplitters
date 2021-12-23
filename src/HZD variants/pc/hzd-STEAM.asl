
state("HorizonZeroDawn", "v1.11.1")
{
    // "the magic variable, we have no idea why it works" -x34
    // ... it doesn't work.. elkjaerRIP
    // a game restart later: not working anymore
    //uint garbage : "HorizonZeroDawn.exe", 0x07163548, 0xD68, 0xB88, 0xA88, 0xF78, 0xF80, 0x948, 0x8D0;


    // Map/Inventory (all tabs) open
    // 1 = true
    // 0 = false
    byte MapInventory : "HorizonZeroDawn.exe", 0x0283D6A0, 0x599;


    // Maybe the same as GameEnginePaused from v1.10
    //uint GameEnginePaused : "HorizonZeroDawn.exe", 0x071346C8, 0x4E8, 0xE38, 0xA88, 0xF78, 0xF80, 0x8E8, 0xE1C;
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x07138C78, 0x3BC;


    // New Value:
    // **Should** be 0 if not loading.
    byte NewValue2 : "HorizonZeroDawn.exe", 0x026A2AC0, 0xC0, 0xA0, 0x10, 0x130, 0xC8, 0x12;


    // Map open (same one as in v1.10)
    // 0 = false
    // 1 = true
    // -> Not useful for this load remover
    uint MapSelectedInMenu : "HorizonZeroDawn.exe", 0x0231A020, 0xE8;


    // literally something
    //byte Something : "HorizonZeroDawn.exe", 0x028367A8, 0x4D8;
    //byte Something2 : "HorizonZeroDawn.exe", 0x028367A8, 0x4D9;
}

state("HorizonZeroDawn", "v1.10")
{
    // Game Engine paused value. Equal to "1" if game engine is paused, "0" if otherwise.
    // This one seems to be stable and reliable
    uint GameEnginePaused : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7C;

    // -> Is map open?
    // never tested elkjaerRIP 
    // uint MapSelectedInMenu : "HorizonZeroDawn.exe", 0x0298BC48, 0x60, 0x398, 0x0, 0xCC8, 0x0, 0x50, 0xC7E;

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

// At startup of LiveSplit/loading the ASL file
startup
{
    // Setting up variables
    vars.isCurrentlyLoading = false;
    //vars.LoadingFromMM = false; // is this still needed since the usage was commented?


    // Settings need to be added here
    // Syntax: settings.Add(id, default_value = true, description = null, parent = null)
    settings.Add("moreRefreshRate", false, "Use a refresh rate of 20");
    settings.Add("print", true, "Print debug output");
    settings.Add("PauseOnPauseMenu", true, "Pause the timer on the Pause menu");
}

update
{
    // Check if version is not set
    // Just a failsafe atm, can probably be removed
    if (version == "")
        return false;

    // Checking settings - there's probably a better way to do this but here we go LUL
    if (settings["moreRefreshRate"])
        { refreshRate = 20; } else { refreshRate = 1; };

    // Debug printing
    // When a debug print is needed, maybe add it here
    if (settings["print"])
    {
        print(
            "[LR DEBUG] MapInventory: "
            + current.MapInventory
            + " GameEng: "
            + current.GameEnginePaused
            + " NewValue2: "
            + current.NewValue2
        );
    };


    // Loading check
    if (current.GameEnginePaused == 1)
    {
        if (current.NewValue2 >= 1)
        {
            vars.isCurrentlyLoading = true;
        }
        else if (current.GameEnginePaused == 1 && current.MapInventory == 0 && MapSelectedInMenu == 0)
        {
            vars.isCurrentlyLoading = true;
        }
        else vars.isCurrentlyLoading = false;
    }
    else vars.isCurrentlyLoading = false;

    /* // Scars attempt at the loading check 
    if (current.GameEnginePaused == 1)
    {
        if (current.MapInventory == 0)
        {
            if (setting[PauseOnPauseMenu])
            {
                vars.isCurrentlyLoading = true;
            }
            else if (current. == ) // TODO add pause menu variable
            {
                vars.isCurrentlyLoading = true;
            }
            else 
            {
                vars.isCurrentlyLoading = false;
            }
        }
        else 
        {
            vars.isCurrentlyLoading = false;
        }
    }
    */
}



// Init of the LR after process was found
init
{
    // Debug print
    if (settings["print"]) { print("[LR DEBUG] Found HZD process!"); }

    // Check first module size to determine game version
    // I don't know any other sizes, so we're doing this
    if (modules.First().ModuleMemorySize == 150884352)
    { version = "v1.11.1"; } else { version = "v1.10"; };

    // A refresh rate of 10 should be all we need
    // since doing more than this takes a lot of CPU overhead away.
    // Anyways, there's a setting for more, if needed.
    refreshRate = 4;
}


isLoading
{
    return vars.isCurrentlyLoading;
}


reset
{
    // This isn't really nessesarry but I might aswell use this address elkjaerLUL
    //if (current.garbage == 0) return true;
}


// There will probably never be anything that we CAN use for splitting
// Simply for the fact that if we base this on the current route, we'd
// have to change this every single time the route changes
// (except at Aratak or HADES to end the run)
split{}


// Start timer
start
{
    // The commented code below will start the timer whenever you hit CONTINUE or load a save from the main menu
    //if ((old.garbage == 0) && (current.garbage == 1)) vars.LoadingFromMM = true;
    //if (vars.LoadingFromMM) if (current.garbage == 2)
    //{
    //vars.LoadingFromMM = false;
    //return true;
    //}
}

// This should prevent LiveSplit from crashing whenever the game process exits
exit
{ timer.IsGameTimePaused = true; }


// TODO(JustSaft): Start using this: https://github.com/LiveSplit/LiveSplit.AutoSplitters#memory