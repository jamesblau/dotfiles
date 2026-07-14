#!/bin/bash
# Public Domain
# (someone claimed the next lines would be useful for…
#  people. So here goes: © 2012 Stefan Breunig
#  stefan+measure-net-speed@mathphys.fsk.uni-heidelberg.de)

# append i3status output to the measure-net-speed’s one.
# the quote and escape magic is required to get valid
# JSON output, which is expected by i3bar (if you want
# colors, that is. Otherwise plain text would be fine).
# For colors, your i3status.conf should contain:
# general {
#   output_format = i3bar
# }

# i3 config looks like this:
# bar {
#   status_command measure-net-speed-i3status.bash
# }

smash_marker="${XDG_RUNTIME_DIR:-/tmp}/smash-mode-$UID/enabled"
i3status | (read line && echo $line && read line && echo $line && while :
do
  read line

  # Ensure vpn is actually running
  if nordvpn status | grep -q Connected; then
    touch ~/.nordvpn_running
  else
    rm -f ~/.nordvpn_running
  fi

  # Update IP address
  IP=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g')
  if [[ -n ${IP} ]]; then
    echo ${IP} > ~/.myip
  else
    rm ~/.myip
  fi

    # Audio stuff
    volume=$(
        sed 's/^.*\({[^{}]*}\)]$/\1/' <<<"$line"
    )

    level_status=$(
        amixer sget Capture |
            tail -n 1 |
            cut -d '[' -f 2,4 |
            sed 's/[][]//g'
    )

    color=$(
        grep -q off <<<"$level_status" &&
            echo ',"color":"#dfaf8f"'
    )

    mic="{ \"full_text\": \" ${level_status/ */}\" ${color}}"

    # Smash-mode indicator
    extra_blocks="$mic"

    if [[ -e "$smash_marker" ]]; then
        smash='{ "full_text": " 💥", "color": "#c87878" }'
        extra_blocks="$smash, $extra_blocks"
    fi

    echo "${line/$volume/$extra_blocks, $volume}" || exit 1
  # TODO: Why doesn't this less weird version work? Some special character?
  # before_volume=$(echo "${line}" | sed 's/^,\[//' | sed 's/^\(.*\),{[^{}]*}]$/\1/')
  # echo ",[${before_volume},${mic},${volume}]" || exit 1
done)
