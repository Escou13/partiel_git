#!/bin/bash
echo "=== Monitoring DISK ==="
echo "Date: $(date)"
echo ""
echo "Utilisation disque:"
df -h | grep -E "Filesystem|/dev/"
echo ""
echo "Inodes:"
df -i | grep -E "Filesystem|/dev/" | head -5
