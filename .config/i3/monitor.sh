#!/bin/bash# default monitor is eDP1
MONITOR=eDP1# functions to switch from eDP1 to HDMI and vice versa
function ActivateHDMI {
	echo "Switching to HDMI2"
	xrandr --output HDMI2 --mode 2560x1440 --output eDP1 --off
	nitrogen --restore
	MONITOR=HDMI2
}
function DeactivateHDMI {
	echo "Switching to eDP1"
	xrandr --output HDMI2 --off --output eDP1 --auto
	MONITOR=eDP1
}# functions to check if HDMI is connected and in use
function HDMIActive {
	[ $MONITOR = "HDMI2" ]
}
function HDMIConnected {
	! xrandr | grep "^HDMI2" | grep disconnected
}# actual script
while true
do
	if ! HDMIActive && HDMIConnected
	then
		ActivateHDMI
	fi	if HDMIActive && ! HDMIConnected
	then
		DeactivateHDMI
	fi	sleep 1s
done

