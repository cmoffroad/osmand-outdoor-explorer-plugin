cd tests/
bash ../../OsmAndMapCreator-main/utilities.sh generate-obf ./Map.osm --rendering-types=../../OsmAnd-resources/obf_creation/rendering_types.xml
bash ../../OsmAndMapCreator-main/inspector.sh -vmap -vmapobjects ./Map.obf > ./Map.log
cat Map.log