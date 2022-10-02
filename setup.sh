#!/usr/bin/sh

#Taking argument from script
arg=$1
#here 1 is arg taken from scrip to other arg 2 and so on
line(){
echo "**************************************************************************"
}

#
echo "**************************************************************************"
echo "setuping files ...."

#make all .sh file runable

echo "Giving excution permission to all .sh files from backup...."
sudo chmod +xw ~/Downloads/Backup_codes/Linux_code.sh/*.sh

echo "copying backup directory from download to home...."

path="~/Downloads/Backup_codes"

sudo cp -i ~/Downloads/Backup_codes/Linux_code.sh/*.sh /usr/bin/

sudo cp -i $path/Linux_code.sh/Linux_Documents/* /home/kingas/

sudo cp -i -R $path /home/kingas/

echo "Adding serves...."

#adding serves
sudo add-apt-repository restricted
sudo add-apt-repository universe
sudo add-apt-repository multiverse

echo "Installation of some packages and software starts......"

#installation of begin
sudo apt-get install rsync
sudo apt-get install code
sudo apt-get install gcc
sudo apt-get install openjdk
sudo apt-get install git
sudo apt-get install python
sudo apt-get install python-pip
pip install --upgrade pip
#updating and run bash script
update.sh

echo "setup completed successfully "
line
