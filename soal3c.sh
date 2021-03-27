#!/bin/bash

limit=23
x=$(date "+%--j")
mod=$((x % 2))


if [[ $mod -eq  0 ]]
then

for ((num=1;num<=23;num=num+1))
do
	i=$(printf "%02d" $num)
	$(mkdir "Kucing_"$(date +"%d-%m-%Y"))
	wget -O /home/adjie/Kucing_$(date +"%d-%m-%Y")/Koleksi_$i 'https://loremflickr.com/320/240/kitten'
done

elif [[ $mod -eq 1 ]]
then

for ((num=1;num<=23;num=num+1))
do
	i=$(printf "%02d" $num)
	$(mkdir Kelinci_$(date +"%d-%m-%Y"))
	wget -O /home/adjie/Kelinci_$(date +"%d-%m-%Y")/Koleksi_$i 'https://loremflickr.com/320/240/bunny'
done
fi
