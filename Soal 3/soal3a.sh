#!/bin/bash

## counter
limit=23

## looping
for ((num=1;num<=limit;num=num+1))
do

## penamaan file
x=$(printf "%02d" $num)

## download file + overwrite log
wget -o Foto.log https://loremflickr.com/320/240/kitten -O "Koleksi_$x"

## mencari line untuk di compare
temp=$(awk 'NR==6{print $3}' Foto.log) 
echo $temp

array[$num]="$(md5sum Koleksi_$x | awk 'NR==6{print $3}' Foto.log)"

iter=num
for ((iter=num-1;iter>=1;iter=iter-1))
do
##	wget -o Foto.log https://loremflickr.com/320/240/kitten -O "Koleksi_$x"
##	temp2=$(awk 'NR==6{print $3}' Foto.log)
	
	if [[ "${check[$num]}" == "${check[$iter]}" ]]
	then
		rm -f "Koleksi_$x"
		limit=$((limit-1))
		num=$((num-1))
	fi
done




##temp2=$(awk -v check="$temp" ' 
##BEGIN{count=0}
##{if( $0-check )count++} END{print count}' Foto.log)
##echo $temp2

##if [[ $temp2>0 ]]
##then
##rm -f "Koleksi_$x"
##fi


##array[$num]="$temp"

##echo $temp
##echo "${array[$num]}"
##rm -f "Koleksi_$x"

done

