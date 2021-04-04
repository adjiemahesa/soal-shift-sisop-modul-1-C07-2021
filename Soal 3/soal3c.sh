#!/bin/bash

limit=23
x=$(date +"%--j")
day=$(date '+%d-%m-%Y')
mod=$((x % 2))
echo $x
echo $mod

if [ ! -d "Kucing_$day" ]&&[ $mod -eq  0 ]
then
for ((num=1;num<=23;num=num+1))
do
        i=$(printf "%02d" $num)
        mkdir -p "Kucing_$day"
        wget -O /home/adjie/Kucing_$(date +"%d-%m-%Y")/Koleksi_$i 'https://loremflickr.com/320/240/kitten'

done

elif [ ! -d "Kelinci_$day" ]&&[ $mod -ne 0 ]
then
for ((num=1;num<=23;num=num+1))
do
        i=$(printf "%02d" $num)
        mkdir -p "Kelinci_$day"
        wget -O /home/adjie/Kelinci_$(date +"%d-%m-%Y")/Koleksi_$i 'https://loremflickr.com/320/240/bunny'

done
fi



