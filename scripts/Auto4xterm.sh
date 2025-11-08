#!/bin/bash

# I Bind it to mod+Shift+Return but you do you.

i3-msg "workspace1"
sleep 0.1 
i3-msg "split horizontal"
i3-msg "exec xterm"
sleep 0.1
i3-msg "exec xterm" 
sleep 0.1
i3-msg "split vertical"
i3-msg "exec xterm"
sleep 0.1
i3-msg "focus left"
i3-msg "split vertical"
i3-msg "exec xterm"
sleep 0.1
i3-msg "focus up"
