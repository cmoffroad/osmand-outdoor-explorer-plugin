# OsmAnd Outdoor Explorer Plugin

This plugin for OsmAnd includes a renderer for outdoor exploration with a focus on enduro, MTB and hiking..

Based on following offroad guidelines: https://github.com/cmoffroad/osm-guidelines

Noticeable features compared to standard offroad/topo map styles:

- roads colored based on OSM `surface` tag (paved/unpaved)
- tracks have the same line thickness as residential and service roads
- dead-end shown as black dots, obstacles and all other barriers as red dots
- unpaved roads and paths that have not been confirmed with a ground survey have their color set to pink (e.g. added via satellite imagery)

<p float="left">
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-outdoor-explorer-plugin/master/screenshots/sample1.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-outdoor-explorer-plugin/master/screenshots/sample2.jpeg" width="250" />
</p>

## Setup

### OsmAnd Installation

- Install [OsmAnd](https://play.google.com/store/apps/details?id=net.osmand) application on your device
- Open the application. Tap on Get started
- Download Recommended Country dataset (if not yet installed)

### Plugin First-time Installation (Android only)

- From your mobile browser, open [Web Preview.](https://www.cmoffroad.com/osmand-outdoor-explorer-plugin-preview/) and click on Download.
- Once download is complete, click on Open.
- OsmAnd should automatically open and inform you the plugin has been successfully added.
- Wait a few seconds for Suggested maps to show up (standard, contour lines, hillshade)
- Download suggested datasets for your country (if not yet installed)
- Select OK
- Tap current profile icon on top left corner
- Scroll down to Map Style and select "Outdoor Explorer"
- Map style can be configured further under "Details".
- Select Activity Mode (enduro, mtb or hiking) to highlight trails difficulty.

> If a "Permission Denied" error occurs, 
> - open your Android phone Settings application
> - go to Apps > OsmAnd > Permissions
> - turn on Storage and try reinstalling the plugin

#### OsmAnd subscriptions

Please note that in the free OsmAnd version:
- elevation data (Contour lines and Terrain) is not shown
- OSM country datasets are updated once a month

If you are serious about doing outdoor exploration, you can purchase a one time or yearly subscription to enable:
- elevation data
- hourly OSM datasets update

> Note: I am not affiliated in any way with OsmAnd, and gain no revenues from this plugin. After much research and experimentation, I have not found a better platform to build my own maps.

> The OsmAnd Live feature is extremely useful for preparing maps before a trip.  e.g. you could add in OpenStreetMap missing tracks via satellite imagery. Your OSM changes will appear in your OsmAnd application within an hour.

### Plugin Future Updates

- From your mobile browser, open [Web Preview.](https://www.cmoffroad.com/osmand-outdoor-explorer-plugin-preview/) and click on Download.
- Once download is complete, click on Open.
- OsmAnd should automatically open and inform you the plugin has been successfully added (updated)
- Close and re-open the application to be sure the rendered is updated.

## Documentation

Notes:
- `Unconfirmed`: based on satellite imagery, may not exists nor be accurate.
- `surface=paved`: support custom tag values `paved`, `asphalt`, `chipseal`, `concrete`, `concrete:plates`, `concrete:lanes`, `paving_stones`
- `surface=unpaved`: support all other surface tag values

### Major Roads

|Style|Category|OpenStreetMap Tags|
|---|---|---|
|![](https://www.gifpng.com/100x12/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=motorway\|trunk\|primary\|secondary + surface=paved + source=GPS`
|![](https://www.gifpng.com/100x12/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unpaved|`highway=motorway\|trunk\|primary\|secondary + surface=unpaved + source=GPS`|
|![](https://www.gifpng.com/100x12/888888/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unconfirmed|`highway=motorway\|trunk\|primary\|secondary`|

### Minor Roads

|Style|Category|OpenStreetMap Tags|
|---|---|---|
|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=tertiary\|unclassified\|residential\|service + surface=paved + source=GPS`|
|![](https://www.gifpng.com/100x6/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unpaved|`highway=tertiary\|unclassified\|residential\|service + surface=unpaved + source=GPS`|
|![](https://www.gifpng.com/100x6/888888/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unconfirmed|`highway=tertiary\|unclassified\|residential\|service`|

### Double Tracks

|Style|Category|OpenStreetMap Tags|
|---|---|---|
|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=track + surface=paved + source=GPS`|
|![](https://www.gifpng.com/100x6/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unpaved|`highway=track + surface=unpaved + source=GPS`|
|![](https://www.gifpng.com/100x6/888888/?border-width=0&font-size=0)|Unconfirmed|`highway=track`|

### Trails Difficulty (Activity Mode `enduro`)

|Style|Category|OpenStreetMap Tags |
|---|---|---|
|![](https://www.gifpng.com/100x3/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=path + surface=paved + source=GPS `<br>`+ motorcycle=yes`|
|![](https://www.gifpng.com/100x2/000000/?border-width=0&font-size=0)|Beginner|`highway=path + surface=unpaved + source=GPS + motorcycle=yes `<br>` (+ dirtbike:scale=0\|1)`|
|![](https://www.gifpng.com/100x2/4caf50/?border-width=0&font-size=0)|Intermediate|`highway=path + surface=unpaved + source=GPS + motorcycle=yes `<br>`+ dirtbike:scale=2`|
|![](https://www.gifpng.com/100x2/f57c00/?border-width=0&font-size=0)|Advanced|`highway=path + surface=unpaved + source=GPS + motorcycle=yes `<br>`+ dirtbike:scale=3`|
|![](https://www.gifpng.com/100x2/f50057/?border-width=0&font-size=0)|Extreme|`highway=path + surface=unpaved + source=GPS + motorcycle=yes `<br>`+ dirtbike:scale=4\|5\|6`|
|![](https://www.gifpng.com/100x2/e040fb/?border-width=0&font-size=0)|Unknown|`highway=path + surface=unpaved + source=GPS`|
|![](https://www.gifpng.com/100x2/9e9e9e/?border-width=0&font-size=0)|Unconfirmed|`highway=path`|

### Trails Visibility

|Style|Category|OpenStreetMap Tags |
|---|---|---|
|![](https://www.gifpng.com/100x2/000000/?border-width=0&font-size=0)|Good|`(+ trail_visibility=good\|excellent)`|
|--------------|Poor|`+ trail_visibility=bad\|intermediate`|
|.......................|Horrible|`+ trail_visibility=no\|horrible`|


> Difficulty rating based on https://wiki.openstreetmap.org/wiki/User:CMoffroad/Key:dirtbike:scale




## Questions

Do you have any questions, or want to report a bug or request an improvement? 

Please contact me via:
- https://www.facebook.com/osmexplorer
- https://www.openstreetmap.org/message/new/cmoffroad