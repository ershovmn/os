#!/bin/bash
crontab -l > mycron
echo "*/5 * * * 3 /home/tehnarenok/labs/lab4/script1.bash" >> mycron
crontab mycron
rm mycron