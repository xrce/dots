#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

WIFI=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')
HOTSPOT=$(ipconfig getsummary en0 | grep sname | awk '{print $3}')
if [[ $HOTSPOT != "" ]]; then
  LABEL=$HOTSPOT
elif [[ $WIFI != "" ]]; then
  LABEL=$WIFI
fi
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
VPN=$(scutil --nwi | grep -m1 'VPN' | awk '{ print $4 }')

if [[ $VPN != "" ]]; then
  ICON=$ICON_VPN
  LABEL=$LABEL
  sketchybar --add item vpn right --set vpn label="Secured" padding_left=8 padding_right=2 background.border_width=0 background.height=24 \
    --add bracket conn vpn status --set conn background.color=$COLOR_BACKGROUND background.border_color=$COLOR_DEFAULT \
    --set vpn conn drawing=on
else
  sketchybar --set vpn conn drawing=off
  if [[ $HOTSPOT != "" ]]; then
    ICON=$ICON_HOTSPOT
    LABEL=$HOTSPOT
  elif [[ $WIFI != "" ]]; then
    ICON=$ICON_WIFI
    LABEL=$WIFI
  elif [[ $IP_ADDRESS != "" ]]; then
    ICON=$ICON_WIFI
    LABEL="on"
  else
    ICON=$ICON_WIFI_OFF
    LABEL="off"
  fi
fi

sketchybar --set $NAME icon=$ICON label="$LABEL"
