#!/bin/bash

LABEL=$(yabai -m query --windows --window | jq -r '.app')

if [[ $LABEL = "" ]]; then
  LABEL="Desktop"
fi

sketchybar --set $NAME label="$LABEL"
