# 📘 README – Branche `staging` (Promotion du Package)

Ce pipeline se déclenche **à chaque push sur la branche `staging`**.

## 🎯 Objectif
- Créer une version du package `Core_Model`
- Promouvoir cette version pour qu'elle soit installable dans les orgs non-scratch (UAT, Prod, pays)

## 🔧 Actions automatisées
- Création du package avec couverture Apex
- Récupération de l’ID de version (`04tXXXX...`)
- Promotion officielle de la version
- Log de confirmation de promotion

## ✅ Résultat attendu
Une version promue est prête à être déployée dans :
- L’UAT Monde (`staging`)
- L’UAT Espagne (`prod`)