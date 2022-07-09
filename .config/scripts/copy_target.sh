#!/bin/sh

# Copy Target IP
target=$(cat ~/.config/scripts/target)
echo -n "$target" | xclip -sel clipboard
