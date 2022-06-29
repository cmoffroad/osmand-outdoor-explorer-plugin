# OsmAnd Offroad Survey Plugin

This plugin for OsmAnd includes a default profile for offroad surveys and a lightweight map style improving the appearance of unpaved roads and trails.

Based on following offroad guidelines: https://github.com/cmoffroad/osm-guidelines

Noticeable features compared to standard offroad/topo map styles:

- roads colored based on OSM `surface` tag (paved/unpaved)
- tracks have the same line thickness as residential and service roads
- dead-end (`noexit=yes`) shown as black dots, fallen trees (`barrier=log`) and all other barriers (`barrier=*`) as red dots, fixme as pink dots
- unpaved roads and paths that have not been confirmed with a ground survey (`source=GPS`) have their color set to pink (e.g. added via satellite imagery)

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

- From your mobile browser, login via OpenStreetMap to [Web Preview.](https://www.cmoffroad.com/osmand-offroad-survey-plugin-preview/) and click on Download.
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
- elevation data (Contour lines and Terrain) is not shown
- OSM country datasets are updated once a month

If you are serious about doing offroad ground surveys, you can purchase a one time or yearly subscription to enable:
- elevation data
- hourly OSM datasets update

> Note: I am not affiliated in any way with OsmAnd, and gain no revenues from this plugin. After much research and experimentation, I have not found a better platform to build my own maps.

> The OsmAnd Live feature is extremely useful for preparing maps before a trip.  e.g. you could add in OpenStreetMap missing tracks via satellite imagery. Your OSM changes will appear in your OsmAnd application within an hour.

### Plugin Future Updates

Future plugin updates can be manually installed by following the exact same first 3 steps as above.

## Documentation

Notes:
- `Unconfirmed`: based on satellite imagery, may not be accurate.
- `Confirmed`: verified on the ground using a GPS trace
- `surface=paved`: support custom tag values `paved`, `asphalt`, `chipseal`, `concrete`, `concrete:plates`, `concrete:lanes`, `paving_stones`
- `surface=unpaved`: support all other surface tag values

### Major Roads

|Style|Category|OpenStreetMap Tags|
|---|---|---|
|![](https://www.gifpng.com/100x12/888888/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unconfirmed|`highway=motorway\|trunk\|primary\|secondary`|
|![](https://www.gifpng.com/100x12/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=motorway\|trunk\|primary\|secondary + surface=paved + source=GPS`
|![](https://www.gifpng.com/100x12/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unpaved|`highway=motorway\|trunk\|primary\|secondary + surface=unpaved + source=GPS`|

### Minor Roads

|Style|Category|OpenStreetMap Tags|
|---|---|---|
|![](https://www.gifpng.com/100x6/888888/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unconfirmed|`highway=tertiary\|unclassified\|residential\|service`|
|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=tertiary\|unclassified\|residential\|service + surface=paved + source=GPS`|
|![](https://www.gifpng.com/100x6/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unpaved|`highway=tertiary\|unclassified\|residential\|service + surface=unpaved + source=GPS`|

### Double Tracks

|Style|Category|OpenStreetMap Tags |
|---|---|---|
|![](https://www.gifpng.com/100x3/fa00ff/?border-width=0&border-type=rectangle&border-color=fa00ff&font-size=0)|Unconfirmed|`highway=track`|
|![](https://www.gifpng.com/100x6/FFFFFF/?border-width=1&border-type=rectangle&border-color=000000&font-size=0)|Paved|`highway=track + surface=paved + source=GPS`|
|![](https://www.gifpng.com/100x6/000000/?border-width=1&border-type=rectangle&border-color=FFFFFF&font-size=0)|Beginner/Unknown|`highway=track + surface=unpaved + source=GPS`|
|![](https://www.gifpng.com/100x8/000000/?border-width=2&border-type=rectangle&border-color=ffeb3b&font-size=0)|Intermediate|`highway=track + surface=unpaved + source=GPS + dirtbike:scale=2`|
|![](https://www.gifpng.com/100x8/000000/?border-width=2&border-type=rectangle&border-color=ff9800&font-size=0)|Advanced|`highway=track + surface=unpaved + source=GPS + dirtbike:scale=3`|
|![](https://www.gifpng.com/100x8/000000/?border-width=2&border-type=rectangle&border-color=f44336&font-size=0)|Pro|`highway=track + surface=unpaved + source=GPS + dirtbike:scale=4`|

### Motorcycle Single Tracks

|Style|Category|OpenStreetMap Tags |
|---|---|---|
|![](https://www.gifpng.com/100x1/fa00ff/?border-width=0&border-type=rectangle&border-color=FFFFFF&font-size=0)|Unconfirmed|`highway=path + motorcycle=yes`|
|![](https://www.gifpng.com/100x1/000000/?border-width=0&border-type=rectangle&border-color=FFFFFF&font-size=0)|Paved|`highway=path + surface=paved + motorcycle=yes + source=GPS`|
|![](https://www.gifpng.com/100x1/000000/?border-width=0&border-type=rectangle&border-color=FFFFFF&font-size=0)|Beginner/Unknown|`highway=path + surface=unpaved + motorcycle=yes + source=GPS`|
|![](https://www.gifpng.com/100x3/000000/ffeb3b?border-width=1&border-type=rectangle&border-color=ffeb3b&font-size=0)|Intermediate|`highway=path + surface=unpaved + motorcycle=yes + source=GPS + dirtbike:scale=2`|
|![](https://www.gifpng.com/100x3/000000/?border-width=1&border-type=rectangle&border-color=ff9800&font-size=0)|Advanced|`highway=path + surface=unpaved + motorcycle=yes + source=GPS + dirtbike:scale=3`|
|![](https://www.gifpng.com/100x3/000000/?border-width=1&border-type=rectangle&border-color=f44336&font-size=0)|Pro|`highway=path + surface=unpaved + motorcycle=yes + source=GPS + dirtbike:scale=4`|

### Hiking Trails

|Style|Category|OpenStreetMap Tags |
|---|---|---|
|![](https://gifpng.com/100x20/FFFFFF/fa00ff?font-size=35&text=%E2%80%93%E2%80%93%E2%80%93%E2%80%93%E2%80%93)|Unconfirmed|`highway=path\|footway`|
|![](https://gifpng.com/100x20/f6f8fa/000000?font-size=35&text=%E2%80%93%E2%80%93%E2%80%93%E2%80%93%E2%80%93)|Confirmed|`highway=path\|footway + surface=unpaved + source=GPS`|
|![](https://gifpng.com/100x20/FFFFFF/FF0000?font-size=35&text=-%20-%20-%20-%20-)|Impassable|`highway=path + smoothness=impassable`|
|![](https://gifpng.com/100x20/f6f8fa/FF0000?font-size=35&text=-%20-%20-%20-%20-)|Stairs|`highway=steps`|

## Questions

Do you have any questions, or want to report a bug or request an improvement? 

Please contact me via:
- https://www.facebook.com/osmexplorer
- https://www.openstreetmap.org/message/new/cmoffroad