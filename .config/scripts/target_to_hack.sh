#!/bin/sh

target=$(cat ~/.config/scripts/target)

if [ $target ]; then
    echo "什 $target"
else
    echo "什 No target"
fi
