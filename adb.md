# ADB

      # Take a screenshot
      adb exec-out screencap -p > screen.png

      # List all activities
      adb shell dumpsys package | grep osmand

      # Refresh APP
      adb shell am start -n "net.osmand/.plus.activities.MapActivity"
      adb shell am start -n "net.osmand/.plus.activities.search.GeoIntentActivity"

      adb shell am start -n "net.osmand/.plus.NavigationService"
      adb shell am start -n "net.osmand/.aidl.OsmandAidlService"
      adb shell am start -n "net.osmand/.aidl.OsmandAidlServiceV2"