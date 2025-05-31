#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

leftbar --set $NAME background.drawing=$SELECTED \
	icon.highlight=$SELECTED \
	label.highlight=$SELECTED
