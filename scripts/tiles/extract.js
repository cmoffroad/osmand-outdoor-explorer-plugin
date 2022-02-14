const fs = require('fs')

const sqlite3 = require('sqlite3')

const db = new sqlite3.Database(`./obf/Hillshade Thailand asia.sqlitedb`, (err) => {})

db.serialize((err) => {
  db.all(`SELECT * FROM tiles WHERE z = 12 LIMIT -1`, (err, items) => {
    items.forEach(item => {
      const { z, x, y, image } = item;
      const dir = `../osm-tools/osmand-offroad-survey-plugin-preview/tiles/${z}/${x}`;
      fs.mkdirSync(dir, { recursive: true });
      fs.writeFileSync(`${dir}/${y}-hillshade.png`, image);
    })
  });
})