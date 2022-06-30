YEAR=$(date +%y)
MONTH=$(date +%m)
FILE=Thailand_asia_${YEAR}_${MONTH}_00.obf
SOURCE="https://download.osmand.net/download?aosmc=true&self=true&file=${FILE}.gz"
TARGET="./obf/${FILE}"

curl -k -o - $SOURCE | gunzip > $TARGET