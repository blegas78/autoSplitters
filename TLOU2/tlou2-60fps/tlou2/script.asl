init
{
	//ars.frameCounterv = 0;
	vars.currentlyLoading = false;

	// vars.fps = 0;//0.0;
	//vars.oldTime = TimeSpan.Zero;

	vars.ticksForTimeCorrection = 0;

	vars.timerModel = new TimerModel { CurrentState = timer };

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

reset 
{
/*
	vars.currentlyLoading = false;
	vars.ticksForTimeCorrection = 480000;

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
	vars.deathLoad = false; */
}

update
{
	vars.backPrior =	features["BackButton"].old > 15.0;
	vars.skipPrior =	features["SkipCinematic"].old > 15.0;
	vars.restartPrior =	features["Restart"].old > 15.0;

	// This if is purely to aid in CPU usage optimization though the effects are probably negligible 
	if ( vars.backPrior || vars.waitingForBlackEnd || vars.waitingMothsStart || vars.moths ) {
		// vars.blackness corresponds to a value where the lower the value, the more black the measured areas
		// This is done using the sum of the squared errors
		// The value of 94.1176 was found empirically using LiveSplit.
		// Unsure why features[...].current will go either both up or down when non-black, but this seems to work

		var black1 = features["black1"].current;
		var black2 = features["black2"].current;
		var black3 = features["black3"].current;
		var black4 = features["black4"].current;

		vars.blackness = Math.Pow(black1 - 94.1176, 2.0) + 
				 Math.Pow(black2 - 94.1176, 2.0) + 
				 Math.Pow(black3 - 94.1176, 2.0) + 
				 Math.Pow(black4 - 94.1176, 2.0);
	
		// Designates when the screen is absolutely black:
		vars.isBlack  = vars.blackness <= 1.0;

		// Subtract the worst match in case a loading screen moth flies under one of them.
		var minBlack = Math.Min(black1, Math.Min(black2, Math.Min(black3, black4)));
		var mothBlackness = vars.blackness - Math.Pow(minBlack - 94.1176, 2.0);

		// The following uses the same blackness value to determine the likelihood that the curent screen is not moths
		// This is where moth RNG can break the laod remover, perhaps there is better logic or black probe placement 
		//vars.definitelyNotMoths =  mothBlackness > 1000.0;	// Failed at 1345 from PDub: https://www.twitch.tv/pdub/clip/UgliestInventiveSrirachaM4xHeh
								 	// Failed at 1020 from PDub: https://www.twitch.tv/pdub/clip/BrainyAmazingTomatoPeteZarollTie
									// Per the above 2 failures, moving threshold to 1500.  At final Ellie guitar, value should be at ~2000
		//vars.definitelyNotMoths =  mothBlackness > 1500.0;	// Failed at 1458 from PDub: https://clips.twitch.tv/CharmingPoisedLocustOhMyDog
									// Per the above, change to 1750.  Also moved black4 left 160 pixels left, further from moths.
									// Similarly, also moved black1 a bit left and down
		vars.definitelyNotMoths =  mothBlackness > 1750.0;

	}

	

	//vars.skipFalling =	(
	//				vars.backPrior &&
	//				features["BackButton"].current <= 15.0
	//			) && (
	//				vars.isBlack
	//			);

	// This logic uses the concept of falling/rising edges to get the exact trigger when a skip cutscen was selected
	if(!vars.skipFalling && vars.skipWasPrimed) {
		if ((	vars.backPrior &&
				features["BackButton"].current <= 15.0
			) && (
				vars.isBlack
			)) {
				vars.skipFalling = true;
			}
	} else {
		vars.skipFalling = false;
	}
	// We only get ready to apply the above logic when the back button is shown and "SkipCinematic" is present
	vars.skipWasPrimed =	features["BackButton"].current > 15.0 && features["SkipCinematic"].current > 15.0;


	// Similar to the logic above, but for detecting the instant RE/RC was selected
	if(!vars.restartFalling && vars.restartWasPrimed) {
		if ((	vars.backPrior &&
				features["BackButton"].current <= 15.0
			) && (
				vars.isBlack
			)) {
				vars.restartFalling = true;
			}
	} else {
		vars.restartFalling = false;
	}
	// We only get ready to apply the above logic when the back button is shown and "Restart" is present
	vars.restartWasPrimed =	features["BackButton"].current > 15.0 && features["Restart"].current > 15.0;


	// Per ScarlettTheHuman/Happy_Asteroid/Kevin700p's findings, each RE/RC should add 1 second to the timer
	if(vars.restartFalling) {	// Only do this for RE/RC, not Skip cutscenes
		//vars.ticksForTimeCorrection += 990;	// we add a full second but need to make sure to offset time adjustments
		//vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 1, 0) );

		// This performs an effective ceil() on seconds:
		var millisecondsToAdd = 1500 - vars.timerModel.CurrentState.CurrentTime.GameTime.Milliseconds;
		//if(millisecondsToAdd < 1000) {
			// vars.ticksForTimeCorrection += millisecondsToAdd-9;
			vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 0, millisecondsToAdd) );
			vars.ticksForTimeCorrection = vars.timerModel.CurrentState.CurrentTime.GameTime.TotalMilliseconds + 500;
		//}
	}

	// Method 1 for ND IGT time correction: Frame counting -- FAILS
	// Every 3 frames, we subract off the truncated time that ND IGT does not acocunt for
	// at 60fps: frameTime = 1/60 = 0.016666666...s = 16.666...ms
	// Truncated at the millisecond level means ND is only adding 16ms per frame
	// So to correct LiveSplit time, we need to remove 0.6666...ms for each frame
	// However since we can only remove at the millisecond level with TimeSpan we remove at every 3 frames
	// the amount to be removed is 3* 0.66666ms = 2ms
	//
	// This method FAILS because the pipeline of PS -> OBS-> Virtualcam -> VAS may have frame process drops
	// This means that not enough time gets remove.  On my systedm it's ~1% off
	// if(!vars.currentlyLoading && vars.frameCounter++ >= 3) {
	// 	vars.frameCounter = 1;
	// 	vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 0, -2) );
	// }

	// The below will measure the incoming fps every 60 frames (not dependence on frameCounter, uncommenting this will break other things)
	// if(!vars.currentlyLoading && vars.frameCounter++ >= 60) {
	// 	vars.frameCounter = 1;
	// 	vars.fps = 60.0*10000000.0/(float)(vars.timerModel.CurrentState.CurrentTime.GameTime.Ticks - vars.oldTime.Ticks);
	// 	vars.oldTime = vars.timerModel.CurrentState.CurrentTime.GameTime;
	// }

	// Method 2 for ND IGT time correction: asynchronous system time-based correction
	// This checks for the total number of milliseconds.  Ticks could be used (units of 100ns) but result in integer overflow errors
	// 60fps:
	// Right now for 60fps we modify the time after 60 frames, where 60*1/60 = 1.0 seconds
	// Each correction is at the truncated amount * the 60 frames.  So 60*0.000666666 = 0.040
	// Because time will be corrected, the next tick will be at:  oldTicks + (1.0 - 0.040)*1000 = oldTicks + 960
	// 59.94fps:
	// Right now for 29.97fps we modify the time after 60 frames, where 60*1/59.94 = 1.001001001 seconds
	// Each correction is at the truncated amount * the 60 frames.  So 60*(1/59.94-0.016) ~= 60*0.00068335001 = 0.041001001
	// Because time will be corrected, the next tick will be at:  oldTicks + (60*1/59.94 - 60*(1/59.94-0.016))*1000 = oldTicks + 960
	// Note on imprecision: rounding the milliseconds from 41.001001 to 41 results in an error of 1.88 seconds over 5 hours
	// 30fps:
	// Right now for 30fps we modify the time after 30 frames, where 30*1/30 = 1.0 seconds
	// Each correction is at the truncated amount * the 30 frames.  So 30*0.0003333333 = 0.010
	// Because time will be corrected, the next tick will be at:  oldTicks + (1.0 - 0.010)*1000 = oldTicks + 990
	// 29.97fps:
	// Right now for 29.97fps we modify the time after 30 frames, where 30*1/29.97 = 1.001001001 seconds
	// Each correction is at the truncated amount * the 30 frames.  So 30*(1/29.97-0.033) ~= 30*0.00036670003 = 0.011001001
	// Because time will be corrected, the next tick will be at:  oldTicks + (30*1/29.97 - 30*(1/29.97-0.033))*1000 = oldTicks + 990
	// Note on imprecision: rounding the milliseconds from 11.001001 to 11 results in an error of 1.82 seconds over 5 hours
	if( !vars.currentlyLoading && vars.timerModel.CurrentState.CurrentTime.GameTime.TotalMilliseconds >= vars.ticksForTimeCorrection) {
		// 60-fps:
		// vars.ticksForTimeCorrection += 960;
		// vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 0, -41) );
		// 29.97fps:
		vars.ticksForTimeCorrection += 990;
		vars.timerModel.CurrentState.SetGameTime(vars.timerModel.CurrentState.CurrentTime.GameTime + new TimeSpan( 0, 0, 0, 0, -11) );
	}
	// At start of IGT, reset the comparison for time correction:
	if(vars.timerModel.CurrentState.CurrentTime.GameTime.TotalMilliseconds < 400) {
	 	vars.ticksForTimeCorrection = 500; // we will start right in the middle at 0.5 seconds toi adjust time
	}


	// Hysteresis on the "NEXT" in death loading due to fade-in: 
	// TODO: This appears to not work anymore, maybe due to a patch and changed HUD?
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
}


