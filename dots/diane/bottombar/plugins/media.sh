#!/bin/bash
source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

STATE="$(echo "$INFO" | jq -r '.state')"
APP="$(echo "$INFO" | jq -r '.app')"

case $APP in
"Spotify")
	BCOLOR=$COLOR_GREEN_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
"Music")
	BCOLOR=$COLOR_RED_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
"Safari" | "Firefox" | "Google Chrome")
	BCOLOR=$COLOR_BLUE_BRIGHT
	COLOR=$COLOR_BACKGROUND
	;;
*)
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
	;;
esac

if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
  bottombar --set $NAME label="$MEDIA" padding_left=8 padding_right=8 \
             --add bracket played $NAME --set played background.color=$COLOR_BACKGROUND background.border_color=$COLOR_DEFAULT \
             --set $NAME played drawing=on \
             --set appmedia label="$APP" icon="󰐌" background.color=$BCOLOR icon.highlight=on label.highlight=on padding_left=8 padding_right=8 background.corner_radius=6 background.border_width=0 background.height=24 \
             --add bracket appname appmedia --set appname background.color=$COLOR_BACKGROUND background.border_color=$COLOR_DEFAULT \
             --set appmedia appname drawing=on
else
  bottombar --set $NAME played drawing=off \
            --set appmedia appname drawing=off 
fi