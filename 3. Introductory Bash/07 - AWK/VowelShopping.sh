#!/bin/bash

#shows shopping items which start with a vowel,
#contain more than one word,
#and price does not contain any cents

echo "Your shopping list is as follows:"
awk 'BEGIN { FS="," }
    /^[aeiou]/ {
        print "Starts with a vowel: " $1
    }' shopping.csv

awk 'BEGIN { FS="," }
    /^.* .*/ {
        print "Has more than one word: " $1
    }' shopping.csv

awk 'BEGIN { FS="," }
    /^[^\.]*$/ {
        print "Whole number price: " $1
    }' shopping.csv