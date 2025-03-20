#!/bin/bash

echo '[GeoIP block]: Uninstall services...'
sudo systemctl disable geoip-update.timer geoip-update.service geoip-boot.service 2> /dev/null
sudo systemctl reset-failed
sudo systemctl daemon-reload

echo '[GeoIP block]: Remove files'
sudo rm /etc/systemd/system/geoip-update.service 2> /dev/null
sudo rm /etc/systemd/system/geoip-update.timer 2> /dev/null
sudo rm /etc/systemd/system/geoip-boot.service 2> /dev/null
sudo rm /usr/local/bin/geoip_block  2> /dev/null
sudo rm -rf /opt/geoip_block/  2> /dev/null

echo '[GeoIP block]: Uninstall complete'
