## Download
#### You can download the latest `.vas` files here: [`Releases Page`](https://github.com/blegas78/autoSplitters/releases)

## Video Tutorial

#### Load Remover setup tutorial: [https://www.youtube.com/watch?v=TIU9j-prm7M](https://www.youtube.com/watch?v=TIU9j-prm7M) *by @DorianSnowball*

###### *Old video: https://www.youtube.com/watch?v=TIU9j-prm7M* *by @blegas78*

##


# Load Removers

I am active in the Horizon Zero Dawn and The Last Of Us (1/2) communities.  These efforts are intended to aid the communities to make live speedrunning times more comparable and therefore, hopefully,  more enjoyable.  If the tools are effective enough, this will eliminate the need to manually calculate your In-Game Time (IGT) through use of a video editor, which can be a laborious task for both runners and leaderboard moderators.

These load removers are based on reading the HUD in particular places. Both the HZD and TLOU2 efforts are intended to be used with LiveSplit using the [`Video Auto Splitter (VAS)`](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases) component. Instructions for installation are already provided by the VAS github, but I will cover them as well.

The VAS is only one necessary component. You also need to get a video source from your game into the VAS component.
Starting with OBS version 26.x.x, they now ship a virtual cam with OBS itself, however some runners have encountered some reliability issues with this method so it is recommended you find out wich works best for yourself.


###### Please also see the change log in each load remover's readme regarding the reason for updates to `.vas` files.

##  Do they work?

These seem to work VERY well on my end, however different setups may cause different issues. Also there could be some scenerios in which they break. Please see information in either game to learn about known issues, if any exist.

###### If you encounter a problem or issue, feel free to check the troubleshooting section further down below or reach out to one of us on Discord.

Although I **HIGHLY** Recommend testing this before attempting a run each day by doing a quick test.
With all of the above up and running and showing IGT, try to start the timer then invoke a load based on whatever the definition of a load is for your game.

## Setup

##### This assumes that you already have LiveSplit installed.  If not, please visit the [LiveSplit release page](https://github.com/LiveSplit/LiveSplit/releases).

I recommend a reboot before installation to avoid any headaches.

### 1. Installation of the LiveSplit VAS component

1. Download the [``Video Auto Splitter (VAS)``](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases) component
2. Extract the `.zip` file, there you should see 5 total `.dll` files
3. Navigate to where your LiveSplit is installed.  It should be in a directory named something like `LiveSplit_1.8.10` (or different numbers depending on your version). There is no proper installation tool for LiveSplit, it just runs out of the box so it could still be in your `Downloads` directory if you never moved it.
4. Inside of the LiveSplit directory, navigate to the `Components` directory.  There should be a bunch of `.dll` files.
5. Copy all 5 VAS `.dll` files from step 2 into this `Components` directory.

> Installation of the VAS should be complete. You will at a minimum need to restart LiveSplit.


### 2. Feeding the game video feed to LiveSplit

The next thing that needs to be done is share the video from OBS to LiveSplit.

###### This assumes that you already have some flavor of OBS installed.  If not, please visit the [OBS releases page](https://github.com/obsproject/obs-studio/releases). A recording software by the name of XSplit also has a Virtual Cam feature wich will not be covered here.

### 2.1 Using OBS' built-in vitual cam

Starting with OBS version 26.x.x, they now ship a virtual cam with OBS itself, however some runners have encountered some reliability issues with this method so it is recommended you find out wich works best for you.

Just hit `Start Virtual Cam` located in the same menu as `Start Recording`

###### If this option doesn't show up, please check the troubleshooting section.


### 2.2 Using the OBS virtual cam plugin

