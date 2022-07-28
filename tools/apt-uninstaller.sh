#!/usr/bin/bash

# Author: nozerobit

# Description: 
# Debloat script for APT since some Linux distributions comes with many packages pre-installed.
# This script supports multiple package selector
# This way you can search and select all the packages that you want to purge

# ANSI Colors
export red='\e[0;31m'
export green='\e[0;32m'
export blue='\e[0;34m'
export neutro='\e[0;m'

# Escape
trap ctrl_c INT
function ctrl_c() {
    echo -e "\n$red[+] Trapped CTRL-C$neutro\n"
    exit
}

# Automation
echo -e "\t$blue APT Uninstaller by nozerobit$neutro\n"
echo -e "$green[i] This script uninstalls APT packages$neutro"
echo -e "$green[i] You can search and select multiple packages$neutro"
echo -e "$green[i] Keyboard Shortcut:$blue Use Tab to select multiple packages$neutro"
echo -e "$green[i] Keyboard Shortcut:$blue Use Ctrl+C to exit$neutro"
echo ""

uninstall(){
    while true
    do
        sudo apt list --installed 2>/dev/null | cut -d / -f 1 | grep -vi 'Listing...' > packages.lst
        PKG=$(cat packages.lst|fzf --multi) || ctrl_c 
        #sudo apt-get remove -y $PKG
        sudo apt-get purge -y $PKG
        sudo apt-get autoremove -y
        sudo apt-get autoclean
        sudo apt-get update
        #sudo apt-get install -f
        echo ""
        read -p "[!] Do you want to continue? (y/n): " yn
        echo ""
        case $yn in
            [Yy]* ) continue;;
            [Nn]* ) exit;;
            * ) echo -e "$red[-] Please answer yes or no.$neutro";;
        esac
    done
}

while true; do
    read -p "[!] Do you want to uninstall package/s? (y/n): " yn
    case $yn in
        [Yy]* ) uninstall;;
        [Nn]* ) exit;;
        * ) echo -e "$red[-] Please answer yes or no.$neutro";;
    esac
done