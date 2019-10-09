#!/bin/bash
ps | sed "/PID/d" | awk '{printf("%s:%s\n", $1, $4)}' > script1.log
grep . ./script1.log | wc -l