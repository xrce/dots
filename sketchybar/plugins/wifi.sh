#!/bin/sh

source "../colors.sh"
source "../icons.sh"

WIFI=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')
HOTSPOT=$(ipconfig getsummary en0 | grep sname | awk '{print $3}')
if [[ $HOTSPOT != "" ]]; then
	COLOR=$COLOR_BLUE
	ICON=$ICON_HOTSPOT
	LABEL=$HOTSPOT
elif [[ $WIFI != "" ]]; then
	COLOR=$COLOR_BLUE
	ICON=$ICON_WIFI
	LABEL=$WIFI
fi
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
VPN=$(scutil --nwi | grep -m1 'VPN' | awk '{ print $4 }')

if [[ $VPN != "" ]]; then
	COLOR=$COLOR_CYAN
	ICON=$ICON_VPN
	LABEL=$LABEL
	sketchybar --add item vpn right --set vpn label="Secured" padding_left=8 padding_right=2 background.border_width=0 background.height=24 \
           	   --add bracket conn vpn status --set conn background.color=$COLOR_BACKGROUND background.border_color=$COLOR_MAGENTA \
			   --set vpn conn drawing=on
else
	sketchybar --set vpn conn drawing=off
	if [[ $HOTSPOT != "" ]]; then
		COLOR=$COLOR_BLUE
		ICON=$ICON_HOTSPOT
		LABEL=$HOTSPOT
	elif [[ $WIFI != "" ]]; then
		COLOR=$COLOR_BLUE
		ICON=$ICON_WIFI
		LABEL=$WIFI
	elif [[ $IP_ADDRESS != "" ]]; then
		COLOR=$COLOR_BLUE
		ICON=$ICON_WIFI
		LABEL="on"
	else
		COLOR=$COLOR_WHITE
		ICON=$ICON_WIFI_OFF
		LABEL="off"
	fi
fi

sketchybar --set $NAME background.color=$COLOR icon=$ICON label="$LABEL"