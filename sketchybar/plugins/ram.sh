#!/bin/sh

source "../colors.sh"
source "../icons.sh"

MEMORY=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')

case $MEMORY in
[8-9][0-9] | 100)
	ICON=${ICON_RAM[4]}
	COLOR=$COLOR_MAGENTA_BRIGHT
	;;
[6-8][0-9])
	ICON=${ICON_RAM[3]}
	COLOR=$COLOR_MAGENTA_BRIGHT
	;;
[3-5][0-9])
	ICON=${ICON_RAM[2]}
	COLOR=$COLOR_MAGENTA_BRIGHT
	;;
[1-9] | [1-2][0-9])
	ICON=${ICON_RAM[1]}
	COLOR=$COLOR_MAGENTA
	;;
*)
	ICON=${ICON_RAM[0]}
	COLOR=$COLOR_MAGENTA
	;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	label=" $MEMORY% " \
	label.color=$COLOR
