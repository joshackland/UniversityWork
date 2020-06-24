#!/bin/bash


while true; do    
    ls 
    #reads input and saves to selder
    read -p "type a folder name: " seldir 
    echo "$seldir"

    if ! [ -d "$seldir" ]; then
        echo "doesn't exist"   
    else
        echo "exist"
        break
    fi
done

while true; do
    #reads input and saves to selpw
    read -s -p 'Enter secret password: ' selpw 
        if ! [ -z "$selpw" ]; then
            echo "valid password"
            break
        else
            echo "empty password"
        fi
done

if ! [ -f "${selder}/secret.txt"  ]; then
    echo "txt doesn't exist"
    touch ${selder}/secret.txt
    echo "$selpw" > "${selder}/secret.txt"
    cat "${selder}/secret.txt"
else
    echo "password file already exists"
    echo "$selpw" > "${selder}/secret.txt"
    cat "${selder}/secret.txt"
fi

exit 0