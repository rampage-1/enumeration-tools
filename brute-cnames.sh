#!/usr/bin/bash
# for Bug Bounties With Bash - VirSecCon2020 Talk, by TomNomNom
# https://www.youtube.com/watch?v=s9w0KutMorE
# not an original work
#######################
# bash-based subdomain brute-force CNAME enumeration script

domain=$1

while read sub; do 
    subdomain=$sub.$domain
    cname=$(host -t CNAME "$subdomain" | grep 'an alias' | awk '{print $NF}')

    # if $cname is an empty value this iteration continue to next iteration
    if [ -z "$cname" ]; then
        continue
    fi

    if ! host $cname &> /dev/null; then
        echo "$cname did not resolve ($subdomain)";
    fi
done
