#!/bin/bash
top -l 1 | grep PhysMem | awk '{print $2}' | sed 's/G//' | awk '{printf "%s/16Gb", $1}'