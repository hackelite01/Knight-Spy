#!/bin/bash

red="\e[0;31m"
green="\e[0;32m"
off="\e[0m"

function banner() {
clear
echo "  _  __      _       _     _   ____            ";  
echo " | |/ /_ __ (_) __ _| |__ | |_/ ___| _ __  _   _ ";
echo " | ' /| '_ \| |/ _' | '_ \| __\___ \| '_ \| | | |";
echo " | . \| | | | | (_| | | | | |_ ___) | |_) | |_| |";
echo " |_|\_\_| |_|_|\__, |_| |_|\__|____/| .__/ \__, |";
echo "               |___/                |_|    |___/ ";

echo "  ___             _        _ _           ";
echo " |_ _|  _ __  ___| |_ __ _| | | ___ _ __ ";
echo "  | |  | '_ \/ __| __/ _\ | | |/ _ \ '__|";
echo "  | |  | | | \__ \ || (_| | | |  __/ |   ";
echo " |___| |_| |_|___/\__\__,_|_|_|\___|_|   ";
echo "                                         ";
}

function termux() {
  echo -e "$red [$green+$red]$off Installing Perl ...";
pkg install -y perl
echo -e "$red [$green+$red]$off Installing JSON Module ...";
cpan install JSON
  echo -e "$red [$green+$red]$off Checking directories ..."

if [ -e "/data/data/com.termux/files/usr/share/KnightSpy" ]; then
  echo -e "$red [$green+$red]$off A previous installation was found Do you want to replace it? [Y/n]: "
read replace
if [ "$replace" == "y" ] || [ "$replace" == "Y" ] || [ -z "$replace" ]; then
 rm -r "/data/data/com.termux/files/usr/share/KnightSpy"
 rm "/data/data/com.termux/files/usr/bin/KnightSpy"
else
  echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
  echo -e "$red [$green✘$red]$off Installation Failed";
 exit
fi
fi

  echo -e "$red [$green+$red]$off Installing ...";
 mkdir "/data/data/com.termux/files/usr/share/KnightSpy" 
 cp "KnightSpy.pl" "/data/data/com.termux/files/usr/share/KnightSpy"
 cp "install.sh" "/data/data/com.termux/files/usr/share/KnightSpy"
 cp "update.sh" "/data/data/com.termux/files/usr/share/KnightSpy"
 chmod +x /data/data/com.termux/files/usr/share/KnightSpy/update.sh
  echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
  echo "#!/data/data/com.termux/files/usr/bin/bash 
perl /data/data/com.termux/files/usr/share/KnightSpy/KnightSpy.pl" '${1+"$@"}' > "KnightSpy";
 cp "KnightSpy" "/data/data/com.termux/files/usr/bin"
 chmod +x "/data/data/com.termux/files/usr/bin/KnightSpy"
 rm "KnightSpy";
 if [ -d "/data/data/com.termux/files/usr/share/KnightSpy" ] ;
then
echo -e "$red [$green+$red]$off Tool successfully installed and will start in 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing KnightSpy"
sleep 5;
KnightSpy
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi
}

function linux() {
echo -e "$red [$green+$red]$off Installing Perl ...";
sudo apt-get install -y perl
echo -e "$red [$green+$red]$off Installing JSON Module ...";
cpan install JSON
  echo -e "$red [$green+$red]$off Checking directories..."
if [ -d "/usr/share/KnightSpy" ]; then
    echo -e "$red [$green+$red]$off A Directory KnightSpy Was Found! Do You Want To Replace It? [Y/n]:" ;
    read replace
    if [ "$replace" = "y" ]; then
      sudo rm -r "/usr/share/KnightSpy"
      sudo rm "/usr/share/icons/KnightSpy.png"
      sudo rm "/usr/share/applications/KnightSpy.desktop"
      sudo rm "/usr/local/bin/KnightSpy"

else
echo -e "$red [$green✘$red]$off If You Want To Install You Must Remove Previous Installations";
echo -e "$red [$green✘$red]$off Installation Failed";
        exit
    fi
fi 

echo -e "$red [$green+$red]$off Installing ...";
echo -e "$red [$green+$red]$off Creating Symbolic Link ...";
echo -e "#!/bin/bash
perl /usr/share/KnightSpy/KnightSpy.pl" '${1+"$@"}' > "KnightSpy";
    chmod +x "KnightSpy";
    sudo mkdir "/usr/share/KnightSpy"
    sudo cp "install.sh" "/usr/share/KnightSpy"
    sudo cp "update.sh" "/usr/share/KnightSpy"
    sudo chmod +x /usr/share/KnightSpy/update.sh
    sudo cp "KnightSpy.pl" "/usr/share/KnightSpy"
    sudo cp "config/KnightSpy.png" "/usr/share/icons"
    sudo cp "config/KnightSpy.desktop" "/usr/share/applications"
    sudo cp "KnightSpy" "/usr/local/bin/"
    rm "KnightSpy";

if [ -d "/usr/share/KnightSpy" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Installed And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing KnightSpy"
sleep 5;
KnightSpy
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi 
}

if [ -d "/data/data/com.termux/files/usr/" ]; then
banner
echo -e "$red [$green+$red]$off KnightSpy Will Be Installed In Your System";
termux
elif [ -d "/usr/bin/" ];then
banner
echo -e "$red [$green+$red]$off KnightSpy Will Be Installed In Your System";
linux
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi
