echo "<!DOCTYPE html><html><head>  <title>OsmAnd Offroad-Survey Plugin Preview (Northern Thailand)</title>  <meta charset='utf-8' />  <meta name='viewport' content='width=device-width, initial-scale=1.0'>    <link rel='stylesheet' href='https://unpkg.com/leaflet@1.7.1/dist/leaflet.css' integrity='sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==' crossorigin='' />    <link rel='stylesheet' href='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.css' />    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css' />    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.5.0/mapbox-gl.css' rel='stylesheet' />    <script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'></script>    <script src='https://unpkg.com/leaflet@1.7.1/dist/leaflet.js' integrity='sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==' crossorigin=''></script>    <script src='https://aratcliffe.github.io/Leaflet.contextmenu/dist/leaflet.contextmenu.js'></script>    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.5.0/mapbox-gl.js'></script>    <script src="https://unpkg.com/mapbox-gl-leaflet/leaflet-mapbox-gl.js"></script>    <script src='https://osmlab.github.io/osm-auth/osmauth.js'></script>    <style>    html,body,.app,.map,#map{width:100%;height:100%;margin: 0; padding: 0;}    .app { opacity: 0; }    .navigation { position: fixed; z-index: 967; }    .feedback { top: 50%; position: fixed; left: 50%; transform: translate(-50%, -50%); z-index: 1000; }    .logout { display: none; }    #crosshair { user-select: none; left: calc(50% - 10px); top: calc(50% - 10px); position: absolute; width: 20px; height: 20px; z-index: 10000; text-align: center; font-weight: normal; font-size: 32px; color: #222; text-shadow: 1px 1px 3px #fff; }  </style></head><body>  <div class='feedback'>Authenticating...</div>  <div class='app'>    <nav class='navigation light-blue lighten-1'>      <div class='nav-wrapper'>        <ul class='right'>          <li><a href='./build/osmand-offroad-survey-plugin.osf'>Download</a></li>          <li><a href='https://github.com/cmoffroad/osmand-offroad-survey-plugin'>Documentation</a></li>          <li class='logout'><a href='#' onclick='logout()'>Logout</a></li>        </ul>      </div>    </nav>    <div class='map'>      <div id='map'></div>      <div id='crosshair'>⌖</div>    </div>  </div>  <script>  var auth = osmAuth({    oauth_secret: '9WfJnwQxDvvYagx1Ut0tZBsOZ0ZCzAvOje3u1TV0',    oauth_consumer_key: 'WLwXbm6XFMG7WrVnE8enIF6GzyefYIN6oUJSxG65',    auto: true,    singlepage: true,    landing: window.location.href  });  if (window.location.protocol.match('file')) {    draw();  } else {    var urlParams = new URLSearchParams(window.location.search);    if(urlParams.has('oauth_token')){      auth.bootstrapToken(urlParams.get('oauth_token'), (error) => {        if(error !== null) {          window.location.href = window.location.origin;        } else           authenticate();      });    }    else {      authenticate();    };  }  const USERS = [ 'cmoffroad', 'crsCR', 'kellerk', 'Bernhard Hiller', 'Russ McD', 'cdohrman', 'ben-cnx', 'CMEtours' ];  function authenticate() {    if (auth.authenticated()) {      loadUser();    } else {      auth.authenticate(loadUser);    }  }  function loadUser() {    auth.xhr({      method: 'GET',      path: '/api/0.6/user/details.json'    }, (err, res) => {      let user = undefined;      try {        user = JSON.parse(res).user;      } catch (e) {}      if (err || !user) {        document.querySelector('.feedback').innerHTML = err;      } else if (USERS.indexOf(user.display_name) === -1) {        document.querySelector('.feedback').innerHTML = 'Please contact OSM user <a href=https://www.openstreetmap.org/message/new/cmoffroad>cmoffroad</a> to request access.';      } else {        document.querySelector('.logout').style.display = 'block';        draw();      }    });    }  function logout() {    auth.logout();    window.location.reload();   }  function getTileURL(zoom, lat, lon) {    var xtile = parseInt(Math.floor( (lon + 180) / 360 * (1<<zoom) ));    var ytile = parseInt(Math.floor( (1 - Math.log(Math.tan(lat * Math.PI / 180) + 1 / Math.cos(lat * Math.PI / 180)) / Math.PI) / 2 * (1<<zoom) ));    return '/tiles/' + zoom + '/' + xtile + '/' + ytile;  }  function draw() {    const hash = location.hash || '#map=13/19.20742852680121/98.81103515625';    const tokens = hash.substring(5).split('/').map(t => parseFloat(t));    if (!location.hash) {      history.pushState(null,null, hash);    }    const center = [ tokens[1], tokens[2] ], zoom = tokens[0];    console.log(center, zoom);    const pluginLayer = L.tileLayer('./tiles/{z}/{x}/{y}.png?date=2022-03-29', {      attribution: '',      minNativeZoom: 13,      maxNativeZoom: 13    });    var map = new L.Map('map', {       minZoom: 12,       maxZoom: 16,      maxBounds: 0 > 0 && 0 > 0 ? L.latLngBounds(         L.latLng(19.186677697957826, 98.8330078125),         L.latLng(19.186677697957826, 98.8330078125)      ) : undefined,      layers: [ pluginLayer ],      zoomControl: false,      contextmenu: true,      contextmenuWidth: 200,      contextmenuItems: [        {          text: 'Center map here',          callback: (e) => map.panTo(e.latlng)        },        '-',        {          text: 'Copy coordinates',          callback: (e) => navigator.clipboard.writeText(e.latlng.lat + ',' + e.latlng.lng)        },        {          text: 'Copy tile URL',          callback: (e) => navigator.clipboard.writeText(getTileURL(map.getZoom(), e.latlng.lat, e.latlng.lng))        },        '-',        {          text: 'Download GPS data',          callback: (e) => window.open('https://api.openstreetmap.org/api/0.6/trackpoints?bbox=' + [map.getBounds().getWest(),map.getBounds().getSouth(),map.getBounds().getEast(),map.getBounds().getNorth()].join(',') + '&page=0')        },        '-',        {          text: 'Compare Aerial Imagery',          callback: (e) => window.open('https://www.cmoffroad.com/aerial-imagery/#map=' + map.getZoom() + '/' + e.latlng.lat + '/' + e.latlng.lng)        },        {          text: 'Open with Thailands Roads Map',          callback: (e) => window.open('http://www.cmoffroad.com/thailand-roads/#map=' + map.getZoom() + '/' + e.latlng.lat + '/' + e.latlng.lng)        },        '-',        {          text: 'Open with Google (Terrain)',          callback: (e) => window.open('https://www.google.com/maps/@?api=1&map_action=map&basemap=terrain&center='+ e.latlng.lat + ',' + e.latlng.lng + '&zoom=' + map.getZoom())        },        {          text: 'Open with Google (Street View)',          callback: (e) => window.open('https://www.google.com/maps/@?api=1&map_action=pano&basemap=terrain&viewpoint='+ e.latlng.lat + ',' + e.latlng.lng + '&zoom=' + map.getZoom())        },        '-',        {          text: 'Edit in OSM (Maxar)',          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=Maxar-Standard&map=16/' + e.latlng.lat + '/' + e.latlng.lng)        },        {          text: 'Edit in OSM (WorldTopoMap)',          callback: (e) => window.open('https://www.openstreetmap.org/edit#background=custom:https://{switch:services,server}.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{zoom}/{y}/{x}&map=16/' + e.latlng.lat + '/' + e.latlng.lng)        }      ]    });    map.attributionControl.setPrefix('');    map.on('moveend', (e) => {      const center = e.target.getCenter(), zoom = e.target.getZoom();      history.pushState(null,null, '#map=' + zoom + '/' + center.lat + '/' + center.lng);          });    var baseLayers = {      'osmand-offroad-survey-plugin': pluginLayer,      'komoot': L.tileLayer('https://tile.hosted.thunderforest.com/komoot-2/{z}/{x}/{y}.png'),      'strava': L.tileLayer('https://a.tiles.mapbox.com/styles/v1/strava/ck2gt6oil0c7y1cnvlz1uphnu/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic3RyYXZhIiwiYSI6IlpoeXU2U0UifQ.c7yhlZevNRFCqHYm6G6Cyg'),      'maps.me': L.mapboxGL({ style: 'https://tiles.maps.me/styles/mapsme_style.json' }),      'mapy.cz': L.tileLayer('https://mapserver.mapy.cz/base-m/{z}-{x}-{y}?sdk=HgUbCgUbGkgqAQkYBxYEHQNHQlJfR1VfQlBZSw%3D%3D'),      'osm': L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png'),      'cyclosm': L.tileLayer('https://b.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png'),      'cyclemap': L.tileLayer('https://{s}.tile.thunderforest.com/cycle/{z}/{x}/{y}.png?apikey=6170aad10dfd42a38d4d8c709a536f38'),      'opentopomap': L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png'),      'worldtopomap': L.tileLayer('https://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}'),      'google (terrain)': L.tileLayer('https://mt3.Google.com/vt?z={z}&x={x}&y={y}&lyrs=p'),      'none': L.tileLayer('')    };    const hillshadeLayer = L.tileLayer('./tiles/{z}/{x}/{y}-hillshade.png', { minNativeZoom: 12, maxNativeZoom: 12, transparency: true, opacity: 0.2 }).addTo(map);    const overlays = {      'SRTM Hillshade 20%': hillshadeLayer,      'Mapbox Locator': L.tileLayer('https://api.mapbox.com/styles/v1/openstreetmap/ckasmteyi1tda1ipfis6wqhuq/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoib3BlbnN0cmVldG1hcCIsImEiOiJja2w5YWtqbDAwcGFkMnZtdngzbWtlbDE3In0.U3DODCbBGFfFXkilttz1YA', { minNativeZoom: 15 }),      'OSM GPS traces': L.tileLayer('https://{s}.gps-tile.openstreetmap.org/lines/{z}/{x}/{y}.png'),      'Strava traces': L.tileLayer('https://heatmap-external-a.strava.com/tiles/all/bluered/{z}/{x}/{y}.png?px=256', { maxNativeZoom: 12 }),      'L7108': L.tileLayer.wms('http://cld.drr.go.th/geoserver/gwc/service/wms?service=WMS&request=GetMap&layers=ProtoPj%3Agis_road_l7018&styles=&format=image%2Fpng&transparent=true&version=1.1.1&srs=EPSG%3A3857')    };    L.control.zoom({ position: 'bottomleft' }).addTo(map);        L.control.layers(baseLayers, overlays, { position: 'bottomright' } ).addTo(map);    map.setView(center, 13);        document.querySelector('.app').style.opacity = 1;    document.querySelector('.feedback').style.display = 'none';  }</script></body></html>" > ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview/index.html
npx serve -l 1234 ../../OSM/osm-tools/osmand-offroad-survey-plugin-preview
