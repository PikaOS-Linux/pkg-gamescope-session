DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/KyleGospo/gamescope-session
cp -rvf ./debian ./gamescope-session
cd ./gamescope-session
patch -Np1 -i ./fedora.patch
patch -Np1 -i ../patches/0001-update-to-work-on-nobara-with-hdr.patch

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
