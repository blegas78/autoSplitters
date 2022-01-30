# Load Removers for `Horizon Zero Dawn™`™

These autosplitters were built based on the rules on [`speedrun.com/hzd`](https://www.speedrun.com/hzd) for the load-time definition.
In this case, quite simply, a load is defined whenever "Loading..." is seen in the bottom left corner of the screen.
This includes few cut scene pauses in the beginning of Any% runs, as well as every time a fast travel is performed.
This load remover checks the video feed for the "Loading...", and tells LiveSplit that it is a load whenever this appears.

#### The latest load removers (`.vas` files) can be downloaded on the [`Releases Page`](https://github.com/blegas78/autoSplitters/releases)

## Testing

I **HIGHLY** Recommend testing this before attempting a run each day by doing a quick test.

With all of the above up and running and showing IGT, try to start the timer and invoke a load by simply performing a fast-travel or loading a save.

## Variants & Scan Region settings (notice me senpai)


### Normal variant

This is the best working, recommended variant for any runs on any platform.
###### More CPU performance sold seperatly OpieOP

 - Scan Region settings
   - X: 99
   - Y: 976
   - Width: 115
   - Height: 25


### PC (memory based) variant (Steam version only) *

You should use this variant for any runs on PC once development finishes.
Currently, this load remover only works with the [Steam](https://store.steampowered.com/app/1151640/Horizon_Zero_Dawn_Complete_Edition/) edition of the game.

> If you still want to test this, the `.asl` file can be found in `src/HZD variants/pc`.

> The memory based LR should be available in LiveSplit itself once one `.asl` file works with the EGS, Steam and GOG edition of the game.


### PS Remote Play variant

Variant with tunings for using [`PS Remote Play`](https://www.playstation.com/en-us/remote-play/). Uses the same scan region settings as the normal variant.


### German variant
The german language has the smallest loading indicator text on loading screens pepeEZ

 - Scan Region settings
   - X: 99
   - Y: 976
   - Width: 55
   - Height: 22
   
### Brazilian Portuguese (pt-br) variant
Thanks to Habeebs for this variant!

 - Scan Region settings
   - X: 86
   - Y: 971
   - Width: 190
   - Height: 35

### Dev variant

This LR now introduces efforts that were talked about blegas's episode of the WTDW Podcast:
 - This LR checks if the RESTART FROM SAVE option in the pause menu is *highlighted* and *unavailiable*

 - Scan Region settings
   - Set X to 0
   - Set Y to 0
   - Set Width to 1920
   - Set Height to 1080


### Classic variant
I added a classic variant where the scan region settings are the same as before this update (just as a backup)

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
