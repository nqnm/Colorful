#!/usr/bin/bash

# Description: 
# This script is executed when BSPWM workspace preview is enabled with SXHKD
# It is re-executed on X11 resolution changes; this is the reason why previous PIDs are killed before launching a new PID

ps -ef |\
 grep "/usr/bin/python /opt/bspwm-workspace-preview/main.py"\
  | grep -v color |\
   awk '{printf "%s\n", $2}' |\
    while read line; do kill -9 $line 2>/dev/null; done
/opt/bspwm-workspace-preview/main.py &