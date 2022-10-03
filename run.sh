#!/bin/bash

#this file contain the cmd which will make any file excuatable 
if [ -f ~/.bash_color ]; then
 source .bash_color
fi

show(){
echo -e "$BOrange Note: Use this file when u need to make file executable fast $Color_Off"
echo " 1.Enter The File Name to Run and save for further run "
echo " 2.Enter For Running Command"
printf "\n \t $BRed Enter any key greater than 3 ...$Color_Off\n"
read opt
}

pd=$(pwd)
TestDir=~/TestingWorkSpace
fileOpt=0
loop=0

furtherRun(){

 while [ $loop ];
 do
 msg="Enter The Test File Name : "
 if [ $fileOpt -eq 0 ]; then
	read -e -p "$msg" file
	if [ -f $TestDir/$file ]; then
    	 bash $TestDir/$file
    	 fileOpt=2
    	else
    	 echo -e "$BRed $file not exist in $TestDir $Color_Off"
    	fi
    else
    	bash $TestDir/$file
    fi
  echo -e "$BCyan To Edit file Enter 1 or 2 to loop and 3 to exit $Color_Off"
  read n

	  if [ $n -eq 1 ]; then
	   nano -i $TestDir/$file
	  elif [ $n -eq 3 ]; then
	   break;exit;
	  fi
  done
 
}

cmdRun(){
 while [ 0 ];
 do
 printf "\n $BRedNote : Not Run Cd Rm Commands in this script input $Color_Off\n"
 msg=" Enter Command To Run : "
 read -e -p "$msg" cmd
 $cmd
 done
 }
 
show
case $opt in
1)  furtherRun ;;
2)  cmdRun ;;
*) exit ;;
esac 
