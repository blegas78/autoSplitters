# Load Removers for `Horizon Zero Dawn™`™

These autosplitters were built based on the rules on [`speedrun.com/hzd`](https://www.speedrun.com/hzd) for the load-time definition.
In this case, quite simply, a load is defined whenever "Loading..." is seen in the bottom left corner of the screen.
This includes few cut scene pauses in the beginning of Any% runs, as well as every time a fast travel is performed.
This load remover checks the video feed for the "Loading...", and tells LiveSplit that it is a load whenever this appears.

#### The latest load removers (`.vas` files) can be downloaded on the [`Releases Page`](https://github.com/blegas78/autoSplitters/releases)

## Testing

I **HIGHLY** Recommend testing this before attempting a run each day by doing a quick test.

With all of the above up and running and showing IGT, try to start the timer and invoke a load by simply performing a fast-travel or loading a save.

## Variants + Scan Region settings

### Normal variant
> This is the best working, recommended variant for any runs on any platform.
###### More CPU performance sold seperatly OpieOP
 - Scan Region settings
   - X: 99
   - Y: 976
   - Width: 115
   - Height: 25

### PC/memory based variant
> "The REAL deal of autosplitting... if Saft'll ever finish it" -Saft

### Alternate/Aussie variant
> Variant with different tunings for everydayaussie. Uses the same scan region settings as the normal variant.

### 720p variant
> Variant for a 1280x720p canvas
- Scan Region settings
  - X: 66
  - Y: 651
  - Width: 76
  - Height: 12

### Alternate 720p variant

- Scan Region settings
  - X: 59
  - Y: 643
  - Height: 91
  - Width: 31

### 3440x1440 variant
> Variant for a 3440x1440 canvas. At the moment using VirtualCam with this resolution will crash OBS, but this should theoretically work. :elkjaerLUL: :pdubWorried:
- Scan Region settings
  - X: 572
  - Y: 1300
  - Width: 153
  - Height: 31

### German variant
> The german language has the smallest loading indicator text on loading screens :pepeEZ:

 - Scan Region settings
   - X: 99
   - Y: 976
   - Width: 55
   - Height: 22
   
### Brazilian Portuguese (pt-br) variant
> Variant for Brazilian Portuguese. Thanks to Habeebs for this variant!

 - Scan Region settings
   - X: 86
   - Y: 971
   - Width: 190
   - Height: 35

### Dev variant

> This LR now introduces efforts for testing that were talked about blegas's episode of the WTDW Podcast: This LR checks if the RESTART FROM SAVE option in the pause menu is *highlighted* and *unavailiable* (currently, using this is against the speedrun.com/hzd rules)

 - Scan Region settings
   - Set X to 0
   - Set Y to 0
   - Set Width to 1920
   - Set Height to 1080


### Classic variant
> Classic variant with the old scan region settings

 - Scan Region settings
   - X: 0
   - Y: 0
   - Width: 1920
   - Height: 1080


##  Change Log

###### 18.12.2021:
- Updates to memory based Load Remover for patch 1.11.1
- Added a variant for the Brazilian Portuguese (pt-br) language
  - Thanks to DorianSnowball and Habeebs 

###### 29.05.2021:
- Efforts to lower CPU usage
  - Shrunken Scan Region size (See Scan Region below)
  - Removed "start" WatchZone
  - Removed "isLoading**a**" WatchZone, leaving the main WatchZone as the only feature to scan for
  - Enforcing a refresh rate of 30fps
- Added support for the german language

## Problems/Issues specific to this load remover

--
