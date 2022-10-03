#!/bin/bash

if [ -f ~/.bash_color ]; then
source ~/.bash_color
fi

#Note for matth opearation with out expr
#use double parensenthies
#ex v=$((i++))

#global scope path
path="/usr/bin/"

#default option
repeat="y"

#default editor
editor="nano -i"

help(){
printf "\n $BGreen Description $Color_Off "
printf "\n \t\t It is an Script to edit user define shell script in linux bash support distor \n"
printf "\n $BRed Syntax $Color_Off \n \t cmd_edit.sh [option] \n"
printf "\n $BBlue -e $Color_Off \n \t : this option is use to choose Editor $Yellow editor are code and nano $Color_Off \n"
printf "\n $BGreen -n $Color_Off \n \t : this option is use to not loop this script \n"
printf "\n $BCyan --help $Color_Off \n \t : it is use to display this message \n\n " 
}

#selecting args option
case $* in
-e)arg1=$1 ;;
-n)arg2=$1 ;;
--help)help;exit ;;
*)arg2=$2 ;;
esac

cmd=( "" "update.sh" "doc.sh" "cmd_edit.sh" "Backup.sh" "firefox.sh" 
 "RAM_info.sh" "run.sh" "setup.sh" "scan.sh" "diff.sh" "history.sh"
 "syncBackup.sh"
 )
 
NoOfCmd=${#cmd[*]}

#function to
line(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "--------------------------------------------------------------------------------------------------------------------------------"
else
echo "---------------------------------------------------------------------"
fi
}

#function to
chooseEditor(){
line
echo " press 1 for Edit in Nano   // to exit ctrl + q //save ctrl + o "
echo " Press 2 for Edit in VS Code // to exit ctrl + q // save ctrl + s "
echo " press 3 for setting nano for whole pgm for now "
echo " press 4 for setting code for whole pgm for now "
line
 
local opt=1

read opt

 if [ $opt -eq 1 ]; then
 editor="nano -i"
 elif [ $opt -eq 2 ]; then
 editor="code -r"
 elif [ $opt -eq 3 ]; then
 arg1="not"
 editor="nano -i"
 elif [ $opt -eq 4 ]; then
 arg1="not"
 editor="code -r"
 fi

}

#function to
show(){

line
echo " Choose which user defind cmd you want to Edit "
line
printf "\n 0.Read cmd  \t Read about user defind cmds \n\n"

printf " |$Cyan %18s |$Green %18s |$Yellow %18s | $Color_Off \n" ${cmd[*]} ;

printf "\n $BRed Enter any number greater than %d To Exit.$Color_Off... \n" $NoOfCmd ;
line

read opt

if [ $opt -lt $NoOfCmd -a "$arg1" = "-e" ]; then
 chooseEditor
fi

#below strnt is use to assign address and editor to l value using value of e
#and p 
combEditPath="$editor $path"

}


#function to
chooseOption(){

#function call
show

if [ $opt -lt $NoOfCmd ]; then
$combEditPath${cmd[$opt]};
else
repeat="n";line;exit;
fi

}

while [ "$repeat" != "n" ];
do
 chooseOption
 if [ "$arg2" = "-n" ]; then
 line
 break
 fi
done


#use for this pgm -x -y =-xy
#while getopts e: opt ;
#do
#echo $opt,OPTARGE: $OPTARG,OPTIND $OPTIND,OPTERR $OPTERR
#case $opt in
#e)arg1="-e" shift 1 ;;
#n)arg2="-n" ;;
#esac
#done
