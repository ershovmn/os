#!/bin/bash
MODE="+"
res=1
tail -n0 -f script5.log |
while true; do
        read strin
        if [[ $strin = "+" ]]; then
                MODE="+"
        else
        if [[ $strin = "*" ]]; then
                MODE="*"
        else
        if [[ $strin =~ ^[0-9]+$ ]]; then
                let "res=$res$MODE$strin"
                echo $res
        else
        if [[ $strin = "quit" ]]; then
                echo "exit"
                exit
        else
                exit 1
        fi
        fi
        fi
        fi
done