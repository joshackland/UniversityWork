#!/bin/bash

#use sed to remove every letter from the output, replaces all spaces with a '-', 
#replaces the '-' with 'Base: ', ' Height: ', and ' Area: '
echo "$(bash '../04 - Functions/triangle.sh' | 
    sed "s/[^ 0-9']//g; 
    s/  */-/g; 
    s/-/Base: /; 
    s/-/ Height: /; 
    s/-/ Area: /;"
    )"