isLoading
{
	// For player-invoked skip cutscene or RE/RC
	// When the skip occurs, we enter a state of waiting for moths OR waiting for the screen to become obviously non-black
	if( vars.skipFalling || vars.restartFalling ) {
		vars.loadingStarted = true;	// No matter what we know that we are in a loading screen
		vars.waitingMothsStart = true;
		
		vars.waitingForBlackEnd = false;
		vars.waitingMothsEnd = false;
		vars.isBlack = true; // HACK: doing this since the below will think loading is done, not black.
		
	}

	if( vars.waitingMothsStart || vars.waitingMothsEnd ) {
		if( !vars.moths ) {
			// If the top pixel row shows presence of the brightness gradient, then this is likely a moth screen
			if( (features["mothGradient"].current > 30.0) ) {
				vars.moths = true;
			}
		} else {
			// Checks conditions to see if the moith screen is gone
			// First we know that moths are gone if the blackness test fails and definitelyNotMoths is true
			// ^ however, if we detect a laoding  circle then definitelyNotMoths is invalid and we had bad moth RNG. laoding circle FTW
			// Also we know that moths don't exist if the upper image gradient doesn't exist
			// Tuning this logic and associated values is best done with Ellie at the very final guitar since
			// 1) the graident check will pass - a false positive
			// 2) the blackness probe points in the lower left of the screen are similarly dark, also causing false positives
			// AFAIK this is the only troublesome spot in the game.
			if( (vars.definitelyNotMoths && !(features["LoadingCircle"].current > 25.0)) || !(features["mothGradient"].current > 15.0) ) {
				vars.moths = false;
			}
		}
	}

	// If moths were found when in the waiting for moths state, then enter the state of waiting for moths to end
	if ( vars.waitingMothsStart && vars.moths ) {
		vars.waitingMothsStart = false;
		vars.waitingMothsEnd = true;
	} 

	// If we are waiting for moths to end and they are no longer present, then wait for the black screen to end
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


	// Conditions for the end of a loading screen:
	// We must have always priorly entered a known loading screen condition+ and either:
	// 1) the black screen ended when we were waiting for it
	// 2) we were waiting for moths but the screen is no longer showign definitive black
	if (	vars.loadingStarted && (
		( vars.waitingForBlackEnd && !vars.isBlack ) ||
		( vars.waitingMothsStart && !vars.isBlack  ) )) {
		vars.loadingStarted = false;

		vars.waitingForBlackEnd = false;
		vars.waitingMothsEnd = false;
		vars.waitingMothsStart = false;

		vars.waitingDeathEnd = false;
	}
	
	// A load is defined wither by conditions of the above state machines or hard set when ina pause menu or laoding screen
	vars.currentlyLoading = vars.loadingStarted || vars.backShown || vars.deathLoad;
	return	vars.currentlyLoading;
}
