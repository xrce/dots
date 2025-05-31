#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/leftbar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  leftbar --set "$NAME" label="$INFO"
fi
