rm -rf ./tmp/*
rm -rf ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles
npm run hillshade
echo "<?xml version='1.0' encoding='UTF-8' standalone='yes' ?><gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1'  width='12544' height='12544' zoom='13' mapDensity='1'  renderingProperties='activityMode=enduro,hideUnconfirmed=true,lang=en,contourLines=11,contourDensity=medium_w,contourWidth=thin'  renderingName='src/rendering/outdoor-explorer'>  <wpt lat='19.20742852680121' lon='98.81103515625'>    <name>13</name>    <extensions>      <maps>Thailand_asia_22_07_00,Thailand_asia_22_06_00,Thailand_asia_22_04_00,Thailand_asia_22_05_00,Thailand_asia,Thailand_asia.srtm</maps>      <zoom>13</zoom>    </extensions>  </wpt></gpx>" > ./tmp/13.gpx
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6320
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6321
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6322
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6323
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6324
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6325
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6326
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6327
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6328
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6329
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6330
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6331
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6332
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6333
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6334
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6335
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6336
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6337
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6338
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6339
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6340
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6341
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6342
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6343
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6344
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6345
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6346
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6347
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6348
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6349
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6350
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6351
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6352
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6353
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6354
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6355
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6356
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6357
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6358
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6359
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6360
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6361
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6362
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6363
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6364
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6365
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6366
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6367
mkdir -p ../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/6368
java -Xms64M -Xmx1024M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering   -native=/Users/julien/Documents/WORKSPACE/OSM/OsmAnd-core-legacy/binaries/darwin/intel/Release   -obfFiles=./obf/   -gpxFile=./tmp/13.gpx   -output=./tmp
convert ./tmp/13.png -crop 256x256 -set filename:tile "%[fx:page.x/256+6320]/%[fx:page.y/256+3626]" +repage "../osm-tools/osmand-outdoor-explorer-plugin-preview/tiles/13/%[filename:tile].png"
node ./scripts/tiles/extract.js
echo "<!DOCTYPE html><html><head>  <title>OsmAnd Outdoor Explorer Plugin Preview (Northern Thailand)</title>  <meta charset='utf-8' />  <meta name='viewport' content='width=device-width, initial-scale=1.0'>    <link rel='stylesheet' href='https://unpkg.com/leaflet@1.7.1/dist/leaflet.css' integrity='sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==' crossorigin='' />    <link rel='stylesheet' href='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.css' />    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css' />    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.5.0/mapbox-gl.css' rel='stylesheet' />    <script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'></script>    <script src='https://unpkg.com/leaflet@1.7.1/dist/leaflet.js' integrity='sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==' crossorigin=''></script>    <script src='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.js'></script>    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.5.0/mapbox-gl.js'></script>    <script src="https://unpkg.com/mapbox-gl-leaflet/leaflet-mapbox-gl.js"></script>    <style>    html,body,.app,.map,#map{width:100%;height:100%;margin: 0; padding: 0;}    .navigation { position: fixed; z-index: 967; }    .feedback { top: 50%; position: fixed; left: 50%; transform: translate(-50%, -50%); z-index: 1000; }    .logout { display: none; }    #crosshair { user-select: none; left: calc(50% - 10px); top: calc(50% - 10px); position: absolute; width: 20px; height: 20px; z-index: 10000; text-align: center; font-weight: normal; font-size: 32px; color: #222; text-shadow: 1px 1px 3px #fff; }    .leaflet-layer.slope img { filter: grayscale(1); }  </style></head><body>  <div class='app'>    <nav class='navigation light-blue lighten-1'>      <div class='nav-wrapper'>        <h5 class='left white-text hide-on-small-only'>&nbsp;&nbsp;osmand-outdoor-explorer-plugin</h5>        <ul class='right'>          <li><a target="_blank" href='./build/osmand-outdoor-explorer-plugin.osf'>Download</a></li>          <li><a target="_blank" href='https://github.com/cmoffroad/osmand-outdoor-explorer-plugin'>Documentation</a></li>          <li class='logout'><a href='#' onclick='logout()'>Logout</a></li>        </ul>      </div>    </nav>    <div class='map'>      <div id='map'></div>      <div id='crosshair'>⌖</div>    </div>  </div>  <script>  function getTileURL(zoom, lat, lon) {    var xtile = parseInt(Math.floor( (lon + 180) / 360 * (1<<zoom) ));    var ytile = parseInt(Math.floor( (1 - Math.log(Math.tan(lat * Math.PI / 180) + 1 / Math.cos(lat * Math.PI / 180)) / Math.PI) / 2 * (1<<zoom) ));    return '/tiles/' + zoom + '/' + xtile + '/' + ytile;  }  function draw() {    const hash = location.hash || '#map=13/19.20742852680121/98.81103515625';    const tokens = hash.substring(5).split('/').map(t => parseFloat(t));    if (!location.hash) {      history.pushState(null,null, hash);    }    const center = [ tokens[1], tokens[2] ], zoom = tokens[0];    console.log(center, zoom);    const pluginLayer = L.tileLayer('./tiles/{z}/{x}/{y}.png?date=2022-07-08', {      attribution: '',      minNativeZoom: 13,      maxNativeZoom: 13    });    var map = new L.Map('map', {      minZoom: 12,      maxZoom: 16,      maxBounds: 49 > 0 && 49 > 0 ? L.latLngBounds(         L.latLng(20.200346006493724, 97.75634765625),         L.latLng(18.166730410221927, 99.90966796875)      ) : undefined,      layers: [ pluginLayer ],      zoomControl: false,      contextmenu: true,      contextmenuWidth: 200,      contextmenuItems: [        {          text: 'Center map here',          callback: (e) => map.panTo(e.latlng)        },        '-',        {          text: 'Copy coordinates',          callback: (e) => navigator.clipboard.writeText(e.latlng.lat + ',' + e.latlng.lng)        },        {          text: 'Copy tile URL',          callback: (e) => navigator.clipboard.writeText(getTileURL(map.getZoom(), e.latlng.lat, e.latlng.lng))        },        '-',        {          text: 'Download GPS data',          callback: (e) => window.open('https://api.openstreetmap.org/api/0.6/trackpoints?bbox=' + [map.getBounds().getWest(),map.getBounds().getSouth(),map.getBounds().getEast(),map.getBounds().getNorth()].join(',') + '&page=0')        },        '-',        {          text: 'Compare Aerial Imagery',          callback: (e) => window.open('https://www.cmoffroad.com/aerial-imagery/#map=' + map.getZoom() + '/' + e.latlng.lat + '/' + e.latlng.lng)        },        {          text: 'Open with Thailands Roads Map',          callback: (e) => window.open('http://www.cmoffroad.com/thailand-roads/#map=' + map.getZoom() + '/' + e.latlng.lat + '/' + e.latlng.lng)        },        '-',        {          text: 'Open with Google (Terrain)',          callback: (e) => window.open('https://www.google.com/maps/@?api=1&map_action=map&basemap=terrain&center='+ e.latlng.lat + ',' + e.latlng.lng + '&zoom=' + map.getZoom())        },        {          text: 'Open with Google (Street View)',          callback: (e) => window.open('https://www.google.com/maps/@?api=1&map_action=pano&basemap=terrain&viewpoint='+ e.latlng.lat + ',' + e.latlng.lng + '&zoom=' + map.getZoom())        },        '-',        {          text: 'Edit in OSM (Maxar)',          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=Maxar-Standard&map=16/' + e.latlng.lat + '/' + e.latlng.lng)        },        {          text: 'Edit in OSM (Bing)',          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=Bing&map=16/' + e.latlng.lat + '/' + e.latlng.lng)        }      ]    });    map.attributionControl.setPrefix('');    map.on('moveend', (e) => {      const center = e.target.getCenter(), zoom = e.target.getZoom();      history.pushState(null,null, '#map=' + zoom + '/' + center.lat + '/' + center.lng);    });    var baseLayers = {      'osmand-outdoor-explorer-plugin': pluginLayer,      'komoot': L.tileLayer('https://tile.hosted.thunderforest.com/komoot-2/{z}/{x}/{y}.png'),      'strava': L.tileLayer('https://a.tiles.mapbox.com/styles/v1/strava/ck2gt6oil0c7y1cnvlz1uphnu/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic3RyYXZhIiwiYSI6IlpoeXU2U0UifQ.c7yhlZevNRFCqHYm6G6Cyg'),      'mapy.cz': L.tileLayer('https://mapserver.mapy.cz/base-m/{z}-{x}-{y}?sdk=HgUbCgUbGkgqAQkYBxYEHQNHQlJfR1VfQlBZSw%3D%3D'),      'osm': L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png'),      'cyclosm': L.tileLayer('https://b.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png'),      'cyclemap': L.tileLayer('https://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38'),      'opentopomap': L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png'),      'worldtopomap': L.tileLayer('https://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}'),      'google (terrain)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=p'),      'google (satellite)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=s'),      'none': L.tileLayer('')    };    const hillshadeLayer = L.tileLayer('./tiles/{z}/{x}/{y}-hillshade.png', { className: 'hillshade', minNativeZoom: 12, maxNativeZoom: 12, transparency: true, opacity: 0.2 }).addTo(map);    const slopeLayer = L.tileLayer('./tiles/{z}/{x}/{y}-slope.png', { className: 'slope', minNativeZoom: 11, maxNativeZoom: 11, transparency: true, opacity: 0.5 });    const overlays = {      'SRTM Hillshade': hillshadeLayer,      'SRTM Slope': slopeLayer,      'OSM GPS traces': L.tileLayer('https://{s}.gps-tile.openstreetmap.org/lines/{z}/{x}/{y}.png'),      'Strava Heatmap': L.tileLayer('https://heatmap-external-a.strava.com/tiles/all/bluered/{z}/{x}/{y}.png?px=256', { maxNativeZoom: 12 })    };    L.control.zoom({ position: 'bottomleft' }).addTo(map);    L.control.layers(baseLayers, overlays, { position: 'bottomright' } ).addTo(map);    map.setView(center, 13);    document.querySelector('.app').style.opacity = 1;    document.querySelector('.feedback').style.display = 'none';  }  draw();</script></body></html>" > ../osm-tools/osmand-outdoor-explorer-plugin-preview/index.html
npx serve -l 1234 ../osm-tools/osmand-outdoor-explorer-plugin-preview
