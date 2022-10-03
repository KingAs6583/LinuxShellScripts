#!/bin/bash

#This file is use to copy the contain from /usr/bin to Backup folder
line(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "--------------------------------------------------------------------------------------------------------------------------------"
else
echo "---------------------------------------------------------------------"
fi
}

line
echo "1.Rsync in Android Directory "
echo "2.Rsync in Linux Directory "
echo "3.Rsync in Java Directory "
echo "4.Rsync in Python Directory "
echo "5.Rsync in C++ DIrectory "
echo "6.To Exit "
line

read option

input()
{
echo "-------------------------------------------------------"
echo "Entre the file name You want to copy"
read -e name_copy
echo "Enter the file name you want to create and paste"
read -e name_paste
echo "-------------------------------------------------------"
}

decorection()
{
echo "-------------------------------------------------------"
echo "   Successfully paste in particular location"
echo "-------------------------------------------------------"
}

syncAndroidDir(){

}
case $option in 
1) ;;
*) exit ;;
esac


#if [ $option -eq 1 ]; then
#input
#cp -i ~/AndroidStudioProjects/$name_copy/app/src/main/java/com/example/$name_copy ~/Backup_code/Android_code/$name_paste
#cp -i ~/AndroidStudioProjects/$name_copy/app/src/main/res/layout/activity_main.xml ~/Backup_codes/Android_code/$name_copy activity_main.xml
#decorection
#elif [ $option -eq 2 ]; then
#input
#cp -i /usr/bin/$name_copy ~/Backup_codes/Linux_code.sh/$name_paste
#decorection
#elif [ $option -eq 3 ]; then
#input
#cp -i ~/ ~/Backup_codes/Linux_code.sh/Linux_Documents/$name_paste
#decorection
#elif [ $option -eq 4 ]; then
#input
#cp -i ~/python3_pgm/$name_copy ~/Backup_codes/python_code/$name_paste
#decorection
#else
#exit
#fi

