const fs = require('fs');

const today = new Date();

let year = today.getFullYear() - 2000;
if (year < 10)
  year = `0${year}`;

let month = today.getMonth() + 1;
if (month < 10)
  month = `0${month}`;

let day = today.getDate()
if (day < 10)
  day = `0${day}`;

const regions = [ 'Thailand_asia' ];

regions.forEach(region => {
  removeFiles(region, year, month);
  downloadFile(region, year, month, "00");
  downloadFile(region, year, month, day);
});

function downloadFile(region, year, month, day) {
  const filename = `${region}_${year}_${month}_${day}.obf`;
  const source = `https://download.osmand.net/download?aosmc=true&self=true&file=${filename}.gz`
  const target = `./latest/${filename}`;
  console.log(`curl -k -o - "${source}" | gunzip > "${target}"`);  
}

function removeFiles(region, year, month) {
  const files = fs.readdirSync('./latest/').filter(f => f.match(`${region}_${year}_${month}`)); 
  files.forEach(file => {
    console.log(`rm ./latest/${file}`)
  });
}