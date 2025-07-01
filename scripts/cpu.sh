#!/bin/bash
top -l 2 | grep 'CPU usage' | tail -1 | awk '{print $3 + $5}' | sed 's/%//g' | awk '{printf "%.0f%%", $1}'