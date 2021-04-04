#!bin/bash

#1.E
printf 'Username,INFO,ERROR\n' > user_statistic.csv
cat syslog.log | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user_name.csv
grep "ERROR" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > jumlah_error.csv
grep "ERROR" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > error_nama.csv
grep "INFO" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > info_jumlah.csv
grep "INFO" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > info_nama.csv

while read username; do
    name_user="$username" 
    info_user=0
    error_user=0
    paste info_jumlah.csv info_nama.csv | (while read infojumlah infonama; do
        if [ "$name_user" == "$infonama" ]
        then
            info_user=$infojumlah
            break
        fi

    done
    paste jumlah_error.csv error_nama.csv | (while read jumlaherror errornama; do
        if [ "$name_user" == "$errornama" ]
        then
            error_user=$jumlaherror
            break
        fi

    done

printf "$name_user,$info_user,$error_user\n" >> user_statistic.csv))
done < user_name.csv
cat user_statistic.csv

rm -r user_name.csv
rm -r jumlah_error.csv
rm -r error_nama.csv
rm -r info_jumlah.csv
rm -r info_nama.csv

