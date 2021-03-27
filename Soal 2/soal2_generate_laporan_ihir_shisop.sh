LC_NUMERIC=C awk -v profitPercentage=0 costPrice=0' 
BEGIN { FS=OFS="\t"; maxprofit=0; rowidmax=1}
{
 costPrice=$18-$21;
 profitPercentage=($21/costPrice)*100;
 
 if(profitPercentage > maxprofit) {
 maxprofit=profitPercentage;
 }
 
 if(profitPercentage == maxprofit) {
  rowidmax = $1;
 }
 
 
}
END {printf ("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.3f %%.\n\n", rowidmax, maxprofit)}' Laporan-TokoShiSop.tsv > hasil.txt

awk '
BEGIN{FS=OFS="\t"; printf("Daftar nama customer di Albuquerque pada tahun 2017 antara lain:\n")}
{if ($3 ~/17/ && $10 == "Albuquerque")
 {print $7}}' Laporan-TokoShiSop.tsv >>hasil.txt


awk 'BEGIN {FS=OFS="\t"; hitho=0; hitcon=0; hitcor=0; profitmin=0}
{
if($8 == "Home Office") hitho++;
if($8 == "Consumer") hitcon++;
if($8 == "Corporate") hitcor++;

if (hitho<hitcon && hitho<hitcor){ profitmin=hitho;bidang="Home Office";}
if (hitcon<hitho && hitcon<hitcor){ profitmin=hitho;bidang="Consumer";}
if (hitcor<hitcon && hitcor<hitho) { profitmin=hitho;bidang="Corporate";}
}
END {printf("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.\n\n", bidang, profitmin)}' Laporan-TokoShiSop.tsv >> hasil.txt


awk 'BEGIN {FS=OFS="\t"; hitC=0; hitW=0; hitE=0; hitS=0; regionmin=0; region="s" }
{
if($13 == "Central") hitC+=$21;
if($13 == "West") hitW+=$21;
if($13 == "East") hitE+=$21;
if($13 == "South") hitS+=$21;

if (hitC<hitW && hitC<hitE &&  hitC<hitS){ regionmin=hitC;region="Central";}
if (hitW<hitC && hitW<hitE &&  hitW<hitS){ regionmin=hitW;region="West";}
if (hitE<hitW && hiEC<hiCE &&  hitE<hitS){ regionmin=hitE;region="East";}
if (hitS<hitW && hitS<hitE &&  hitS<hitc){ regionmin=hitS;region="South";}

}
END {printf("Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d\n\n",region,regionmin)}' Laporan-TokoShiSop.tsv >> hasil.txt


