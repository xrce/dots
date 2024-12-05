#!/bin/sh

source "../colors.sh"
source "../icons.sh"

BREW=$(brew outdated | wc -l | awk '{ print $1 }')
PIP=$(pip3 list --outdated | wc -l | awk '{ print $1 }')

sketchybar --set pip background.color=$COLOR label=" $PIP" \
           --set brew background.color=$COLOR label=" $BREW"