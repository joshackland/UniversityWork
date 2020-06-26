#!/bin/bash

#use sed to remove every letter from the output and remove all extra spaces. 
#use AWk to format the output of the values and to calculate the total areas
echo "$(bash '../04 - Functions/triangle.sh')" | sed "s/[^ 0-9']//g; s/  */ /g;" |
awk '{total += $3; print "Base: "$1" Height: "$2" Area: "$3}
END {
    printf "Total area of all tringles: "total}'