#!/bin/bash

while IFS=$'\n' read -r line; do
    if [[ -f "$line" ]]; then
        echo "${line} - That file exists!"
    elif [[ -d "$line" ]]; then
        echo "${line} - That directory exists!"
    else        
        echo "${line} - I don't know what that is!"
    fi
done < $1