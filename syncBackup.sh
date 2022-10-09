#!/usr/bin/bash

#This file is use to backup and sync the contain

if [ -f ~/.bash_color ]; then 
 source ~/.bash_color
fi 

star(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "*****************************************************************************************************************************"
else
echo "***********************************************************************"
fi
}

syncScripts(){

 #copying .sh file from bin to backup directory

 rsync -azvh /usr/bin/*.sh ~/Coding/LinuxShellScripts/
 rm ~/Coding/LinuxShellScripts/amuFormat.sh
 rm ~/Coding/LinuxShellScripts/gettext.sh
 rsync -azvh ~/.bash* ~/Coding/LinuxShellScripts/ShellConfig/
 rsync -azvh ~/.zshrc ~/Coding/LinuxShellScripts/ShellConfig/
 rm ~/Coding/LinuxShellScripts/ShellConfig/.bash_history
 #rsync -a is file which sync or copy the data from dir to dir
 #rsync -zvh is to copy file to file

}

comFile=( "cpp.tar.gz" "java.tar.gz" "python.tar.gz" "web.tar.gz" "linux.tar.gz" )
comSize=${#comFile[*]}
readonly path=~/Coding/BackUp
dirFile=( "cpp_gcc_pgm" "java_pgm" "python3_pgm" "web_developement" "LinuxScripts" )
readonly D=$(expr 6500 + 83)

compress(){
 echo "Compression start ..."
 i=0
 while [ $i -lt $comSize ];
 do
 if [ -f  $path/${comFile[$i]} ]; then
 tar -vczf $path/${comFile[$i]} ~/Coding/${dirFile[$i]}/*
 else
 tar -vczf $path/${comFile[$i]} ~/Coding/${dirFile[$i]}/*
 fi
 i=$(expr $i + 1)
 done
 echo "Compression done ..."
 echo "check $path "
 }

extract(){

 i=0
 while [ $i -lt $comSize ];
 do
 if [ -f  $path/${comFile[$i]} ]; then
 tar -vxzf $path/${comFile[$i]} -c $path/
 fi
 i=$(expr $i + 1)
 done
 echo "check $path"
 }
 
show(){

 star
 printf " \n \n  \t $BGreen syncing or copying or backup ... $Color_Off"
 printf " \n Syncing of backup directory to google drive start ..."
 printf " \n \n $BOrange Choose from the option $Color_Off\n"
 printf " \n |$BCyan %s \t|$Yellow  %s \t|$Purple %s \t|$Color_Off \n" "1 ${comFile[0]}" "2 ${comFile[1]}" "3 ${comFile[2]}"
 printf " \n |$BCyan %s \t|$Yellow  %s \t|$Purple %s \t|$Color_Off \n" "4 ${comFile[3]}" "5 ${comFile[4]}" "6 Android.zip"
 printf " \n \n$BRed Note : First open $USER$D@gmail.com drive in files under Network section before choose a option $Color_Off"
 printf " \n \t$BBlue Before syncing compress the files first $Color_OFF"
 printf " \n \t$BRed Press Any Or Number Greater Than 7 To Exit ...$Color_Off \n"
 star
  #when setting up first know how to sync file in linux using online account
  #system setting > onlineAccount 
 }

 GmailUserName=$USER$D
 
syncCodes(){
 #cmd to run --no-perms -O --omit-dir-times
 cmd="rsync -azvh --no-perms -O --omit-dir-times --progress"
 drivePath="/run/user/1000/gvfs/google-drive:host=gmail.com,user=$GmailUserName/BackUpCodes/"

 show

 read opt
 
 case $opt in
 # this is copying c++ and c pgm from home dir to backup dir
 1) $cmd $path/${comFile[0]} $drivePath/ ;;
 #this is copying java pgm
 2) $cmd $path/${comFile[1]} $drivePath/ ;;
 #this is copying python pgm
 3) $cmd $path/${comFile[2]} $drivePath/ ;;
 #this is copying web pgm
 4) $cmd $path/${comFile[3]} $drivePath/ ;;
 #
 5) $cmd $path/${comFile[4]} $drivePath/ ;;
 #
 6) $cmd $path/*.zip $drivePath/AndroidZip/ ;;
 #
 *) exit ;;
 #if you dont want rsync then use cp with * to copy all note it will only copy files
 esac

 star
 echo "syncing of backup to google drive is complete"
 echo "Note do check if changes are refelect in google drive or not "
 echo "syncing backup successfully done "
 star 

}

star
echo "1 SyncScripts "
echo "2 SyncCodes   "
echo "3 Compress    "
echo "4 Decompress  "
star

read option

case $option in 
1) star; syncScripts; star ;;
2) syncCodes ;;
3) star; compress ; star ;;
4) star; extract; star ;;
*) exit ;;
esac

