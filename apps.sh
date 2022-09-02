#!/usr/bin/bash

echo "[+] Sudo privileges required"
sudo test

echo "[+] Installing Obsidian!"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/Obsidian-0.15.9.AppImage -O Obsidian-0.15.9.AppImage >> apps_log.txt 2>&1
if [ $? != 0 ]; then
    echo -e "[-] Failed to download Obsidian!"
    exit
fi
chmod +x Obsidian-0.15.9.AppImage >> apps_log.txt 2>&1
sudo mkdir -p /opt/appimages >> apps_log.txt 2>&1
mkdir -p ~/.local/share/applications >> apps_log.txt 2>&1
cp appimages/Obsidian.desktop  ~/.local/share/applications/ >> apps_log.txt 2>&1
sudo cp appimages/obsidian.png  /opt/appimages >> apps_log.txt 2>&1
sudo cp Obsidian-0.15.9.AppImage /opt/appimages >> apps_log.txt 2>&1

echo "[+] Installing Firefox Developer Edition!"
sudo apt-get install firefox-developer-edition-en-us-kbx -y >> apps_log.txt 2>&1
if [ $? != 0 ]; then
    echo -e "[-] Failed to install Firefox Developer Edition!"
    exit
fi