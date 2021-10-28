init
{
    // reduces CPU usage (maybe)
    var refreshRate = 30;
}

startup
{
    vars.NewGameDialogue = false;
    // This is set to true if the 'New Game' dialogue
    // is shown and stays true until a loading screen is seen

    vars.pauseTimer = false;
    vars.ThisIsLoadingScreen = false;
    vars.ThisIsMainMenu = false;
    vars.ScreenIsBlack = false;
}

reset
{
    // Automatic timer reset
    // Timer will reset as soon as the New Game Dialoge shows up
    // Sorry future me Kappa
    return vars.NewGameDialogue;
}

isLoading
{
    // Will pause the timer if one of the three variables in update{} is true
	return vars.pauseTimer;
}

start
{
    // Timer automagically starts if the 'New Game' dialogue was shown && a loading screen is seen
    if (vars.NewGameDialogue && vars.ThisIsLoadingScreen){
        return true;
    }
}

update
{
    // TODO: find a more efficient way than check a thousand If's
    // Check for either the right or left half of the loading bar
    if ((features["LoadingBar1"].current > 15) | (features["LoadingBar2"].current > 85)){
        vars.ThisIsLoadingScreen = true;

        // Reset NewGameDialogue because there's no reason to leave it on true
        vars.NewGameDialogue = false;
    }else
    {
        vars.ThisIsLoadingScreen = false;
    }

    // Check for the 'CONTROL' logo and the top and bottom edges to determine if the main menu is shown
    // TODO: This check can probably be fooled by going to a dark area and bringing up the pause menu
    if ((features["LogoKreygasm"].current > 5) && ((features["ScreenTopEdge"].current > 1.5) & (features["ScreenBottomEdge"].current > 7)))
    {
        vars.ThisIsLoadingScreen = true;
    }else
    {
        vars.ThisIsLoadingScreen = false;
    }

    // Check if the screen is black in these 4 areas of the screen
    // If this works that it's not as stupid as it might seem like 
    if ((features["black1"].current + features["black2"].current + features["black3"].current + features["black4"].current / 4) > 85)
    {
        vars.ScreenIsBlack = true;
    }else
    {
        vars.ScreenIsBlack = false;
    }

    // Checks for the dialog that appears when selecting 'New Game' in the main menu
    // TODO: This doesn't work on console, because on PC, there's a 'Exit Game' option wich moves the menu items (centered menues suck)
    if (features["NewGameDialogue"].current > 15)
    {
        vars.NewGameDialogue = true;
    }

    // Update the pause timer variable if one of these is true.
    vars.pauseTimer = vars.ThisIsMainMenu || vars.ThisIsLoadingScreen || vars.ScreenIsBlack;
}