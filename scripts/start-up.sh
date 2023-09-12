#!/bin/bash

# +----------------------------+
# |   Start-Up Configuration   |
# +----------------------------+

# +-------------+
# |   Monitor   |
# +-------------+
# Set monitor output
xrandr --output DP-0 --primary --mode 1920x1080 --rate 144
# Set background wallpaper
feh --bg-scale ~/Pictures/ship-wallpaper.png

# +-----------------+
# |   Keymappings   |
# +-----------------+
# Remap CapsLock to Ctrl
/usr/bin/setxkbmap -option "ctrl:nocaps"

# +----------+
# |   Apps   |
# +----------+
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
