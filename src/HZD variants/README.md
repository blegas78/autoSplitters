# HZD Load Removers

Video with information and installation: [https://www.youtube.com/watch?v=lmLSUKhvSrg](https://www.youtube.com/watch?v=lmLSUKhvSrg)

The hzd.vas profile was built based on the rules on speedrun.com for the load-time definition.  In this case, quite simply, a "load" is defined whenever "Loading..." is seen in the bottom left corner of the screen.  This includes few cut scene pauses in the beginning for Any% runs, as well as every time a fast travel is performed.  

This load remover checks the video feed for the "Loading...", and tells LiveSplit that it is a load whenever this appears.


##  Does it work?

These seem to work VERY well on my end, however different setups may cause different issues.  Also there could be some scenerios in which they break.  

The HZD load remover has worked great for a few people.   So far measuring the loadless times compared to what the load remover does live has resulted in less than 1 second of error over 2-3 hour runs.  Setup has not been too hard, except that one person needed some numbers changed probably due to some video settings.  I recommend starting with hzd.vas, checking your video settings, and if all that fails then try the hzdAussie.vas file which i built with minimally different tunings.  Currently only English is supported.

- hzd.vas: Tunings that work for me.
- hzdAussie.vas: Tunings that have worked for others, including a person that had success using PS4Share.

Please see the Change Log to regarding the reason for updates to the .vas files.



## Testing

I *HIGHLY* Recommend testing this before attempting a run each day by doing a quick test.
With all of the above up and running and showing IGT, try to start the timer then invoke a load by simply performing a fast-travel or loading a save.

 - VAS Scan Region settings
   - X is set to 99
   - Y is set to 976
   - Width is set to 115
   - Height is set to 25


##  Change Log

- Efforts to lower CPU usage
  - Shrunken Scan Region size (See Scan Region above)
  - Removed "start" WatchZone
  - Removed "isLoading**a**" WatchZone, leaving the main WatchZone as the only feature to scan for


#### Classic variant

I added a classic variant where the scan region settings are the same as before this update (just as a backup)
 - Scan Region settings
   - Set X to 0
   - Set Y to 0
   - Set Width to 1920
   - Set Height to 1080

#### German variant

The german language has the smallest loading indicator text on loading screens
 - Scan Region settings
   - Set X to 99
   - Set Y to 976
   - Set Width to 82
   - Set Height to 22