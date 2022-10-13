#!/bin/bash

glob=$1
pattern=$2
target=$3

for file in $(find . -name "$glob" -exec grep -lir "$pattern" {} \;); do
  read -n1 -p "continue? [enter]" ans
  if [[ ! -z $ans ]]; then
    break
  fi 

  nvim "+bufdo %s/$pattern/$target/gc" $file
done
