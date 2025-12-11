# Feature RAM - README

## Script: monitor_ram.sh (VERSION BUGUÉE)

### Ce que fait le code

```bash
#!/bin/bash
# Indique que c'est un script bash

echo "=== Monitoring RAM ==="
echo "Date: $(date)"
# Affiche le titre et la date

echo ""
echo "Utilisation mémoire:"
# Ligne vide puis titre

free -h | grep -E "Mem|Swap"
# free -h : Affiche la mémoire en format lisible (Go, Mo)
# grep -E : Garde seulement les lignes Mem et Swap

echo ""
echo "Calcul de pourcentage..."
# Message avant le calcul

let "result = 100 / 0"
# ⚠️ BUG VOLONTAIRE : Division par zéro
# Cette ligne va crasher le script avec une erreur

echo "Mémoire disponible: $result%"
# Cette ligne ne sera jamais atteinte à cause de l'erreur
```

### Pourquoi le bug ?

- `let "result = 100 / 0"` essaie de diviser par zéro
- C'est mathématiquement impossible
- Bash retourne une erreur et le script s'arrête

### Résultat attendu (avec erreur)

```
=== Monitoring RAM ===
Date: jeu. 11 déc. 2025 15:30:45 CET

Utilisation mémoire:
              total       used       free     shared  buff/cache   available
Mem:           15Gi       8.2Gi       2.1Gi       543Mi       5.2Gi       6.5Gi
Swap:         2.0Gi       512Mi       1.5Gi

Calcul de pourcentage...
./monitor_ram.sh: line 12: let: result = 100 / 0: division by 0 (error token is "0")
```

### Commandes pour créer

```bash
git checkout -b feature/ram
cat > monitor_ram.sh << 'EOF'
[contenu du script]
EOF
chmod +x monitor_ram.sh
git add monitor_ram.sh
git commit -m "feat: ajout monitoring RAM (avec bug)"
```

### Comment corriger (pour plus tard)

Remplacer le code buggé par :

```bash
TOTAL=$(free | grep Mem | awk '{print $2}')
USED=$(free | grep Mem | awk '{print $3}')
PERCENT=$(awk "BEGIN {printf \"%.2f\", ($USED/$TOTAL)*100}")
echo "Mémoire utilisée: $PERCENT%"
```
