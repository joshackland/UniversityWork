#!/bin/bash

ping 8.8.8.8 -c 1

if [ $? = 0 ]; then
    echo "internet seems to be connected"
else
    echo "internet is not working"
    exit 1
fi

while true
do
    read -p 'Please tpye a website URL to download or type "exit" to quit: ' url

    if [ $url != 'quit' ]; then
        wget -O ${url}.html $url
    else
        break
    fi
done
exit 0