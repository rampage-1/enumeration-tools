#!/bin/bash
# for https://app.hackthebox.eu/machines/Archetype/walkthroughs
# not an original work
# for Kali-2021.1 with Nmap installed via Kali's repos

# uses Nmap to detect open ports and scans those ports with the following options
# -sC: equivalent to --script=default, using scripts in the default NSE category (https://nmap.org/nsedoc/categories/default.html)
# -sV: Probe open ports to determine service/version info

# could use a better handler for argument validation some day
if [ "$1" == "" ] 
then 
echo "usage: ./nmap-it.sh 10.10.10.27"

else
# initial Nmap scan to determine open ports
ports=$(nmap -p- --min-rate 1000 -T4 $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)

# count open ports
commas=$(echo $ports | tr -cd , | wc -c)
printf '\n'
echo "Nmap detected" $(expr $commas + 1) "open ports."
printf '\n'

# display detected ports
openPorts=$(echo "PORTS:" $ports | tr ',' '/')
echo $openPorts
portsLen=${#openPorts}

for i in $(seq 1 $portsLen);do
printf "-"
done
printf '\n%.0s' {1..2}

# perform default and servce scans
nmap -sC -sV -p $ports $1
fi
