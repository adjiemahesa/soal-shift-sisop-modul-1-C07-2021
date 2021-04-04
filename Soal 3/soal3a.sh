#!/bin/bash

##declare array
array=()

## looping
for ((iter=1;iter<=23;iter=iter+1))
do

## penamaan file
x=$(printf "%02d" $iter)

## download file + overwrite log
wget -O "Koleksi_$x" -o Foto.log https://loremflickr.com/320/240/kitten 

array[$iter]="$(md5sum Koleksi_$x | awk '{print $1}')"
echo "${array[$iter]}"

for ((a=1;a<iter;a=a+1))
do
if [[ "${array[$iter]}" ==  "${array[$a]}" ]];
then 
        echo "Delete Duplikat"
        rm -f "Koleksi_$x"
        iter=$((iter-1))
        fi
done

done


