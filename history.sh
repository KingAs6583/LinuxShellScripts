#
#note use double coats to string and single to char
#sed cmd has limit of characters 20
echo "choose the operation"
echo "1 common use cmd"
echo "2 delete any cmd u want"
echo "3 for number "
echo "4 To View History"
echo "5 To edit .bash_history"
echo "6 for exit "
read a

common_cmd()
{
sed -i 's/update.sh //g' .bash_history
sed -i 's/doc.sh //g' .bash_history
sed -i 's/sudo apt update //g' .bash_history
sed -i 's/sudo apt upgrade //g' .bash_history
sed -i 's/firefox.sh //g' .bash_history
sed -i 's/code.sh //g' .bash_history
sed -i 's/history.sh //g' .bash_history
sed -i 's/cmd_edit.sh //g' .bash_history
}

delete_cmd()
{
echo "enter the cmd u want to delete "
echo " note it must be length and unique doesn't match to any other cmd in short form"
read cmd
sed -i "s/$cmd//g" .bash_history
echo "$cmd is successfully remove or delete"
}

delete_num()
{
x=0
#x is is varible which store a value
echo "enter the limit of numbers"
read n
# read is take value from user in n
while [ $x -le $n ]
do
#while loop
sed -i "s/$x//g" .bash_history
#sed -i 's/word delete//g' file name
#sed is a cmd which use to delete a word inside particular file
#in bash "$varible value" double coat is use display varible value in display strnt
#$ dollar symbol is use to access varible actual value in code or program
x=$(( $x + 1 ))
#above strnt is like x++ to access any value as a int use this below syntax
#varible to assign = $(( varible value + operation value ))
done
#done is end of while loop
sed -i 's/      //g' .bash_history
file=".bash_history"
sed -i 's/     //g' $file
sed -i 's/    //g' $file
echo "complete..."
}

space()
{
#this function will remove space or empty line
# void or white space
sed -e 's/[\t ] //g;/^$/d' .bash_history > temp.txt
cat temp.txt > .bash_history
rm temp.txt
echo ""
echo " To Make it effect Close and open the Terminal"
echo ""
}


if [ $a == 1 ]; then
common_cmd
space

elif [ $a == 2 ]; then
delete_cmd
space

elif [ $a == 3 ]; then
delete_num

elif [ $a == 4 ]; then
history
echo "You Watched Contain of .bash_history file "

elif [ $a == 5 ]; then
nano .bash_history

else

echo " complete...."

exit
fi

#hi
