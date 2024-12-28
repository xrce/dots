#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

VOLUME=$(osascript -e 'set ivol to input volume of (get volume settings)')

case $VOLUME in
[6-9][0-9] | 100)
	ICON=${ICONS_MICROPHONE[2]}
	COLOR=$COLOR_DEFAULT
	;;
[1-9] | [3-5][0-9])
	ICON=${ICONS_MICROPHONE[1]}
	COLOR=$COLOR_DEFAULT
	;;
*)
	ICON=${ICONS_MICROPHONE[0]}
	COLOR=$COLOR_DEFAULT
	;;
esac

bottombar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	label=" $VOLUME% " \
	label.color=$COLOR
