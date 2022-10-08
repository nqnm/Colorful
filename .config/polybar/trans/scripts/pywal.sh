#!/usr/bin/bash

# Wal Path (Doesn't work with crontabs)
#PYW=$(/usr/bin/which wal)
#/bin/echo $PYW

# Color files
PFILE="$HOME/.config/polybar/trans/config.ini"
RFILE="$HOME/.config/polybar/trans/scripts/rofi/colors.rasi"
KFILE="$HOME/.config/kitty/kitty.conf"
DFILE="$HOME/.config/dunst/dunstrc"

# Get colors
pywal_get() {
    /usr/local/bin/wal --backend /usr/local/bin/wal -i "$1" -q \
        || /usr/bin/wal --backend /usr/bin/wal -i "$1" -q
}

# Change colors
change_color() {
	sed -i -e "s/background = #.*/background = $BGT/g" $PFILE
	sed -i -e "s/background-alt = #.*/background-alt = $FG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FGA/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $SH1/g" $PFILE
	sed -i -e "s/secondary = #.*/secondary = $SH2/g" $PFILE
	sed -i -e "s/alert = #.*/alert = $SH3/g" $PFILE
	sed -i -e "s/disabled = #.*/disabled = $SH4/g" $PFILE

    # bspwm
    bspc config normal_border_color $SH1
    bspc config focused_border_color $SH2
    bspc config active_border_color $SH3
    # bspc config urgent_border_color $SH4
    bspc config presel_feedback_color $SH2

	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
         background:    ${BGT};
         background-alt:   ${FG};
         foreground:   ${FGA};
         primary:   ${SH1};
         secondary:    ${SH2};
         alert:   ${SH3};
         disabled: ${SH4};
	}
	EOF

	# kitty
	sed -i -e "s/active_tab_background   #.*/active_tab_background   $SH1/g" $KFILE
	sed -i -e "s/inactive_tab_background #.*/inactive_tab_background $SH2/g" $KFILE
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
        BGT=`echo $BG | sed 's/#/#aa/g'`
        #echo $BGT
		FG=`printf "%s\n" "$color0"`
		FGA=`printf "%s\n" "$color7"`
		SH1=`printf "%s\n" "$color1"`
		SH2=`printf "%s\n" "$color2"`
		SH3=`printf "%s\n" "$color5"`
		SH4=`printf "%s\n" "$color8"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color2"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
    exit
fi
