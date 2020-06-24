#!/bin/bash

if [ $# != 3 ]; then
    echo "not three arguments"
    
    declare -a filenames

    for i in $@; do
        if ! [ -f $i ]; then
            echo "This is not a filename"
            exit 1
        fi
        filenames+=($i)

    done

    newestfile=$filenames[0]

    for file in $filenames[@]}; do
        if [ $file -nt $newestfile ]; then
            newestfile=$file
        fi
    done

    echo "${newestfile##*/}"
else
    for i in $@; do
        if ! [ -f $i ]; then
            echo "This is not a filename"
            exit 1
        fi
    done

    file1=$1
    file2=$2
    file3=$3
    

    if [ $file1 -nt $file2 -a $file1 -nt $file3 ]; then
        echo "${file1##*/}"
    elif [ "$file2" -nt "$file1" -a "$file2" -nt "$file3" ]; then
        echo "${file2##*/}"
    elif [ "$file3" -nt "$file1" -a "$file3" -nt "$file2" ]; then
        echo "${file3##*/}"
    fi

fi