#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/leftbar/config/components#space----associate-mission-control-spaces-with-an-item

leftbar --set "$NAME" background.drawing="$SELECTED"
