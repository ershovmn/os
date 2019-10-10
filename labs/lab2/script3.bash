#!/bin/bash
grep -E -r -h -s -w -o "[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+.[a-z]+" /etc/ | awk '{print $1}' > ./emails.lst