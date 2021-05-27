init
{
	vars.timerModel = new TimerModel { CurrentState = timer };

	vars.encounterFalling = false;
	vars.encounterShown = false;

	vars.skipFalling = false;
	vars.restartFalling = false;
	vars.skipWasPrimed = false;
	vars.restartWasPrimed = false;

	vars.moths = false;
	vars.waitingMothsStart = false;
	vars.waitingMothsEnd = false;

	vars.isBlack = false;
	vars.definitelyNotMoths = false;
	vars.blackness = 0.0;
	vars.waitingForBlackEnd = false;

	vars.loadingStarted = false;

	vars.backShown = false;

	vars.waitingDeathEnd = false;
	vars.deathRising = false;
	vars.deathLoad = false;
}

update
{
	vars.backPrior =	features["BackButton"].old > 15.0;
	vars.skipPrior =	features["SkipCinematic"].old > 15.0;
	vars.restartPrior =	features["Restart"].old > 15.0;
	
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

	

	//vars.skipFalling =	(
	//				vars.backPrior &&
	//				features["BackButton"].current <= 15.0
	//			) && (
	//				vars.isBlack
	//			);

	if(!vars.skipFalling && vars.skipWasPrimed) {
		if (		(
					vars.backPrior &&
					features["BackButton"].current <= 15.0
				) && (
					vars.isBlack
				) 
			) {
				vars.skipFalling = true;
			}
	} else {
		vars.skipFalling = false;
	}

	if(!vars.restartFalling && vars.restartWasPrimed) {
		if (		(
					vars.backPrior &&
					features["BackButton"].current <= 15.0
				) && (
					vars.isBlack
				) 
			) {
				vars.restartFalling = true;
			}
	} else {
		vars.restartFalling = false;
	}

	vars.skipWasPrimed =	features["BackButton"].current > 15.0 &&
				features["SkipCinematic"].current > 15.0;

	vars.restartWasPrimed =	features["BackButton"].current > 15.0 &&
				features["Restart"].current > 15.0;


	if(vars.restartFalling) {	// Only do this for RE/RC, not Skip cutscenes
		vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 0, 400) );
	}

	// Hysteresis on the "NEXT" in death loading due to fade-in: 
	if( !vars.deathLoad && features["DeathNext"].current > 15.0 ) {
		vars.deathLoad = true;
		vars.deathRising = true;
	} else {
		vars.deathRising = false;
	}
	if( vars.deathLoad && features["DeathNext"].current < 5.0) {
		vars.deathLoad = false;
	}

	// If a rising edge is detected on a death, subtract off the 3.5 seconds it took to appear
	if ( vars.deathRising ) {
		vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, -3, -500) );
	}


	vars.backShown = features["BackButton"].current > 15.0;

	// Hysteresis on the "NEXT" in Encounter end screen : 
	if( !vars.encounterShown && features["EncounterNext"].current > 20.0 ) {
		vars.encounterShown = true;
	} 
	if( vars.encounterShown && features["EncounterNext"].current < 10.0) {
		vars.encounterShown = false;
		vars.encounterFalling = true;
	} else {
		vars.encounterFalling = false;
	}
}


isLoading
{
	

	// for player-invokes skip cutscene or RE/RC ( now Encounter Screen too )
	//if( vars.skipFalling || vars.restartFalling || vars.encounterFalling ) {
	if( vars.encounterFalling ) {
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

	// For death screen:
	if ( vars.deathRising ) {
		vars.loadingStarted = true;
		
		vars.waitingDeathEnd = true;
	}

	if ( vars.waitingDeathEnd && !vars.deathLoad) {
		vars.waitingDeathEnd = false;
		vars.waitingForBlackEnd = true;
		vars.isBlack = true; // HACK: doing this since the below will think loading is done, not black.
	}

	if (	vars.loadingStarted && (
		( vars.waitingForBlackEnd && !vars.isBlack ) ||
		( vars.waitingMothsStart && !vars.isBlack  ) )) {
		vars.loadingStarted = false;

		vars.waitingForBlackEnd = false;
		vars.waitingMothsEnd = false;
		vars.waitingMothsStart = false;

		vars.waitingDeathEnd = false;
	}
	
	//return	vars.loadingStarted || vars.backShown || vars.deathLoad;
	return	vars.loadingStarted || vars.deathLoad;
}
