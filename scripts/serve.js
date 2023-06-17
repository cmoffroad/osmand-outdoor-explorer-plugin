const express = require('express');
const path = require('path');
const fs = require('fs');
const child_process = require("child_process");
const preview = require('./preview');

const generateGPX = (zoom, lat, lon, width, height, obfs) => {
  const xml = `<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<gpx version='1.1' xmlns='http://www.topografix.com/GPX/1/1'
  width='${width}' height='${height}' zoom='${zoom}' mapDensity='1'
  renderingProperties='activityMode=enduro,hideUnconfirmed=true,lang=en,contourLines=11,contourDensity=medium_w,contourWidth=thin'
  renderingName='src/rendering/outdoor-explorer'
>
  <wpt lat='${lat}' lon='${lon}'>
    <name>serve</name>
    <extensions>
      <maps>${obfs.join(',')}</maps>
      <zoom>${zoom}</zoom>
    </extensions>
  </wpt>
</gpx>`;

  return xml;
}

const exec = async (command) => {
  return new Promise((resolve, reject) => {
    child_process.exec(command, (error, stdout, stderr) => {
      if (error) reject(error);
      else resolve(stdout);
    });
  });
}


const generateImage = async (zoom, lat, lon, width, height) => {
  console.log(zoom, lat, lon, width, height);
  const obfs = preview.getOBFs('./latest');
  const now = +new Date();
  const imgPath = path.join(__dirname, '..', 'tmp', `serve.png`);
  const gpxPath = path.join(__dirname, '..', 'tmp', 'serve.gpx');
  const gpx = generateGPX(zoom, lat, lon, width, height, obfs);
  const command = (`java -Xms64M -Xmx1024M -cp ../OsmAndMapCreator-main/OsmAndMapCreator.jar net.osmand.swing.OsmAndImageRendering \
-native=/Users/julien/Documents/WORKSPACE/OSM/OsmAnd-core-legacy/binaries/darwin/intel/Release \
-obfFiles=./latest/ \
-gpxFile=${gpxPath} \
-output=./tmp`);
  console.log(command);
  await fs.promises.writeFile(gpxPath, gpx);
  await exec(command);
  return imgPath;
}

express()
.get('', (req, res, next) => {
  const { zoom, lat, lon, width, height } = req.query
  generateImage(parseInt(zoom), parseFloat(lat), parseFloat(lon), parseInt(width), parseInt(height))
  .then(path => res.sendFile(path))
  .catch(err => next(err))
})
.listen(8888, () => {
  console.log(`Build server started at http://localhost:8888`)
})