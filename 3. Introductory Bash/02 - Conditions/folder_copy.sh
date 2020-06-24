#!/bin/bash

read -p "enter folder that will be copies" copyFolder
read -p "enter new folder where copied folder will be sent to: " newfolder



if ! [ -d $newfolder ]; then
    mkdir $newfolder
    cp -r $copyFolder $newfolder
else
    echo "folder already exists"
fi