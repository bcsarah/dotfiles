#!/bin/sh

input=$(printf "poweroff\nreboot\nreload\nexit\nlock" | dmenu -i -p "opt:")

[ -z "$input" ] && exit 0

case "$input" in
    poweroff)
        kitty -e poweroff
        ;;
    reboot)
        kitty -e reboot
        ;;
    reload)
        i3-msg restart
        ;;
    exit)
        i3-msg exit
        ;;
    lock)
        i3lock -c 2d2d2d
        ;;
esac
