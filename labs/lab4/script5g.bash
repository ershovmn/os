#!/bin/bash
while true; do
        read strin
        if [[ $strin = "QUIT"]; then
                exit
        fi
        echo $strin >> script5.log
done