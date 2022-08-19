#!/usr/bin/bash

function configure_compton(){
  # Install compton
    sudo apt purge picom -y && sudo apt update && sudo apt install -y compton
    sudo rm -rf /usr/local/bin/picom
  # Comment picom and uncomment compton in bspwmrc
    sed -i -e "s/picom --config ~\/.config\/picom\/picom.conf \-b/#picom --config ~\/.config\/picom\/picom.conf \-b/g" ~/.config/bspwm/bspwmrc
    sed -i -e "s/# compton --config ~\/.config\/compton\/compton.conf \&/compton --config ~\/.config\/compton\/compton.conf \&/g" ~/.config/bspwm/bspwmrc
  # Comment picom and uncomment compton in changer script
    sudo echo '' > /usr/local/bin/changer
    sudo echo '#!/bin/sh' >> /usr/local/bin/changer
    sudo echo 'WAL=$(ls ~/Pictures/*.* | shuf -n 1)' >> /usr/local/bin/changer
    sudo echo 'bash ~/.config/polybar/colorblocks/scripts/pywal.sh $WAL' >> /usr/local/bin/changer
    sudo echo 'compton --config ~/.config/compton/compton.conf &' >> /usr/local/bin/changer
}

echo 'Compton will reduce the issue of the polybar disappearing (it will still happen sometimes but less), however, you will not be able to use rounded corners.'
echo "If you don't care about rounded corners please proceed."; echo

while true; do
    read -p "Do you wish to remove picom and use compton instead?" yn
    case $yn in
        [Yy]* ) configure_compton; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

comp_ver=$(compton --version)

echo ''
echo "[+] The configuration is now done!"
echo "[+] The compton version is: $comp_ver"
