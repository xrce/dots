#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

ISSUE=$(gh status | grep issue | wc -l | awk '{print $1}')

if [[ $ISSUE == 0 ]];then
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
elif [[ $ISSUE == '' ]];then
    ISSUE="0"
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    BCOLOR=$COLOR_ORANGE_BRIGHT
    COLOR=$COLOR_BACKGROUND
fi

sketchybar --set $NAME label="$ISSUE" icon.color=$COLOR label.color=$COLOR background.color=$BCOLOR