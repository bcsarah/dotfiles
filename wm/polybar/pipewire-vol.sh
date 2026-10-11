#!/usr/bin/env bash

raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
vol=$(echo "$raw" | awk '{printf "%d", $2 * 100}')

# Ícones Nerd Font (JetBrainsMono):
#   volume baixo  -> U+F026
#   volume médio  -> U+F027
#   volume alto   -> U+F028
if   [ "$vol" -eq 0 ];   then icon=""
elif [ "$vol" -lt 34 ];  then icon=$'\uf026'
elif [ "$vol" -lt 67 ];  then icon=$'\uf027'
else                          icon=$'\uf028'
fi

echo "$vol% $icon"
