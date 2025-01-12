#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

MESSAGES=$(lsappinfo -all info -only StatusLabel Telegram | sed -nr 's/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p')

if [[ $MESSAGES == 0 ]];then
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
elif [[ $MESSAGES == '' ]];then
    MESSAGES="0"
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    BCOLOR=$COLOR_BLUE_BRIGHT
    COLOR=$COLOR_BACKGROUND
fi

sketchybar --set $NAME label="$MESSAGES" icon.color=$COLOR label.color=$COLOR background.color=$BCOLOR
