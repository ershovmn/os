#!/bin/bash
ps a |
    sed "/PID/d" |
    awk '{printf("%s ", $1)} {system("grep -E '^PPid' /proc/" $1 "/status")}' |
    awk '{printf("%s %s\n", $1, $NF)}' |
    awk '{printf("%s %s ", $1, $2)} {system("grep -E '^avg_atom' /proc/" $1 "/sched")}' |
    awk '{printf("%s %s %s\n", $1, $2, $5)}' |
    sort -n -k2 |
    awk '{printf("ProcessID=%s : ParentProcessID=%s : Average_Slepping_Time=%s\n", $1, $2, $3)}' > script5.log