#!/bin/sh

scrot /tmp/greeter.png
#mogrify -blur 0x3 /tmp/greeter.png
blur /tmp/greeter.png
i3lock -i /tmp/greeter.png
