#!/bin/bash
#reads input and saves to folderName
read -p "type the name of the folder you would like to create:" folderName 
#makes directory folderName
mkdir "$folderName" 
echo "The $folderName has been created."
#copies the script into the new folder
cp 'foldermaker.sh' $folderName 

exit 0