#!/usr/bin/bash

# Description:
# If the keyboard shortcut is executed two (2) times it will kill `xeventbind resolution /home/kali/.workspace_preview.sh` since is executed (2) times
# Also kills all the running PIDs which should be 1 (PID) of xeventbind and 1 (PID) of bspwm-workspace-preview
# A while loop is used in the odd case that there are more spawned by other means (aka not using the shortcut)

# xeventbind workspace 
LINES=$(ps -ef | grep ".workspace_preview.sh" | grep -v color | wc -l)
if [[ $LINES -gt 2 ]]; then
    ps -ef |\
    grep ".workspace_preview.sh"\
    | grep -v color |\
    awk '{printf "%s\n", $2}' |\
        while read line; do kill -9 $line 2>/dev/null; done
fi

# workspace
ps -ef |\
 grep "/usr/bin/python /opt/bspwm-workspace-preview/main.py"\
  | grep -v color |\
   awk '{printf "%s\n", $2}' |\
    while read line; do kill -9 $line 2>/dev/null; done