#!/bin/sh

ARTIST=$(playerctl metadata artist)
ALBUM=$(playerctl metadata album)
SONG=$(playerctl metadata title)

notify-send --urgency=low --expire-time=5000 "${SONG}" "${ARTIST} - ${ALBUM}"
