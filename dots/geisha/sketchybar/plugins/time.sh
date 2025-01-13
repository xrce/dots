#!/bin/sh

# The $NAME variable is passed from bottombar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/bottombar/config/events#events-and-scripting

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

HOUR=$(date '+%H')

sketchybar --set $NAME label="$(date '+%I:%M %p')" label.color=$COLOR_DEFAULT
