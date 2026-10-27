#!/bin/sh

wpp=$(ls ~/Imagens/Wallpapers | sort | dmenu -i -p "wpp:")

[ -z "$wpp" ] && exit 0

ln -sf ~/Imagens/Wallpapers/$wpp ~/.xwallpaper
xwallpaper --zoom ~/.xwallpaper
