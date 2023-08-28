#!/bin/bash
# ~/.config/polybar/launch

# Remove existing polybar instances
killall -q dunst
sleep 1

# Launch dunst
dunst &

