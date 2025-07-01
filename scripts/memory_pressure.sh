#!/bin/bash
memory_pressure | awk '/System-wide memory free percentage:/ {printf "%d%%", 100 - $5}'