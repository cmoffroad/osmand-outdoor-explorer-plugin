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
  const xtile = parseInt((lon_deg + 180.0) / 360.0 * n);
  const ytile = parseInt((1.0 - Math.log(Math.tan(lat_rad) + (1 / Math.cos(lat_rad))) / Math.PI) / 2.0 * n)
  return [xtile, ytile];
}

const getOBFs = (dir) => {
  const files = fs.readdirSync(dir);

  return files
    .filter(fileName => fileName.match(/^Thailand.*\.obf$/))
    .map(fileName => ({
      name: fileName.replace(/\.obf$/, ''),
      time: fs.statSync(`${dir}/${fileName}`).mtime.getTime(),
    }))
    .sort((a, b) => b.time - a.time)
    .map(file => file.name);
};

const generateGPX = (zoom, lat, lon, xTiles, yTiles, obfs) => {
  const tileSize = 256;

  // const obfs = "Thailand_asia_22_02_10,Thailand_asia_22_02_00,Thailand_asia_22_01_00,Thailand_asia,Thailand_asia.srtm".split(',');

  const xml = `<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1' 
  width='${xTiles*tileSize}' height='${yTiles*tileSize}' zoom='${zoom}' mapDensity='1'
  renderingProperties='appMode=default,lang=en,contourLines=11,contourDensity=medium_w,contourWidth=thin'
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

const generateHTML = (zooms, lat, lon, xTiles, yTiles, date, previewDir) => {

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
    <link rel='stylesheet' href='https://unpkg.com/leaflet@1.7.1/dist/leaflet.css' integrity='sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==' crossorigin='' />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css' />
    <link rel='stylesheet' href='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.css' />
    <script src='https://unpkg.com/leaflet@1.7.1/dist/leaflet.js' integrity='sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==' crossorigin=''></script>
    <script src='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.js'></script>
    <script src='https://osmlab.github.io/osm-auth/osmauth.js'></script>
    <style>
    html,body,#map{width:100%;height:100%;margin: 0; padding: 0;}
    #crosshair { left: calc(50% - 10px); top: calc(50% - 10px); position: absolute; width: 20px; height: 20px; z-index: 10000; text-align: center; font-weight: normal; font-size: 32px; color: #222; text-shadow: 1px 1px 3px #fff; }
  </style>
</head>
<body>
<div id='map'></div>
<div id='crosshair'>⌖</div>
<script>
  
  var auth = osmAuth({
    oauth_secret: '9WfJnwQxDvvYagx1Ut0tZBsOZ0ZCzAvOje3u1TV0',
    oauth_consumer_key: 'WLwXbm6XFMG7WrVnE8enIF6GzyefYIN6oUJSxG65',
    auto: true,
    singlepage: true,
    landing: window.location.href
  });

  var urlParams = new URLSearchParams(window.location.search);
  if(urlParams.has('oauth_token')){
    auth.bootstrapToken(urlParams.get('oauth_token'), (error) => {
      if(error !== null) {
        window.location.href = window.location.origin;
      } else 
        authenticate();
    });
  }
  else {
    authenticate()
  };

  const USERS = [ 'cmoffroad' ];

  function authenticate() {
    if (auth.authenticated()) {
      loadUser();
    } else {
      auth.authenticate(loadUser);
    }
  }

  function loadUser() {
    auth.xhr({
      method: 'GET',
      path: '/api/0.6/user/details.json'
    }, (err, res) => {
      let user = undefined;
      try {
        user = JSON.parse(res).user;
      } catch (e) {}
      console.log(err, res);
      if (err || !user) {
        document.querySelector('body').innerHTML = err;
      } else if (USERS.indexOf(user.display_name) === -1) {
        document.querySelector('body').innerHTML = '<br>&nbsp;&nbsp;&nbsp;&nbsp;Please contact OSM user <a href=https://www.openstreetmap.org/message/new/cmoffroad>cmoffroad</a> to request access.';
      } else {
        draw();
      }
    });  
  }

  function logout() {
    auth.logout();
    window.location.reload(); 
  }

  function draw() {
    const hash = location.hash || '#map=13/${lat}/${lon}';
    const tokens = hash.substring(5).split('/');

    if (!location.hash) {
      history.pushState(null,null, hash);
    }

    const center = [ tokens[1], tokens[2] ], zoom = tokens[0];

    const pluginLayer = L.tileLayer('./tiles/{z}/{x}/{y}.png?date=${date}', {
      attribution: 'osmand-offroad-survey-plugin - <a href=https://github.com/cmoffroad/osmand-offroad-survey-plugin>Documentation</a> - <a href="#" onclick=logout()>Logout</a>',
      minNativeZoom: ${zoom},
      maxNativeZoom: ${zoom}
    });

    var map = new L.Map('map', { 
      minZoom: 12, 
      maxZoom: 15,
      maxBounds: ${xTiles} > 0 && ${yTiles} > 0 ? L.latLngBounds(
         L.latLng(${latMin}, ${lonMin}),
         L.latLng(${latMax}, ${lonMax})
      ) : undefined,
      layers: [ pluginLayer ],
      zoomControl: true,
      contextmenu: true,
      contextmenuWidth: 200,
      contextmenuItems: [
        {
          text: 'Center map here',
          callback: (e) => map.panTo(e.latlng)
        },
        {
          text: 'Copy coordinates',
          callback: (e) => navigator.clipboard.writeText(e.latlng.lat + ',' + e.latlng.lng)
        },
        '-',
        {
          text: 'Edit in OSM (Maxar)',
          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=Maxar-Standard&map=16/' + e.latlng.lat + '/' + e.latlng.lng)
        },
        {
          text: 'Edit in OSM (WorldTopoMap)',
          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=custom:https://{switch:services,server}.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{zoom}/{y}/{x}&map=16/' + e.latlng.lat + '/' + e.latlng.lng)
        }      
      ]
    })
    .setView(center, ${zoom});
    map.attributionControl.setPrefix('');
    map.on('moveend', (e) => {
      const center = e.target.getCenter(), zoom = e.target.getZoom();
      history.pushState(null,null, '#map=' + zoom + '/' + center.lat + '/' + center.lng);      
    });

    var baseLayers = {
      'osmand-offroad-survey-plugin': pluginLayer,
      'cyclemap': L.tileLayer('https://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38'),
      'opentopomap': L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png'),
      'worldtopomap': L.tileLayer('https://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}'),
      'komoot': L.tileLayer('https://{s}.tile.komoot.de/komoot/{z}/{x}/{y}.png?lang=en'),
      'mapy.cz': L.tileLayer('https://mapserver.mapy.cz/base-m/{z}-{x}-{y}?sdk=HgUbCgUbGkgqAQkYBxYEHQNHQlJfR1VfQlBZSw%3D%3D'),
      'google (terrain)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=p'),
      'google (satellite)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=y')
    };

    const hillshadeLayer = L.tileLayer('./tiles/{z}/{x}/{y}-hillshade.png', { minNativeZoom: 12, maxNativeZoom: 12, transparency: true, opacity: 0.2 }).addTo(map);

    var overlays = {
      'SRTM Hillshade 20%': hillshadeLayer,
      'OSM GPS traces': L.tileLayer('https://{s}.gps-tile.openstreetmap.org/lines/{z}/{x}/{y}.png'),
      'DRR Dynamic': L.tileLayer.wms('https://gisportal.drr.go.th/portal/sharing/servers/aa5fdea8d96542d49d3d8731d77458b7/rest/services/GISBaseMaps/DRR_Dynamic/MapServer/export?transparent=true&format=png&layers=show:1,2,3,4,5,6,7&bboxSR=102100&f=image')
    };

    
    L.control.layers(baseLayers, overlays).addTo(map);
  }
</script>
</body>
</html>`

  console.log(`echo "${html.replace(/\n/g, '')}" > ${previewDir}/index.html`)
}

