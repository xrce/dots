#!/usr/bin/env bash

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

source "../colors.sh"
source "../icons.sh"

PROC=$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')

case $PROC in
[5-9][0-9] | 100)
	ICON=${ICON_CPU[1]}
	COLOR=$COLOR_MAGENTA_BRIGHT
	;;
[1-9] | [1-5][0-9])
	ICON=${ICON_CPU[0]}
	COLOR=$COLOR_MAGENTA
	;;
*)
	ICON=${ICON_CPU[0]}
	COLOR=$COLOR_MAGENTA
	;;
esac

sketchybar --set $NAME icon=$ICON \
	icon.color=$COLOR \
	label=" $PROC% " \
	label.color=$COLOR
