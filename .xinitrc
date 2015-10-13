#!/bin/bash

eval $(ssh-agent)


# disable caps lock
setxkbmap -option ctrl:nocaps

notify_batt=true
notify_mem=true
notify_wifi=0

#Random Wallpaper
feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

for (( i = 0;; ++i )); do

lsop=$(ss -nut | grep -o ":[0-9]\+ *$" | wc -l)
	memory=$(($(cat /proc/meminfo | grep "MemAvailable" | grep -o "[0-9]\+") / 1024))
	if ((memory > 2000)); then
		notify_mem=true
	else
		if ($notify_mem && ((memory < 500))); then
			notify-send -u critical "Memory low" ""$memory"M"
			notify_temp=false
		fi
	fi

	temperature=$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))

	ssid=$(iw dev wlan0 link | grep 'SSID' |  awk '{print $2}');
	if [[ -n $ssid ]]; then
		if ((notify_wifi == 0)); then
			notify-send "WIFI: Connected to $ssid"
			notify_wifi=1
		fi
	elif ((notify_wifi == 1)); then
		notify-send "WIFI disconnected"
		notify_wifi=0
	fi

	charge=$(cat /sys/class/power_supply/BAT0/capacity)
	charging=$(cat /sys/class/power_supply/BAT0/status)

	if [[ $charging =~ Charging ]]; then
		notify_batt=true

	elif ((charge < 60)); then
		if ($notify_batt); then
			notify-send -u critical "Low battery" "$charge% remaining"
			notify_batt=false
		fi
	fi

	# random wallpaper every 30mins
	if (( i % 1800 == 0)); then
		feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`
	fi

	if ((i % 30 == 0 )); then
		VPN_RUNNING=$(pgrep openvpn > /dev/null && echo "[ON]")
	fi

	# Power/Battery Status
	DWM_BATTERY=$charge

	# Wi-Fi eSSID
	DWM_ESSID=$ssid


	# Volume Level
	DWM_VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')

	#Time
	dtime=$(date +"%a %d %b %R")

	# Overall output command
	DWM_STATUS="VPN: $VPN_RUNNING | SSID: $DWM_ESSID  | Power: $DWM_BATTERY% | Vol: $DWM_VOL | $dtime";
	xsetroot -name "$DWM_STATUS";
	sleep 1
done &

#Lock if inactive for 5 minutes or if mouse button is held in the bottom right corner for 3 secs
xautolock -time 5 -locker slock -nowlocker slock -detectsleep -corners 000+ -cornerdelay 10 &
#Load f.lux equivalent tool
redshift &
#Fix for java applications to display properly with DWM
wmname LG3D &
