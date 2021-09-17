# OsmAnd Offroad Survey Plugin (Android only)

This plugin for OsmAnd can be used for off-road ground surveys and includes a lightweight map style improving the appearance of unpaved roads and trails.

Based on following offroad guidelines: https://github.com/cmoffroad/osm-guidelines

Noticeable features compared to standard offroad/topo map styles:

- roads colored based on OSM `surface` tag (paved/unpaved/unspecified)
- tracks share the same line thickness as residential and service roads
- path use straight line when `motorcycle=yes` is enabled

Customizable Details:

- **Ground survey mode**: unpaved roads/paths that were not added based on ground survey (`source=GPS`) will have their color faded to grey
- **Show fixme notes**: show `fixme` notes on roads/paths including text (e.g. `fixme=precision|continue|resurvey`)
- **Highlight service roads**: Show red border around service roads (`highway=service`)
- **Highlight residential roads**: Show orange border around residential roads (`highway=residential`)

<p float="left">
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-offroad-survey-plugin/master/screenshots/sample1.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/cmoffroad/osmand-offroad-survey-plugin/master/screenshots/sample2.jpeg" width="250" />
</p>

## Setup

### OsmAnd Installation

- Install [OsmAnd](https://play.google.com/store/apps/details?id=net.osmand) application on your device
- Open the application. Tap on Get started
- Download Recommended Country dataset (if not yet installed)
- Open Menu > Plugins > make sure Trip Recording is enabled

### Plugin First-time Installation (Android only)

- Download [Plugin OSF file](https://github.com/cmoffroad/osmand-offroad-survey-plugin/raw/master/build/osmand-offroad-survey-plugin.osf) from your mobile browser.
- Once download is complete, click on Open.
- OsmAnd should automatically open and inform you the plugin has been successfully added.
- Wait a few seconds for Suggested maps to show up
- Download suggested datasets for your country (if any)
- Select OK

> If a "Permission Denied" error occurs, 
> - open your Android phone Settings application
> - go to Apps > OsmAnd > Permissions
> - turn on Storage and try reinstalling the plugin

### Plugin Future Updates

Future plugin updates can be manually installed by following the exact same first 3 steps as above.

## Documentation

> Work in progress...

|Type|Tag|Style|Condition|
|---|---|---|---|
|way|`fixme=*`||`showFixme=yes`|
|way|`highway=service`||`showService=yes`|
|way|`highway=residential`||`showResidential=yes`|
|way|`highway=path`||`motorcycle=yes`|
|way|`highway=path`||`motorcycle=no \|\| !motorcycle`|
|way|`surface=asphalt`|||
|way|`surface=concrete`|||
|way|`surface=chipseal`|||
|way|`surface=paved`|||
|way|`surface={other}`||`!groundSurveyMode \|\| source=GPS`|
|way|`surface={other}`||`groundSurveyMode && source!=GPS`|
|way|`!surface`|||
|node|`amenity=place_of_worship`|||
|node|`barrier=gate`|||
|node|`fixme=*`||`showFixme=yes`|
|node|`ford=yes`|||
|node|`natural=cave_entrance`|||
|node|`noexit=yes`|||
|node|`fixme=*`|||
|node|`tourism=viewpoint`|||
|node|`waterway=waterfall`||