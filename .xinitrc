#!/bin/bash

source .bash_aliases

# disable caps lock
setxkbmap -option ctrl:nocaps


for (( i = 0;; ++i )); do

	# random wallpaper every 30mins
	if (( i % 1800 == 0)); then
		feh --bg-fill `find ~/Downloads/Wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`
	fi

	# Power/Battery Status
	DWM_BATTERY=$(acpi | awk '{print $4}');

	# Wi-Fi eSSID
	DWM_ESSID=$(iw dev wlan0 info | grep 'ssid' |  awk '{print $2}');

	# Volume Level
	DWM_VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')

	#BTC Price Ticker
	if (( i % 30 == 0 )); then
		lbtcusd=$(btcusd)
	fi

	#Open Ports (courtesy of RommelVR)
	lsop=$(ss -natu | tail -n+2 | tr ':' ' ' |  awk '{ print $8 }' | sort | uniq -c | tr -d '\n' | tr -s ' ')

	#Time
	dtime=$(date +"%a %d %b %R")

	# Overall output command
	DWM_STATUS="$lsop | SSID: $DWM_ESSID | BTC = $lbtcusd USD | Power: $DWM_BATTERY | Vol: $DWM_VOL | $dtime";
	xsetroot -name "$DWM_STATUS";
	sleep 1
done &

#Lock if inactive for 5 minutes or if mouse button is held in the bottom right corner for 3 secs
xautolock -time 5 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 3 &

exec dwm
