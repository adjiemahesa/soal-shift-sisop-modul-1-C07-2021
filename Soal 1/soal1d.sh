#!bin/bash 

#1.D

printf 'Keterangan Error : Count\n' > error_message.csv
grep "ERROR" "syslog.log" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > jumlah.csv
grep "ERROR" "syslog.log"  | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > pesan.csv

paste pesan.csv jumlah.csv | while IFS="$(printf '\t')" read -r m1 m2

do
printf "$m1 : $m2\n"
done >> error_message.csv
cat error_message.csv

rm -r pesan.csv
rm -r jumlah.csv


