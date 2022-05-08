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
echo -e "$red [$green+$red]$Cleaning Up Old Directories ...";
  rm -r "/data/data/com.termux/files/usr/share/KnightSpy"
  echo -e "$red [$green+$red]$off Installing ...";
  git clone https://github.com/haclelite01/KnightSpy "/data/data/com.termux/files/usr/share/KnightSpy";
  rm -r "/data/data/com.termux/files/usr/share/KnightSpy/config"

if [ -d "/data/data/com.termux/files/usr/share/KnightSpy" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing KnightSpy"
sleep 5;
KnightSpy
else
echo -e "$red [$green✘$red]$off Tool Cannot Be Installed On Your System! Use It As Portable !";
    exit
fi 
}

function linux() {
echo -e "$red [$green+$red]$off Cleaning Up Old Directories ...";
  sudo rm -r "/usr/share/KnightSpy"
  echo -e "$red [$green+$red]$off Installing ...";
 sudo git clone https://github.com/haclelite01/KnightSpy "/usr/share/KnightSpy";
  sudo rm -r "/usr/share/KnightSpy/config"

if [ -d "/usr/share/KnightSpy" ] ;
then
echo -e "$red [$green+$red]$off Tool Successfully Updated And Will Start In 5s!";
echo -e "$red [$green+$red]$off You can execute tool by typing KnightSpy";
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
fi
