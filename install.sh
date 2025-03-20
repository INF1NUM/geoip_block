#!/bin/bash
APPDIR='/opt/geoip_block'

echo '[GeoIP block]: Installing dependencies...'
sudo apt install ipset iprange -y

echo '[GeoIP block]: Downloading programm files...'
wget -nv https://github.com/INF1NUM/geoip_block/archive/refs/heads/main.tar.gz
tar -xvzf main.tar.gz 1> /dev/null
rm main.tar.gz
cd geoip_block-main/

echo '[GeoIP block]: Сreating a directory structure...'
sudo mkdir -p ${APPDIR}/{etc,bin,data}

echo '[GeoIP block]: Сopying program files...'
sudo cp ipset-apply.sh ${APPDIR}/bin/
sudo cp geoip-block.sh ${APPDIR}/bin/
sudo cp url.list ${APPDIR}/etc/
sudo cp geoip_block.conf ${APPDIR}/etc/
sudo cp iptables.rule ${APPDIR}/etc/
sudo cp geoip-update.service ${APPDIR}/etc/
sudo cp geoip-update.timer ${APPDIR}/etc/
sudo cp geoip-boot.service ${APPDIR}/etc/
sudo chmod +x ${APPDIR}/bin/
sudo chmod +x ${APPDIR}/bin/
sudo ln -s ${APPDIR}/bin/geoip-block.sh" "/usr/local/bin/geoip_block

echo '[GeoIP block]: Setting up Update service...'
sudo systemctl link ${APPDIR}/etc/geoip-update.service
sudo systemctl link ${APPDIR}/etc/geoip-update.timer
sudo systemctl link ${APPDIR}/etc/geoip-boot.service
sudo systemctl enable geoip-boot.service
sudo systemctl enable geoip-update.timer --now

echo '[GeoIP block]: Cleaning...'
rm -rf ../geoip_block-main

echo '[GeoIP block]: Install complete'
