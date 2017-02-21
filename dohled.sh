#!/bin/bash
cas=`date +%T`
ip=`ifconfig | grep Všesměr | awk -F ":" '{print $2}' | awk -F " " '{print $1}'`
rx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'`
tx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`
lidi=`who| wc- l`
disk=`df -h | grep sda1 | awk -F | " "  '{print $2}'

echo "Aktuální čas: "$cas >> /home/student/Plocha/skripty/index.html
echo "Moje IP: "$ip >> /home/student/Plocha/skripty/index.html
echo "Přijatá data: "$rx >> /home/student/Plocha/skripty/index.html
echo "Odeslaná data: "$tx >> /home/student/Plocha/skripty/index.html
echo "Uzivatelu: "$lidi >> /home/student/Plocha/skripty/index.html
echo "Disk: "$disk >> /home/student/Plocha/skripty/index.html


