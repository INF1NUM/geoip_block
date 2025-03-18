#!/bin/bash
echo '[GeoIP block]: Install dependencies'
sudo apt install ipset iprange -y

echo '[GeoIP block]: Download archive'
wget -nv https://github.com/INF1NUM/geoip_block/archive/refs/heads/main.tar.gz
tar -xvzf main.tar.gz 1> /dev/null
rm main.tar.gz
cd geoip_block-main/

echo '[GeoIP block]: Create folders'
sudo mkdir -p /opt/geoip_block/etc
sudo mkdir -p /opt/geoip_block/bin
sudo mkdir -p /opt/geoip_block/data

echo '[GeoIP block]: Copy files'
sudo cp ipset-apply.sh /opt/geoip_block/bin/ipset-apply.sh
sudo cp geoip-block.sh /opt/geoip_block/bin/geoip-block.sh
sudo cp url.list /opt/geoip_block/etc/url.list
sudo cp geoip_block.conf /opt/geoip_block/etc/geoip_block.conf
sudo cp iptables.rule /opt/geoip_block/etc/iptables.rule
sudo cp geoip-update.service /opt/geoip_block/etc/geoip-update.service
sudo cp geoip-update.timer /opt/geoip_block/etc/geoip-update.timer
sudo cp geoip-boot.service /opt/geoip_block/etc/geoip-boot.service
sudo chmod +x /opt/geoip_block/bin/ipset-apply.sh
sudo chmod +x /opt/geoip_block/bin/geoip-block.sh
sudo ln -s /opt/geoip_block/bin/geoip-block.sh /usr/local/bin/geoip_block

echo '[GeoIP block]: Start Update service'
sudo systemctl link /opt/geoip_block/etc/geoip-update.service
sudo systemctl link /opt/geoip_block/etc/geoip-update.timer
sudo systemctl link /opt/geoip_block/etc/geoip-boot.service
sudo systemctl enable geoip-boot.service
sudo systemctl enable geoip-update.timer --now

echo '[GeoIP block]: Install complete'
