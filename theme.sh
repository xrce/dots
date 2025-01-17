#!/bin/bash

CONFIG_DIR="/Users/xrce/.config"
DOTS_DIR="$CONFIG_DIR/dots"

[ -d "$DOTS_DIR/$1" ] || { echo "'$1' dots not found"; exit 1; }

pkill "sketchybar"
pkill "bottombar"

rm -rf $CONFIG_DIR/{sketchybar,bottombar,yabai}
cp -r $DOTS_DIR/$1/* $CONFIG_DIR/

yabai --restart-service

WALLPAPER_JPG="$CONFIG_DIR/wallpaper/$1.jpg"
WALLPAPER_JPEG="$CONFIG_DIR/wallpaper/$1.jpeg"
WALLPAPER_PNG="$CONFIG_DIR/wallpaper/$1.png"

if [ -f "$WALLPAPER_JPG" ]; then  osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_JPG\""
elif [ -f "$WALLPAPER_JPEG" ]; then osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_JPEG\""
elif [ -f "$WALLPAPER_PNG" ]; then osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_PNG\""
else echo "No wallpaper found for theme '$1'"
fi
