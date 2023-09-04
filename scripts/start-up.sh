#!/bin/bash

# +----------------------------+
# |   Start-Up Configuration   |
# +----------------------------+

# ===== Monitor ======================================================
# Set monitor output
xrandr --output DP-0 --primary --mode 1920x1080 --rate 144
# Set background wallpaper
feh --bg-scale ~/Pictures/ship-wallpaper.png

# ===== Keyboard =====================================================
# Remap CapsLock to Ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"

# ===== Mouse ========================================================
# Define variables to represent device ID
logitech_mouse_id=$(xinput list --id-only pointer:"Logitech G Pro ")
if [ -z "$logitech_mouse_id" ]
then
    logitech_mouse_id=$(xinput list --id-only pointer:"Logitech G Pro Wireless Gaming Mouse")
fi
# Adjust mouse settings
if [ -z "$logitech_mouse_id" ]
then 
    echo "Logitech mouse device not connected"
else
    xinput set-prop $logitech_mouse_id "libinput Accel Profile Enabled" 0, 1
    xinput set-prop $logitech_mouse_id "libinput Accel Speed" -0.50
fi

# ===== Apps =========================================================
# Start flameshot
killall -q flameshot
flameshot &
# Start polybar
killall -q polybar
polybar --reload frian &
# Start dunst
killall -q dunst
dunst &
# Start picom
killall -q picom
picom &
