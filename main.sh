DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/PikaOS-linux/gamescope-session
cp -rvf ./debian ./gamescope-session
cd ./gamescope-session

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
