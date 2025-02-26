# Install dependencies
echo '[GeoIP block]: Install dependencies'
sudo apt install ipset iprange -y

# Download archive
echo '[GeoIP block]: Download archive'
wget -nv https://github.com/INF1NUM/geoip_block/archive/refs/heads/main.tar.gz
tar -xvzf main.tar.gz 1> /dev/null
cd geoip_block-main/

# Copy files
echo '[GeoIP block]: Create folders'
sudo mkdir -p /opt/geoip_block/etc
sudo mkdir -p /opt/geoip_block/bin
sudo mkdir -p /opt/geoip_block/data
echo '[GeoIP block]: Copy files'
sudo cp ipset-apply.sh /opt/geoip_block/bin/ipset-apply.sh
sudo cp geoip-update.sh /opt/geoip_block/bin/geoip-update.sh
sudo cp url.list /opt/geoip_block/etc/url.list
sudo cp geoip_block.conf /opt/geoip_block/etc/geoip_block.conf
sudo cp iptables.rule /opt/geoip_block/etc/iptables.rule
sudo cp geoip-update.service /etc/systemd/system/geoip-update.service
sudo cp geoip-update.timer /etc/systemd/system/geoip-update.timer
sudo chmod +x /opt/geoip_block/bin/ipset-apply.sh
sudo chmod +x /opt/geoip_block/bin/geoip-update.sh

# Start Update service
echo '[GeoIP block]: Start Update service'
sudo systemctl daemon-reload
sudo systemctl enable geoip-update --now

echo '[GeoIP block]: Install complete'
