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

      ### export JAVA
      export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home

      ### compile
      sh intel-darwin.sh release
      cd ./intel-darwin-intel-darwin-clang-release.baked
      make -j4

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
  - For `Directory with binary files`, set `/Documents/WORKSPACE/OsmAnd/OsmAnd-core-legacy/binaries/darwin/intel/Release/`
  - For `Rendering style file`, set the rendering file of your choice e.g. `~/Documents/WORKSPACE/OsmAnd/OsmAnd-resources/rendering_styles/topo.render.xml`
  - Close Preferences window 
- Top right corner of click on `Online Rendering` button
  - Confirm details and click `OK`