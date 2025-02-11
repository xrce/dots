#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
IS_CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $IS_CHARGING == "" ]]; then
	case ${BATT_PERCENT} in
	100)
		ICON=${ICONS_BATTERY[10]}
		BCOLOR=$COLOR_DEFAULT
		COLOR=$COLOR_BACKGROUND
		;;
	9[0-9])
		ICON=${ICONS_BATTERY[9]}
		BCOLOR=$COLOR_CYAN_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	8[0-9])
		ICON=${ICONS_BATTERY[8]}
		BCOLOR=$COLOR_CYAN_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	7[0-9])
		ICON=${ICONS_BATTERY[7]}
		BCOLOR=$COLOR_BLUE_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	6[0-9])
		ICON=${ICONS_BATTERY[6]}
		BCOLOR=$COLOR_BLUE_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	5[0-9])
		ICON=${ICONS_BATTERY[5]}
		BCOLOR=$COLOR_GREEN_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	4[0-9])
		ICON=${ICONS_BATTERY[4]}
		BCOLOR=$COLOR_GREEN_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	3[0-9])
		ICON=${ICONS_BATTERY[3]}
		BCOLOR=$COLOR_YELLOW_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	2[0-9])
		ICON=${ICONS_BATTERY[2]}
		BCOLOR=$COLOR_ORANGE_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	1[0-9])
		ICON=${ICONS_BATTERY[1]}
		BCOLOR=$COLOR_RED_BRIGHT
		COLOR=$COLOR_BACKGROUND
		;;
	*)
		ICON=${ICONS_BATTERY[0]}
		BCOLOR=$COLOR_DEFAULT
		COLOR=$COLOR_BACKGROUND
		;;
	esac
else
	case ${BATT_PERCENT} in
	100)
		ICON=${ICONS_BATTERY_CHARGING[10]}
		;;
	9[0-9])
		ICON=${ICONS_BATTERY_CHARGING[9]}
		;;
	8[0-9])
		ICON=${ICONS_BATTERY_CHARGING[8]}
		;;
	7[0-9])
		ICON=${ICONS_BATTERY_CHARGING[7]}
		;;
	6[0-9])
		ICON=${ICONS_BATTERY_CHARGING[6]}
		;;
	5[0-9])
		ICON=${ICONS_BATTERY_CHARGING[5]}
		;;
	4[0-9])
		ICON=${ICONS_BATTERY_CHARGING[4]}
		;;
	3[0-9])
		ICON=${ICONS_BATTERY_CHARGING[3]}
		;;
	2[0-9])
		ICON=${ICONS_BATTERY_CHARGING[2]}
		;;
	1[0-9])
		ICON=${ICONS_BATTERY_CHARGING[1]}
		;;
	*)
		ICON=${ICONS_BATTERY_CHARGING[0]}
		;;
	esac
	BCOLOR=$COLOR_DEFAULT
	COLOR=$COLOR_BACKGROUND
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	background.color=$BCOLOR \
	label=" ${BATT_PERCENT}%" \
	label.color=$COLOR
