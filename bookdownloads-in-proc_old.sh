#!/bin/bash
#page=0
 
url_for_download=$(curl http://it-ebooks.info/book/4680/ | grep -o "http:\/\/filepi.*'" | rev | cut -c 2- | rev)
echo
echo parced
echo
real_url=$(curl $url_for_download -I -H 'Referer: http://it-ebooks.info/book/4680/' | grep -o "http[a-zA-Z0-9\/:.]*")
#curl $url_for_download -I -H 'Referer: http://it-ebooks.info/book/4680/'
#real_url1=$(tr -d '\r' $real_url)
#real_url1=$(echo << te -d 'r' $real_url)
echo
#echo $real_url1
wget --content-disposition  $real_url
