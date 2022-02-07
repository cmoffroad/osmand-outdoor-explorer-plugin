rm -rf ./tmp/*
rm -rf ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles
echo "<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1'   width='12544' height='12544' zoom='13' mapDensity='1'  renderingProperties='appMode=default,lang=en,contourLines=12,contourDensity=medium_w,contourWidth=thin'  renderingName='src/rendering/offroad-survey'>  <wpt lat='19.20742852680121' lon='98.81103515625'>    <name>13</name>    <extensions>      <maps>Thailand_asia_22_02_00,Thailand_asia_22_01_00,Thailand_asia,Thailand_asia.srtm</maps>      <zoom>13</zoom>    </extensions>  </wpt></gpx>" > ./tmp/13.gpx
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6320
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6321
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6322
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6323
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6324
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6325
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6326
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6327
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6328
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6329
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6330
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6331
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6332
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6333
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6334
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6335
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6336
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6337
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6338
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6339
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6340
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6341
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6342
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6343
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6344
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6345
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6346
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6347
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6348
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6349
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6350
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6351
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6352
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6353
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6354
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6355
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6356
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6357
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6358
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6359
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6360
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6361
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6362
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6363
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6364
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6365
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6366
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6367
mkdir -p ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/6368
java -Xms64M -Xmx1024M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering   -native=/Users/julien/Documents/WORKSPACE/OsmAnd/OsmAnd-core-legacy/binaries/darwin/intel/Release   -obfFiles=./obf/   -gpxFile=./tmp/13.gpx   -output=./tmp
convert ./tmp/13.png -crop 256x256 -set filename:tile "%[fx:page.x/256+6320]/%[fx:page.y/256+3626]" +repage "../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/tiles/13/%[filename:tile].png"
echo "<!DOCTYPE html><html><head>  <title>OsmAnd Offroad-Survey Plugin Preview (Northern Thailand)</title>  <meta charset='utf-8' />  <meta name='viewport' content='width=device-width, initial-scale=1.0'>    <link rel='stylesheet' href='https://unpkg.com/leaflet@1.7.1/dist/leaflet.css' integrity='sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==' crossorigin=''/>    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css'>    <script src='https://unpkg.com/leaflet@1.7.1/dist/leaflet.js' integrity='sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==' crossorigin=''></script>    <style>    html,body,#map{width:100%;height:100%;margin: 0; padding: 0;}  </style></head><body><div id='map'></div><script>  const center = [ 19.20742852680121, 98.81103515625 ];  const pluginLayer = L.tileLayer('./tiles/{z}/{x}/{y}.png?date=2022-02-07', {    attribution: '<a href="https://github.com/cmoffroad/osmand-offroad-survey-plugin">osmand-offroad-survey-plugin</a>'  });  var map = new L.Map('map', {     minZoom: 13,     maxZoom: 13,    maxBounds: L.latLngBounds(       L.latLng(20.200346006493724, 97.75634765625),       L.latLng(18.166730410221927, 99.90966796875)    ),    layers: [ pluginLayer ]  })  .setView(center, 13);  map.attributionControl.setPrefix('');  var baseLayers = {    'osmand-offroad-survey-plugin': pluginLayer,    'komoot': L.tileLayer('http://{s}.tile.komoot.de/komoot/{z}/{x}/{y}.png?lang=en'),    'cyclemap': L.tileLayer('https://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38'),    'mapy.cz': L.tileLayer('https://mapserver.mapy.cz/base-m/{z}-{x}-{y}?sdk=HgUbCgUbGkgqAQkYBxYEHQNHQlJfR1VfQlBZSw%3D%3D'),    'google (terrain)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=p'),    'google (satellite)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=y')  };  var overlays = {    'OSM GPS traces': L.tileLayer('https://{s}.gps-tile.openstreetmap.org/lines/{z}/{x}/{y}.png')  };  L.control.layers(baseLayers, overlays).addTo(map);</script></body></html>" > ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/index.html
open ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/index.html
