#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

PORT=$(nmap localhost | grep open | wc -l | awk '{print $1}')

case $PORT in
1[0-5])
	BCOLOR=$COLOR_ORANGE_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[6-9])
	BCOLOR=$COLOR_YELLOW_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[0-5])
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
	;;
*)
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
esac

bottombar --set $NAME icon.color=$COLOR background.color=$BCOLOR label="opened: $PORT " label.color=$COLOR