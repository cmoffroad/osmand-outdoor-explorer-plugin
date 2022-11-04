const { exec } = require("child_process");

const args = process.argv.slice(2);

const today = new Date();
const day = args[0] ? parseInt(args[0]) : today.getDate()
const month = args[1] ? parseInt(args[1]) : today.getMonth() + 1;
const year = args[2] ? parseInt(args[2]) : today.getFullYear() - 2000;

const regions = [ 'Thailand_asia' ];

regions.forEach(region => {
  const filename = `${region}_${year}_${month < 10 ? '0' : ''}${month}_${day < 10 ? '0' : ''}${day}.obf`;
  const source = `https://download.osmand.net/download?aosmc=true&self=true&file=${filename}.gz`
  const target = `./obf/${filename}`;
  console.log(`curl -k -O ${source} && gunzip -f ${target}`);
});