#! /bin/bash

cd /tmp
rm plexmediaserver_*.deb
wget --trust-server-names  https://dev2day.de/plex-latest
sudo dpkg -i plex*
sudo service plexmediaserver stop
cd /tmp/
mkdir libc6
cd libc6
wget http://ftp.us.debian.org/debian/pool/main/g/glibc/libc6_2.19-15_armhf.deb
dpkg-deb -x libc6_2.19-15_armhf.deb ./
cp -a lib/arm-linux-gnueabihf/libm-2.19.so /opt/plex/Application
cd /opt/plex/Application
chmod ugo+x libm-2.19.so
ln -s libm-2.19.so libm.so.6
sudo apt-get install mkvtoolnix libexpat1 ffmpeg -y
sudo service plexmdiaserver restart
