#!/bin/bash


 k=0
nslookup $1 $3  | while read restul ip2 
do

    if [ "$restul" = "Address:" ]
    then
        k=$((k+1))
        if [ "$k" -eq 2  -a "$2" != "$ip2"  ]
        then
            echo "Bogus IP for $1 in /etc/hosts!" 
                
        fi
    fi
       
    done 
   
    

exit 0