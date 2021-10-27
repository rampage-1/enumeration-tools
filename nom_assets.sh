#!/bin/bash
# for https://academy.tcm-sec.com/p/practical-ethical-hacking-the-complete-course
# not an original work
#
# harvest potential subdomains with tomnomnom's Assetfinder and Httprobe
# https://github.com/tomnomnom/assetfinder
# Usage: ./nom_assets.sh <domain>

domain=$1

# directory creation
now=$(date +%s)
dir=$domain/recon/$now

#set output directory
mkdir -p $dir

echo "___________________________________________________________"
echo ""
echo "[+] Harvesting subdomains with tomnomnom's assetfinder..."

assetfinder $domain >> $dir/temp-output
cat $dir/temp-output | sort -u >> $dir/assetfinder_found.txt && rm $dir/temp-output

echo "[+] Probing for live domains ... "

cat $dir/assetfinder_found.txt | httprobe -prefer-https | sort -u >> $dir/live-endpoints.txt

echo "[+] Done! "
