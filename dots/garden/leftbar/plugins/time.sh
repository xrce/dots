#!/bin/sh

# The $NAME variable is passed from leftbar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/leftbar/config/events#events-and-scripting

leftbar --set $NAME label="$(date '+%I:%M')"
