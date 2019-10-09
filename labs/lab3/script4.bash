#!/bin/bash
ps a | sed "/PID/d" | awk '{printf("%s ", $1)} {system("grep . /proc/" $1 "/statm")}' | sed "/grep:/d" | awk '{x=$2-$3} {printf("%s:%s\n", $1, x)}' | sort -n -t ':' -k2 -r