# ~/.config/polybar/launch.sh

# Shell script to launch polybar

# Remove existing polybar instances
killall -q polybar

# Wait for picom & i3 to intialize
sleep 1

# Launch polybar
polybar example &
