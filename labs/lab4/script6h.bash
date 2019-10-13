#!/bin/bash
echo $$ > script6.pid
a=1
MODE="working"
myfun()
{
    MODE="stop"
}
trap 'myfun' SYTERM
while true; do
    if [[ $MODE = "working" ]]; then
        let a=$a+1
        echo $a
    else
        echo "Stop"
        exit
    fi
    sleep 1
done