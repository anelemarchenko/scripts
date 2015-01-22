#!/bin/bash
#page=0
counter=0
page=4704                                               #page counter
fail_attempt=0					        #fails counter
base_url_ebook='http://it-ebooks.info/book/'		#setting up the base part of book's url

while [  $fail_attempt -lt 10 ]; 
do
    echo "--> Book number" $page
    url_ebook="$base_url_ebook$page/"
    echo "url_ebook=" $url_ebook
    url_for_download=$(curl $url_ebook | grep -o "http:\/\/filepi.*'" | rev | cut -c 2- | rev)

    if [ -z "$url_for_download" ]
    then
        echo "no book"
        let fail_attempt=fail_attempt+1
        let page=page+1
        echo "fail_attempt="$fail_attempt
    else
        echo "url_for_download=" $url_for_download
        real_url=$(curl $url_for_download -I -H  'Referer:'$url_ebook | grep -o "http[a-zA-Z0-9\/:.]*")
        echo "url_for_download=" $real_url
        echo
        wget --content-disposition -P books $real_url
        let page=page+1
        fail_attempt=0
        let counter=counter+1
        echo -n "Continue? [y/n]: "
        read
            if [ "$REPLY" = "y" ];
            then                             # continue question
                echo
            else break    
            fi
     fi
done
echo "========================="
echo "No Books Anymore. "$counter "books were downloaded."
