#!/bin/bash

#downloads the html from 'example.com' and displays the header text and the first paragraph text
curl -s http://example.com > html.txt
sed -e "s/.*<h1>\(.*\)<\/h1>.*/\1/;t;d" html.txt
sed -n '/<p>/,/<\/p>/p; /<\/p>/q;' html.txt | sed 's/<p>//; s/<\/p>//; s/^[ ]*//'