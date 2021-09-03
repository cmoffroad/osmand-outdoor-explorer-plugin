zip -x "**/.DS_Store" -r ./build/cmoffroad-enduro-latest.osf ./src/

git add ./build/cmoffroad-enduro-latest.osf
git commit -m "update OSF"
git push