#!/bin/bash
d=$(date +"%m_%d_%y_%H_%M_%S")
mkdir "$HOME/test" &&
{
        echo "catalog test was created successfully" > "/home/tehnarenok/labs/lab4/report"
        touch "$HOME/test/$d"
}
ping -c 1 www.net_nikogo.ru || echo "ERROR connection" >> "/home/tehnarenok/labs/lab4/report"