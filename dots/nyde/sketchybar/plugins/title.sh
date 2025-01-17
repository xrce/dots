#!/bin/bash

LABEL=$(yabai -m query --windows --window | jq -r '.app')

if [[ -z $LABEL ]]; then
  LABEL="Finder"
fi

LABEL_LENGTH=${#LABEL}

BASE_PADDING=280
PADDING_LEFT=$(( (BASE_PADDING - LABEL_LENGTH * 2)-6 ))
PADDING_RIGHT=$(( (BASE_PADDING - LABEL_LENGTH * 2)-3 ))

sketchybar --set $NAME label="$LABEL" padding_left=$PADDING_LEFT padding_right=$PADDING_RIGHT
