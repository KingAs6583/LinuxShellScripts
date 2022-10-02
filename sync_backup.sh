#!/usr/bin/sh

#This file is use to backup and sync the contain

star(){
col=$(tput cols)
if [ $col -le 135 -a $col -gt 80 ]; then
echo "*****************************************************************************************************************************"
else
echo "***********************************************************************"
fi
}

star
echo "syncing or copying or backup ... "

#copying .sh file from bin to backup directory
cp /usr/bin/*.sh ~/Backup_codes/Linux_code.sh/

#rsync -a is file which sync or copy the data from dir to dir
#rsync -zvh is to copy file to file

#this is copying c++ and c pgm from home dir to backup dir
rsync -azvh ~/cpp_gcc_pgm/ ~/Backup_codes/cpp_gcc_pgm

#this is copying java pgm
rsync -azvh ~/java_pgm/ ~/Backup_codes/java_pgm

#this is copying python pgm
rsync -azvh ~/python3_pgm/ ~/Backup_codes/python_code

#this is copying web pgm
rsync -azvh ~/web_developement/ ~/Backup_codes/web_developement

#if you dont want rsync then use cp with * to copy all note it will only copy files

star
echo "syncing backup successfully done "
star

echo "syncing of backup directory to google drive start ..."
echo "choose from the option "
echo "1 Android_code"
echo "2 cpp_gcc_pgm"
echo "3 java_pgm"
echo "4 linux_code.sh"
echo "5 python3_pgm"
echo "6 web_developement"
echo "7 Exit"
echo "Note : First open kingas6583@gmail.com drive in files under Network section before choose a option "
read option

#cmd to run
cmd="rsync -azvh --no-perms -O --omit-dir-times --progress "

#path of directories
path="/home/kingas/Backup_codes"
A_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1b5AcT5nEFMsm8_JxwfoGc68DqiX1Dmnz/1KPjTSiui2XplSPM_hQpMfQ4YM26qE299"
C_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1vcuZWKUA9XrRl2IOdCL-47-Diu0wb85I"
J_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1JIWSjAEbaMcC_zD5LLFVAUEXwmMYvSYC"
P_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1q7s9kdBa1yvGBFuF4S5p-GeADQXOaoYt"
W_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1N_nU2IxlXQ76nn3NoYW6m30bhbevNJ7D"
L_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E/1a6A-GVFzpLXnY7KIbMlxfHvsCnMgYQCT"
B_path="/run/user/1000/gvfs/google-drive:host=gmail.com,user=kingas6583/19n-pcspxFm2s-16mvxjkEOQrc3QDzz6E"

#condition matching and excution of cmd and path

if [ $option -eq 1 ]; then
cp ~/Backup_codes/Android_code/Android_code_zip/*.zip $A_path/
show
elif [ $option -eq 2 ]; then
$cmd$path/cpp_gcc_pgm/ $C_path
show
elif [ $option -eq 3 ]; then
$cmd$path/java_pgm/ $J_path
show
elif [ $option -eq 4 ]; then
$cmd$path/Linux_code.sh/ $L_path
show
elif [ $option -eq 5 ]; then
$cmd$path/python_pgm/ $P_path
show
elif [ $option -eq 6 ]; then
$cmd$path/web_developement/ $W_path
show
else
exit
fi
cp $path/*.txt /$B_path/
star
echo "syncing of backup to google drive is complete"
echo "Note do check if changes are refelect in google drive or not "
star

