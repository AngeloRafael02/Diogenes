#!/bin/bash

# If you have i3 window tiling manager, you can bind it on you .config/i3/config file by adding the line below:
# bindsym <your keystroke> exec /path/to/openYazi.sh

TERMINAL="xterm"
APP_COMMAND="yazi"
TARGET_WORKSPACE="4"

i3-msg "exec $TERMINAL -T 'yazi' -e $APP_COMMAND; \
        workspace $TARGET_WORKSPACE; \
        layout tabbed"

echo "$APP_COMMAND launched in a new $TERMINAL window, moved to workspace $TARGET_WORKSPACE, and layout set to tabbed."