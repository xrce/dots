#!/bin/bash

LABEL=$(yabai -m query --windows --window | jq -r '.app')

if [[ $LABEL = "" ]]; then
  LABEL="Finder"
fi

leftbar --set $NAME label="$LABEL"
