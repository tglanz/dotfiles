#!/bin/bash

theme="$XDG_CONFIG_HOME/rofi/themes/user/material.rasi"
rofi -modi run,ssh,window -combi-modi run,ssh,window -show combi -theme "$theme"
