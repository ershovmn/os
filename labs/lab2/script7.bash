#!/bin/bash
man bash | tr "[:upper:]" "[:lower:]" | grep -o -i "[a-zA-Z]\{4,\}" | sort | uniq -c | sort -r -n | head -10 | awk '{print $2}'