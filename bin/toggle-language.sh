#!/bin/bash

current=$(setxkbmap -v 10 | grep "layout: " | tr -s ' ' | cut -d ' ' -f 2)

case $current in
    us) next=il ;;
    il) next=us ;;
esac  

setxkbmap ${next:us}
