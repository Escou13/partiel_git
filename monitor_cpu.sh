#!/bin/bash
echo "=== Monitoring CPU ==="
echo "Date: $(date)"
echo ""
echo "Usage CPU:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU utilisé: " 100 - $1 "%"}'
echo ""
echo "Informations CPU:"
lscpu | grep -E "Model name|CPU\(s\)|Thread"
