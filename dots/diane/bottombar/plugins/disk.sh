#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

DISK=$(df -lh | grep /dev/disk3s5 | awk '{print $5}')
BCOLOR=$COLOR_DEFAULT
COLOR=$COLOR_BACKGROUND

bottombar --set $NAME icon="􀤂" \
	icon.color=$COLOR \
	background.color=$BCOLOR \
	label=" $DISK " \
	label.color=$COLOR
