#!/bin/bash
fn=$1
echo $fn
size=$(stat -c%s "$fn")
let "size=$size / 1000"
while [ $size -lt 1024 ]
do
  echo $(cat $fn) >>$fn
  size=$(stat -c%s "$fn")
  let "size=$size / 1000"
  echo $size
done
