const fs = require('fs');
const path = require('path')
const { exec } = require("child_process");

function tile2lon(x,z) { return (x/Math.pow(2,z)*360-180); }

function tile2lat(y,z) {
  var n=Math.PI-2*Math.PI*y/Math.pow(2,z);
  return (180/Math.PI*Math.atan(0.5*(Math.exp(n)-Math.exp(-n))));
}

const deg2num = (lat_deg, lon_deg, zoom) => {
  const lat_rad = lat_deg * (Math.PI / 180);
  const n = Math.pow(2.0, zoom);
  const xtile = ((lon_deg + 180.0) / 360.0 * n);
  const ytile = ((1.0 - Math.log(Math.tan(lat_rad) + (1 / Math.cos(lat_rad))) / Math.PI) / 2.0 * n)
  return [xtile, ytile];
}

const generateGPX = (zoom, lat, lon, xTiles, yTiles) => {
  const tileSize = 256;

  const obfs = "Thailand_asia_22_02_00,Thailand_asia_22_01_00,Thailand_asia,Thailand_asia.srtm".split(',');

  const xml = `<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1' 
  width='${xTiles*tileSize}' height='${yTiles*tileSize}' zoom='${zoom}' 
  renderingProperties='appMode=default,lang=en,contourLines=12,contourDensity=medium_w,contourWidth=thin'
  renderingName='src/rendering/offroad-survey'
>
  <wpt lat='${lat}' lon='${lon}'>
    <name>${zoom}</name>
    <extensions>
      <maps>${obfs.join(',')}</maps>
      <zoom>${zoom}</zoom>
    </extensions>
  </wpt>
</gpx>`;
  
  console.log(`echo "${xml.replace(/\n/g, '')}" > ./tmp/${zoom}.gpx`)
}

const generateHTML = (zooms, lat, lon, date, previewDir) => {

  const zoom = zooms[0]

  const [xTileCenter, yTileCenter] = deg2num(lat, lon, zoom);
  const xTileMin = xTileCenter + 1 - (xTiles / 2);
  const xTileMax = xTileMin + xTiles;
  const yTileMin = yTileCenter + 1 - (yTiles / 2);
  const yTileMax = yTileMin + yTiles;

  const lonMin = tile2lon(xTileMin, zoom);
  const lonMax = tile2lon(xTileMax, zoom);
  const latMin = tile2lat(yTileMin, zoom);
  const latMax = tile2lat(yTileMax, zoom);

  const html = `<!DOCTYPE html>
<html>
<head>
  <title>OsmAnd Offroad-Survey Plugin Preview (Northern Thailand)</title>
  <meta charset='utf-8' />
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='stylesheet' href='https://unpkg.com/leaflet@1.7.1/dist/leaflet.css' integrity='sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==' crossorigin=''/>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css'>
    <script src='https://unpkg.com/leaflet@1.7.1/dist/leaflet.js' integrity='sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==' crossorigin=''></script>
    <style>
    html,body,#map{width:100%;height:100%;margin: 0; padding: 0;}
  </style>
</head>
<body>
<div id='map'></div>
<script>
  const center = [ ${lat}, ${lon} ];

  const pluginLayer = L.tileLayer('./tiles/{z}/{x}/{y}.png?date=${date}', {
    attribution: '<a href="https://github.com/cmoffroad/osmand-offroad-survey-plugin">osmand-offroad-survey-plugin</a>'
  });

  var map = new L.Map('map', { 
    minZoom: ${zooms[zooms.length-1]}, 
    maxZoom: ${zoom},
    maxBounds: L.latLngBounds(
       L.latLng(${latMin}, ${lonMin}),
       L.latLng(${latMax}, ${lonMax})
    ),
    layers: [ pluginLayer ]
  })
  .setView(center, ${zoom});
  map.attributionControl.setPrefix('');

  var baseLayers = {
    'osmand-offroad-survey-plugin': pluginLayer,
    'komoot': L.tileLayer('http://{s}.tile.komoot.de/komoot/{z}/{x}/{y}.png?lang=en'),
    'cyclemap': L.tileLayer('https://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38'),
    'mapy.cz': L.tileLayer('https://mapserver.mapy.cz/base-m/{z}-{x}-{y}?sdk=HgUbCgUbGkgqAQkYBxYEHQNHQlJfR1VfQlBZSw%3D%3D'),
    'google (terrain)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=p'),
    'google (satellite)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=y')
  };

  var overlays = {
    'OSM GPS traces': L.tileLayer('https://{s}.gps-tile.openstreetmap.org/lines/{z}/{x}/{y}.png')
  };

  L.control.layers(baseLayers, overlays).addTo(map);
</script>
</body>
</html>`

  console.log(`echo "${html.replace(/\n/g, '')}" > ${previewDir}/index.html`)
}

const processZoom = (zoom, lat, lon, xTiles, yTiles, dirTiles) => {
  
  const [xTileCenter, yTileCenter] = deg2num(lat, lon, zoom);
  const xTileMin = parseInt(xTileCenter + 0.5 - (xTiles) / 2);
  const yTileMin = parseInt(yTileCenter + 0.5 - (yTiles) / 2);

  generateGPX(zoom, lat, lon, xTiles, yTiles);

  for (var x=0; x<xTiles; x++) {
    console.log(`mkdir -p ${dirTiles}/${zoom}/${xTileMin + x}`);
  }

  console.log(`java -Xms64M -Xmx512M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering \
  -native=/Users/julien/Documents/WORKSPACE/OsmAnd/OsmAnd-core-legacy/binaries/darwin/intel/Release \
  -obfFiles=./obf/ \
  -gpxFile=./tmp/${zoom}.gpx \
  -output=./tmp`);

  console.log(`convert ./tmp/${zoom}.png -crop 256x256 -set filename:tile "%[fx:page.x/256+${xTileMin}]/%[fx:page.y/256+${yTileMin}]" +repage "${dirTiles}/${zoom}/%[filename:tile].png"`);
}

// const lat = 19.3619, lon = 98.6302;
const lat = 19.2085242, lon = 98.8059622;
const zooms = [13];

const xTiles = 35;
const yTiles = 30;

const date = new Date().toISOString().split('T')[0];

const previewDir = `../../OSM/osm-tools/osmand-offroad-survey-plugin-preview`;
const dirTiles = `${previewDir}/tiles`;

console.log(`rm -rf ./tmp/*`);
console.log(`rm -rf ${dirTiles}`);

for (var i=0;i<zooms.length; i++) {
  processZoom(zooms[i], lat, lon, xTiles/Math.pow(2, i), yTiles/Math.pow(2, i), dirTiles);
}

generateHTML(zooms, lat, lon, date, previewDir);

console.log(`open ${previewDir}/index.html`);