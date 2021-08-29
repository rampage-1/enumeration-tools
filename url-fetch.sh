#!/usr/bin/bash
# for Bug Bounties With Bash - VirSecCon2020 Talk
# https://www.youtube.com/watch?v=s9w0KutMorE
# not an original work
#######################
# bash-based http fetcher with curl
# usage: ./fetch.sh [url.domain.tld]

#!/bin/bash

# set timestamp for directory creation
now=$(date +%s)

# set output directory for fetch
outdir=out/fetch


while read url; do

    # create url-specific output directory
    urldir="$outdir/$url/$now"
    mkdir -p $urldir

    # create unique filename for the http output
    filename=$(echo $url | md5sum | awk '{print $1}')

    # append the output directory to the output file     
    filename="$urldir/$filename"

    # curl fetch each url
    curl -sk "http://$url" -o $filename

done
