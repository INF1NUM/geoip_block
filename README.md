# GeoIP block
Simple GeoIP filter for ipset

## Install
```bash
wget -O - https://github.com/INF1NUM/geoip_block/raw/refs/heads/main/install.sh | bash
```

## Uninstall
```bash
wget -O - https://github.com/INF1NUM/geoip_block/raw/refs/heads/main/uninstall.sh | bash
```

# Configure
Add direct link to *.ipset or *.netset file to /etc/geoip_block/url.list.
Use iptables command to restrict access by ipset.
For example:
```bash
iptables -A INPUT -i eth0 -p tcp -m set ! --match-set country_ru src -m tcp --dport 22 -j DROP
```

Sources
- https://github.com/firehol/blocklist-ipsets
- https://github.com/firehol/firehol/tree/master/contrib
- https://www.seenlyst.com/blog/iptables-ipset-block-country-vpn/
