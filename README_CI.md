# 📘 README – Branche `CI` (Validation Technique)

Ce pipeline se déclenche automatiquement **à chaque push sur la branche `CI`**.

## 🎯 Objectif
- Valider le code source du Core Model avant création de Pull Request vers `develop`
- Tester la qualité technique dans une Scratch Org dédiée

## 🔧 Actions automatisées
- Lancement des tests Apex unitaires
- Création d’une Scratch Org (`validateCI`)
- Push du code source
- Réexécution des tests dans l’org
- Suppression automatique de l’org

## ✅ Résultat attendu
Si tous les tests passent, le développeur peut :
- Créer une Pull Request vers `develop`
- Fusionner la fonctionnalité dans l’intégration continue