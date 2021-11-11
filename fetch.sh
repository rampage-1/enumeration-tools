#!/usr/bin/bash
# for Bug Bounties With Bash - VirSecCon2020 Talk
# https://www.youtube.com/watch?v=s9w0KutMorE
# not an original work
#######################
# curl-based http/s fetcher
# usage: ./fetch.sh < url.list

# set timestamp for directory creation
now=$(date +%s)

# set output directory for fetch
outdir=$(pwd)/out/fetch

while read url; do

    # create url-specific output directory
    urldir="$outdir/$url/$now" && mkdir -p $urldir

    # create unique filename for the http output   
    filename="$urldir/$(echo $url | md5sum | awk '{print $1}')"

    # curl fetch each url
    curl -k -v "https://$url" &> $filename

done
