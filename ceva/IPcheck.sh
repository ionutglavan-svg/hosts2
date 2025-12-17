#!/bin/bash

cat /etc/hosts | while read IP nume restul
do
    IP_corect=""
    k=0
    if [ "$IP" = "#" ] ; then
        break
    fi
    if [ -z "$restul" ] ; then
        echo "$IP $nume"
        nslookup "$nume" 1.1.1.1 | while read stanga dreapta
        do
            if [ "$stanga" = "Address:" ] ; then
                if [ "$k" -eq "1" ] ; then 
                    IP_corect="$dreapta"
                    #echo "$IP_corect"
                    if [ "$IP" != "$IP_corect" ] ; then
                        echo "Bogus IP for $nume in /etc/hosts"
                    fi
                    break
                fi
                k=1
            fi
        done
    fi
done