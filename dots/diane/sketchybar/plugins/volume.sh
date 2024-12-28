#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

VOLUME=$(osascript -e 'set ovol to output volume of (get volume settings)')

case $VOLUME in
[8-9][0-9] | 100)
	ICON=${ICONS_VOLUME[3]}
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[6-7][0-9])
	ICON=${ICONS_VOLUME[2]}
	BCOLOR=$COLOR_ORANGE_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
[2-3][0-9] | [4-5][0-9])
	ICON=${ICONS_VOLUME[1]}
	BCOLOR=$COLOR_YELLOW_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
*)
	ICON=${ICONS_VOLUME[0]}
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
	;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	background.color=$BCOLOR \
	label=" $VOLUME% " \
	label.color=$COLOR
