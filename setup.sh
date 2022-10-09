#!/usr/bin/bash

line(){
 col=$(tput cols)
 if [ $col -le 135 -a $col -gt 80 ]; then
  echo "***************************************************************************************************************************"
 else
  echo "**************************************************************************"
 fi
}

#Global Declaration
downloadPath=~/Downloads/LinuxShellScripts
movePath=~/

 if [ -f $downloadPath/ShellConfig/.bash_color ]; then
  sudo chmod 755 $downloadPath/ShellConfig/.bash_color
  source $downloadPath/ShellConfig/.bash_color
 fi

copyFiles(){

 line

 printf "\n \t \t $BCyan SetUping Files and Directories .... $Color_Off \n"

 
 printf "\n Copying Backup $BBlue directory scripts from download to /bin/ .... $Color_Off \n"

 #copy file to /bin
 sudo cp -i $downloadPath/*.sh /usr/bin/

 #creating backup for .bash files
 mkdir ~/BackupConfig
 sudo cp -i ~/.bash* ~/BackupConfig/
 echo "files are hidden in this directory run ls -a to view them" >> ~/BackupConfig/readme.txt

 #copying config to .bash file in home dir
 sudo cp  $downloadPath/ShellConfig/.bash* ~/ 

  #Making all .sh file runable
  printf "\n $BGreen Giving excution permission to all .sh files from backup.... $Color_Off \n"
  sudo chmod 755 /usr/bin/*.sh
  sudo chmod 755 ~/.bash*


 #moving this file to home dir
 sudo mv -i $downloadPath ~/Coding/
 line
 
}

addServers(){

printf "\n \t $BYellow Adding servers.... $Color_Off \n"
#adding serves
sudo add-apt-repository restricted
sudo add-apt-repository universe
sudo add-apt-repository multiverse

}

downloadCommands(){
 printf "\n $BGreen Installation of some packages and software starts...... $Color_Off \n"
 #installation of packages begin
 sudo apt-get install rsync
 sudo apt-get install code
 sudo apt-get install gcc
 sudo apt-get install openjdk
 sudo apt-get install git
 sudo apt-get install python
 sudo apt-get install python-pip
 sudo apt-get install zsh
 pip install --upgrade pip
 #updating and run bash script
 update.sh
}

if [ -d $downloadPath ]; then
 mkdir ~/Coding
 copyFiles
 addServers
 downloadCommands
 printf "\n $BGreen \t Setup completed successfully $Color_Off \n"
 scan.sh
 line
else
 line
 red='\033[1;31m';end='\033[1;0m'
 printf "\n $red $downloadPath does not Exist $end \n\n"
 line 
fi
