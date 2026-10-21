#!/bin/sh

input=$(printf "poweroff\nreboot\nexit\nlock" | dmenu -i -p "opt:")

case "$input" in
    poweroff)
        kitty -e sudo poweroff
        ;;
    reboot)
        kitty -e sudo reboot
        ;;
    exit)
        i3-msg exit
        ;;
    lock)
        i3lock -c 2d2d2d
        ;;
esac
