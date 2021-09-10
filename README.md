# OsmAnd Plugin Enduro (Android only)

This plugin for OsmAnd includes a profile for Enduro riders and a lightweight style improving the appearance of unpaved roads and trails.

Noticeable features compared to standard offroad/topo map styles:

- roads colored based on OSM `surface` tag (paved/unpaved/unspecified)
- tracks share the same line thickness as residential and service roads
- path use straight line when `motorcycle=yes`

Customizable Details:

- **Ground survey mode**: unpaved roads/paths that were not added based on ground survey (`source=GPS|survey|mapillary`) will have their color faded to grey
- **Show fixme notes**: show `fixme` notes on roads/paths including text (e.g. `fixme=precision|continue|resurvey`)
- **Show gas stations**: include gas stations with an icon
- **Highlight service roads**: Show red border around service roads (`highway=service`)
- **Highlight residential roads**: Show orange border around residential roads (`highway=residential`)

<p float="left">
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-plugin-enduro/master/screenshots/sample1.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-plugin-enduro/master/screenshots/sample2.jpeg" width="250" />
</p>

## Setup

### OsmAnd Installation

- Install [OsmAnd](https://play.google.com/store/apps/details?id=net.osmand) application on your device
- Open the application. Tap on Get started

### Plugin First-time Installation (Android only)

- Download [Plugin OSF file](https://github.com/cmoffroad/osmand-plugin-enduro/raw/master/build/osmand-plugin-enduro.osf) from your mobile browser.
- Once download is complete, click on Open.
- OsmAnd should automatically open and inform you the plugin has been successfully added.
- Wait a few seconds for Suggested maps to show up
- Download suggested datasets for your country (if any)
- Select OK
- Tap on Menu Button (bottom left)
- Tap on current profile icon (top left)
- Select Enduro profile

> If a "Permission Denied" occurs, go to your Android phone Settings > Apps > OsmAnd > Permissions and turn on Storage

### Plugin Future Updates

Future plugin updates can be manually installed by following the exact same first 3 steps as above.

## Documentation

> Work in progress...

|Type|Tag|Style|Condition|
|---|---|---|---|
|way|`fixme=*`||`showFixme`|
|way|`highway=service`||`showService`|
|way|`highway=residential`||`showResidential`|
|way|`highway=path`||`motorcycle=yes`|
|way|`highway=path`||`motorcycle=no \|\| !motorcycle`|
|way|`surface=asphalt`|||
|way|`surface=concrete`|||
|way|`surface=chipseal`|||
|way|`surface=paved`|||
|way|`surface={other}`||`!groundSurveyMode \|\| source=GPS\|survey\|mapillary`|
|way|`surface={other}`||`groundSurveyMode && source!=GPS\|survey\|mapillary`|
|way|`!surface`|||
|node|`amenity=fuel`||`showFuel`|
|node|`amenity=place_of_worship`|||
|node|`fixme=*`||`showFixme`|
|node|`ford=yes`|||
|node|`gate=*`|||
|node|`noexit=yes`|||
