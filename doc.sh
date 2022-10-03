#/usr/bin/sh!

#To edit this file use nano /usr/bin/doc.sh cmd
#This is the file which helps us in writing and maintaining documentation of bash commands
#This file code is major develope with help of cat command

line(){
line    --- 
}

greet=" \t thanks for using \n"

# 'greet' is the varible which hold string value

write() {
# write() is a user define function below is the body of function or code of function
line 
echo " Write about the new command"
echo " To save details of command press ctrl + d "
line 
# echo is use to display similar like printing strnt or function
code -r /home/kingas/documents.txt
# cat is use to display the contain of file
# >> this operator os use to append or write contion from end of line or file
printf "$greet"
#" below command is run for above function "
#'cat >> /home/kingas/documents.txt'
}

read1() {
# read1() is the function to display the contain of documents.txt file

line  
echo " you are seeing the contain of documents.txt file "
line  
cat /home/kingas/documents.txt

line  
echo " press 1 to view above or head contain "
echo " press 2 to view below or tail contain "
printf "\t To exit press 3 "
line  

local opt=0
read opt

if [ $opt -eq 3 ]; then
printf "$greet"
line
exit
fi

line  
echo " Enter how many line you want to read "
line  

NoOfLine=30

# Assigning value to line varible with default value 30

read NoOfLine

# Assigning value to line varible user defind value

if [ $opt -eq 1 ]; then
  cat /home/kingas/documents.txt | head -$NoOfLine
  
# head is a cmd which return the top contain of file
# '|' this symbol is pipe which connect to cmd
# '-line' here '-'is a symbol and line is varible hold intiger value and parameter of head cmd

elif [ $opt -eq 2 ]; then
  cat /home/kingas/documents.txt | tail -$NoOfLine
  
# tail is cmd which return the down contain of file
fi
printf "$greet"
# fi is use after if or loop strnts

}

edit()
{
# edit is the function which use to edit the documents.txt file
line 
echo " to save contain in nano press ctrl + o "
echo " to exit from nano press ctrl + x "
line 
code /home/kingas/Backup_codes/Linux_code.sh/Linux_Documents/documents.txt
#code mean virtual studio or vs code editer it has been download by kingas
#nano /home/kingas/documents.txt
#use nano if code cmd is not work properly

# here nano is inbulit text editor
printf "$greet"
}

source_code() {
# source code is a function which use display the code of this file doc.sh
line- 
echo " YOU ARE WATCHING SOURCE CODE OF DOC.SH FILE "
line- 
cat /usr/bin/doc.sh

printf "$greet"
}

commands() {
# this is a function use to display commands or files create by kingas
# note this function deal with file .user_defind_cmd
line    
echo " enter below choice number to perform task "
line    
echo " 1 view           // to view user defind command by kingas "
echo " 2 edit or write // to edit the contain of .user_defind_cmd "
# note .user_defind_cmd is file create by kingas
line   
printf "\t \t press any key to exit "
line   

read a
#read is a keyword 
# 'a' is a varible which is inside command function so the 'a' outside the function is different


edit(){
# this is a function use to edit file .user_define_cmd
nano /home/kingas/.user_defind_cmd
#nano is text editor
#file name .user_defind_cmd
echo " if you press ctrl + o then it is save or else not saved "
printf "$greet"
}

view() {
# view function is use to view contain of .user_defind_cmd file
cat /home/kingas/.user_defind_cmd
# cat is use to view contain of files
# . dot is use to hidden the files

line  
echo " press 1 to view above or head contain "
echo " press 2 to view below or tail contain "
echo "           to exit press e "
line  
read b
if [ $opt == 'e' ]; then
printf "$greet"
exit
fi
line  
echo " Enter how many line you want to read "
line  

line=10
# Assigning value to line varible with default value 10

read line

# insialatio of line varible user defind value

if [ $opt == 1 ]; then
  cat /home/kingas/.user_defind_cmd | head -$NoOfLine
  printf "$greet"

# head is a cmd which return the top contain of file
# '|' this symbol is pipe which connect to cmd
# '-line' here '-'is a symbol and line is varible hold intiger value and parameter of head cmd

elif [ $opt == 2 ]; then
cat /home/kingas/.user_defind_cmd | tail -$NoOfLine
  printf "$greet"

# tail is cmd which return the down contain of file

else
printf "$greet"
fi

}


if [ $a == 1 ]; then
    view
elif [ $a == 2 ]; then
   edit
else

echo " thanks for using "
      exit
fi
#below is the close bracket of commands function
}

line
echo " choose following operation and enter number "
echo " to perform operation prescribe with number from 0 to 4 "
line
echo " Note all below operation perfrom on documents.txt file "
line
echo " 0 write        // to write details of command "
echo " 1 read         // to display the contain "
echo " 2 edit         // to edit the file you wriiten "
echo " 3 source code // to view code of this file or command"
echo " 4 commands    // to view user define files or command"
line
echo "               press any key to exit "
line

read opt
# read is the keyword of bash which use to take input from the user
# 'opt' is the varible

# '$' this symbol is use access value of the varible

if [ $a == 0 ]; then
     write
elif [ $a == 1 ]; then
    read1
elif [ $a == 2 ]; then
     edit
elif [ $a == 3 ]; then
     source_code
elif [ $a == 4 ]; then
     commands
else
echo " invalid input "
echo "---thanks for  using ---"
exit
fi
#fi is indicate end of line
