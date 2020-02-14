#!/bin/bash

BRIGHTNESS=`xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1`

NEW_BRIGHTNESS=$BRIGHTNESS

if [ $1 = "inc" ] && (( $(echo "$BRIGHTNESS < 1.0" | bc -l) )); then
    NEW_BRIGHTNESS=$(echo $BRIGHTNESS + 0.1 | bc -l)
fi

if [ $1 = "dec" ] && (( $(echo "$BRIGHTNESS > 0.0" | bc -l) )); then
    NEW_BRIGHTNESS=$(echo $BRIGHTNESS - 0.1 | bc -l)
fi

echo $NEW_BRIGHTNESS

xrandr --output eDP-1 --brightness $NEW_BRIGHTNESS


