#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;

 red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'
			   
               echo "Connect ocspanel.info..."
               sleep 1
               
			   echo "กำลังตรวจสอบ Permision..."
               sleep 1
               
			   echo -e "${green}ได้รับอนุญาตแล้ว...${NC}"
               sleep 1
			   
flag=0

if [ $USER != 'root' ]; then
	echo "คุณต้องเรียกใช้งานนี้เป็น root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;

if [[ -e /etc/debian_version ]]; then
	#OS=debian
	RCLOCAL='/etc/rc.local'
else
	echo "คุณไม่ได้เรียกใช้สคริปต์นี้ในระบบปฏิบัติการ Debian"
	exit
fi

vps="VPS";

if [[ $vps = "VPS" ]]; then
	source="http://ocspanel.info"
else
	source="http://เฮียเบิร์ด.com"
fi

# GO TO ROOT
cd

# text gambar
apt-get install boxes

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat

clear
echo "
----------------------------------------------
[√] ยินดีต้อนรับเข้าสู่ : สคริประบบ Ocspanel.info 
[√] Connect...
[√] Wellcome : กรุณาทำตามขั้นตอน... [ OK !! ]
----------------------------------------------
 " | lolcat
 sleep 5

MYIP=$(wget -qO- ipv4.icanhazip.com);

flag=0	

clear

# text gambar
apt-get install boxes

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat

clear
echo "
----------------------------------------------
[√] ยินดีต้อนรับเข้าสู่ : ระบบสคริป Ocspanel.info 
[√] Connect...
[√] Server Msg : เริ่มต้นติดตั้ง... [ OK !! ]
----------------------------------------------
 " | lolcat
 sleep 5

apt-get -y install zip unzip

cd /home/vps/public_html/application/views/panel/base

wget https://raw.githubusercontent.com/lnwseed/FORDVPN/master/panelocs.zip

mv panelocs.zip LTEOCS.zip

unzip LTEOCS.zip

rm -f LTEOCS.zip

clear
echo "
----------------------------------------------
[√] Source : Ocspanel.info 
[√] กำลังรีสตาทระบบ....
[√] กำลังเริ่มต้น : Restart..... [ OK !! ]
----------------------------------------------
 " | lolcat
 
cd /root

apt-get update

service webmin restart

sleep 3
clear
echo "
----------------------------------------------
[√] Source : Ocspanel.info 
[√] อัพเดตเรียบร้อยครับ....
[√] กำลังประมวลผล : ..... [ OK !! ]
----------------------------------------------
 " | lolcat
 sleep 5
# info
clear
echo "================ การติดตั้งเสร็จสิ้น พร้อมใช้งาน ================" | tee -a log-install.txt
rm -f /root/upweb.sh
cd ~/
