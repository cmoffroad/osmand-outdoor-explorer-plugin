const express = require('express')
const sqlite3 = require('sqlite3')

const dbs = {};

express()
.use('/:db/:z/:x/:y', (req, res, next) => {
  const { db } = req.params;

  if (!dbs.hasOwnProperty(db)) {
    const connection = new sqlite3.Database(`./obf/${db}.sqlitedb`, (err) => {
      if (err)
        return next(err);

      dbs[db] = connection;
      next();
    })
  } else next();
})
.get('/:db/:z/:x/:y', (req, res, next) => {
  const { db, z, x, y } = req.params;
  dbs[db].get(`SELECT * FROM tiles WHERE z = ${z} AND x = ${x} AND y = ${y} LIMIT 1`, (err, data) => {
    if (err)
      next(err);

    if (!data)
      return res.status(400).send('not Found')

    const img = Buffer.from(data.image, 'base64');

    res.writeHead(200, {
      'Content-Type': 'image/png',
      'Content-Length': img.length
    });
    res.end(img);
  })
})
.listen(3000);