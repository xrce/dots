#!/bin/sh

source "../icons.sh"

sketchybar --set $NAME background.drawing=$SELECTED \
	icon.highlight=$SELECTED \
	label.highlight=$SELECTED


for i in "${!ICONS_SPACE[@]}"
do
    sid=$(($i + 1))
    LABEL=""

    QUERY=$(yabai -m query --windows --space "$sid")
    APPS=$(echo "$QUERY" | jq -r '.[].app')
    TITLES=$(echo "$QUERY" | jq -r '.[].title')

    echo "$APPS"
    if [[ -n "$APPS" ]];
    then
        APPS_ARR=()
        while IFS= read -r line; do APPS_ARR+=("$line"); done <<< "$APPS"
        TITLES_ARR=()
        while IFS= read -r line; do TITLES_ARR+=("$line"); done <<< "$TITLES"
    
        LENGTH=${#APPS_ARR[@]}
        for j in "${!APPS_ARR[@]}"
        do
            APP=$(echo "${APPS_ARR[j]}" | sed 's/"//g')
            TITLE=$(echo "${TITLES_ARR[j]}" | sed 's/"//g')
            ICON=$("/Users/xrce/.config/sketchybar/plugins/app_icon.sh" "$APP" "$TITLE")
            LABEL+=" $ICON "
            if [[ $j < $(($LENGTH-1)) ]]; then
                LABEL+=" "
            fi
            echo "$ICON"
        done
    else
        LABEL+=""
    fi
    sketchybar --set space.$sid label="$LABEL"
done
