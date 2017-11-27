#!/bin/bash

screen_internal="eDP1"
screen_l="DP2-1"
screen_r="DP2-2"

function clear_disconnected {
    xrandr --query | grep -w disconnected | awk '{print $1;}' | xargs -L 1 -I % xrandr --output % --off
}

function internal_on {
    xrandr --output $screen_internal --auto --primary
}

function display_docked {
    clear_disconnected
    internal_on

    xrandr --output $screen_l --auto --right-of $screen_internal
    xrandr --output $screen_r --auto --right-of $screen_l
}

function display_mirror {
    clear_disconnected
    internal_on

    xrandr --output $1 --same-as $screen_internal
}

function display_internal_only {
    clear_disconnected
    internal_on
}

if [[ $(xrandr --query | grep -w connected | awk '{print $1;}' | grep $screen_l | wc -l) = 0 ]]; then
    screen_internal="eDP-1"
    screen_l="DP-2-1"
    screen_r="DP-2-2"
fi

connected_outputs=$(xrandr --query | grep -w connected | awk '{print $1;}')
nb_connected_outputs=$(xrandr --query | grep -w connected | awk '{print $1;}' | wc -l)

if [[ $nb_connected_outputs = 1 ]]; then
    display_internal_only
elif [[ $nb_connected_outputs = 3 ]]; then
    display_docked
fi

nitrogen --restore
