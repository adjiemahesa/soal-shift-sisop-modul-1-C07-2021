#!/bin/bash

## counter
count=23

## looping
for ((iter=1;iter<=count;iter=iter+1))
do

## penamaan file
x=$(printf "%02d" $iter)

## download file + overwrite log
wget -o Foto.log https://loremflickr.com/320/240/kitten -O "Koleksi_$x"

## mencari line untuk di compare
temp=$(awk 'NR==6{print $3}' Foto.log) 
##echo $temp

a=num
for ((a=iter-1;a>=1;a=a-1))
do
        wget -o Foto.log https://loremflickr.com/320/240/kitten -O "Koleksi_$x"
        temp2=$(awk 'NR==6{print $3}' Foto.log)

        if [[ "$temp" == "$temp2" ]]
        then
                rm -f "Koleksi_$x"
                count=$((count-1))
                iter=$((iter-1))
        fi
done

done
