const { exec } = require("child_process");

const now = new Date();
const month = now.getMonth() + 1;
const year = now.getFullYear() - 2000;

const regions = [ 'Thailand_asia', 'Indonesia_nusa-tenggara-timur_asia' ]

regions.forEach(region => {
  const filename = `${region}_${year}_${month < 10 ? '0' : ''}${month}_00.obf`;
  const source = `https://download.osmand.net/download?aosmc=true&self=true&file=${filename}.gz`
  const target = `./obf/${filename}`;
  const command = `curl -k -o - ${source} | gunzip > ${target}`;
  console.log(command);
});