#!/bin/bash
# custom theHarvester script
# for Kali-2021.1 with theHarvester installed via Kali's repos
# usage: ./dirtyHarvest.sh domain.name

# handle argument count
if [ "$1" == "" ] 
then 
echo "usage: ./dirtyHarvest.sh domain.name"
exit

else

# I am interested in these sources, at least initially
authfree_sources=("bing" "bufferoverun" "certspotter" "crtsh" "dnsdumpster" "duckduckgo" "exalead" "google" "hackertarget" "linkedin" "linkedin_links" "netcraft" "omnisint" "otx" "rapiddns" "sublist3r" "threatcrowd" "threatminer" "urlscan" "virustotal" "yahoo" "securityTrails")

# I don't API keys for these yet
authd_sources=("bingapi" "censys" "github-code" "hunter" "intelx" "pentesttools" "projectdiscovery" "securityTrails" "spyse")

# Not initially interested in these sources
exalead=("exalead") # a public search engine
baidu=("baidu") # a public search engine
qwant=("qwant") # a public search engine
trello=("trello") # google search of Trello boards 
twitter=("twitter") # google search of domain related twitter accounts 

for t in ${authfree_sources[@]}; do
# cute little descriptive banner
echo "__________________________________"
echo ""
echo "checking" $t
echo "__________________________________"
# loop through unauthd_sources, output wherever you please
theHarvester -d $1 -b $t -s
done

fi
