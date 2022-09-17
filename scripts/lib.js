const fs = require('fs');
const path = require('path')
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

const getOBFs = (dir, files) => {
   return files
    .filter(fileName => fileName.match(/.*\.obf$/))
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

  console.log(`convert ./tmp/${zoom}.png -transparent white ./tmp/${zoom}.png`);

  console.log(`convert -limit memory 2048MiB ./tmp/${zoom}.png -crop 256x256 -set filename:tile "%[fx:page.x/256+${xTileMin}]/%[fx:page.y/256+${yTileMin}]" +repage "${dirTiles}/${zoom}/%[filename:tile].png"`);
}


const processSqlite = (file, zooms, targetDir) => {
  const sqlite = new sqlite3.Database(file, (err) => {});

  sqlite.serialize((err) => {
    zooms.forEach(zoom => {
      sqlite.all(`SELECT * FROM tiles WHERE z = ${zoom} LIMIT -1`, (err, items) => {
        items.forEach(item => {
          const { z, x, y, image } = item;
          const dir = `${targetDir}/${z}/${x}`;
          fs.mkdirSync(dir, { recursive: true });
          fs.writeFileSync(`${dir}/${y}.png`, image);
        })
      });
    });
  });
}


const processOBFs = (dir, country, center, xTiles, yTiles, zooms) => {

  const files = fs.readdirSync(dir).filter(f => f.match(country));

  // compute list OBFs
  const obfs = getOBFs(dir, files);

  // reset folders
  //console.log(`rm -rf ./tmp/*`);
  //console.log(`rm -rf ${dirTiles}`);

  // compute precise lat/lon
  const [x, y] = deg2num(center[0], center[1], zooms[0]);
  const lat = tile2lat(y, zooms[0]);
  const lon = tile2lon(x, zooms[0]);


  // process each zoom
  for (var i=0;i<zooms.length; i++) {
    processZoom(zooms[i], lat, lon, xTiles * Math.pow(2, i), yTiles * Math.pow(2, i), `../osm-tools/tiles`, obfs);
  }

  // process hilldshades if exists
  const hillshadeFile = files.find(filename => filename.match('Hillshade'));
  if (hillshadeFile)
    processSqlite(path.join(dir, hillshadeFile), [ 12 ], `../osm-tools/tiles/hillshade`);

  // process slopes if exists
  const slopeFile = files.find(filename => filename.match('Slope'));
  if (hillshadeFile)
    processSqlite(path.join(dir, hillshadeFile), [ 12 ], `../osm-tools/tiles/slope`);
}

module.exports = {
  getOBFs,
  generateGPX,
  processOBFs
}