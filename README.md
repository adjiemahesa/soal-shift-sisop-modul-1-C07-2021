# soal-shift-sisop-modul-1-C07-2021

## Soal 1

__Soal 1A__ : <br> ``` cat syslog.log | cut -f6- -d' ' ```

//  menampilkan informasi Log,Pesan Log, dan Username<br>
    cat syslog.log mengambil data syslog.log , kemudian cut baris yang di pisahkan ' ' kemudian di ambil dari field ke-6 untuk menampilkan informasi log,pesan log, dan Username
    tampilkan
 
__Soal 1B__ : <br> ``` cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c ```

//  menampilkan jumah kemuculan soal setiap pesan "ERROR" <br>
    cat syslog.log mengambil data syslog.log , grep "ERROR" mengambil line yang mengandung kata "ERROR" , kemudian cut baris yang di pisahkan ' ', setelah itu di cut lagi degan '(' kemudian di ambil field awal (f1) . Terakhir di sorting atau di grouping dengan perintah uniq .
    
__Soal 1C__ :<br> ``` cat syslog.log | grep "ERROR" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c ``` <br>
     ``` cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c ```
  
// menampilkan jumlah kemunculan log "ERROR" maupun "INFO" <br>
   cat syslog.log mengambil data syslog.log , grep "ERROR" mengambil line yang mengandung kata "ERROR" atau "INFO", kemudian cut baris dengan '(' , setelah itu hasil cut tersebut di cut lagi dengan ')' sehingga nanti akan memunculkan user. Terakhir di sorting dan di grouping dengan perintah uniq.


__Soal 1D__ :
```
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
```
//
<br> ``` printf 'Keterangan Error : Count\n' > error_message.csv ```<br>
``` grep "ERROR" "syslog.log" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > jumlah.csv``` 
``` grep "ERROR" "syslog.log"  | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > pesan.csv ```<br><br>
Pada soal kali ini kita di minta untuk menampilkan informasi yang di dapat pada soal 1.b kemudian kita masukan ke dalam file error_message.csv . <br>
``` grep -Eo '[0-9]{1,}' > jumlah.csv ``` berfungsi untuk mengurutkan hasil output dari soal 1b berdasarkan numerical order urutan terbalik (reverse), piping kembali, untuk mengambil segala jenis digit pada suatu baris dan kemudian dimasukkan kedalam file temporary jumlah.csv.

``` paste pesan.csv jumlah.csv | while IFS="$(printf '\t')" read -r m1 m2 ```<br><br>
untuk line ini di gunakan ``` paste pesan.csv jumlah.csv  ``` untuk menampilkan data pada 2 file temporary secara berdampingan .<br>
kemudian ``` while IFS="$(printf '\t')" read -r m1 m2 ``` di gunakan untuk membaca hasil perintah paste sebelumnya. kemudian dilanjutkan dengan perintah printf yang dipisahkan dengan karakter (koma) , sehingga data bisa dimasukkan ke dalam file error_message.csv. <br><br>

``` do ```<br>
``` printf "$m1 : $m2\n" ```<br>
``` done >> error_message.csv ```<br>
``` cat error_message.csv ``` <br><br>
Pada bagian ini di gunakan untuk menampilkan hasil dari file temporary error_message.csv .


``` rm -r pesan.csv ```<br>
``` rm -r jumlah.csv ```<br><br>
fungsi ```rm``` untuk menghapus file temporary csv yang di gunakan sebelumnya


__Soal 1E__ : 
``` 
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
```
<br>

// <br> 
``` cat syslog.log | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user_name.csv ``` pada line ini di gunakan untuk memperoleh          username dari setiap user yang ada di ```syslog.log``` .<br>
``` grep "ERROR" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > jumlah_error.csv ``` pada line ini di gunakan untuk mengambil jumlah error kemudian di masukkan ke dalam file temporary jumlah_error.csv .<br>
``` grep "ERROR" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > error_nama.csv ``` pada line ini di gunakan untuk mengambil username dari variabel yang berisi nama dan jumlah error kemudian di masukan ke dalam file error_nama.csv . <br>
``` grep "INFO" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > info_jumlah.csv ``` pada line ini di gunakan untuk mengambil jumlah info kemudian di masukan ke dalam file info_jumlah.csv . <br> 
``` grep "INFO" "syslog.log" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > info_nama.csv ``` pada line ini di gunakan untuk mengambil username dari varibel yang mengandung nama dan jumlah error kemudian di masukkan kedalam file info_nama.csv . <br>
Selanjutnya kita mencari username dan jumlah errornya serta jumlah infonya lalu dimasukkan ke dalam user_statistic.csv .<br>
```
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
```
Setelah itu baru kita tampilkan dengan menggunakan line ``` printf "$name_user,$info_user,$error_user\n" >> user_statistic.csv)) ``` <br><br>

