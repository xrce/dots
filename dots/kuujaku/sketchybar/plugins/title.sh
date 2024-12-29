#!/bin/bash

LABEL=$(yabai -m query --windows --window | jq -r '.app')

if [[ $LABEL = "" ]]; then
  LABEL="Finder"
fi

sketchybar --set $NAME label=$LABEL