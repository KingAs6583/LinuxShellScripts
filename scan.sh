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

line
echo " Fully scaning of bash user define file Started .... "
line
scan=( "update.sh" "jarvis.sh" "cmd_edit.sh" "doc.sh" "code.sh"
"firefox.sh" "run.sh" "clean.sh" "Backup.sh" "android.sh" )

#sub files of files
sub=([1]=".user_defind_cmd"
[2]="documents.txt")

#directories for files
#Backup_codes Android_code Linux_code.sh python_code
dir=([1]="python3_pgm"
[2]="venv"
[3]="java_pgm"
[4]="cpp_gcc_pgm")

#logic and scaning begins
no=0
limit=${#scan[*]}
search=0

#
echo " 1 If you want scan in Backup dir "
echo " 2 If you want scan in usr/bin dir "
line
read path
line
if [ $path -eq 1 ]; then
path="/home/kingas/Backup_codes/Linux_code.sh"
else
path="/usr/bin"
fi

# checking file exits
while [ $no -le $limit ]
do
no=$(expr $no + 1)
if [[ -f "$path/${scan[$no]}" ]]; then
echo " $no ${scan[$no]} Exists scaning $(( $no * 10 ))%"
line
else
search=$(expr $search + 1)
echo " !! ${scan[$no]} Do not Exists Download it from Drive scanning  $(($no * 10))%"
line
fi
done
no=0
while [ $no -le 1 ]
do
no=$(expr $no + 1)
if [[ -f "${sub[$no]}" ]]; then
echo " ${sub[$no]} is exist to support ${scan[4]} "
line
else
search=$(expr $search + 1)
echo " !! ${sub[$no]} is not exits"
line
fi
done

#checking directory exits

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

unset scan
diff.sh

echo " Scanning Complete $search "
line
