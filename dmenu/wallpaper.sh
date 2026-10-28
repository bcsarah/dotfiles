#!/bin/sh

wpp=$(ls ~/Imagens/wpp | sort | dmenu -i -p "wpp:")

[ -z "$wpp" ] && exit 0

ln -sf ~/Imagens/wpp/$wpp ~/.xwallpaper
xwallpaper --zoom ~/.xwallpaper
