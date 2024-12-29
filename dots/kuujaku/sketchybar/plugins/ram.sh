#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

MEMORY=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')

case $MEMORY in
[8-9][0-9] | 100) ICON=${ICON_RAM[4]} ;;
[6-8][0-9]) ICON=${ICON_RAM[3]} ;;
[3-5][0-9]) ICON=${ICON_RAM[2]} ;;
[1-9] | [1-2][0-9]) ICON=${ICON_RAM[1]} ;;
*) ICON=${ICON_RAM[0]} ;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR_DEFAULT \
	label=" $MEMORY% " \
	label.color=$COLOR_DEFAULT
