#!/usr/bin/env bash

DIR="$HOME/.config/bspwm"

rofi_command="rofi -theme $DIR/rofi/themes/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"
#_msg="Options  -  yes / y / no / n"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        sudo shutdown -P -h now
        ;;
    $reboot)
        sudo reboot
        ;;
    $lock)
        i3lock -c 6BA4E7
        ;;
    $suspend)
	sudo pm-suspend
        ;;
    $logout)
        bspc quit
        ;;
esac

