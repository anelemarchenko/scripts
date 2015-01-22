#!/bin/bash
#page=0
page=1                                                  #page counter
fail_attempt=0					        #fails counter
base_url_ebook='http://it-ebooks.info/book/'		#setting up the base part of book's url
while							#begining of loop
 [  $fail_attempt -lt 10 ]; do
echo -------
echo "---> Next download has started"
echo "Book number" $page
url_ebook="$base_url_ebook$page/"
echo "ebook link (url_ebook)" $url_ebook
echo -n "Continue? [y/n]: "
read
if [ "$REPLY" = "y" ]; then				# debug pause
echo "CONTINUE"
else break    
fi
echo -------
echo "сейчас будет проверка работы curl с параметром url_ebook"
curl $url_ebook

url_for_download=$(curl "$url_ebook" | grep -o "http:\/\/filepi.*'" | rev | cut -c 2- | rev)
echo "curl works? url_for_download=" $url_for_download
real_url=$(curl $url_for_download -I -H 'Referer: $url_ebook' | grep -o "http[a-zA-Z0-9\/:.]*")
echo
wget --content-disposition  $real_url
let page=page+1
fail_attempt=0
done
