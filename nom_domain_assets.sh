#!/bin/bash
# for https://academy.tcm-sec.com/p/practical-ethical-hacking-the-complete-course
# not an original work
#
# harvest potential subdomains with tomnomnom's assetfinder (https://github.com/tomnomnom/assetfinder)
# Usage: ./nom_domain_assets.sh <domain>

domain=$1

if [ ! -d "$domain" ]; then
    mkdir $domain
fi

if [ ! -d "$domain/recon" ]; then
    mkdir $domain/recon
fi

# cute little descriptive banner
echo "_______________________________________________"
echo ""
echo "[+] Harvesting subdomains with assetfinder..." $t
echo "_______________________________________________"

# set timestamp for directory creation
now=$(date +%s)

assetfinder $domain | sort | uniq | sort >> $domain/recon/$now-"assets_found.txt"
