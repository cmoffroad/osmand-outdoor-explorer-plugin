const { processSnapshots } = require('./lib');

const obfs = {
  latest: ['Thailand_asia.srtm', 'Thailand_asia'],
  2020: ['Thailand_asia.srtm', 'Chiangmai-200101']
}

const zoom = 13;

// processSnapshots('mae-tang', zoom, 19.179953, 98.77687, 1920, 1080, obfs);
// processSnapshots('samoeng-south', zoom, 18.76203943805478, 98.67446927373197, 1920, 1080, obfs);
// processSnapshots('mae-rim', zoom, 18.960233952694963,98.81782404378954, 1920, 1080, obfs);
// processSnapshots('doi-mon-lan', zoom, 19.483556396738397,99.3281062839093, 1080, 1920, obfs);
// processSnapshots('chiang-dao', zoom, 19.311450194917143, 98.84769879771719, 1920, 1080, obfs);