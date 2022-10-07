#!/usr/bin/bash

# Author: nozerobit
# Description: Creates and/or modifies a cronjob that changes your desktop wallpaper every x minutes.
# Support: Used only in colorful-dotfiles created by nozerobit

# Usage:
# wallpaper_scheduler.sh -m <amount_of_minutes>
# Data type of <amount_of_minutes>: Integer
# Range of <amount_of_minutes>: 1-59

#if [ `id -u` -ne 0 ]; then
    #/bin/echo "[i] This scripts needs root or sudo permissions!"
    #exit 1
#fi

enable_cronjob(){
    crontab -l | sed "/^#.*\/usr\/bin\/bash \/usr\/local\/bin\/changer/s/^#//" | crontab -
    /bin/echo "[+] Enabled the cronjob"
    crontab -l
}

disable_cronjob(){
    crontab -l | sed "/^[^#].*\/usr\/bin\/bash \/usr\/local\/bin\/changer/s/^/#/" | crontab -
    /bin/echo "[+] Disabled the cronjob"
    crontab -l
}

configure_cronjob(){
    # <minutes>  * * * * command

    if ! [[ "$MINUTE" =~ ^[0-9]+$ ]]
    then
        /bin/echo "[-] Sorry, positive integers only"
        exit 1
    fi

    if [ $MINUTE -ge 1 ] && [ $MINUTE -le 59 ]; then
        :
    else
        /bin/echo "[-] The minute is out of range, the valid range is from (1-59) minutes"
        exit 1
    fi

    /bin/echo "[!] Elevating to sudo"
    sudo test
    CRON_FILE="/var/spool/cron/crontabs/$USER"
	if sudo [ ! -f $CRON_FILE ]; then
        /bin/echo "[+] Creating a cron file!"
        /bin/echo "*/$MINUTE * * * * /usr/bin/bash /usr/local/bin/changer" | crontab -
        #/usr/bin/crontab $CRON_FILE
        /bin/echo "[+] The current user: $USER now has the following cronjob/s:"
        /usr/bin/crontab -u $USER -l
        /bin/echo "[i] The crontab location is: $CRON_FILE"
    else
        crontab -l | sed -E "s/([0-9]+)/$MINUTE/" | crontab - 
        /bin/echo "[+] Modified the crontab to change the desktop wallpaper every $MINUTE minutes."
        /bin/echo "[i] The crontab location is: $CRON_FILE"
        /bin/echo "[+] New crontab configuration:"
        crontab -l
    fi
    
    #if [ $? != 0 ]; then
        #/bin/echo "[-] Error: Couldn't create the cronjob."
        #exit 1
    #fi
}

help(){
    /bin/echo "Script usage: wallpaper_scheduler.sh [-h] [-e] [-d] [-m <minutes>]"
    /bin/echo -e "Example:\n" \
        "\twallpaper_scheduler.sh -m 5\nOptions:\n" \
        "\t-h: Print this help menu.\n" \
        "\t-e: Enable the cronjob.\n" \
        "\t-d: Disable the cronjob.\n" \
        "\t-m: Amount of minutes within the range of (1-59)."
}

if [ "$#" -eq 0 ]
then
    help
    exit 1
fi

# Get the options
while getopts "hedm:" OPTION; do
   case $OPTION in
       h) # display Help
           help
           exit;;
       e) # enable the cronjob
           enable_cronjob
           exit;;
       d) # disable the cronjob
           disable_cronjob
           exit;;
       m) # set cronjob minutes
           MINUTE=$OPTARG
           configure_cronjob
           exit;;
       \?) # incorrect option
           /bin/echo "Script usage: $0 [-h] [-e] [-d] [-m <minutes>]" >&2
           /bin/echo "Use the following to view the help menu: $0 -h"
           exit 1;;
   esac
done
shift "$(($OPTIND -1))"
