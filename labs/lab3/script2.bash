#!/bin/bash
ps a | sed "/PID/d" | sort -k4 -n | head -1 | awk '{print $1}'