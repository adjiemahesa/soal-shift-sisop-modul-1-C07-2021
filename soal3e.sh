#!/bin/bash

password=$(date +"%d%m%Y")

unzip -P $password Koleksi.zip

rm -r Koleksi.zip
