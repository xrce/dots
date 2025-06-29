#!/bin/bash

space_number=$(yabai -m query --spaces --space | jq -r .index)
yabai_mode=$(yabai -m query --spaces --space | jq -r .type)

case "$yabai_mode" in
    bsp)
    leftbar -m --set yabai_mode label="􁻻"
    ;;
    stack)
    leftbar -m --set yabai_mode label="􀏜"
    ;;
    float)
    leftbar -m --set yabai_mode label="􀢌"
    ;;
esac