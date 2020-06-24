#!/bin/bash

ls 

while true; do

    #reads input and saves to seldir
    read -p "type a folder name: " seldir 
    echo $seldir

    if [ -d "$seldir" ]; then
        echo "exists"
        if [ "$(ls -A $seldir)" ]; then
            ls $seldir
        else
            echo "empty"
        fi
        break
    else
        echo "doesn't exist"
    fi
done

exit 0