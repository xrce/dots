#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

BREW=$(brew outdated | wc -l | awk '{ print $1 }')
if [[ $BREW == 0 ]]; then
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    BCOLOR=$COLOR_BLUE_BRIGHT
    COLOR=$COLOR_BLACK_BRIGHT
fi
bottombar --set brew label=" $BREW " background.color=$BCOLOR icon.color=$COLOR label.color=$COLOR
PIP=$(pip3 list --outdated | wc -l | awk '{ print $1 }')
if [[ $PIP == 0 ]]; then
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    BCOLOR=$COLOR_GREEN_BRIGHT
    COLOR=$COLOR_BLACK_BRIGHT
fi
bottombar --set pip label=" $PIP " background.color=$BCOLOR icon.color=$COLOR label.color=$COLOR
NPM=$(npm outdated)
if [[ $NPM == "" ]]; then
    NPM='0'
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    NPM=$(npm outdated | wc -l | awk '{ print $1 }')
    BCOLOR=$COLOR_YELLOW_BRIGHT
    COLOR=$COLOR_BLACK_BRIGHT
fi
bottombar --set npm label=" $NPM " background.color=$BCOLOR icon.color=$COLOR label.color=$COLOR
GEM=$(gem outdated)
if [[ $GEM == "" ]]; then
    GEM='0'
    BCOLOR=$COLOR_BACKGROUND
    COLOR=$COLOR_DEFAULT
else
    GEM=$(gem outdated | wc -l | awk '{ print $1 }')
    BCOLOR=$COLOR_RED_BRIGHT
    COLOR=$COLOR_BLACK_BRIGHT
fi
bottombar --set gem label=" $GEM " background.color=$BCOLOR icon.color=$COLOR label.color=$COLOR