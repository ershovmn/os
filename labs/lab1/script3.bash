#!/bin/bash
read s
o=""
while [ $s != "q" ]
do
    o=$o$s
    read s
done
echo "$o"