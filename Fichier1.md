# Schéma A – Flowchart Global du Processus Core Model → Espagne → Key Users → Go-Live

## 🎯 Résumé
Ce schéma représente la chaîne complète de développement du Core Model (France),  
son déploiement automatique vers l’Espagne, les tests de non-régression des équipes  
espagnoles, les tests Key Users et enfin la préparation à la mise en production prévue  
en janvier 2027.

## 🧩 Contexte
- 🇫🇷 **France** : construit le Core Model (5 lots), teste et déploie automatiquement vers PKG-Core Espagne.
- 🇪🇸 **Espagne** : développe ses spécificités locales et valide que chaque nouveau lot n’impacte pas ses packages.
- 👥 **Key Users Espagne** : testent le modèle final + migration des données.
- 🚀 **Projet** : Mise en production en janvier 2027.

---

## 🔁 Flowchart global

```mermaid
flowchart LR
    subgraph FR["France – Developpement Core Model"]
        direction TB
        L1["Lot 1 : Developpement"] --> T1["Test Lot 1"]
        T1 --> B1["Build Package Lot 1"]

        L2["Lot 2 : Developpement"] --> T2["Test Lot 2"]
        T2 --> B2["Build Package Lot 2"]

        L3["Lot 3 : Developpement"] --> T3["Test Lot 3"]
        T3 --> B3["Build Package Lot 3"]

        L4["Lot 4 : Developpement"] --> T4["Test Lot 4"]
        T4 --> B4["Build Package Lot 4"]

        L5["Lot 5 : Developpement"] --> T5["Test Lot 5"]
        T5 --> B5["Build Package Lot 5"]
    end

    PREPKG["Preparation PKG-Core par France avant Lot 1"] --> B1

    B1 --> D1["Deploiement automatique Lot 1 vers PKG-Core Espagne"]
    B2 --> D2["Deploiement automatique Lot 2 vers PKG-Core Espagne"]
    B3 --> D3["Deploiement automatique Lot 3 vers PKG-Core Espagne"]
    B4 --> D4["Deploiement automatique Lot 4 vers PKG-Core Espagne"]
    B5 --> D5["Deploiement automatique Lot 5 vers PKG-Core Espagne"]

    subgraph ES["Espagne – Dev locaux et Non-regression"]
        ES1["Developpement Specifiques Espagne (apres Lot 1)"]

        D2 --> NR2["Test impacts Lot 2"] --> DEC2{"Impacts ?"}
        DEC2 -->|Oui| FIX2["Correction packages locaux"] --> REDEP2["Reinstallation PKG-Core"] --> RETEST2["Retest NR"]
        DEC2 -->|Non| OK2["Validation Lot 2"]

        D3 --> NR3["Test impacts Lot 3"] --> DEC3{"Impacts ?"}
        DEC3 -->|Oui| FIX3 --> REDEP3 --> RETEST3
        DEC3 -->|Non| OK3["Validation Lot 3"]

        D4 --> NR4["Test impacts Lot 4"] --> DEC4{"Impacts ?"}
        DEC4 -->|Oui| FIX4 --> REDEP4 --> RETEST4
        DEC4 -->|Non| OK4["Validation Lot 4"]

        D5 --> NR5["Test impacts Lot 5"] --> DEC5{"Impacts ?"}
        DEC5 -->|Oui| FIX5 --> REDEP5 --> RETEST5
        DEC5 -->|Non| OK5["Validation Lot 5"]
    end

    OK5 --> KU1["Tests Key Users – Province pilote"]
    KU1 --> KU2["Tests de bout en bout"]
    KU2 --> MIG["Tests de reprise de donnees CRM Dynamique vers Salesforce"]
    MIG --> CORR["Corrections finales"]
    CORR --> GO["Mise en Production Janvier 2027"]
