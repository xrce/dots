#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

MESSAGES=$(sqlite3 ~/Library/Messages/chat.db "SELECT COUNT(guid) FROM message WHERE NOT(is_read) AND NOT(is_from_me) AND text !=''")

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