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
With all of the above up and running and showing IGT,  try to start the timer then invoke a load.

1. In HZD, simply perform a fast-travel.



##  Change Log

Empty for now
