#!/bin/bash
#page=0
page=0
fail_attempt=0
url_ebook='http://it-ebooks.info/book/'
let page=page+1
echo "Начало скачивания новой книги"
echo $page
 
url_for_download=$(curl http://it-ebooks.info/book/4680/ | grep -o "http:\/\/filepi.*'" | rev | cut -c 2- | rev)
echo -----
real_url=$(curl $url_for_download -I -H 'Referer: http://it-ebooks.info/book/4680/' | grep -o "http[a-zA-Z0-9\/:.]*")
echo
wget --content-disposition  $real_url
