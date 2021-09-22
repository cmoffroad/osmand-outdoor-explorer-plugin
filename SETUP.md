# OsmAndMapCreator with offline rendering

> Note: you do not need to compile any library if you don't need to use the offline rendering feature. You can simply download the software and run it as explained below.

## Pre-requisites

- Mac OSX
- Xcode or Command Line Tools
- Java SDK

> I am not aware of any minimum compatible versions, tried it on a old mac with OSX 10.12, Xcode 9.2 Java 16

## Instructions

Based on official [documentation](https://docs.osmand.net/en/main@latest/development/build-osmand/how-to-compile-mapcreator-and-tools#compile-native-rendering-library-for-osmandmapcreator)

      ### Create workspace directory for OsmAnd
      mkdir ~/Documents/WORKSPACE/OsmAnd

### OsmAnd-core-legacy

      ### download repository
      cd ~/Documents/WORKSPACE/OsmAnd
      git clone https://github.com/osmandapp/OsmAnd-core-legacy.git
      cd OsmAnd-core-legacy/externals

      ### configure
      sh configure.sh
      cd ../targets

      ### compile
      sh intel-darwin.sh release

      # binaries will be compiled under ./intel-darwin-intel-darwin-clang-release.baked
      # check if any compilation errors (red)
      # I got stuck here because of dependencies error with third-party skia library

### OsmAnd-resources
      
      ### download
      cd ~/Documents/WORKSPACE/OsmAnd
      git clone https://github.com/osmandapp/OsmAnd-resources.git


### OsmAndMapCreator
    
      ### download and unzip
      cd ~/Documents/WORKSPACE/OsmAnd
      curl -o OsmAndMapCreator-main.zip http://download.osmand.net/latest-night-build/OsmAndMapCreator-main.zip
      unzip OsmAndMapCreator-main.zip -d OsmAndMapCreator-main
      rm -f OsmAndMapCreator-main.zip

      ### start application
      cd OsmAndMapCreator-main
      sh OsmAndMapCreator.sh

- Select in menu Window > Preferences
  - For `Native lib file`, set `~/Documents/WORKSPACE/OsmAnd/OsmAnd-core-legacy/targets/intel-darwin-intel-darwin-clang-release.baked/libosmand.dylib`
  - For `Rendering style file (path)`, set the rendering file of your choice e.g. `~/Documents/WORKSPACE/OsmAnd/OsmAnd-resources/rendering_styles/topo.render.xml`
  - Close Preferences window 
- Top right corner of click on `Online Rendering` button
  - Confirm details and click `OK`