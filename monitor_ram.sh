#!/bin/bash
echo "=== Monitoring RAM ==="
echo "Date: $(date)"
echo ""
echo "Utilisation mémoire:"
free -h | grep -E "Mem|Swap"
echo ""
# ERREUR VOLONTAIRE: division par zéro
echo "Calcul de pourcentage..."
let "result = 100 / 0"
echo "Mémoire disponible: $result%"
