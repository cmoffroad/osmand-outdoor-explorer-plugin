YEAR=$(date -j -v-1d +%y)
MONTH=$(date -j -v-1d +%m)
DAY=${1:-00}
FILE=Thailand_asia_${YEAR}_${MONTH}_${DAY}.obf
SOURCE="https://download.osmand.net/download?aosmc=true&self=true&file=${FILE}.gz"
TARGET="./obf/${FILE}"

echo $SOURCE

curl -k -o - $SOURCE | gunzip > $TARGET