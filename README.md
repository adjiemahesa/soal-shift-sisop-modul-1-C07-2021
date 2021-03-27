# soal-shift-sisop-modul-1-C07-2021

## Soal 1

1a : <br> ``` cat syslog.log | cut -f6- -d' ' ```

//  menampilkan informasi Log,Pesan Log, dan Username
    cat syslog.log mengambil data syslog.log , kemudian cut baris yang di pisahkan ' ' kemudian di ambil dari field ke-6 untuk menampilkan informasi log,pesan log, dan Username
    tampilkan
 
1b : <br> ``` cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c ```

//  menampilkan jumah kemuculan soal setiap pesan "ERROR" 
    cat syslog.log mengambil data syslog.log , grep "ERROR" mengambil line yang mengandung kata "ERROR" , kemudian cut baris yang di pisahkan ' ', setelah itu di cut lagi degan '(' kemudian di ambil field awal (f1) . Terakhir di sorting atau di grouping dengan perintah uniq .
    
1c :<br> ``` cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c ``` <br>
     ``` cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c ```
  
// menampilkan jumlah kemunculan log "ERROR" maupun "INFO"
  cat syslog.log mengambil data syslog.log , grep "ERROR" mengambil line yang mengandung kata "ERROR" atau "INFO", kemudian cut baris dengan '(' , setelah itu hasil cut tersebut di cut lagi dengan ')' sehingga nanti akan memunculkan user. Terakhir di sorting dan di grouping dengan perintah uniq.
  


## Soal 3

__Soal 3A__

Untuk mendownload file atau foto-foto dari link ``https://loremflickr.com/320/240/kitten``


__Soal 3B__

Soal ini meminta kita untuk menjalankan script **setiap tanggal 1 tujuh hari sekali** dan **tanggal 2 empat hari sekali**. Untuk melakukan itu kita pakai crontab sebagai berikut
```
0 20 1-31/7 * * /home/adjie/soal3a.sh
0 20 2-31/4 * * /home/adjie/soal3a.sh
```
Lalu, kita buat script untuk menjalankan perintah membuat folder baru menggunakan format nama tanggal unduhnya seperti "DD-MM-YYYY" dengan menggunakan
```
$(mkdir $(date +"%d-%m-%Y"))
```
sedangkan untuk memindahkan file gambar yang telah diunduh serta dengan log-nya kita menggunakan
```
$(mv Koleksi_* Foto.log /home/adjie/$(date +"%d-%m-%Y")) 
```

__Soal 3C__

Soal ini, selain kita diminta mengunduh gambar kucing, kita juga diminta mengunduh gambar kelinci melalui link ``https://loremflickr.com/320/240/bunny``. Lalu, kita juga diminta agar gambar-gambar tersebut diunduh secara bergantian. Untuk itu kita menggunakan
```
x=$(date "+%--j")
mod=$((x % 2))
```
Dimana kita menggunakan tanggal unduh tersebut dan di modulo 2 agar menghasilkan nilai 0 dan bukan 0. Variable ``mod`` akan digunakan dalam looping ``if`` dimana jika hasil dari ``mod = 0`` maka akan mengunduh gambar kucing. Sedangkan jika ``mod != 0`` gambar yang diunduh akan menjadi gambar kelinci
