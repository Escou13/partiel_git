# Feature DISK - README

## Script: monitor_disk.sh

### Ce que fait le code

```bash
#!/bin/bash
# Indique que c'est un script bash

echo "=== Monitoring DISK ==="
echo "Date: $(date)"
# Affiche le titre et la date

echo ""
echo "Utilisation disque:"
# Ligne vide puis titre

df -h | grep -E "Filesystem|/dev/"
# df -h : Affiche l'utilisation des disques en format lisible (Go, Mo)
# grep -E : Garde seulement la ligne d'en-tête (Filesystem) et les partitions (/dev/)

echo ""
echo "Inodes:"
# Ligne vide puis titre

df -i | grep -E "Filesystem|/dev/" | head -5
# df -i : Affiche l'utilisation des inodes (métadonnées du système de fichiers)
# grep -E : Filtre pour garder header et partitions
# head -5 : Limite à 5 lignes pour éviter trop d'output
```

### Ce que sont les inodes

Les inodes sont des structures de données qui stockent les métadonnées des fichiers (permissions, dates, propriétaire, etc.). Chaque fichier utilise un inode. Si tu n'as plus d'inodes, tu ne peux plus créer de fichiers même s'il reste de l'espace disque.

### Résultat attendu

```
=== Monitoring DISK ===
Date: jeu. 11 déc. 2025 15:30:45 CET

Utilisation disque:
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p2  457G  234G  200G  54% /
/dev/nvme0n1p1  511M   34M  478M   7% /boot/efi

Inodes:
Filesystem      Inodes  IUsed   IFree IUse% Mounted on
/dev/nvme0n1p2 30138368 456789 29681579    2% /
/dev/nvme0n1p1        0      0        0     - /boot/efi
```

### Commandes pour créer

```bash
git checkout -b feature/disk
cat > monitor_disk.sh << 'EOF'
[contenu du script]
EOF
chmod +x monitor_disk.sh
git add monitor_disk.sh
git commit -m "feat: ajout monitoring DISK"
```