1. Ensure OBS is closed.
2. Download the [OBS virtual cam plugin](https://github.com/CatxFish/obs-virtual-cam/releases)
3. Run the installation. One of the prompts will ask how many cameras you want.  I selected 4, but really only 1 is needed.
4. Open OBS.
5. In your sorce panel, right-click on your game capture source, then click on `Filters`
6. While you're here, please check if your settings match these:

 - Resolution: 1920x1080
 - Color Space: Default
 - Color Range: Partial

7. Under `Effects`, add a new filter.  It may look like a `+` button near the bottom. Add a filter called `VirtualCam`
8. There are some settings here.  I leave "Horizontal Flip" and "Keep Aspect Ratio" NOT checked.  I also set "Buffered Frames" to 1
9.  Most importantly in these settings, remember the name of `Target Camera`, for me, it is `OBS-Camera`
10. Click on the "Start" button

###### IMPORTANT: Every time that you close/open OBS, you will need to navigate to the VirtualCam filter and click that "Start" button.  It will NOT auto-start each time OBS is restarted.

> Your game feed should now be fed to a virtual webcam with the name designated under "Target Camera."

###### Tip: If you're unsure that virtualcam is actually running, test it using any program that makes use of a webcam, e.g. Discord. (Go to ``Settings`` -> ``Voice- & Videochat`` -> ``Video settings`` -> Click the ``Test`` button)


### 3. PlayStation™ Settings

###### These instructions should also apply to the PS5, but they might have a different name.

These load removers are based on reading the HUD in particular places. The PS has the ability to change how the HUD is rendered based on system settings. In order to ensure that the HUD is in the correct spot, you will need to set the HUD to the largest setting.

Navigate to `Settings`

#### Under: `Sound and Screen` -> `Display Area Settings`:

 - Enlarge the setting to the maximum setting, until `Enlarge` becomes greyed.

#### Under: `Sound and Screen` -> `Video Output Settings` -> `Video Output Information`:

 - Resolution: 1920 x 1080 - 60Hz
 - Color Format: RGB
 - HDR: Disabled or Not Supported


### 4. Video Auto Splitter

1. Download your desired `.vas` file from the [``Releases Page``](https://github.com/blegas78/autoSplitters/releases)
2. Open LiveSplit and your layout if not open
3. At this stage your timer is still probably checking against Real Time Attack (RTA) instead of the loadless IGT. Right-click the LiveSplit window, then select `Compare Against` -> `Game Time`
4. Right-click the LiveSplit window again, this time choose `Edit Layout...`
5. Click on the `+` button, then choose `Control` -> `Video AutoSplitter`  (this item will be hidden, and not mess up anything visually in your layout)
6. Click on "Layout Settings".  Navigate to the tab titled `Video Auto Splitter`
7. Under `Settings` ensure that `Capture Device` represents what is set in OBS-VirtualCam's `Target Camera`.  For me, it is `OBS-Camera`
8. Still in `Settings`, open the downloaded `.vas` file
9. Click on the `Scan Region` tab
> If your game is running, with OBS and VirtualCam running, you should see a live preview of your game in this tab
10. Now head over to the game's specific readme file and continue from there

## SAQ (sometimes asked questions) [![blegasLurk](https://static-cdn.jtvnw.net/emoticons/v2/303139865/default/dark/1.0)]()

#### Am I required to have a capture card (for runs on PlayStation)?

I have reports from some users that have had success using PS4 share instead of a capture card.
###### Thank you Leiberton and Charlatan_11235 for testing!

#### What versions of software do you use for development and testing?

There may be issues in installation for different versions of software, but don't be afraid to try versions different from my own. Please check the troubleshooting section if you encounter a problem.

 - [Livesplit 1.8.10](https://github.com/LiveSplit/LiveSplit/releases)
 - [Video Auto Splitter 0.5.2.3](https://github.com/ROMaster2/LiveSplit.VideoAutoSplit/releases)
 - [OBS 25.0.4](https://github.com/obsproject/obs-studio/releases)
 - [OBS-VirtualCam 2.0.4](https://github.com/CatxFish/obs-virtual-cam/releases)

###### I have also heard reports that versions newer than the above list also work. Thank you Aquila_Ezio!


## General troubleshooting

#### Please also check the readme's of the specific load remover you're using.

I will build this section more and more as people run into issues with setup. Please contact me if you have issues with setup, installation, or if you have inconsistencies in load times.


#### Problem: Load pauses worked, but in the middle of the run they stop pausing or unpausing.
- **Solution 1**: In LiveSplit restart the load remover by: Right-Click - Open Layout - select your layout
- **Solution 2**: Assuming you're using OBS' built-in vitual cam, use the Virtualcam Plugin instea


#### Problem: I regularly get crashes in the middle of runs.
- Cause 1
  - Your CPU may be overloaded.
  - **Solution**: Try reducing your CPU load by closing unnecessary programs.  I have had to eliminate Streamlabs Emote Walls since that regularly consumes 20% CPU on my end.  I have also heard success regarding stopping local recordings (this sucks but all hardware is different).
- Cause 2
  - This may also be caused by specific combinations of software (VAS, LiveSplit, OBS).
  - **Solution**: Feel free to try different versions.



#### Problem: `Scan Region` tab in the VAS' settings doesn't show a preview
###### This assumes you already have OBS running and outputting an image via the built-in virtual cam
- **Solution**: There's no real fix for this other than restarting LiveSplit and praying it works until the end of the run. However you can use the Virtualcam Plugin instead wich doesn't have this issue
###### Problem brought up by ScrambledEggsChef and JustSaft



#### Problem: `Start Virtual Cam` button doesn't show up
###### This assuems you have a OBS version newer than 26.x.x
- You might be using a portable version of OBS, in this case this option won't show up.



#### Problem: I have issues with a titlted screen
- "One thing that is working for me is to not start the virtual cam with livesplit closed, when i do that i get the virtual cam tilted"
###### -charlatan_11235


#### Problem: LiveSplit timer won't listen to the VAS component
###### This assumes the VAS is showing a preview of the game's video feed in the `Scan Region` settings

- Cause 1
  - You may be using LiveSplit version 1.8.16 (and/or newer). For unknown reasons this version of LiveSplit totally ignores the VAS. This may be fixable through a patch on the VAS developer's end.
  - **Solution**: Downgrade LiveSplit. See [(LiveSplit releases page)](https://github.com/LiveSplit/LiveSplit/releases)
- Cause 2
  - Your timer is still probably checking against Real Time Attack (RTA) instead of the loadless IGT.
  - **Solution**: Right-click the LiveSplit window, select `Compare Against` -> `Game Time`


## Problems

- Kevin700P has had trouble streaming and using the load remover at the same time.  Turns out his phone was plugged into his stream computer (a laptop) and unplugging the phone lets him do both at once.
- Pdub had configured his capture card to a resolution of 1280x720 and it caused issues.
- ikeden had a filter for increasing the brightness of his game capture source for streaming purposes. This resulted in the TLOU loadremover not correctly identifying the Moth Screens™


## My Settings

Settings that I use are layed out at their appropriate locations troughout the Setup section's steps.
This was done to eliminate the need for this extra section.

## Contributors [![blegasLove](https://static-cdn.jtvnw.net/emoticons/v2/303139860/default/dark/1.0)]()

Though I'm the one building the configuration files I simply do not have the resources to test every scenario and every configuration.  I greatly appreciate when others report on problems so that I can make these tools better.  I view development on these tools as a community effort.

#### HZD
- [ElkjaerTV](https://www.twitch.tv/elkjaertv): Timing verification
- [everyday_aussie](https://www.twitch.tv/everydayaussie): Timing verification, reason for the Aussie .vas
- [charlatan_11235](https://www.twitch.tv/charlatan_11235): Tested working function of PS4Share
- [leiberton](https://www.twitch.tv/leiberton): Tested working function of PS4Share
- [Aquila_Ezio](https://www.twitch.tv/aquila_ezio): Found success in newer software versions
- [JustSaft](https://www.twitch.tv/justsaft): HZD load remover and GitHub repo optimizations and made a german load remover for HZD
- [habeebs_](https://twitch.tv/habeebs_) & [DorianSnowball](https://www.twitch.tv/DorianSnowball): PT-BR Load Remover

#### TLOU2
- [DemonicRobots](https://www.twitch.tv/demonicrobots) (Helped spearhead and test initial load remover)
- [PDub](https://www.twitch.tv/pdub) (Provided setup feedback, is my regular guinnea pig)
- [Kevin700p](https://www.twitch.tv/kevin700p) (Reason for the French version, helped point out potential hardware issues)
- [mattmatt10111](https://www.twitch.tv/mattmatt10111) (Has had crashes, the reason for doing optimization efforts.  Found success thorugh stopping local recordings.)
- [ScarlettTheHuman](https://www.twitch.tv/scarlettthehuman) (Has done a tremendous amount of modeling/reverse engineering to figure out how ND IGT works.)
- [happy_asteroid](https://www.twitch.tv/happy_asteroid) (Tester extraordinare, helped gather a ton of data to validate ND IGT models)
- [https://github.com/alexjlockwood](https://github.com/alexjlockwood) (Tester extraordinare, helped gather a ton of data to validate ND IGT models)
- [MaDe_bY_ScaR](https://www.twitch.tv/made_by_scar) Made a 720p variant of the HZD load remover to handle corner cases

#### Donators

- [Aquila_Ezio](https://www.twitch.tv/aquila_ezio) ($40.00)
- [TimRoc](https://www.twitch.tv/timroc) ($30.00)
- [PDub](https://www.twitch.tv/pdub) ($25.00)

I am doing this purely to improve the quality of speedrunning these games and am completely happy to contribute to the respect communities.  Therefore I am providing these efforts for free for everyone and am thriled that people will better enjoy speed running the games.  I do not ask for donations.  I do not need monetary support to continue development on these tools.  Having said that, I do believe in patronage and am **very** grateful when others support my efforts.  I have also been asked by PDub to provide a method to support my efforts.  If you feel compelled to support then you may do so either through my Twitch or through the streamlabs donations links:

 - [https://www.twitch.tv/blegas78](https://www.twitch.tv/blegas78)
 - [https://streamlabs.com/blegas78](https://streamlabs.com/blegas78)

[![blegasHey](https://static-cdn.jtvnw.net/emoticons/v2/303139870/default/dark/1.0)]()
[![blegasHype](https://static-cdn.jtvnw.net/emoticons/v2/303139854/default/dark/1.0)]()
[![blegasLove](https://static-cdn.jtvnw.net/emoticons/v2/303139860/default/dark/1.0)]()
[![blegasLurk](https://static-cdn.jtvnw.net/emoticons/v2/303139865/default/dark/1.0)]()
[![blegasShock](https://static-cdn.jtvnw.net/emoticons/v2/302811435/default/dark/1.0)]()
