#!/usr/bin/bash

# Color files
PFILE="$HOME/.config/polybar/hack/colors.ini"
RFILE="$HOME/.config/polybar/hack/scripts/rofi/colors.rasi"
KFILE="$HOME/.config/kitty/kitty.conf"
DFILE="$HOME/.config/dunst/dunstrc"

# Get colors
pywal_get() {
    /usr/local/bin/wal --backend /usr/local/bin/wal -i "$1" -q \
        || /usr/bin/wal --backend /usr/bin/wal -i "$1" -q
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	
    # bspwm
    bspc config normal_border_color $BG
    bspc config focused_border_color $FG
    bspc config active_border_color $AC
    # bspc config urgent_border_color $SH4
    bspc config presel_feedback_color $AC

	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  ac:    ${AC}FF;
	  se:    ${AC}26;
	  fg:    ${FG}FF;
	}
	EOF

	# kitty
	sed -i -e "s/active_tab_background   #.*/active_tab_background   $AC/g" $KFILE
	sed -i -e "s/inactive_tab_background #.*/inactive_tab_background $FG/g" $KFILE
	sed -i -e "s/tab_bar_background #.*/tab_bar_background $BG/g" $KFILE

    # dunst
    #cat $DFILE | grep "urgency_low" -A 3 | grep "background" | sed -i -e "s/background = \"#.*\"/background= \"$BG\"/g" $DFILE
    #cat $DFILE | grep "urgency_normal" -A 3 | grep "background" | sed -i -e "s/background = \"#.*\"/background= \"$BG\"/g" $DFILE
    sed -i -e "s/frame_color = \"#.*\"/frame_color = \"$SH1\"/g" $DFILE
    killall dunst
    dunst --config $DFILE > /dev/null 2>&1 &

	polybar-msg cmd restart
}

# Main
if [[ -f "/usr/bin/wal" || -f "/usr/local/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`
		AC=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
