#!/bin/bash
# ~/.config/polybar/launch

# Remove existing polybar instances
killall -q polybar
sleep 1

# Launch polybar
# polybar frian &

# Launch polybar on each monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload frian &
  done
else
  polybar --reload frian &
fi

