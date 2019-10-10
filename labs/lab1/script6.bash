#!/bin/bash
if [[ $HOME == $PWD ]]; then
    echo "$HOME"
    exit 0
else
    exit 1
fi