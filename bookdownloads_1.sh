#!/bin/bash
page=0
fail_attempt=0
ebook_url=www.it-ebooks.com/book/
while
 [  $fail_attempt -lt 10 ]; do
  if [ $page -gt 3 ]; then 
    break
  fi

  download_url=curl $ebook_url+$page | grep 'filepi'
  
  wget $download_url
  echo The counter is $page
  let page=page+1 
done
