# 🖥️ Système de Monitoring - TP Git

## 📌 Description du Projet

Projet de TP Git consistant à développer un système de monitoring système (CPU, RAM, Disque) en utilisant les branches Git et en gérant des conflits.

## 🎯 Objectifs du TP

- ✅ Créer et gérer plusieurs branches Git
- ✅ Développer des scripts de monitoring sur des branches séparées
- ✅ Introduire et résoudre un bug volontaire
- ✅ Gérer les merges et conflits
- ✅ Utiliser les outils de debugging Git (bisect, blame, reflog)

## 🌳 Structure des Branches

```
main
└── develop
    ├── feature/cpu
    ├── feature/ram (contient un bug volontaire)
    └── feature/disk
```

## 📂 Fichiers du Projet

- `monitor_cpu.sh` - Script de monitoring CPU
- `monitor_ram.sh` - Script de monitoring RAM
- `monitor_disk.sh` - Script de monitoring Disque

## 🚀 Installation et Utilisation

### Prérequis
- Git installé
- Bash
- Commandes système : `top`, `free`, `df`, `lscpu`

### Cloner le projet
```bash
git clone <url-du-repo>
cd tp-git-monitoring
```

### Exécuter les scripts
```bash
# Monitoring CPU
./monitor_cpu.sh

# Monitoring RAM
./monitor_ram.sh

# Monitoring Disque
./monitor_disk.sh
```

## 🐛 Bug Volontaire

Un bug a été intentionnellement introduit dans `monitor_ram.sh` (division par zéro) pour pratiquer :
- La détection de bugs avec `git bisect`
- L'analyse de code avec `git blame`
- La récupération avec `git reflog`

## 🔍 Commandes de Debug Git Utilisées

```bash
git bisect    # Recherche binaire du commit fautif
git blame     # Identification de l'auteur de chaque ligne
git reflog    # Historique de tous les déplacements HEAD
```

---

**Note**: Ce projet est conçu à des fins pédagogiques pour apprendre Git et la gestion de versions.
