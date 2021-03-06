#!/usr/bin/bash
# for Bug Bounties With Bash - VirSecCon2020 Talk
# https://www.youtube.com/watch?v=s9w0KutMorE
# not an original work
#######################
# bash-based subdomain brute-force enumeration script

domain=$1

while read sub; do 
    subdomain=$sub.$domain
    if host "$subdomain" &> /dev/null; then
        echo "$subdomain resolves";
    fi
done
