#!/bin/bash
# perform all auth-free queries against a domain using theHarvester. this is nothing special, a hack job at best
# for Kali-2021.1 with theHarvester installed via Kali's repos
# usage: ./dirtyHarvest.sh domain.name

# handle argument count
if [ "$1" == "" ] 
then 
echo "usage: ./dirtyHarvest.sh domain.name"
exit

else

# declare array of auth-free sources; in bash arrays are space seperated quoted strings in ()
authfree_sources=("baidu" "bing" "bufferoverun" "certspotter" "crtsh" "dnsdumpster" "duckduckgo" "exalead" "google" "hackertarget" "linkedin" "linkedin_links" "netcraft" "omnisint" "otx" "qwant" "rapiddns" "sublist3r" "threatcrowd" "threatminer" "trello" "twitter" "urlscan" "virustotal" "yahoo")

# these discovery sources require API-key authorization
authd_sources=("bingapi" "censys" "github-code" "hunter" "intelx" "pentesttools" "projectdiscovery" "securityTrails" "spyse")

for t in ${authfree_sources[@]}; do
# cute little descriptive banner
echo "__________________________________"
echo ""
echo "checking" $t
echo "__________________________________"
# loop through unauthd_sources, output wherever you please
theHarvester -d $1 -b $t
done

fi
