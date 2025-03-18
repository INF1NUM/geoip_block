#!/bin/bash

echo '[GeoIP block]: Stop services...'
sudo systemctl disable geoip-update.timer geoip-update.service geoip-boot.service
sudo systemctl reset-failed
sudo systemctl daemon-reload

echo '[GeoIP block]: Remove files'
sudo rm /etc/systemd/system/geoip-update.service
sudo rm /etc/systemd/system/geoip-update.timer
sudo rm /etc/systemd/system/geoip-boot.service
sudo rm /usr/local/bin/geoip_block
sudo rm -rf /opt/geoip_block/

echo '[GeoIP block]: Uninstall complete'
