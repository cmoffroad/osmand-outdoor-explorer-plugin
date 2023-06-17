cd tests/
#osmium extract --bbox=98.29,18.18,99.59,19.7 --set-bounds --strategy=smart thailand-200101.osm.pbf  --output chiangmai-200101.osm.pbf
bash ../../OsmAndMapCreator-main/utilities.sh generate-obf ./chiangmai-200101.osm.pbf --rendering-types=../../OsmAnd-resources/obf_creation/rendering_types.xml
# bash ../../OsmAndMapCreator-main/inspector.sh -vmap -vmapobjects ./Map.obf > ./Map.log