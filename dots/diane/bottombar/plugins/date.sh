#!/bin/sh

# The $NAME variable is passed from bottombar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/bottombar/config/events#events-and-scripting

bottombar --set $NAME label="$(date '+%a %b %d')"
