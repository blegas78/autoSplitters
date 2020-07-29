# Load Removers

Video with information and installation: [https://www.youtube.com/watch?v=lmLSUKhvSrg](https://www.youtube.com/watch?v=lmLSUKhvSrg)

I am active in the Horizon Zero Dawn and The Last Of Us (1/2) communities.  These efforts are intended to aid the communities to make live speedrunning times more comparable and therefore, hopefully,  more enjoyable.  If the tools are effective enough, this will eliminate the need to manually calculate your In-Game Time (IGT) through use of a video editor, which can be a laborious task for both runners and leaderboard moderators.


##  Does it work?

These seem to work VERY well on my end, however different setups may cause different issues.  Also there could be some scenerios in which they break.  Please see information in either game to learn more about known issues, if any exist.


Please see the Change Log in each laod remover description regarding the reason for updates to .vas files.



## Requirements

Both the HZD and TLOU2 efforts are intended to be used for LiveSplit using the [Video Auto Splitter (VAS)](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit) tool.  Instructions for installation are already provided by the VAS github, but I will cover installation as well.

The VAS is only one necessary component.  You also need to get a video source from your game into the VAS component.  I use OBS with a component called [OBS-VirtualCam](https://github.com/CatxFish/obs-virtual-cam).  Again, instructions for installalation are provided there but they will be covered here as well.

There may be issues in installation for different versions of software, but don't be afraid to try versions different form my own.  This is the list of versions that I use for development and testing:

 - [Livesplit 1.8.10](https://github.com/LiveSplit/LiveSplit/releases)
 - [Video Auto Splitter 0.5.2.3](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases)
 - [OBS 25.0.4](https://github.com/obsproject/obs-studio/releases)
 - [OBS-VirtualCam 2.0.4](https://github.com/CatxFish/obs-virtual-cam/releases)

I have reports from some users that have had success using PS4 share instead of a capture card.  Thank you Leiberton and Charlatan_11235 for testing!

I have also heard reports that versions newer than the above list also work.  Thank you Aquila_Ezio!

Kevin700p has had trouble streaming and using the load remover at the same time.  Turns out his phone was plugged into his stream computer (a laptop) and unplugging the phone lets him do both at once.

## Installation of the LiveSplit VAS component

This assumes that you already have LiveSplit installed.  If not, please visit the [LiveSplit release page](https://github.com/LiveSplit/LiveSplit/releases).

1. Download the Video Autosplitter v0.5.2.3: [LiveSplit.VideoAutoSplit.v0.5.2.3.zip](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases/download/0.5.2.3/LiveSplit.VideoAutoSplit.v0.5.2.3.zip)
2. Extract the Zip, there should see 5 total ".dll" files.
3. Navigate to where your LiveSplit is installed.  It should be in a directory named something like "LiveSplit_1.8.10" (or different numbers for your version).  There is no proper installation tool for LiveSplit, it just runs out of the box so it could still be in your "Downloads" directory if you never moved it.
4. Inside of the LiveSplit directory, navigate to the "Components" directory.  There should be a bunch of ".dll" files.
5. Copy all 5 VAS .dll files from step 2 into this "Components" directory.

Installation of the VAS should be complete.  You will at a minimum need to restart LiveSplit.

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
2. Under Scenes->Source, right click on your game capture source, then click on "Filters."
3. Under "Effects Filters", add a new filter.  It may look like a "+" button near the bottom.  Add a filter called "VirtualCam."
4. There are some settings here.  I leave "Horizontal Flip" and "Keep Aspect Ratio" NOT checked.  I also set "Buffered Frames" to 1.
5. Most importantly in these settings, remember the name of "Target Camera."   For me, it is "OBS-Camera."
6. Click on the "Start" button.

Your game feed should now be fed to a virtual webcam with the name designated under "Target Camera."

> IMPORTANT: Every time that you close/open OBS, you will need to navigate to the VirtualCam filter and click that "Start" button.  It will NOT auto-start each time OBS is restarted.

> Tip: If you are unsure that this is working, you can test using any program that makes use of a webcam to check video.  For example: I use Discord and check video settings for video chat preview, and select the "OBS-Camera" to see if the game feed is coming through.

#### Video Auto Splitter

1. Download the ".vas" game profile from this page for your corresponding game.
2. Open LiveSplit, and open your layout if not open.
3. Right-click Live-Split, and choose "Edit Layout..."
4. Click on the "+" button, then choose Control->Video AutoSplitter  (this item will be hidden, and not mess up anything visually in your layout)
5. Click on "Layout Settings".  Navigate to the tab titled "Video Auto Splitter."
6. Under "Settings" ensure that "Capture Device" represents what is set in OBS-VirtualCam's "Target Camera".  For me, it is "OBS-Camera."
7. Still in "Settings", set the "Game Profile" to the appropriate ".vas" file (hzd.vas or tlou2.vas).
8. Click on the "Scan Region" tab and ensure that X=0, Y=0, Width=1920, and Height=1080.  If your game is running, with OBS and VirtualCam running, you should see a live preview of your game with funny colors in this tab.
9. Click on OK, then OK again.
10. At this stage your timer is still probably checking against Real Time Attack (RTA) instead of the loadless IGT.  Right-click on LiveSplit again, then select Compare Against->Game Time.
11. Save your layout

#### PS4 Settings

These load removers are based on reading the HUD in particular places.  The PS4 has the ability to change how the HUD is rendered based on system settings.  In order to ensure that the HUD is in the correct spot, you will need to set the HUD to the largest setting.

1. In the PS4's home screen, navigate to "Settings."
2. Go to "Sound and Screen."
3. Select "Display Area Settings."
4. Enlarge the setting to the maximum setting, until "Enlarge" becomes greyed.


## Testing

I *HIGHLY* Recommend testing this before attempting a run each day by doing a quick test.
With all of the above up and running and showing IGT,  try to start the timer then invoke a load based on whater the definition of a load is for your game.



## Troubleshooting

I will build this section more and more as people run into issues with setup.  Please contact me if you have issues with setup, installation, or if you have inconsistencies in load times.

- Problem: Load pauses worked, but in the middle of the run they stop pausing or unpausing.
- Solution: In LiveSplit restart the load remover by: Right-Click - Open Layout - select your layout

- Problem:  I regularly get crashes in the middle of runs.
- Solution: Your CPU may be overloaded.  Try reducing your CPU load by closing unnecessary programs.  I have had to eliminate Streamlabs Emote Walls since that regularly consumes 20% CPU on my end.  I have also heard success regarding stopping local recordings (this sucks but all hardware is different).

## My Settings

The following is a set of my video settings.  If you have trouble with the efficacy of load time removal, you may check to ensure that your settings match mine:

#### PS4

I am on a normal PS4 with an HDD.  That shouldn't matter as long as your video settings are similar.

Under: Settings->Sound and Screen->Video Output Settings->Video Output Information:

 - Resolution: 1920 x 1080 - 60Hz
 - Color Format: RGB
 - HDR: Disabled or Not Supported
 
 #### Capture Card/ PS4Share Settings
 
 You may need to configure your card itself, like using Elgato's software, to be at 1920x1080 resolution.  
 
 - PDub had his set at 1280x720 and it caused issues.

If you are using PS4Share instead of a capture card and have issues with a titlted screen, try the following to fix:

 - "One thing that is working for me is to not start the virtual cam with livesplit closed, when i do that i get the virtual cam tilted" -charlatan_11235

#### OBS Capture settings

Right-click your game video capture device, then select "Properties"

 - Resolution: 1920x1080
 - Color Space: Default
 - Color Range: Partial

## Contributors

Though I'm the one building the configuration files I simply do not have the resources to test every scenario and every configuration.  I greatly appreciate when others report on problems so that I can make these tools better.  I view development on these tools as a community effort.

#### HZD
- [ElkjaerTV](https://www.twitch.tv/elkjaertv) (Timing verification)
- [everyday_aussie](https://www.twitch.tv/everydayaussie) (Timing verification, reason for the Aussie .vas)
- [charlatan_11235](https://www.twitch.tv/charlatan_11235) (Tested working function of PS4Share)
- [leiberton](https://www.twitch.tv/leiberton) (Tested working function of PS4Share)
- [Aquila_Ezio](https://www.twitch.tv/aquila_ezio) (Found success in newer software versions)

#### TLOU2
- [DemonicRobots](https://www.twitch.tv/demonicrobots) (Helped spearhead and test initial load remover)
- [PDub](https://www.twitch.tv/pdub) (Provided setup feedback, is my regular guinnea pig)
- [Kevin700p](https://www.twitch.tv/kevin700p) (Reason for the French version, helped point out potential hardware issues)
- [mattmatt10111](https://www.twitch.tv/mattmatt10111) (Has had crashes, the reason for doing optimization efforts.  Found success thorugh stopping local recordings.)

#### Donators

- [TimRoc](https://www.twitch.tv/timroc) ($30.00)
- [PDub](https://www.twitch.tv/pdub) ($25.00)

I am doing this purely to improve the quality of speedrunning these games and am completely happy to contribute to the respect communities.  Therefore I am providing these efforts for free for everyone and am thriled that people will better enjoy speed running the games.  I do not ask for donations.  I do not need monetary support to continue development on these tools.  Having said that, I do believe in patronage and am *very* grateful when others support my efforts.  I have also been asked by PDub to provide a method to support my efforts.  If you feel compelled to support then you may do so either through my Twitch or through the streamlabs donations links:

 - [https://www.twitch.tv/blegas78](https://www.twitch.tv/blegas78)
 - [https://streamlabs.com/blegas78](https://streamlabs.com/blegas78)

