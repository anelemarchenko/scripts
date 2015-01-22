#!/bin/bash
page=0
fail_attempt=0
ebook_url=www.it-ebooks.com/book/
while
 [  $fail_attempt -lt 10 ]; do

  download_url=curl $ebook_url+$page | grep 'filepi'
  book_url=
  
  # wget $download_url
  
  curl -referer
  curl 'http://filepi.com/i/Nm8gA4c' -I -H 'Referer: http://www.it-ebooks.info/book/1/'
  echo The counter is $page
  let page=page+1 
done
