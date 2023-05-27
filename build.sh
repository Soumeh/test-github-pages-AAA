# make build dir
if [ -d "build/" ]; then
  rm -rf build/
fi
mkdir build


# make temp dir
if [ -d "temp/" ]; then
  rm -rf temp/
fi
mkdir temp

# copy everything into temp
rsync -av * temp/ --exclude=temp/ --exclude=fabric/ --exclude=forge/ --exclude=build.sh

# copy fabric data into temp
rsync -av fabric/ temp/

cd temp/
echo -e '\n[versions]\nfabric = "0.14.21"\nminecraft = "1.19.2"' >> pack.toml

# build
packwiz mr export --output ../build/fabric.mrpack

cd ..


# remake temp dir
if [ -d "temp/" ]; then
  rm -rf temp/
fi
mkdir temp

# copy everything into temp
rsync -av * temp/ --exclude=temp/ --exclude=fabric/ --exclude=forge/ --exclude=build.sh

# copy forge data into temp
rsync -av forge/ temp/

cd temp/
echo -e '\n[versions]\nforge = "43.2.0"\nminecraft = "1.19.2"' >> pack.toml

# build
packwiz mr export --output ../build/forge.mrpack

cd ..

rm -rf temp/
