const { processOBFs } = require('./lib');

// const fs = require('fs')
// const files = fs.readdirSync(dir).filter(f => f.match(country));
// console.log(files)

processOBFs(`./obf`, 'Thailand',  [ 19.070825827131095,99.03986245393754 ], 25, 20, [ 12, 13 ]);
// processOBFs(`./obf`, 'Indonesia', [ -8.656135907033477, 121.07986792148543 ], 20, 8, [ 12, 13 ]);