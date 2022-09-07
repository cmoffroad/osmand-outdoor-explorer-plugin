const fs = require('fs');
const path = require('path')
const { exec } = require("child_process");
const sqlite3 = require('sqlite3')


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

  const xml = `<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1'
  width='${xTiles*tileSize}' height='${yTiles*tileSize}' zoom='${zoom}' mapDensity='1'
  renderingProperties='activityMode=enduro,lang=en,hideContour=true,hideBuildings=true,hideBoundaries=true,hideLanduse=true,hideWater=true'
  renderingName='src/rendering/outdoor-explorer'
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

const processZoom = (zoom, lat, lon, xTiles, yTiles, dirTiles, obfs) => {

  const [ xTileCenter, yTileCenter ] = deg2num(lat, lon, zoom);
  const xTileMin = parseInt(xTileCenter - (xTiles / 2));
  const yTileMin = parseInt(yTileCenter - (yTiles / 2));

  generateGPX(zoom, lat, lon, xTiles, yTiles, obfs);

  for (var x=0; x<xTiles; x++) {
    console.log(`mkdir -p ${dirTiles}/${zoom}/${xTileMin + x}`);
  }

  console.log(`java -Xms512M -Xmx3072M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering \
  -native=/Users/julien/Documents/WORKSPACE/OSM/OsmAnd-core-legacy/binaries/darwin/intel/Release \
  -obfFiles=./obf/ \
  -gpxFile=./tmp/${zoom}.gpx \
  -output=./tmp`);

  console.log(`convert -limit memory 2048MiB ./tmp/${zoom}.png -transparent "#FFFBF7" -crop 256x256 -set filename:tile "%[fx:page.x/256+${xTileMin}]/%[fx:page.y/256+${yTileMin}]" +repage "${dirTiles}/${zoom}/%[filename:tile].png"`);
}

const dirObfs  = `./obf`;
const dirTiles = `../osm-tools/tiles`;

const args = process.argv.slice(2);
const xTiles = Math.ceil(parseInt(args[0] || '3') / 2.0) * 2;
const yTiles = Math.ceil(parseInt(args[1] || '3') / 2.0) * 2;

const point = [ 19.070825827131095,99.03986245393754 ];
const zooms = [ 12, 13, 14 ];

const [x, y] = deg2num(point[0], point[1], zooms[0]);
const lat = tile2lat(y, zooms[0]);
const lon = tile2lon(x, zooms[0]);

console.log(`rm -rf ./tmp/*`);
console.log(`rm -rf ${dirTiles}`);

const obfs = getOBFs(dirObfs);

for (var i=0;i<zooms.length; i++) {
  processZoom(zooms[i], lat, lon, xTiles * Math.pow(2, i), yTiles * Math.pow(2, i), dirTiles, obfs);
}

const hillshadeDB = new sqlite3.Database(`./obf/Hillshade Thailand asia.sqlitedb`, (err) => {})

hillshadeDB.serialize((err) => {
  hillshadeDB.all(`SELECT * FROM tiles WHERE z = 12 LIMIT -1`, (err, items) => {
    items.forEach(item => {
      const { z, x, y, image } = item;
      const dir = `../osm-tools/tiles/${z}/${x}`;
      fs.mkdirSync(dir, { recursive: true });
      fs.writeFileSync(`${dir}/${y}-hillshade.png`, image);
    })
  });
})

const slopeDB = new sqlite3.Database(`./obf/Slope Thailand asia.sqlitedb`, (err) => {})

slopeDB.serialize((err) => {
  slopeDB.all(`SELECT * FROM tiles WHERE z = 11 LIMIT -1`, (err, items) => {
    items.forEach(item => {
      const { z, x, y, image } = item;
      const dir = `../osm-tools/tiles/${z}/${x}`;
      fs.mkdirSync(dir, { recursive: true });
      fs.writeFileSync(`${dir}/${y}-slope.png`, image);
    })
  });
})

module.exports = {
  getOBFs,
  generateGPX
}