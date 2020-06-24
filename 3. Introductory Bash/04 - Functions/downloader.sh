downloader()
{
    wget -O $2.html $1
}

downloader www.google.com ./www.google.com