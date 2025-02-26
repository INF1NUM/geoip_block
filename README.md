# GeoIP block
Simple GeoIP filter for ipset

## Install
```bash
wget -nv -O - https://github.com/INF1NUM/geoip_block/raw/refs/heads/main/install.sh | bash
```

## Uninstall
```bash
wget -nv -O - https://github.com/INF1NUM/geoip_block/raw/refs/heads/main/uninstall.sh | bash
```

# Configure
Add direct link to *.ipset or *.netset file to /etc/geoip_block/url.list

Modify iptables rule in /opt/geoip_block/etc/iptables.rule
Example rule drop access to tcp port 10022 on interface eth0:
```bash
iptables -A INPUT -i eth0 -p tcp -m set ! --match-set country_ru src -m tcp --dport 22 -j DROP
```
To apply settigs you can run command
```shell
geoip_block update
geoip_block apply
```


Sources
- https://github.com/firehol/blocklist-ipsets
- https://github.com/firehol/firehol/tree/master/contrib
- https://www.seenlyst.com/blog/iptables-ipset-block-country-vpn/
