#!/usr/bin/env bash

date_formatted=$(LANG=en_us_88591; date "+%H:%M:%S, %A %d-%m-%Y %p")
status=$(awk "NR==1" /sys/class/leds/input*::capslock/brightness)

if [[ "$status" == "1" ]]; then
    echo -e "CAPS ON   $date_formatted"
else
    echo "$date_formatted"
fi

