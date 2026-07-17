#!/bin/sh
# xrandr --output eDP-1 --mode 3840x2400 --pos 0x1080 --rotate normal --output DP-1-0 --primary --mode 1920x1080 --rate 120 --pos 848x0 --rotate normal
# xrandr --output eDP-1 --mode 3840x2400 --pos 0x1080 --rotate normal --output DP-1-0 --primary --mode 1920x1080 --rate 240 --pos 848x0 --rotate normal
# xrandr --output eDP-1 --mode 3840x2400 --pos 0x1080 --rotate normal --output DP-1-0 --primary --mode 800x600 --rate 240 --pos 848x0 --rotate normal
# xrandr --output eDP-1 --off --output DP-1-0 --primary --mode 800x600 --rate 240 --pos 848x0 --rotate normal
# xrandr --output eDP-1 --mode 3840x2400 --pos 0x1440 --rotate normal --output DP-1-0 --primary --mode 2560x1440 --rate 240 --pos 640x0 --rotate normal
xrandr --output eDP-1 --off --output DP-1-0 --primary --mode 2560x1440 --rate 240 --rotate normal
