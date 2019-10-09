#!/bin/bash
n=$(grep . ./script5.log | wc -l)
s=$(awk -F "=" '{printf("%s + ", $NF)}' ./script5.log)
s=$s"0"
s="( "$s" ) / "$n
echo "$s" | bc -l