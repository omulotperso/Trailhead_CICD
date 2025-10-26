# 📘 README – Branche `prod` (Déploiement UAT Espagne)

Ce pipeline se déclenche **à chaque push sur la branche `prod`**.

## 🎯 Objectif
- Installer la **version promue** du Core Model dans l’environnement **UAT Espagne**

## 🔧 Actions automatisées
- Installation du package via son ID promu
- Déploiement dans l’org UAT Espagne (`UAT_ES_ORG_ALIAS`)

## ✅ Résultat attendu
L’équipe Espagne peut :
- Tester ses extensions locales contre le Core Model mis à jour
- Confirmer la compatibilité avant mise en prod