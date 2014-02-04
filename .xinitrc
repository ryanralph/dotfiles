#!/bin/bash

source .bash_aliases

# disable caps lock
setxkbmap -option ctrl:nocaps

# random wallpaper
feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

for (( i = 0;; ++i )); do
	if (( i % 30 == 0 )); then
		lbtcusd=$(btcusd)
	fi

	lsop=$(ss -natu | tail -n+2 | tr ':' ' ' |  awk '{ print $8 }' | sort | uniq -c | tr -d '\n' | tr -s ' ')
	dtime=$(date +"%c")

	xsetroot -name "$lsop | $lbtcusd USD | $dtime"
	sleep 1
done &

exec dwm
