# ~/.config/polybar/launch.sh

# Shell script to launch polybar

# Remove existing polybar instances
killall -q polybar
sleep 1

# Launch polybar
polybar example &
