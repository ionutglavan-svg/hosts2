#!/bin/bash

nume_host="$1"
adresa_ip="$2"
dns="$3"
k=0
#echo "$nume_host"
#echo "$adresa_ip"
#echo "$dns"
nslookup "$nume_host" "$dns" | while read stanga dreapta
    do
         if [ "$stanga" = "Address:" ] ; then
             if [ "$k" -eq "1" ] ; then 
                IP_corect="$dreapta"
                if [ "$adresa_ip" != "$IP_corect" ] ; then
                     echo "Bogus IP for $nume_host in /etc/hosts"
                else
                    echo "Ip corect"
                fi
               break
            fi
            k=1
        fi
        done
echo "Alex na"