#!/bin/bash

res=$(xrandr | grep \* | cut -d' ' -f4)

while true; do {
	newRes=$(xrandr | grep \* | cut -d' ' -f4)
	if [ "$newRes" != "$res" ]; then {
		# echo "Resolution change: $newRes"
     		res=$(xrandr | grep \* | cut -d' ' -f4)
    		feh -g $res --bg-fill ~/Pictures/TW.png
		bash ~/.config/polybar/colorblocks/scripts/pywal.sh ~/Pictures/TW.png &
		wait $!
	} fi
	sleep 1
} done
