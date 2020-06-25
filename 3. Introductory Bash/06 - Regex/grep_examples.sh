#!/bin/bash

#find all uses of 'echo'
grep -r echo ..
echo -e '\n\n'

#find all lines that start with 'echo'
grep -r "^echo" ..
echo -e '\n\n'

#find all lines that contain an 'echo' with a flag
grep -r "echo -.*" ..
echo -e '\n\n'

#fine all echo statements where the text is in double quotes and starts with an uppdercase "TEST"
grep -r 'echo .*\"[A-Z].*\"'
echo -e '\n\n'

#fine all lines using an echo statement with the text in double quotes that ends in an exclamation mark "TEST!"
grep -r 'echo .*\".*!\"'
echo -e '\n\n'

#finds all sed statements
grep -r sed ..
echo -e '\n\n'

#finds all lines that start with the letter m
grep -r '^m' ..
echo -e '\n\n'

#finds all lines that contain 3 digits. 000
grep -r '[0-9]\{3\}' ..
echo -e '\n\n'

#find all lines that start with a vowel
grep -r '^[aeiou]' ..
echo -e '\n\n'

#find all lines that contain a loop
grep -r '\(while\|for\)' ..
echo -e '\n \n'