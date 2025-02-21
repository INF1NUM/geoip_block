# Install dependencies
echo '[GeoIP block]: Install dependencies'
sudo apt install ipset iprange netfilter-persistent -y

# Download archive
echo '[GeoIP block]: Download archive'
wget -nv https://github.com/INF1NUM/geoip_block/archive/refs/heads/main.tar.gz
tar -xvzf main.tar.gz 1> /dev/null
cd geoip_block-main/

# Copy files
echo '[GeoIP block]: Copy files'
sudo cp ipset-apply.sh /usr/local/bin/ipset-apply.sh
sudo cp geoip-update.sh /usr/local/bin/geoip-update.sh
sudo cp geoip-update.service /etc/systemd/system/geoip-update.service
sudo cp geoip-update.timer /etc/systemd/system/geoip-update.timer
sudo chmod +x /usr/local/bin/ipset-apply.sh
sudo chmod +x /usr/local/bin/geoip-update.sh
sudo mkdir /etc/geoip_block
sudo cp url.list /etc/geoip_block/url.list


# Start Update service
echo '[GeoIP block]: Start Update service'
sudo systemctl daemon-reload
sudo systemctl enable geoip-update --now

echo '[GeoIP block]: Install complete'