#!/bin/bash

#using awk to print the names of the items in a shopping list
echo "The items on your shopping list is as follows:"
awk 'BEGIN {
        FS=","
    }
    {
        print $1
    }' shopping.csv
