#!/bin/bash
ps a | awk '{printf("%s %s\n", $1, $5)}' | grep "/sbin/" | awk '{print $1}'