#!/bin/bash
echo '[GeoIP block]: Stop Update service'
sudo systemctl disable geoip-update.timer --now
sudo systemctl disable geoip-boot.service --now

echo '[GeoIP block]: Remove files'
sudo rm /etc/systemd/system/geoip-update.service
sudo rm /etc/systemd/system/geoip-update.timer
sudo rm /etc/systemd/system/geoip-boot.service
sudo rm /usr/local/bin/geoip_block
sudo rm -rf /opt/geoip_block/
echo '[GeoIP block]: Reload daemons'
sudo systemctl daemon-reload

echo '[GeoIP block]: Uninstall complete'
