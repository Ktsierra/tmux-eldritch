#!/bin/bash
memory_pressure | awk '/System-wide memory free percentage:/ {printf "Pressure: %d%%", 100 - $5}'