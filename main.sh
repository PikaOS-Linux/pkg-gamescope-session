DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports

# Clone Upstream
cd ./gamescope-session

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
