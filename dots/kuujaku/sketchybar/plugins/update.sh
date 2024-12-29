#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

BREW=$(brew outdated | wc -l | awk '{ print $1 }')
PIP=$(pip3 list --outdated | wc -l | awk '{ print $1 }')

sketchybar --set pip icon.color=$COLOR_DEFAULT label.color=$COLOR_DEFAULT label=" $PIP" \
           --set brew icon.color=$COLOR_DEFAULT label.color=$COLOR_DEFAULT label=" $BREW"