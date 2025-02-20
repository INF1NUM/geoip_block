#!/bin/bash

BASE="/tmp/geoip_block"
mkdir -p $BASE
rm ${BASE}/*
cd $BASE

# Download and update list
# curl -sO https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/datacenters.netset
# wget https://raw.githubusercontent.com/firehol/blocklist-ipsets/refs/heads/master/geolite2_country/country_ru.netset
wget -i /etc/geoip_block/url.list

# Load to kernel
# Apply all *.netset and *.ipset files
find $BASE \( -name "*.netset" -or -name "*.ipset" \) -exec ipset-apply.sh {} \;
# Or apply files manually: file name without extention in folder $BASE or full path to file
# ipset-apply.sh country_ru

# Make persistent
# netfilter-persistent save