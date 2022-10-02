#!/bin/bash
#The file contain the command which give the changes made in files
line(){
cols=$(tput cols)
if [ $cols -le 135 -a $cols -gt 80 ]; then
echo "------------------------------------------------------------------------------------------------------------------------------"
else
echo "-------------------------------------------------------------------------"
fi
}

no=0
msg="For AutoCompelte Press Tab : "
normal(){

line
echo " Enter the file name with path to check change  "
read -e -p "$msg" file1
echo " Enter the file name which want to look changes in or with $file "
read -e -p "$msg" file2
line
#Here -e -p is for autocomplete from terminal
#dif -u in + - formate
diff -y --color="auto" $file1 $file2
line
echo " change are above "
line

}

checking(){
# this function is use check change to backup and usr/bin pgm or files

line
echo " Checking Changes "

#array
scan=( "update.sh" "jarvis.sh" "cmd_edit.sh" "doc.sh" "code.sh" "firefox.sh" 
"run.sh" "clean.sh" "Backup.sh" "android.sh" )

#sub file of files array with define index
sub=( [1]=".user_defind_cmd"
[2]="documents.txt")

#variables
path="/usr/bin"
path1="/home/kingas/Backup_codes/Linux_code.sh"
limit=${#scan[*]}

while [ $no -le $limit ]
do

#Alternative of expr no=$(($no + 1 ))
no=$(expr $no + 1)

if [ -f "$path1/${scan[$no]}" ]; then
line
echo " Changes of $path/${scan[$no]} files are "
diff -y -w --suppress-common-lines --color="auto" $path/${scan[$no]} $path1/${scan[$no]}
line

else

echo " !! ${scan[$no]} Do not Exists Download it from Drive scanning  $(($no * 10))%"
fi
done

}

test(){
if [ "diff -u /home/kingas/systeminfo.sh /usr/bin/systeminfo.sh" ]; then
echo "change"
else
echo "not change"
fi
}

release(){
unset -v scan sub path path1
unset -v file1 file2 limit no msg
unset -f line 
}

line
echo "1.To check the difference of user define files"
echo "2.To check the difference"
echo "3.To Backup"
line
read opt

if [ $opt -eq 1 ]; then
checking
elif [ $opt -eq 2 ]; then
normal
elif [ $opt -eq 3 ]; then
Backup.sh
fi
line
release
