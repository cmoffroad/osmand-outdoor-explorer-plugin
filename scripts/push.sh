export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"

adb shell <<EOF
echo '$(cat ./src/rendering/outdoor-explorer.render.xml)' > /sdcard/Android/data/net.osmand/files/rendering/outdoor-explorer.render.xml
EOF
adb shell am force-stop net.osmand
adb shell monkey -p net.osmand 1