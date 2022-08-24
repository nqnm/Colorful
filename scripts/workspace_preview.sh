#!/usr/bin/bash

# Kill previous process
del=`cat ~/.pid_of_bspwm_workspace.txt`
kill -9 $del &> /dev/null

# xeventbind process
FILE=~/.pid_of_bspwm_xeventbind.txt
/opt/bspwm-workspace-preview/main.py & echo $! >> $FILE
LINES=`wc -l $FILE | cut -d ' ' -f 1`

# Kill the previous process and remove the PID from the file
if [[ $LINES -gt 1 ]]; then
    pid=`head -n 1 $FILE` 
    kill -9 $pid &> /dev/null
    sed -i '1d' $FILE  
fi
