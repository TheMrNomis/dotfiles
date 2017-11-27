#!/bin/sh

acpi --battery | sed 's/,\|%//g' | awk '{"$HOME/.cargo/bin/icons battery " $3 " " $4 | getline icon; print icon, $4"%"}' | sed 'N;s/\n/ | /;'
#BAT_TIME=$(acpi --battery | grep "Battery 0" | grep -Eio '[0-2][0-9](:[0-5][0-9]){2}')
#BAT_PERC=$(acpi --battery | grep "Battery 0" | grep -Eio '[0-9]{1,3}%' | sed 's/%//')
#BAT_STAT=$(acpi --battery | grep "Battery 0" | grep -Eio '(dis)?charging|full')
#
#BAT_ICON=$($HOME/.cargo/bin/icons battery ${BAT_STAT} ${BAT_PERC})
#echo "${BAT_ICON} ${BAT_PERC}%"
