#!/bin/bash

#includes judgemental comments about the shopping list
awk 'BEGIN {FS=","; 
print "____________________________________________________________________________________________"
print "|               |           |          |          |                                        |"
printf "| %-13s | %-9s | %-8s | %-8s | %-38s |\n", "Item", "Quantity", "Price", "Total", "Comment" 
print "|_______________|___________|__________|__________|________________________________________|"}
{ 
    comment = ""
    total = ($2 * $3)
    if ($2 > 5)
        comment = "Do you really need that many?"
    else if (total > 5)
        comment = "That is a bit expensive! Are you sure?"    
    else if (total < 3)
        comment = "Such a cheapskate!"
    printf "| %-13s | %-09d | %-c%-07.2f | %-c%-07.2f | %-38s |\n", $1, $2, "$", $3, "$", total, comment }
END {print "|_______________|___________|__________|__________|________________________________________|"}' shopping.csv