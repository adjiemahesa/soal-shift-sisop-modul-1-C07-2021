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
Dimana kita menggunakan tanggal unduh tersebut dan di modulo 2 agar menghasilkan nilai 0 dan bukan 0. Variable ``mod`` akan digunakan dalam looping ``if`` dimana jika hasil dari ``mod = 0`` maka hari akan sama dengan hari genap dan akan mengunduh gambar kucing. Sedangkan jika ``mod != 0`` maka hari akan sama dengan hari ganjil dan gambar yang diunduh akan menjadi gambar kelinci.
```
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
```
Didalam loopingan ini terdapat juga untuk tiap kondisi loopingan ``for`` untuk mengambil gambar menggunakan ``wget`` serta membuat folder sesuai format nama "Kucing/Kelinci_DDMMYYY". Untuk membuat folder tersebut kita gunakan ``mkdir`` seperti berikut
```
$(mkdir Kucing_$(date +"%d-%m-%Y"))
$(mkdir Kelinci_$(date +"%d-%m-%Y"))
```

__Soal 3d__

Disoal ini kita membuat script untuk memindahkan seluruh folder Kucing dan Kelinci beserta gambar-gambarnya kedalam suatu file ``zip`` dengan fomrat nama "Koleksi.zip". Untuk itu kita bisa melakukan seperti berikut
```
zip -rm -P $password Koleksi.zip Kucing_* Kelinci_*
```
Pada perintah tersebut ``-rm`` digunakan agar memindahkan file-file tersebut dan bukan hanya di *copy* saja. Ada juga ``-P`` untuk membuat password yang berupa tanggal saat ini dengan format "DDMMYYY". Agar terlakukan hal tersebut dibentuk variable ``password`` yang menyimpan nilai dari tanggal saat ini seperti berikut
```
password=$(date +"%d%m%Y")
```

__Soal 3e__

Soal ini kita diminta untuk membuat sebuah script dimana pada hari tertentu dan jam tertentu folder dan gambar-gambar tersebut akan ter-zip dan meng-unzip file-file tersebut pada waktu lainnya. Untuk itu kami buat kan crontab agar bisa menggunakan waktu yang spesifik.
```
* 7-17 * * 1+5 /home/adjie/soal3d.sh
* 0-6, 18-23 * * 1-5 /home/adjie/soal3e.sh
* * * * 6-7 /home/adjie/soal3e.sh
```
Pada crontab tersebut bisa dilihat bahwa kita menggunakan jam 7 hingga 17 pada hari senin hingga jumat (Hari Kuliah) untuk meng-zip kan file dan sisanya untuk meng-unzip kan file. Untuk meng-zipkan file crontab diarahkan ke ``soal3d.sh`` karena sudah mengandung perintah untuk meng-zip kan file. Untuk meng-unzip kan file bisa digunakan sebagai berikut
```
unzip -P $password Koleksi.zip
```
Kita *unzip* kan file dengan ``-P`` untuk memasukkan password karena file ``zip`` menggunakan password dan password tersebut menggunakan format nama yang sama dengan ``soal3d.sh`` yaitu
```
password=$(date +"%d%m%Y")
```
Lalu, sama seperti **Soal 3d** kita menggunakan *command* ``rm`` agar tidak hanya meng-*unzip* kan file tetapi juga menghapus file ``zip`` yang lama
```
rm -r Koleksi.zip
```
