#!/bin/bash
file="/var/log/anaconda.log"
grep -E -h "WARNING" $file | sed -E  "s/WARNING/Warningn:/" > full.log
grep -E -h "INFO" $file | sed -E "s/INFO/Informarion:/" >> full.log