init
{
	vars.timerModel = new TimerModel { CurrentState = timer };

	vars.skipFalling = false;

	vars.moths = false;
	vars.waitingMothsStart = false;
	vars.waitingMothsEnd = false;

	vars.isBlack = false;
	vars.definitelyNotMoths = false;
	vars.blackness = 0.0;
	vars.waitingForBlackEnd = false;

	vars.loadingStarted = false;

	vars.backShown = false;

}

update
{
	vars.backPrior = features["BackButton"].old > 15.0;
	
	if ( vars.backPrior || vars.waitingForBlackEnd || vars.waitingMothsStart || vars.moths ) {
		vars.blackness =	Math.Pow( features["black1"].current - 94.1176, 2.0) + 
					Math.Pow( features["black2"].current - 94.1176, 2.0) + 
					//Math.Pow( features["black3"].current - 94.1176, 2.0) + 
					Math.Pow( features["black4"].current - 94.1176, 2.0);
	
		vars.isBlack  = vars.blackness <= 1.0;
		//vars.definitelyNotMoths =  vars.blackness > 1000.0;	// Failed at 1345 from PDub: https://www.twitch.tv/pdub/clip/UgliestInventiveSrirachaM4xHeh
								 	// Failed at 1020 from PDub: https://www.twitch.tv/pdub/clip/BrainyAmazingTomatoPeteZarollTie
									// Per the above 2 failures, moving threshold to 1500.  At final Ellie guitar, value should be at ~2000
		vars.definitelyNotMoths =  vars.blackness > 1500.0;	// Failed at 1458 from PDub: https://clips.twitch.tv/CharmingPoisedLocustOhMyDog
									// Per the above, change to 1750.  Also moved black4 left 160 pixels left, further from moths.
									// Similarly, also moved black1 a bit left and down
		vars.definitelyNotMoths =  vars.blackness > 1750.0;

	}

	vars.skipFalling =	(
					vars.backPrior &&
					features["BackButton"].current <= 15.0
				) && (
					vars.isBlack
				);

	vars.backShown = features["BackButton"].current > 15.0;
}


isLoading
{
	

	// for player-invokes skip cutscene or RE/RC
	if( vars.skipFalling ) {
		vars.loadingStarted = true;
		vars.waitingMothsStart = true;
		
		vars.waitingForBlackEnd = false;
		vars.waitingMothsEnd = false;
		vars.isBlack = true; // HACK: doing this since the below will think loading is done, not black.
		
	}

	if( vars.waitingMothsStart || vars.waitingMothsEnd ) {
		if( !vars.moths ) {
			if( (features["mothGradient"].current > 30.0) ) {
				vars.moths = true;
			}
		} else {
			if( (vars.definitelyNotMoths && !(features["LoadingCircle"].current > 25.0)) || !(features["mothGradient"].current > 15.0) ) {
				vars.moths = false;
			}
		}
	}

	if ( vars.waitingMothsStart && vars.moths ) {
		vars.waitingMothsStart = false;
		vars.waitingMothsEnd = true;
	} 

	if ( vars.waitingMothsEnd && !vars.moths ) {
		vars.waitingMothsEnd = false;
		vars.waitingForBlackEnd = true;
	}

	// Death-loading code goes here

	if (	vars.loadingStarted && (
		( vars.waitingForBlackEnd && !vars.isBlack ) ||
		( vars.waitingMothsStart && !vars.isBlack  ) )) {
		vars.loadingStarted = false;

		vars.waitingForBlackEnd = false;
		vars.waitingMothsEnd = false;
		vars.waitingMothsStart = false;

	}
	
	return	vars.loadingStarted || vars.backShown;
}
