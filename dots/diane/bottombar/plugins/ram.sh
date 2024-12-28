#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

MEMORY=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')

case $MEMORY in
[8-9][0-9] | 100)
	ICON=${ICON_RAM[4]}
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[6-8][0-9])
	ICON=${ICON_RAM[3]}
	BCOLOR=$COLOR_ORANGE_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[3-5][0-9])
	ICON=${ICON_RAM[2]}
	BCOLOR=$COLOR_YELLOW_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[1-9] | [1-2][0-9])
	ICON=${ICON_RAM[1]}
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
	;;
*)
	ICON=${ICON_RAM[0]}
	BCOLOR=$COLOR_BACKGROUND
	COLOR=$COLOR_DEFAULT
	;;
esac

bottombar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	background.color=$BCOLOR \
	label=" $MEMORY% " \
	label.color=$COLOR
