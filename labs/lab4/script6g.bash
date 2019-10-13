#!/bin/bash
pid=$(cat script6.pid)
while true; do
    read strin
    if [[ $strin = "TERM" ]]; then
        kill -SIGTERM $pid
        exit
    fi
done