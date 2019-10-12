#!/bin/bash
MODE="+"
res=1
tail -n0 -f script5.log |
    while true; do
        read strin
        case $strin in
            "+"      ) MODE="+" ;;
            "*"      ) MODE="*" ;;
            "[0-9]+" ) let "res = $res $MODE $strin" ;;
            "QUIT"   ) echo "Stop"; exit ;;
            *        ) exit 1 ;;
        esac
    done