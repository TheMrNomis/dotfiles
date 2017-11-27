#!/bin/bash

layout=$1

if [ $1 -eq "bepo" ]
then
    layout=fr bepo
fi

setxkbmap $layout
