#!/bin/bash
max=$2
if [[ $1 -gt $max ]]
then
    max=$1
fi
if [[ $3 -gt $max ]]
then
    max=$3
fi
echo $max