Untuk fungsi 
```
rm -r user_name.csv
rm -r jumlah_error.csv
rm -r error_nama.csv
rm -r info_jumlah.csv
rm -r info_nama.csv
```
Di gunakan untuk menghapus file temporary yang di gunakan sebelumnya .




  


## Soal 2

__Soal 2A__

pada soal ini kita diminta untuk menampilkan row id yang memiliki profit percentage yang terbesar
```
costPrice=$18-$21;
 profitPercentage=($21/costPrice)*100;
 
 if(profitPercentage > maxprofit) {
 maxprofit=profitPercentage;
 }
 
 if(profitPercentage == maxprofit) {
  rowidmax = $1;
 }
 ```
bagian diatas akan melakukan perhitunagn untuk mendapatkan costprice dan profitpercentage untuk setiap barisnya, jika ditemukan profit percentage yang lebih besar atau sama dengan nilai profit terbesar yang telah tersimpan, maka nilai profit dan data pada order id akan disimpan di variabel maxprofit dan variabel rowidmax
 
__Soal 2B__

pada soal ini kita diminta untuk mencari nama customer yang berada pada Alberqueque saat 2017
```
printf("Daftar nama customer di Albuquerque pada tahun 2017 antara lain:\n")}
{if ($3 ~/-17/ && $10 == "Albuquerque")
 {print $7|"uniq"}}
```
bagian diatas akan melakukan pencarian pada field 3 yang memiliki "-17" dan pada field 10 berisi "Alberqueque", menggunakan ```uniq``` untuk mencegah pengulangan saat melakukan print

__Soal 2C__

soal ini meminta kita untuk menampilkan segmen customer dengan penjualan yang paling sedikit
```
if($8 == "Home Office") hitho++;
if($8 == "Consumer") hitcon++;
if($8 == "Corporate") hitcor++;
```
bagian ini akan melakukan perhitungan jumlah penjualan pada setiap segmennya
```
if (hitho<hitcon && hitho<hitcor){ profitmin=hitho;bidang="Home Office";}
if (hitcon<hitho && hitcon<hitcor){ profitmin=hitho;bidang="Consumer";}
if (hitcor<hitcon && hitcor<hitho) { profitmin=hitho;bidang="Corporate";}
```
setelah melakukan perhitungan bagian ini akan melakukan perbandingan nilai, jika telah didapatkan nilai terkecil maka akan diisikan kedalam variabel profitmin dan pada bidang akan diisikan nama segmen dengan nilai terkecil

__Soal 2D__

soal ini meminta kita untuk menampilkan region dengan profit yang paling sedikit, soal ini hampir mirip dengan bagian sebelumnnya maka penyelesaiannya juga hampir serupa
```
if($13 == "Central") hitC+=$21;
if($13 == "West") hitW+=$21;
if($13 == "East") hitE+=$21;
if($13 == "South") hitS+=$21;
```
bagian ini akan melakukan penjumlahan profit yang diperoleh pada setiap regionnya
```
if (hitC<hitW && hitC<hitE &&  hitC<hitS){ regionmin=hitC;region="Central";}
if (hitW<hitC && hitW<hitE &&  hitW<hitS){ regionmin=hitW;region="West";}
if (hitE<hitW && hiEC<hiCE &&  hitE<hitS){ regionmin=hitE;region="East";}
if (hitS<hitW && hitS<hitE &&  hitS<hitc){ regionmin=hitS;region="South";}
```
setelah melakukan perhitungan bagian ini akan melakukan perbandingan profit, jika telah didapatkan nilai terkecil maka akan diisikan kedalam variabel regionmin dan pada region akan diisikan nama region dengan perolehan profit terkecil

__Soal 2E___

