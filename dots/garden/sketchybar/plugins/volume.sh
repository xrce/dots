#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

VOLUME=$(osascript -e 'set ovol to output volume of (get volume settings)')

case $VOLUME in
[6-9][0-9] | 100) ICON=${ICONS_VOLUME[3]} ;;
[3-5][0-9]) ICON=${ICONS_VOLUME[2]} ;;
[1-9] | [1-2][0-9]) ICON=${ICONS_VOLUME[1]} ;;
*) ICON=${ICONS_VOLUME[0]} ;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR_DEFAULT
