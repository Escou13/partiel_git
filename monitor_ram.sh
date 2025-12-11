#!/bin/bash
echo "=== Monitoring RAM ==="
echo "Date: $(date)"
echo ""
echo "Utilisation mémoire:"
free -h | grep -E "Mem|Swap"
echo ""
# CORRECTION: calcul correct du pourcentage
TOTAL=$(free | grep Mem | awk '{print $2}')
USED=$(free | grep Mem | awk '{print $3}')
PERCENT=$(awk "BEGIN {printf \"%.2f\", ($USED/$TOTAL)*100}")
echo "Mémoire utilisée: $PERCENT%"
