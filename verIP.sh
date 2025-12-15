#!/bin/bash

cat /etc/hosts | while read ip nume
do
     k=0
    if [ "$ip" = "" ];then
        break
    fi
    nslookup "$nume" 1.1.1.1 | while read restul ip2 
    do

        if [ "$restul" = "Address:" ]
        then
            k=$((k+1))
            if [ "$ip" != "$ip2" -a "$k" -eq 2 ]
            then
                echo "Bogus IP for $nume in /etc/hosts!"
            fi
        fi
       
    done 
   
    
done
exit 0