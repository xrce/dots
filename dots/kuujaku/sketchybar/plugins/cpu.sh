#!/usr/bin/env bash

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

PROC=$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')

case $PROC in
[5-9][0-9] | 100) ICON=${ICON_CPU[1]} ;;
[1-9] | [1-5][0-9]) ICON=${ICON_CPU[0]} ;;
*) ICON=${ICON_CPU[0]} ;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR_DEFAULT \
	label=" $PROC% " \
	label.color=$COLOR_DEFAULT
