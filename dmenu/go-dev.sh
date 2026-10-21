#!/bin/sh

dir=$(ls ~/dev | sort | dmenu -i -p "~/dev:")

[ -z "$dir" ] && exit 0

exec kitty -e tmux new-session -c ~/dev/$dir
