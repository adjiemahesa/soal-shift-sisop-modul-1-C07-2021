#!/bin/bash

#a 
printf 'Informasi Log,Pesan log,Username :\n'
cat syslog.log | cut -f6- -d' ' 
printf '\n'

#b
printf 'Jumlah Kemunculan Soal setiap pesan ERROR;\n'
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
printf '\n'

#c
printf 'Jumlah Kemunculan LOG ERROR setiap User :\n'
cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf 'Jumlah Kemunculan LOG INFO setiap User :\n'
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf '\n'

