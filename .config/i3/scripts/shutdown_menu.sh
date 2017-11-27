#!/bin/sh

CMD=$(echo -e "cancel\nlock\nshutdown\nreboot" | dmenu)

if [[ $CMD == lock ]]; then
    $HOME/.config/i3/scripts/lock.sh
fi

if [[ $CMD == shutdown ]]; then
    poweroff
fi

if [[ $CMD == reboot ]]; then
    reboot
fi
