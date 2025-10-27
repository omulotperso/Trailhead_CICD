# 📘 Workflow – Push sur la branche `develop`

Ce document explique le processus de push vers la branche `develop` dans le cadre de l’architecture CI/CD du Core Model Salesforce.

---

## 🎯 Objectif

La branche `develop` est utilisée comme **branche d'intégration**. Elle regroupe les fonctionnalités validées via des PR issues des branches `feature/xxx`, après avoir été testées techniquement sur la branche `CI`.

---

## 🔁 Processus complet

### 1. Création d’une branche `feature/xxx`

Un développeur crée une branche pour sa fonctionnalité :
```bash
git checkout -b feature/FRA-001-visite
```

### 2. Développement + tests en Scratch Org locale

Le développeur code et teste dans sa propre Scratch Org.

### 3. Push vers la branche `CI` pour validation technique
```bash
git push origin feature/FRA-001-visite:CI
```

⚠️ Cette action déclenche **le pipeline `sf-ci-core-model.yml`** qui :
- Crée une Scratch Org temporaire
- Pousse le code
- Exécute les tests Apex
- Supprime l’org

> Pour désactiver temporairement la validation (sauvegarde uniquement) :
```bash
git commit -m "WIP sauvegarde [skip ci]"
```

---

## ✅ 4. Si les tests passent

Le développeur peut maintenant créer une **Pull Request vers `develop`** :

```bash
gh pr create --base develop --head feature/FRA-001-visite
```

Ou depuis GitHub UI.

---

## 🔍 Objectif de la branche `develop`

| Fonction       | Description                                         |
|----------------|-------------|
| 🔗 Intégration | Regroupe toutes les fonctionnalités prêtes pour UAT |
| ✅ Validation fonctionnelle croisée | Permet à plusieurs développeurs de tester ensemble |
| 🔁 Préparation de la release | Merge vers `staging` une fois stable |

---

## 📌 Règles

- 🔐 Pas de push direct sur `develop`
- ✅ Tous les commits doivent venir via PR depuis une branche `feature`
- ✔️ La PR doit être validée (code review + tests CI verts)

---

## 💡 Astuce

Tu peux créer un alias Git pour faciliter le push CI :

```bash
git config alias.pushci '!f() { git push origin $1:CI; }; f'
git pushci feature/FRA-001-visite
```

---

Ce fichier est à placer à la racine du dépôt ou dans `docs/`.