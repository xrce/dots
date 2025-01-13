#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

SCREC=$(top -l 1 -s 0 | grep screencapture | wc -l | awk '{print $1}')

if [[ $SCREC == 0 ]];then
    BCOLOR=$COLOR_DEFAULT
    COLOR=$COLOR_BACKGROUND
else
    BCOLOR=$COLOR_MAGENTA_BRIGHT
    COLOR=$COLOR_BACKGROUND
fi

sketchybar --set $NAME icon=$ICONS_RECORD icon.color=$COLOR background.color=$BCOLOR