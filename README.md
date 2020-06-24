# Load Removers

I am active in Horizon Zero Dawn and The Last Of Us (1/2) communities.  These efforts are intended to aid the communities to make live speedrunning times more comporable and therefore, hopefully,  more enjoyable.  Also if the tools are effective enough, this will eliminate the need to manually calculate your In-Game Time (IGT) through use of a video editor, which can be a laborious task for both runners and leaderboard moderators.

#### HZD Load Remover

The hzd.vas profile was built based on the rules on speedrun.com for the load-time definition.  In this case, quite simply, a "load" is defined whenever "Loading..." is seen in the bottom left corner of the screen.  This includes few cut scene pauses in the beginning for Any% runs, as well as every time a fast travel is performed.  

This laod remover checks the video feed for the "Loading...", and tells LiveSplit that it is a load whenever this appears.

#### TLOU2 Load Remover

The rules are yet to be defined for TLOU2 speedruns, so these efforts are preliminary.  It does seem to me that a loading screen may be defined as 
1. Loading starts immediately after "Skip Cutscene" is performed.
2. The screen will be black.  Sometimes if long enough a gradient with moths appears.  Also sometimes a loading circle appears.  The moths will then fade to black again.  All of this is considered to be in the load.
3. The load ends when the screen turns from completely black to the next frame where it is not black, and not the gradient w/moths.

Based ont he above, this laod remover checks for when "Skip Cutscene" first disappears, then waits for the black screen to end only if it is not the gradient moths.



## Requirements

Both the HZD and TLOU2 efforts are intended to be used for LiveSplit using the [Video Auto Splitter (VAS)](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit) tool.  Instructions for installation are already provided by the VAS github, but I will cover installation as well.

The VAS is only one necessary component.  You also need to get a video source from your game into the VAS component.  I use OBS with a component called (OBS-VirtualCam)[https://github.com/CatxFish/obs-virtual-cam].  Again, instructions for installalation are provided there but they will be covered here as well.

There may be issues in installation for different versions of software, but don't be afraid to try versions different form my own.  This is the list of versions that I use for development and testing:

 - [Livesplit 1.8.10](https://github.com/LiveSplit/LiveSplit/releases)
 - [Video Auto Splitter 0.5.2.3](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases)
 - [OBS 25.0.4](https://github.com/obsproject/obs-studio/releases)
 - [OBS-VirtualCam 2.0.4](https://github.com/CatxFish/obs-virtual-cam/releases)


## Installation of the LiveSplit VAS component

This assumes that you already have LiveSplit installed.  If not, please visit the [LiveSplit release page](https://github.com/LiveSplit/LiveSplit/releases).

1. Download the Video Autosplitter v0.5.2.3: [LiveSplit.VideoAutoSplit.v0.5.2.3.zip](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases/download/0.5.2.3/LiveSplit.VideoAutoSplit.v0.5.2.3.zip)
2. Extract the Zip, there should see 5 total ".dll" files.
3. Navigate to where your LiveSplit is installed.  It shoul dbe in a directory named something like "LiveSplit_1.8.10" for example.  There is no proper installaiton for LiveSplit, it just runs out of the box so it could still be in your "Downloads" directory if you never moved it.
4. Inside of that above directory, navigate to the "Components" directory.  There should be a bunch of ".dll" files.
5. Copy all 5 VAS dll files from step 2 into this "Components" directory.

Installation of the VAS shoul dbe complete.  You will at a minimum need to restart LiveSplit

## Installation of OBS-VirtualCam
This assumes that you already have some flavor of OBS installed.  If not, please visit the [OBS release page](https://github.com/obsproject/obs-studio/releases).  Should also work with Streamlabs-OBS, but I have not personally tried it.

1. Ensure OBS is closed.
2. Download [OBS-VirtualCam2.0.4-Installer.exe
](https://github.com/CatxFish/obs-virtual-cam/releases/download/2.0.4/OBS-VirtualCam2.0.4-Installer.exe)
3. Run the installation.  One of the prompts will ask how many cameras you want.  I selected 4, but really only 1 is needed.

## Setup

I recommend a reboot post-installation to avoid any headaches.  The first thing that needs to be done is share the video from OBS to LiveSplit.


#### VirtualCam in OBS setup

1. Open OBS
2. Under Scenes->Source, right click on your game capture source, then click on "Filters".
3. Under "Effects Filters", add a new filter.  It may look like a "+" button near the bottom.  Add a filter called "VirtualCam"
4. There are some settings here.  I leave "Horizontal Flip" and "Keep Asepct Ratio" NOT checked.  I also set "Buffered Frames" to 1.
5. Most importantly in these settings, remember the name of "Target Camera".  For me, it is "OBS-Camera"
6. Click on the "Start" button

Your game feed should now be fed to a virtual webcam with the name designated under "Target Camera".

> IMPORTANT: Every time that you close/open OBS, you will need to navigate to the VirtualCam filter and click that "Start" button.  It will NOT auto-start each time OBS starts.

> Tip: If you are unsure that this is working, you can test using any program that makes use of a webcam to check video.  For example: I use Discord and check video settings for video chat, and select the "OBS-Camera" to see if it is running.

#### Video Auto Splitter

1. Download the ".vas" game profile from this page for your corresponding game.
2. Open LiveSplit, and open your layout if not open.
3. Right-click Live-Split, and choose "Edit Layout..."
4. Click on the "+" button, then choose Control->Video AutoSplitter  (this item will be hidden, and not mess up anything visually in your layout)
5. Click on "Layout Settings".  Navigate to the tab titled "Video Auto Splitter"
6. Under "Settings" ensure that "Capture Device" represents what is set in OBS-VirtualCam's "Target Camera".  For me, it is "OBS-Camera".
7. Still in "Settings", set the "Game Profile" to the appropriate ".vas" file (hzd.vas or tlou2.vas)
8. Click on the "Scan Region" tab and ensure that X=0, Y=0, Width=1920, and Height=1080.  If your game is running, with OBS and VirtualCam running, you should see a preview with funny colors in this tab.
9. Click on OK, then OK again.
10. At this stage your timer is still probably checking against Real Time Attack (RTA) instead of the loadless IGT.  Right-click on LiveSplit again, then select Compare Against->Game Time
11. Save your layout

#### PS4 Settings

These load removers are based on reading the HUD in particular places.  The PS4 has the ability to change how the HUD is rendered based on system settings.  In order ensure that the HUD is in the correct spot, you will need to set the HUD to the largest setting.

1. In the PS4's home screen, navigate to "Settings"
2. Go to "Sound and Screen"
3. Select "Display Area Settings"
4. Enlarge the setting to the maximum setting, until "Enlarge" becomes greyed


## Testing

With all of the above up and running and showing IGT,  try to start the timer then invoke a load.

1. In HZD, simply perform a fast-travel
2. In TLOU2, you will need to find a section where you can skip a cutscene.  Starting or loading a game from the main menu will NOT pause the timer.



## Troubleshooting



## Settings

The following is a set of my video settings.  If you have trouble with the efficacy of load time removal, you may check to ensure that your settings match mine:

#### PS4

Under: Settings->Sound and Screen->Video Output Settings->Video Output Information
 - Resolution: 1920 x 1080 - 60Hz
 - Color Format: RGB
 - HDR: Disabled or Not Supported

#### OBS Capture settings

Right-click your game video capture device, then select "Properties"

 - Resolution: 1920x1080
 - Color Space: Default
 - Color Range: Partial

