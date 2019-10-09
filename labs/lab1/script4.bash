#!/bin/bash
count=0
read n
let n=n%2
while [ $n == 1 ]
do
    let count+=1
    read n
    let n=n%2
done
echo "$count"