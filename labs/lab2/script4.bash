#!/bin/bash
grep -E -r -s "#!" /bin/ | sort | uniq -c | sort -r -n | head -1 | awk '{print $2}'