pada soal ini kita diminta untuk melakukan print output dari sript soal sebelumnya ke dalam file hasil.txt dan menambahkan beberapa kalimat agar mudah dibaca
contoh dalam soal 2A :
```
END {printf("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.\n\n", bidang, profitmin)}' Laporan-TokoShiSop.tsv >> hasil.txt
```
Dengan menggunakan ``` >> hasil.txt ``` program akan mencetak output di hasil.txt

output untuk seluruh soal 2 adalah sebagai berikut :
```
Transaksi terakhir dengan profit percentage terbesar yaitu 9952 dengan persentase 100.000 %.

Daftar nama customer di Albuquerque pada tahun 2017 antara lain:
Michelle Lonsdale
Benjamin Farhat
David Wiener
Susan Vittorini

Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan 1783 transaksi.

Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah Central dengan total keuntungan 39706.3625
```

## Soal 3

__Soal 3A__

*Untuk soal ini saya saat di execute hasilnya masih salah*

Untuk mendownload file atau foto-foto dari link ``https://loremflickr.com/320/240/kitten`` kita menggunakan *command* ``wget`` seperti berikut
```
wget -o Foto.log https://loremflickr.com/320/240/kitten -O "Koleksi_$x"
```
dengan ``-o`` untuk mengoverwrite Foto.log yang kita gunakan nanti *compare* dengan gambar-gambar berikutnya. ``-O`` kita *command* dengan "Koleksi_$x" dimana setiap gambar yang diunduh akan berubah namanya sesuai urutan download yang kita urutkan dengan ``x=$(printf "%02d" $iter)`` yang akan mencari angka urutan terhadap 2-digit. Lalu, kita menggunakan satu bagian *string* didalam ``Foto.log`` yang berisi nama file gambar untuk kita *compare* gambar yang sudah diunduh dengan yang baru diunduh. Hal itu kita buat dengan ``awk`` seperti ini
```
temp=$(awk 'NR==6{print $3}' Foto.log)
```
Lalu, kita *compare* dengan looping dimana kita menggunakan ``wget`` lagi untuk mengunduh gambar serta membuat ``awk`` lagi sehingga dapat line untuk di *compare*.
```
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
```
Terakhir, didalam loopingan mengunduh foto akan ada loopingan dimana meng-*check* apakah line pada variable ``temp`` dengan ``temp2`` sama atau tidak. Jika sama maka akan menghapus file duplikat yang baru saja diunduh dengan *command* ``rm``.

__Soal 3B__

Soal ini meminta kita untuk menjalankan script **setiap tanggal 1 tujuh hari sekali** dan **tanggal 2 empat hari sekali**. Untuk melakukan itu kita pakai crontab sebagai berikut
```
0 20 1-31/7 * * bash /home/adjie/soal3a.sh
0 20 1-31/7 * * bash /home/adjie/soal3b.sh
0 20 2-31/4 * * bash /home/adjie/soal3a.sh
0 20 2-31/4 * * bash /home/adjie/soal3b.sh
```
Crontab diarah kan ke file ``soal3a.sh`` agar dapat menarik gambar-gambar yang diperlukan. Lalu, kita buat script untuk menjalankan perintah membuat folder baru menggunakan format nama tanggal unduhnya seperti "DD-MM-YYYY" dengan menggunakan
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
* 7-17 * * 1+5 bash /home/adjie/soal3d.sh
* 0-6, 18-23 * * 1-5 unzip -P $(date +%d%m%Y) -o ~/Koleksi.zip && rm ~/Koleksi.zip
* * * * 6-7 unzip -P $(date +%d%m%Y) -o ~/Koleksi.zip && rm ~/Koleksi.zip
```
Pada crontab tersebut bisa dilihat bahwa kita menggunakan jam 7 hingga 17 pada hari senin hingga jumat (Hari Kuliah) untuk meng-zip kan file dan sisanya untuk meng-unzip kan file. Untuk meng-zipkan file crontab diarahkan ke ``soal3d.sh`` karena sudah mengandung perintah untuk meng-zip kan file. Untuk meng-unzip kan file bisa digunakan sebagai berikut
```
unzip -P $(date +%d%m%Y) -o ~/Koleksi.zip && rm ~/Koleksi.zip
```
Dimana *command* ``-P`` digunakan untuk memasukan password agar bisa membuka file zip dan ``-o`` serta ``rm`` untuk mengeluarkan serta menghapus file ``.zip``
