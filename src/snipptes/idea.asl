
// This is code for a idea that I had:
// What if we made the loadremover detect wich FPS setting the player is using (if needed at all)
// to make certian calculations use the 60 method if 60 is enabled and the 30 methods if 30 is enabled
// This comes of course at the cost that the player would have to show the chosen setting every time they startup the loadremover
// but maybe this could be a nice addition. Just bringing this up because it sounded cool in my brain, so it's you choice to implement this.

// Maybe this allows the 60 and 30 fps variants to use the same codebase
// and just tweak 'vars.sixtyfps' to determine the framerate to use / default behavior

// script.asl

// Add to startup{}
startup
{
    // Create variable to be used & changed later
    vars.sixtyfps = false;
}

// Add to update{}
update
{
    // The folloing should only be run when the back button is visible aka menu is opened,
    // so it's not constantly checking.
    // vars.BackBtnVisible is just a placeholder in this case.

    if (vars.BackBtnVisible)
    {
        // Check if the 60 toggle is currently displayed on the screen
        if (features["60fpsSettingVisible"].current > 20)
        {
            // Then check for the toggle's status using these
            if (features["60fpsToggleSetTo30"].current > 24)
            {
                vars.sixtyfps = false;
            }
            if (features["60fpsToggleSetTo60"].current > 24)
            {
                vars.sixtyfps = true;
            }
        }
    }
}

// -------------
// structure.xml

// [...]
// <WatchZone>
//          <Name>60fpsToggleSetTo30</Name>
//          <Geometry>
//            <X>?</X>
//            <Y>?</Y>
//            <Width>?</Width>
//            <Height>?</Height>
//          </Geometry>
//          <Watches>
//            <Watcher>
//              <Name>loading</Name>
//             <ErrorMetric>PeakAbsolute</ErrorMetric>
//              <WatchImages>
//                <WatchImage>
//                  <FilePath>imgs\60fpsToggleSetTo30.png</FilePath>
//                </WatchImage>
//              </WatchImages>
//            </Watcher>
//          </Watches>
//        </WatchZone>
// [...]
// <WatchZone>
//          <Name>60fpsToggleSetTo60</Name>
//          <Geometry>
//            <X>?</X>
//            <Y>?</Y>
//            <Width>?</Width>
//            <Height>?</Height>
//          </Geometry>
//          <Watches>
//            <Watcher>
//              <Name>loading</Name>
//             <ErrorMetric>PeakAbsolute</ErrorMetric>
//              <WatchImages>
//                <WatchImage>
//                  <FilePath>imgs\60fpsToggleSetTo60.png</FilePath>
//                </WatchImage>
//              </WatchImages>
//            </Watcher>
//          </Watches>
//        </WatchZone>
// [...]
// <WatchZone>
//          <Name>60fpsSettingVisible</Name>
//          <Geometry>
//            <X>?</X>
//            <Y>?</Y>
//            <Width>?</Width>
//            <Height>?</Height>
//          </Geometry>
//          <Watches>
//            <Watcher>
//              <Name>loading</Name>
//             <ErrorMetric>PeakAbsolute</ErrorMetric>
//              <WatchImages>
//                <WatchImage>
//                  <FilePath>imgs\60fpsSetting.png</FilePath>
//                </WatchImage>
//              </WatchImages>
//            </Watcher>
//          </Watches>
//        </WatchZone>
// [...]