#!/bin/bash

#replace system with computer
sed 's/system/computer/' sampleText.txt

echo -e '\n\n'

#replace system with computer and remove ' operating'
sed -e 's/system/computer/; s/ operating//' sampleText.txt

echo -e '\n\n'

#replace system with computer, remove ' operating' and direct output to newText.txt
sed -e 's/system/computer/;s/ operating//' sampleText.txt > newText.txt