#!/bin/sh
xrandr \
  --output DP-0 --off \
  --output DP-1 --off \
  --output HDMI-0 --mode 1920x1200 --pos 960x0 --rotate normal \
  --output DP-2 --off \
  --output DP-3 --off \
  --output eDP-1-1 --mode 3840x2400 --pos 0x1200 --rotate normal \
  --output HDMI-1-1 --off \
  --output DP-1-1 --off \
  --output DP-1-2 --off \
  --output DP-1-3 --off \
  --output DP-1-4 --off
