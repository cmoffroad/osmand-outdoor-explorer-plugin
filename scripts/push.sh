export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"

adb shell <<EOF
echo '$(cat ./src/rendering/offroad-survey.render.xml)' > /sdcard/Android/data/net.osmand/files/rendering/offroad-survey.render.xml
EOF
adb shell am force-stop net.osmand
adb shell monkey -p net.osmand 1
# adb shell am start -n "net.osmand/.plus.activities.search.GeoIntentActivity"
