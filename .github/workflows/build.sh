#!/bin/bash

VERSION="$1"
echo "$VERSION"

if [ -d "build/" ]; then
  rm -rf build/
fi
mkdir build

build () {

  if [ -d "temp/" ]; then
    rm -rf temp/
  fi
  mkdir temp

  rsync -av * temp/
  rsync -av .packwizignore temp/
  rsync -av "$1/" temp/

  cd temp/

    sed 's/version = "1.0.0"/version = "'$3'"/' pack.toml
    packwiz mr export --output "../build/$1.mrpack"

  cd ..

  rm -rf temp/

}

build "fabric" '\n[versions]\nfabric = "0.14.21"\nminecraft = "1.19.2"' "$VERSION"
build "forge" '\n[versions]\nforge = "43.2.0"\nminecraft = "1.19.2"' "$VERSION"
