!/bin/bash
intern=eDP1
extern=HDMI1

xrandr && xrandr --output eDP1 --mode 1920x1200 --rotate normal --primary

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$intern" --mode 1920x1200 --primary --auto
else
    xrandr --output "$extern" --mode 2560x1440 --primary --auto --output "$intern" --off
fi
