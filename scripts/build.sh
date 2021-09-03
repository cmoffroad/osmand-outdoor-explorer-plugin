zip -x "**/.DS_Store" -r ./build/enduro-plugin-latest.osf ./src/

git add ./build/enduro-plugin-latest.osf
git commit -m "update OSF"
git push