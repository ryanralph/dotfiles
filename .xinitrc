#!/bin/bash

eval $(ssh-agent)

source .bash_aliases

# disable caps lock
setxkbmap -option ctrl:nocaps


for (( i = 0;; ++i )); do

	# random wallpaper every 30mins
	if (( i % 1800 == 0)); then
		changeBG
	fi

	if ((i % 30 == 0 )); then #Check if OpenVPN is running
		VPN_CHECK=$(pidof openvpn)
		if [ -z "$VPN_CHECK" ]; then
			VPN_RUNNING="[ON]"
		else
			VPN_RUNNING="[OFF]"
		fi
	fi

	# Power/Battery Status
	DWM_BATTERY=$(acpi | awk '{print $4}');

	# Wi-Fi eSSID
	DWM_ESSID=$(iw dev wlan0 link | grep 'SSID' |  awk '{print $2}');

	# Volume Level
	DWM_VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')

	#BTC Price Ticker
	if (( i % 30 == 0 )); then
		lbtcusd=$(btcusd)
	fi

	#Time
	dtime=$(date +"%a %d %b %R")

	# Overall output command
	DWM_STATUS="VPN: $VPN_RUNNING | SSID: $DWM_ESSID | BTC = $lbtcusd USD | Power: $DWM_BATTERY | Vol: $DWM_VOL | $dtime";
	xsetroot -name "$DWM_STATUS";
	sleep 1
done &

#Lock if inactive for 5 minutes or if mouse button is held in the bottom right corner for 3 secs
xautolock -time 5 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 10 &

exec dwm
