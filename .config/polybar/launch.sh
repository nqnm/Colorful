#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Fix windows
    bspc config top_padding 0
    bspc config bottom_padding 0

	# Launch the bar
	if [[ "$style" == "hack" ]]; then
		polybar -q top -c "$dir/$style/config.ini" & 2>/dev/null
		polybar -q bottom -c "$dir/$style/config.ini" & 2>/dev/null
	else
		polybar -q main -c "$dir/$style/config.ini" & 2>/dev/null
	fi
}

if [[ "$1" == "--trans" ]]; then
    style="trans"
	# Sudo rofi
	echo 'rofi -theme ~/.config/polybar/trans/scripts/rofi/launcher.rasi -show drun -run-command' > ~/.sudo-launch
    launch_bar

elif [[ "$1" == "--colorblocks" ]]; then
	style="colorblocks"
	# Sudo rofi
	echo 'rofi -theme ~/.config/polybar/colorblocks/scripts/rofi/launcher.rasi -show drun -run-command' > ~/.sudo-launch
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme
		
	Available Themes:
	--colorblocks
	--trans
	EOF
fi
