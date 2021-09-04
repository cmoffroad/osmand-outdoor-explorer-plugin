cd ./src && zip -x "**/.DS_Store" -r ../build/osmand-plugin-enduro.osf .

git add ../build/osmand-plugin-enduro.osf
git commit -m "update OSF"
git push