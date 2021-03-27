# soal-shift-sisop-modul-1-C07-2021

// Soal 1

1a : menampilkan informasi Log,Pesan Log, dan Username
    cat syslog.log mengambil data syslog.log , kemudian cut baris yang di pisahkan ' ' kemudian di ambil  dari field ke-6 untuk menampilkan informasi log,pesan log, dan Username
    tampilkan
 
1b : menampilkan jumah kemuculan soal setiap pesan "ERROR" 
      cat syslog.log mengambil data log , grep "ERROR" mengambil kata error ,


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
