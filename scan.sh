#!/bin/bash

#function
line(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "-----------------------------------------------------------------------------------------------------------------------------"
else
echo "-----------------------------------------------------------------------"
fi
}

#colors
red='\033[1;31m'
end='\033[0m'

scanScripts(){

line
echo " Fully scaning of bash user define scripts Started .... "
line

scripts=( "update.sh" "cmd_edit.sh" "diff.sh" "RAM_info.sh" "scan.sh" 
"systeminfo.sh" "firefox.sh" "setup.sh" "clean.sh" "syncBackup.sh" )
 
subFiles=( ".bashrc" ".bash_aliases" ".bash_function" ".zshrc" ".bash_color" )

mainPath=/usr/bin
localPath=~/Coding/LinuxShellScripts
localSubPath=$localPath/ShellConfig

limit=${#subFiles[*]}
i=0
size=${#scripts[*]}

while [ $i -lt $size ]
do

#checking main path script against local path 
if [[ -f $mainPath/${scripts[$i]} ]] && [[ -f $localPath/${scripts[$i]} ]]; then
n=1
else
echo " ${scripts[$i]} not found $size"
fi

#checking local sub path files against home dir files
if [ $i -lt $limit ]; then
 if [[ ! -f $localSubPath/${subFiles[$i]} ]] && [[ -f $HOME/${subFiles[$i]} ]]; then
 printf "\n $red ${subFiles[$i]} not found $end \n" 
 fi
fi

i=$(expr $i + 1)
done

printf "\n Scanned Files are : \n"
printf " %18s %18s %18s \n" ${scripts[*]} ${subFiles[*]} 

}

scanDir(){

#directories for files in hash map
dir=([1]="python3_pgm"
[2]="venv"
[3]="java_pgm"
[4]="cpp_gcc_pgm")

#logic and scaning begins

limit=${#dir[*]}
search=0
##checking directory exits
line
if [[ -d "Backup_codes" && -d "Backup_codes/Android_code" && -d "Backup_codes/Linux_code.sh" && -d "Backup_codes/python_code" ]]; then
echo " Backup_codes and it is Sub directories exist "
else
search=$(expr $search + 1)
echo " !! Backup_codes don't exist "
fi
line

if [[ -d "python3_pgm" && -d "python3_pgm/venv" ]]; then
echo " python3_pgm and venv exist "
else
search=$(expr $search + 1)
echo " !! python3_pgm and venv not exist "
fi
line

if [[ -d "java_pgm" && -d "cpp_gcc_pgm" ]]; then
echo " java pgm and cpp_gcc_pgm exist "
else
search=$(expr $search + 1)
echo " !! java pgm and cpp_gcc_pgm not exist "
fi
line

}

#diff.sh
scanDir
scanScripts
line
echo " Scanning Complete $search "
unset -v scripts subFiles
line