const processZoom = (zoom, lat, lon, xTiles, yTiles, dirTiles, obfs) => {
  
  const [xTileCenter, yTileCenter] = deg2num(lat, lon, zoom);
  const xTileMin = parseInt(xTileCenter + 1 - (xTiles / 2));
  const yTileMin = parseInt(yTileCenter + 1 - (yTiles / 2));

  generateGPX(zoom, lat, lon, xTiles, yTiles, obfs);

  for (var x=0; x<xTiles; x++) {
    console.log(`mkdir -p ${dirTiles}/${zoom}/${xTileMin + x}`);
  }

  console.log(`java -Xms64M -Xmx1024M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering \
  -native=/Users/julien/Documents/WORKSPACE/OsmAnd/OsmAnd-core-legacy/binaries/darwin/intel/Release \
  -obfFiles=./obf/ \
  -gpxFile=./tmp/${zoom}.gpx \
  -output=./tmp`);

  console.log(`convert ./tmp/${zoom}.png -crop 256x256 -set filename:tile "%[fx:page.x/256+${xTileMin}]/%[fx:page.y/256+${yTileMin}]" +repage "${dirTiles}/${zoom}/%[filename:tile].png"`);
}

const args = process.argv.slice(2);
const tiles = parseInt(args[0] || '0');

// const lat = 19.3619, lon = 98.6302;
// const lat = 19.2085242, lon = 98.8059622;
const center = [ 19.2085242, 98.8059622 ];
const zooms = [13];

// needs to be odd for now
const xTiles = tiles;
const yTiles = tiles;

const [x, y] = deg2num(center[0], center[1], zooms[0]);
const lat = tile2lat(y+0.5, zooms[0]), lon = tile2lon(x+0.5, zooms[0]);

const date = new Date().toISOString().split('T')[0];

const previewDir = `../../OSM/osm-tools/osmand-offroad-survey-plugin-preview`;

if (xTiles > 0 && yTiles > 0) {
  const dirTiles = `${previewDir}/tiles`;
  const dirObfs  = `./obf`;

  console.log(`rm -rf ./tmp/*`);
  console.log(`rm -rf ${dirTiles}`);

  const obfs = getOBFs(dirObfs);

  for (var i=0;i<zooms.length; i++) {
    processZoom(zooms[i], lat, lon, xTiles/Math.pow(2, i), yTiles/Math.pow(2, i), dirTiles, obfs);
  }

  console.log(`node ./scripts/tiles/extract.js`);
}

generateHTML(zooms, lat, lon, xTiles, yTiles, date, previewDir);

console.log(`npx serve -l 1234 ${previewDir}`);
// console.log(`open ${previewDir}/index.html`);