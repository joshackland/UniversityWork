#!/bin/bash

#extracts the title of the page from the html that is downloaded using '04 - Functions/downloader.sh'
echo "Downloaded a page with the title: $(bash '../04 - Functions/downloader.sh' www.google.com ./index | 
    sed -e "s/.*<title>\(.*\)<\/title>.*/\1/;t;d" index.html
    )"
