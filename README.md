# Feature CPU - README

## Script: monitor_cpu.sh

### Ce que fait le code

```bash
#!/bin/bash
# Indique que c'est un script bash

echo "=== Monitoring CPU ==="
echo "Date: $(date)"
# Affiche le titre et la date actuelle

echo ""
echo "Usage CPU:"
# Ligne vide puis titre de section

top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU utilisé: " 100 - $1 "%"}'
# - top -bn1 : Lance top en mode batch, 1 itération
# - grep "Cpu(s)" : Filtre la ligne qui contient les infos CPU
# - sed : Extrait le pourcentage d'idle (inactif)
# - awk : Calcule l'utilisation = 100 - idle

echo ""
echo "Informations CPU:"
# Ligne vide puis titre

lscpu | grep -E "Model name|CPU\(s\)|Thread"
# lscpu : Affiche les infos détaillées du CPU
# grep -E : Filtre pour garder seulement le modèle, nombre de CPUs et threads
```

### Résultat attendu

```
=== Monitoring CPU ===
Date: jeu. 11 déc. 2025 15:30:45 CET

Usage CPU:
CPU utilisé: 25.3%

Informations CPU:
Model name:            Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
CPU(s):                12
Thread(s) per core:    2
```

### Commandes pour créer

```bash
git checkout -b feature/cpu
cat > monitor_cpu.sh << 'EOF'
[contenu du script]
EOF
chmod +x monitor_cpu.sh
git add monitor_cpu.sh
git commit -m "feat: ajout monitoring CPU"
```
