# Stop Update service
echo '[GeoIP block]: Stop Update service'
sudo systemctl disable geoip-update

# Remove files
echo '[GeoIP block]: Remove files'
sudo rm /usr/local/bin/ipset-apply.sh
sudo rm /usr/local/bin/geoip-update.sh
sudo rm /etc/systemd/system/geoip-update.service
sudo rm /etc/systemd/system/geoip-update.timer
sudo rm -rf /etc/geoip_block/
sudo rm -rf /tmp/geoip_block/

echo '[GeoIP block]: Reload daemons'
sudo systemctl daemon-reload

echo '[GeoIP block]: Uninstall complete'