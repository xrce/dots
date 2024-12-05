#!/bin/bash
source "../colors.sh"
source "../icons.sh"

STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
  sketchybar --set $NAME label="$MEDIA" icon="󰐌" padding_left=2 padding_right=8 \
             --add bracket played $NAME spaces --set played background.color=$COLOR_BACKGROUND background.border_color=$COLOR_RED \
             --set $NAME played drawing=on
else
  sketchybar --set $NAME played drawing=off
fi