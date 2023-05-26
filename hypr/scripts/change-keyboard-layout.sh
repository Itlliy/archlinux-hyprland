#!/bin/bash

removable_keyboard=glorious-gmmk-2-96
onboard_keyboard=at-translated-set-2-keyboard


result_command1=$(hyprctl devices | grep -A3 -E '(^|\s)glorious-gmmk-2-96($|\s)' | grep "active keymap" | grep -oP '(?<=active keymap: ).*')
result_command2=$(hyprctl devices | grep -A3 -E '(^|\s)at-translated-set-2-keyboard($|\s)' | grep "active keymap" | grep -oP '(?<=active keymap: ).*')


if hyprctl devices | grep -q -E "(^|\s)$removable_keyboard($|\s)"; then
    if [ "$result_command1" != "$result_command2" ]; then
        # Perform the command to switch removable_keyboard layout
        hyprctl switchxkblayout $removable_keyboard next
    else
        # Perform the command to switch the keymap layout for both devices
        hyprctl switchxkblayout $removable_keyboard next && hyprctl switchxkblayout $onboard_keyboard next
    fi
else
    hyprctl switchxkblayout "$onboard_keyboard" next
fi
