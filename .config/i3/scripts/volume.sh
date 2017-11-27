#!/bin/sh

VOL_PRCT=$(pamixer --get-volume)
VOL_MUTE=$(pamixer --get-mute | sed 's/true/muted/' | sed 's/false/unmuted/')
VOL_ICON=$(icons volume ${VOL_MUTE} ${VOL_PRCT})

echo "${VOL_ICON}${VOL_PRCT}%"
