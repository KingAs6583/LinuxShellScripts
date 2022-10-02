#!/bin/sh
line(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "-----------------------------------------------------------------------------------------------------------------------------"
else
echo "------------------------------------------------------------------------"
fi
}

update(){
line
printf "\t\t\t Starting full system update... \n"
line
sudo apt update
sudo apt upgrade
}

clean(){
line
printf "\t\t\t   Cleaning up \n"
line
sudo apt autoremove
sudo apt autoclean
}

leave(){
line
printf "\t\t\t   Update Complete \t\t\t \n"
line
}

nextUpdate(){
line
printf "\t\t\t   Next update \n"
line
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get autoclean
}

strnt(){
line
echo 'sudo apt-get update'
echo 'sudo apt-get upgrade'
echo 'sudo apt-get autoremove'
echo 'sudo apt-get autoclean'
line
}

release(){
unset -f line
}

update
clean
nextUpdate
strnt
leave
