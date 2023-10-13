#!/bin/bash

out_path=$1
mkdir -p $(dirname $out_path)

backgrounds_dir=/usr/share/backgrounds
file=$(find $backgrounds_dir | grep -Po ".*jpg|.*png" | sort -R | head -n 1) 

cp $file $out_path
