/*
   _             _          _  _  _            _  _  _  _      
  (_)           (_)        (_)(_)(_)          (_)(_)(_)(_)_    
  (_)           (_)           (_)             (_)        (_)   
  (_)     _     (_)           (_)             (_) _  _  _(_)   
  (_)   _(_)_   (_)           (_)             (_)(_)(_)(_)     
  (_)  (_) (_)  (_)           (_)             (_)              
  (_)_(_)   (_)_(_)         _ (_) _           (_)              
    (_)       (_)          (_)(_)(_)          (_)              
                                                               
                                                               

*/


update {
	
	// Check for the Pause menu option, which I'll probably remove since
	// they'll probably be not allowed for leaderboard submissions
	if (settings["PauseOnPauseMenu"] && features["ResumeButton"].current > scanThreshold)
	{	
		vars.isCurrentlyLoading = true;
	}

	else

	{
		// Check if screen is black
		if ((features["BlackSquareMiddle"].current > scanThreshold) && (features["BlackSquareBR"].current > scanThreshold))
		{
			vars.isCurrentlyLoading = true;
		}

		// Check if there's the yellow exclamation mark on screen
		else if (features["yellowExclamationMark"].current > scanThreshold)
		{
			vars.isCurrentlyLoading = true;
		}
		
		// if none of the above apply, it's probably not a load
		else vars.isCurrentlyLoading = false;
	}

}

start {
	// Check for settings
	// Put it here so it doesn't get run while the timer is running
	if (settings["higherThreshold"])
	{
		scanThreshold = 22.0;
	}
	else scanThreshold = 11.0;

	if (settings["higherRefreshRate"])
	{
		refreshRate = 30;
	}
	else refreshRate = 20;
}

startup {
	refreshRate = 20;
	int scanThreshold = 11.0;
	vars.isCurrentlyLoading = false;

	// Syntax: settings.Add(id, default_value = true, description = null, parent = null)
	settings.Add("printDebug", true, "Enable prints (for debugging)", null);
	settings.Add("PauseOnPauseMenu", false, "Pause the timer if Pause menu is open", null);
	settings.Add("higherThreshold", false, "Compare against a higher threshold", null);
	settings.Add("higherRefreshRate", false, "Use 30fps instead of 20fps", null);
}

isLoading {

	return vars.isLoading;

}