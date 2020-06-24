#!/bin/bash

if (( $#!=2 )); then
    echo "Error, must provide two numbers!" && exit 1
fi

for (( i = $1; i <= $2; i++ ))
do
    echo "Creating directory number $i"
    mkdir "$i"
done