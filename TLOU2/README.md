# TLOU2 Load Removers

The rules us Naughty Dog's save file time, so this does not provide an official time.  We do not know exactly what a loading screen consists of, however it does seem to me that a loading screen may be defined as 
1. Loading starts immediately when a pause screen is shown.
2. The screen will be black.  Sometimes if long enough a gradient with moths appears.  Also sometimes a loading circle appears.  The moths will then fade to black again.  All of this is considered to be in the load.
3. The load ends when the screen is no longer completely black.

Also a load screen may occur on death, defined as follows:

1. The load starts when after the death animation, immediately when the screen turns black.
2. A tutorial screen appears.  When "x" is pressed, the screen turns back to black.
3. The load ends when the screen is no longer black.

The load remover has been designed to handle the above cases.  There may be other instances that are considered to be a load that are not defined as above.


##  Does it work?

These seem to work VERY well on my end, however different setups may cause different issues.  Also there could be some scenerios in which they break.  

The TLOU2 load remover works very strongly in starting the timer pause, i.e. the start of a load.  This is due to the strong feature set in the menus.  The load remover is however a bit weaker defining the end of a load, where sections of the screen are measured for pure black.  If the end of the load displays video that is too dark, it may not detect it as the end of the load.  This is easily fixable, but more testing and example failures will be needed.  Language will matter in you game settings.

- tlou2.vas: For English menus.
- tlou2French.vas: For French menus.

I have since added death load removal to both the French and English versions.  If you are worried about overloading your CPU then you can use the following file which does not detect death loads and will be very slightly easier on your PC:

- tlou2gitgud.vas: For English, no death load screen removal.

Based on the above, feel free to try these tools.  LiveSplit will still continue to measure your RTA time even if your IGT gets messed up from failed load detection.  I do however ask that if you try this, expect that this is beta-test sotware. I hope that if it does fail that you can provide feedback so that I can make the tools stronger.

Please see the Change Log to regarding the reason for updates to the .vas files.


## Testing

I *HIGHLY* Recommend testing this before attempting a run each day by doing a quick test.
With all of the above up and running and showing IGT,  try to start the timer then invoke a load.
There are 2 loading types for this game so you should test both.  Here's how to test for each case:

1. Skip/Restart loads: Load up a chapter or new game, then perform a skip cutscene/restart encounter. 
2. Death loads: I like to load up the Arcade since I can die fast.  Check that once "Next" appears in the bottom right, that 3.5 seconds is subtracted off and then the time pauses.  Time should be paused until the secodn black screen disappears.





##  Change Log

#### July 28, 2020:

###### New Features:

1. Now included removal of death loading screens!
2. Have tlou2gitgud.vas which does not detect death loads incase you are worried about CPU usage.

###### Fixes:

Another failure in PDub's stream resulted in moths unpausing the timer.  I've attempted to mitigate this by doing the 3 following things:

1. Increased black screen threshold
2. Moved a black screen probe point further from the moths in the top right.
3. Scan for the loading circle that appears after some time to ignore everything and lock-in the pause.  This greatly reduces laoding screen false-negatives.

I have also greatly reduced the amount of computation needed to scan for load screens by:

1. Reduce the scan size of the moth gradient from 1920x25 pixels to 1920x1 pixels. 25x factor improvement
2. Removed one of the 4 black screen probe points.
3. Perform slightly less floaitng point math when not needed.
4. Removed unused scan regions.



#### July 20, 2020: 

On PDub's stream there were 2 failures where moths unpaused the timer.  This is the first citing of a failure from moths being perfectly aligned that caused some sensing values to exceed values beyond expectations.  To find this twice in one run, PDub basically found a gunicorn.  This has now been fixed and it is recommended for everyone to use the latest vas files.

- Testing: Clips were made in each instance and were used to successfully reproduce the error.
- Rectification: Threshold values for the moths were increased to increase robustness.  Once the fix was put into place, the timer remained paused following identical tests.

These are the clips of each load remover failure, which have now been fixed:
- [Bad Moths 1](https://www.twitch.tv/pdub/clip/UgliestInventiveSrirachaM4xHeh)
- [Bad Moths 2](https://www.twitch.tv/pdub/clip/BrainyAmazingTomatoPeteZarollTie)
