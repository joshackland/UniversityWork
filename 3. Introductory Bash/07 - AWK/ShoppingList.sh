#!/bin/bash

#use awk to print out a formatted version of the shopping list
awk 'BEGIN {FS=","; 
print "___________________________________________________"
print "|               |           |          |          |"
printf "| %-13s | %-9s | %-8s | %-8s |\n", "Item", "Quantity", "Price", "Total" 
print "|_______________|___________|__________|__________|"}
{ printf "| %-13s | %-09d | %-c%-07.2f | %-c%-07.2f |\n", $1, $2, "$", $3, "$", ($2 * $3) }
END {print "|_______________|___________|__________|__________|"}' shopping.csv
