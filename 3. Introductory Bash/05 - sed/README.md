# sed
sample_sed.sh - basic sed to replace text and redirect output to a text file

IpInfo.sh - uses ifconfig to retrieve network information and sed is used to retrieve only the IP address, subent mask, and broadcast address

IpAddressOnly.sh - uses IpInfo.sh to retrieve its output and displays only the IP address

LinuxFinder.sh - searches text file for lines containing 'Linux' and inserts a line above it to indicate that it contains the word

ShorterTriangle.sh - modifies the output from '04 - Functions/triangle.sh' to make it short

WebTitle.sh - uses '04 - Functions/downloader.sh' to download the html of a page and then sed is used to extract the title (<title></title>) of the page and output it