#!/bin/bash

command=$1

if [ "$command" = "" ]; then
    echo "usage: $0 {up|down|toggle}"
    exit 0;
fi

display_volume=0

if [ "$command" = "up" ]; then
    amixer sset Master unmute
    display_volume=$(amixer sset Master 10+ unmute | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
    icon_name="/home/john/.icons/Faenza/status/32/audio-volume-high.png"
fi

if [ "$command" = "down" ]; then
    amixer sset Master unmute
    display_volume=$(amixer sset Master 10- unmute | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
    icon_name="/home/john/.icons/Faenza/status/32/audio-volume-low.png"
fi

if [ "$command" = "toggle" ]; then
            if amixer get Master | grep "\[on\]"; then
         amixer sset Master mute
                 display_volume=0
                 icon_name="/home/john/.icons/Faenza/status/32/audio-volume-muted.png"
            else
         amixer sset Master unmute
                 display_volume=$(amixer get Master | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
                 icon_name="/home/john/.icons/Faenza/status/32/audio-volume-high.png"
    fi
fi

notify-send --icon="$icon_name" "Гучність: $display_volume%"
exit 1