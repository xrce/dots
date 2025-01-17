#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

WIFI=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')
HOTSPOT=$(ipconfig getsummary en0 | grep sname | awk '{print $3}')
if [[ $HOTSPOT != "" ]]; then
	ICON=$ICON_HOTSPOT
	LABEL=$HOTSPOT
elif [[ $WIFI != "" ]]; then
	ICON=$ICON_WIFI
	LABEL=$WIFI
fi
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
VPN=$(scutil --nwi | grep -m1 'VPN' | awk '{ print $4 }')

if [[ $VPN != "" ]]; then
	ICON=$ICON_VPN
	LABEL=$LABEL
else
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

sketchybar --set $NAME background.color=$COLOR_DEFAULT icon=$ICON label="$LABEL"
