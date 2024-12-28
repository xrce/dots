#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

PROCESS=$(lsappinfo | grep "pid" | wc -l | awk '{print $1}')

case $PROCESS in
9[0-9])
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[7-8][0-9])
	BCOLOR=$COLOR_ORANGE_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[5-6][0-9])
	BCOLOR=$COLOR_YELLOW_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[1-9] | [1-4][0-9])
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
	;;
*)
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
esac

bottombar --set $NAME icon.color=$COLOR background.color=$BCOLOR label="running: $PROCESS " label.color=$COLOR