#!/bin/sh
#this file give the info of ram
line(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "-----------------------------------------------------------------------------------------------------------------------------"
else
echo "-----------------------------------------------------------------------"
fi
}
ram_info(){
line
echo " RAM INFO IS BELOW "
line
sudo dmidecode --type 17
sudo lshw -class memory
sudo dmidecode --type 16
line
}

Main_info(){
line
echo "Essential information of RAM is below "
line
echo " Type of RAM "
sudo dmidecode --type 17 | grep Type:
line
echo " Size of RAM "
sudo dmidecode --type 17 | grep Size:
line
echo " Slots of RAM "
sudo dmidecode --type 17 | grep Locator:
line
echo " Speed of RAM "
sudo dmidecode --type 17 | grep Speed:
line
echo " Manufacturer of RAM "
sudo dmidecode --type 17 | grep Manufacturer:
line
echo " bits of RAM "
sudo dmidecode --type 17 | grep "Data Width"
line
echo " Description of RAM  "
sudo lshw -class memory |  grep Description
line
echo " Maximum Capacity of RAM supported by Pc "
sudo dmidecode --type 16 | grep "Maximum Capacity:"
line
echo " Number of Slots of RAM In pc "
sudo dmidecode --type 16 | grep "Number Of Devices:"
line
echo " +++++ Note If any of above show unknown mean it didnt of RAM +++++"
line
}


Main_info
printf "\n\t If you want Full information of RAM Enter 1(one) or 0(zero) to Exit \n"
line

read opt
line

if [ $opt -eq 1 ]; then
 ram_info
 exit
fi
