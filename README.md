# OsmAnd Offroad Survey Plugin

[Quick Download Link.](https://github.com/cmoffroad/osmand-offroad-survey-plugin/raw/master/build/osmand-offroad-survey-plugin.osf)

This plugin for OsmAnd includes a default profile for offroad surveys and a lightweight map style improving the appearance of unpaved roads and trails.

Based on following offroad guidelines: https://github.com/cmoffroad/osm-guidelines

Noticeable features compared to standard offroad/topo map styles:

- roads colored based on OSM `surface` tag (paved/unpaved/unspecified)
- tracks share the same line thickness as residential and service roads
- dead-end (`noexit=yes`) shown as black dot, any barriers (`barrier=*`) as a red dot, fixme

Customizable Details:

- **Ground survey mode**: unpaved roads that were not added based on a ground survey (`source=GPS`), as well as paths tagged without `motorcycle=yes` will have their color faded to pink
- **Show fixme notes**: show `fixme` notes on roads/paths including text (e.g. `fixme=precision|continue|resurvey`)
- **Highlight service roads**: Show red border around service roads (`highway=service`)

<p float="left">
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-offroad-survey-plugin/master/screenshots/sample1.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-offroad-survey-plugin/master/screenshots/sample2.jpeg" width="250" />
</p>

## Setup

### OsmAnd Installation

- Install [OsmAnd](https://play.google.com/store/apps/details?id=net.osmand) application on your device
- Open the application. Tap on Get started
- Download Recommended Country dataset (if not yet installed)

### Plugin First-time Installation (Android only)

- Download [Plugin OSF file](https://github.com/cmoffroad/osmand-offroad-survey-plugin/raw/master/build/osmand-offroad-survey-plugin.osf) from your mobile browser.
- Once download is complete, click on Open.
- OsmAnd should automatically open and inform you the plugin has been successfully added.
- Wait a few seconds for Suggested maps to show up (standard, contour lines, hillshade)
- Download suggested datasets for your country (if not yet installed)
- Select OK
- Tap profile icon on top left corner
- Select offroad motorcycle icon
- Map style can be configured further under "Details".

> If a "Permission Denied" error occurs, 
> - open your Android phone Settings application
> - go to Apps > OsmAnd > Permissions
> - turn on Storage and try reinstalling the plugin

#### OsmAnd subscriptions

Please note that in the free OsmAnd version:
- elevation data (Countour lines and Terrain) is not shown
- OSM country datasets are updated once a month

If you are serious about doing offroad ground surveys, you can purchase a [one time or yearly subscription](https://docs.osmand.net/en/main@latest/osmand/purchases/android#free-and-paid-features) to enable:
- elevation data
- hourly OSM datasets update

> I am not affiliated in any way with OsmAnd, and gain no revenues from this plugin. After much research and experimentation, I have not found better platforms to build my own maps.

> The OsmAnd Live feature is extremely useful for preparing maps before a trip.  e.g. you could add in OpenStreetMap missing tracks via satellite imagery, or add fixme tag on paths that are missing data and may need to be resurveyed. Your OSM changes will appear in your OsmAnd application within an hour.

### Plugin Future Updates

Future plugin updates can be manually installed by following the exact same first 3 steps as above.

## Documentation

|Type|Tag|Style|
|---|---|---|
|way|`highway=track + surface=unpaved + source=GPS`|![](https://www.gifpng.com/100x3/000000/?border-width=0&border-type=rectangle&border-color=FFFFFF&font-size=0)|
|way|`highway=track`|![](https://www.gifpng.com/100x3/fa00ff/?border-width=0&border-type=rectangle&border-color=fa00ff&font-size=0)|
|way|`highway=path + motorcycle=yes + surface=unpaved + source=GPS`|![](https://gifpng.com/100x20/FFFFFF/000000?font-size=35&text=-%20-%20-%20-%20-)|
|way|`highway=path`|![](https://gifpng.com/100x20/F6F8FA/fa00ff?font-size=35&text=-%20-%20-%20-%20-)|
|way|`highway=footway + surface=unpaved + source=GPS`|![](https://gifpng.com/100x15/FFFFFF/000000?text=-%20-%20-%20-%20-%20-%20-%20-%20-)|
|way|`highway=footway`|![](https://gifpng.com/100x15/F6F8FA/fa00ff?text=-%20-%20-%20-%20-%20-%20-%20-%20-)|
|way|`highway={other} + surface=asphalt\|concrete\|concrete:lanes\|chipseal\|paved`|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|
|way|`highway={other} + surface={other}`|![](https://www.gifpng.com/100x6/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|
|way|`highway={other} + !surface`|![](https://www.gifpng.com/100x6/888888/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|
|way|`highway=service`|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=FF0000&font-size=0)|