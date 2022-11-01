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
	
	var scanThreshold = 11.0;

	// Checks
	if (settings["differentThreshold"])
	{
		if ((settings["PauseOnPauseMenu"] && (features["ResumeButton"].current > 10))
			|| ((features["BlackSquareMiddle"].current > 92.0) && (features["BlackSquareBR"].current > 92.0))
			|| (features["yellowExclamationMark"].current > 6 || features["otherYellowIcon"].current > 6)
			|| (features["ConfirmFT"].current > 10)
		)
		{	
			vars.isLoading = true;
		}
		// if none of the above apply, it's probably not a load
		else vars.isLoading = false;
	}

	else
	{
		if ((settings["PauseOnPauseMenu"] && (features["ResumeButton"].current > 17))
		|| ((features["BlackSquareMiddle"].current == 100.0) && (features["BlackSquareBR"].current == 100.0))
		|| (features["yellowExclamationMark"].current > 11 || features["otherYellowIcon"].current > 11)
		|| (features["ConfirmFT"].current > 17)
		)
		{	
			vars.isLoading = true;
		}
		// if none of the above apply, it's probably not a load
		else vars.isLoading = false;
	}
	
}

startup {
	refreshRate = 20;
	vars.isLoading = false;
	var scanThreshold = 11;

	// Syntax: settings.Add(id, default_value = true, description = null, parent = null)
	settings.Add("printDebug", true, "Debugging", null);
	settings.Add("PauseOnPauseMenu", false, "Pause on Pause menu", null);
	settings.Add("higherRefreshRate", false, "30fps", null);
	settings.Add("differentThreshold", false, "Different Threshold", null);
}

isLoading {

	return vars.isLoading;

}

init {
	
}

start {
	if (settings["higherRefreshRate"])
	{
		refreshRate = 30;
	}
	else refreshRate = 20;
}

exit {

}

reset {

}

split {

}

gameTime {

}