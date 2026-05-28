#!/bin/bash

W=`xdotool getactivewindow`
S1=`xprop -id ${W} | awk -F '"' '/WM_CLASS/{print $4}'`
if [ "$S1" != "firefox" ] && [ "$S1" != "Firefox" ] && [ "$S1" != "Firefox Developer Edition" ] && [ "$S1" != "firefox_firefox" ]; then
  xvkbd -xsendevent -text "\Cq"
# echo $S1
fi
