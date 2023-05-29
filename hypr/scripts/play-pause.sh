#!/bin/bash

if pgrep -x "mpv" > /dev/null; then
    echo "cycle pause" | socat - "$HOME/.config/mpv/socket"
else
    playerctl play-pause
fi
