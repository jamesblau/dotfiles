#!/bin/sh
xrandr --output eDP-1-1 --primary --mode 2560x1440 --pos 0x1200 --rotate normal \
  --output DP-1-1 --off \
  --output HDMI-1-1 --mode 1920x1200 --pos 320x0 --rotate normal \
  --output DP-1-2 --off \
  --output HDMI-1-2 --off \
  --output DP-1-3 --off \
  --output HDMI-1-3 --off
