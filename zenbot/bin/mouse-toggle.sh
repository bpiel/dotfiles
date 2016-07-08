#!/bin/sh

set -x

if [ "$(synclient -l | grep TouchpadOff | grep -o "1" )" = "1" ]; then
    /home/bill/bin/mouse-on.sh
else
       /home/bill/bin/mouse-off.sh
fi
